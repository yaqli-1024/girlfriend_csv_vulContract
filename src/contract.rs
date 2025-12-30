use std::{
    collections::{BTreeMap, HashMap, HashSet},
    fmt::Display,
    mem,
};

use alloy_primitives::U256;
use anyhow::Result;
use tracing::error;
use serde::{Serialize};  // 文件顶部加这一行（如果还没有的话）
use std::fs::OpenOptions;
use std::io::Write;
use once_cell::sync::Lazy;
use std::{fs, path::Path};
//TODO:(12.29调试)增加头文件，之后可删
use serde_json::json;


use crate::{
    abi::{
        self,
        types::{DecodedArg, MemoryVar, StructDef},
        Abi,
    },
    config::HARDHAT_CHEAT_ADDR,
    utils::{self, hash_to_name},
};
//调试
type SlotInfo = (u64, bool); // (slot, is_vyper)


//TODO:调试：已知代币 storage 槽位表（全局静态映射表）
static KNOWN_TOKEN_SLOTS: Lazy<HashMap<String, (u64, bool)>> = Lazy::new(|| { //全局静态映射表,第一次用到时才初始化
    let mut slots = HashMap::new();
    // 主流稳定币和代币 (Solidity)
    //slot: u64：该代币合约里 mapping(address => uint256) balances 的基准槽位编号
    //提前写好slot，之后强行设置余额时就可以：类似于keccak256(abi.encode(sender, slot))
    slots.insert("0x1f9840a85d5af5bf1d1762f925bdaddc4201f984".to_string(), (4, false));  // UNI
    slots.insert("0xdac17f958d2ee523a2206206994597c13d831ec7".to_string(), (2, false));  // USDT
    slots.insert("0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2".to_string(), (3, false));  // WETH
    slots.insert("0x2260fac5e5542a773aa44fbcfedf7c193bc2c599".to_string(), (0, false));  // WBTC
    slots.insert("0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48".to_string(), (9, false));  // USDC //USDC 写死 (9,false)：表示它的 balances mapping 基准槽位是 9
    slots.insert("0x6b175474e89094c44da98b954eedeac495271d0f".to_string(), (2, false));  // DAI
    slots.insert("0xae7ab96520de3a18e5e111b5eaab095312d7fe84".to_string(), (0, false));  // stETH
    slots.insert("0x514910771af9ca656af840dff83e8264ecf986ca".to_string(), (1, false));  // LINK
    slots.insert("0x6982508145454ce325ddbe47a25d4ec3d2311933".to_string(), (0, false));  // PEPE
    slots.insert("0x95ad61b0a150d79219dcf64e1e6cc01f0b64c4ce".to_string(), (0, false));  // SHIB
    
    // Vyper 代币 (slot 顺序与 Solidity 相反)
    slots.insert("0xd533a949740bb3306d119cc777fa900ba034cd52".to_string(), (3, true));   // CRV (Vyper 0.2.4)
    
    slots
});

#[derive(Debug, Serialize, Default)]
pub struct Contract {
    pub name: String,
    pub addr: String,
    /// setUp or constructor
    pub setup_constructor: Option<SetupConstructor>,
    /// map<var_name, SubContract>
    #[serde(skip)]
    pub sub_contracts: HashMap<String, SubContract>,
    /// Ordered sub_contracts
    /// It takes the ownership of `sub_contracts` when `self.generate` is
    /// called.
    pub ordered_sub_contracts: Vec<SubContract>,
    /// map<var_name, address>
    pub named_addresses: BTreeMap<String, String>,
    /// The calls in `test1()` including all root_calls of txs.
    pub test1_calls: Vec<String>,
    /// The calls in `test2()` including all root_calls of txs.
    pub test2_calls: Vec<String>,
    /// map<fn_signature, Function>
    pub test3_calls: Vec<String>,
    ///调试：新增test3_calls（只有这一句）
    #[serde(skip)]
    pub functions: HashMap<String, Function>,
    /// Ordered functions, the root_fn is always the first one.
    /// It takes the ownership of `functions` when `self.tidy_functions` is
    /// called.
    pub ordered_functions: Vec<ConciseFn>,
    /// Counter variables to record the number of calls of functions.
    pub counters: Vec<String>,
    /// map<fn_signature, UnresolvedFn>
    pub fallback: HashMap<String, UnresolvedFn>,
    /// salt is used to predict the contract address.
    #[serde(skip)]
    pub salt: Option<String>,

    // Use multi boolean values instead of an enum to make the template easier.
    pub is_receiver: bool,
    pub is_inner: bool,

    //调试：新增字段token_addrs（receiver涉及到的合约地址）
    pub token_addrs: Vec<String>,
}



#[derive(Debug, Serialize, Default)]
pub struct SetupConstructor {
    pub fn_def: String,
    pub fn_calls: Vec<String>,
}

#[derive(Debug, Serialize, Default, Clone)]
pub struct SubContract {
    pub name: String,
    pub var_name: String,
    pub addr: String,
    // Use multi boolean values instead of an enum to make the template easier.
    pub is_receiver: bool,
    pub is_inner: bool,
    /// salt is used to predict the contract address.
    pub salt: Option<String>,
    /// initcode hash is used to predict the contract address.
    pub initcode_hash: Option<InitCodeHash>,
    /// str_constructor_args is used in the template.
    /// e.g. `a_x6dd0, a_x6dd1`
    pub str_constructor_args: String,

    // constructor_args is used to build the constructor.
    // map<var_name, value>
    #[serde(skip)]
    constructor_args: HashMap<String, String>,
}

#[derive(Debug, Serialize, Default, Clone)]
pub struct InitCodeHash {
    pub var: String,
    pub value: String,
}

#[derive(Debug, Default, Clone, Serialize)]
pub struct Function {
    /// Is the function is a view function.
    pub is_view: bool,
    /// The function signature to define a function.
    pub fn_def_signature: String,
    /// return signature to parse the output
    pub ret_signature: String,
    /// If a function is called multiple times, the call_group of each call may
    /// be different.
    pub call_groups: Vec<CallGroup>,
    /// Is payable
    pub payable: bool,
}

/// A group of calls in a `if` block.
#[derive(Debug, Default, Clone, Serialize)]
pub struct CallGroup {
    /// The calls of this group.
    pub calls: Vec<ParsedCall>,
    /// The output of this group.
    pub raw_output: String,
    /// The decoded output of this group.
    pub decoded_output: Vec<String>,
    /// The number of times this group repeats.
    /// (repeats, last_idx)
    pub repeats: (usize, usize),
}

#[derive(Debug, Serialize, Default)]
pub struct ConciseFn {
    /// Is the function is a view function.
    pub is_view: bool,
    /// The function signature to define a function.
    pub fn_def_signature: String,
    /// return signature
    pub ret_def_signature: String,
    /// The counter to record the number of calls of this function.
    pub counter: String,
    /// Serialized function calls
    pub call_groups: Vec<ConciseCallGroup>,
    /// Is payable
    pub payable: bool,
}

/// A group of calls in a `if` block.
#[derive(Debug, Serialize, Default, Clone)]
pub struct ConciseCallGroup {
    /// The calls of this group.
    pub calls: Vec<String>,
    /// The outputs of this group.
    pub outputs: Vec<String>,
    /// The condition of this `if` block.
    /// `<= 5` means `if (counter <= 5)`
    pub cond: String,
}

#[derive(Debug, Serialize, Default)]
pub struct UnresolvedFn {
    pub fn_selector: String,
    pub fn_signature: String,
}

#[derive(Debug, Eq, PartialEq, Default, Clone, Serialize)]
pub enum ParsedCallType {
    #[default]
    Interface,
    Raw,
    SendValue,
    Create,
    Create2,
    SelfDestruct,
    DelegateCall,
    HardhatCheat,
    WithSelector,
    Parentheses,
}

#[derive(Debug, Default, Clone, PartialEq, Eq, Serialize)]
pub struct ParsedCall {
    pub ty: ParsedCallType,
    // call, staticcall, ...
    pub sol_ty: String,
    pub caller: String,
    pub target: String,
    pub fn_signature: String,
    pub ret_signature: String,
    pub fn_call: String,
    pub raw_input: String,
    pub raw_output: String,
    pub value: U256,
    pub sub_calls: Vec<ParsedCall>,

    /// the memory variables that are used in this function call.
    pub memory_vars: Vec<MemoryVar>,
    /// map<var_name, address>
    pub named_addresses: HashMap<String, String>,
    /// map<struct_signature, struct_def>
    pub struct_defs: HashMap<String, StructDef>,
    /// map<return_value, ReturnData>, duplicated return values are merged.
    pub return_vars: HashMap<String, ReturnData>,
    /// Raw return data, duplicated return values are not merged.
    pub return_data: Vec<ReturnData>,
    /// e.g. uint256 return_var = abi.decode(output, (uint256));
    pub ret_decode_call: Option<String>,
    /// If the call is a `CREATE2`, it has a salt
    pub salt: Option<String>,
    /// The comment of the function call.
    pub comment: Option<String>,
    /// Is the target is a contract generated by GF?
    pub target_is_contract: bool,
    /// VmState to set the vm state, e.g. `vm.createSelectFork/vm.warp ...`
    pub vm_state: Option<VmState>,
    /// visible inner_create_variables to avoid duplicate definitions.
    pub inner_create_vars: HashSet<String>,
}

#[derive(Debug, Default, Clone, PartialEq, Eq, Serialize)]
pub struct VmState {
    pub forked_rpc: String,
    pub tx_hash: String,
    pub block_number: String,
    pub block_timestamp: String,
}

//test2里状态生成的部分
impl VmState {
    pub fn generate(&self, is_first_call: bool) -> Vec<String> {
        if is_first_call {
            vec![format!(
                "vm.createSelectFork(\"{}\", {}); // tx.blockNumber - 1",
                self.forked_rpc, self.block_number
            )]
        } else {
            vec![
                format!("vm.warp({});", self.block_timestamp),
                format!("vm.roll({});", self.block_number),
            ]
        }
    }

    //调试：新增部分
    pub fn generate3(&self) -> Vec<String> {
        let n: u64 = self.block_number.parse().unwrap();
        let s = (n + 1).to_string();
        println!("[generate3] roll block = {}", s);
        // if is_first_call {
        //     vec![format!(
        //         "vm.createSelectFork(\"{}\", {}); // tx.blockNumber - 1",
        //         self.forked_rpc, self.block_number
        //     )]
        // } else {
        //     vec![
        //         format!("vm.warp({});", self.block_timestamp),
        //         format!("vm.roll({});", self.block_number),
        //     ]
        // }
        vec![
                format!("vm.warp({});", self.block_timestamp),
                format!("vm.roll({});", s),
            ]
    }
    //调试结束
}

#[derive(Debug, Serialize, Default, Clone, PartialEq, Eq)]
pub struct ReturnData {
    pub ty: String,
    pub var: String,
    pub value: String,
    pub is_dynamic: bool,
}

impl Display for ReturnData {
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        if self.is_dynamic {
            write!(f, "// {} memory {} = {};", self.ty, self.var, self.value)
        } else {
            write!(f, "// {} {} = {};", self.ty, self.var, self.value)
        }
    }
}

//调试：新增函数，将地址全部转换为小写字母（原来有大有小）
fn norm_addr(s: &str) -> String {
    let s = s.trim();
    if s.starts_with("0x") || s.starts_with("0X") {
        format!("0x{}", &s[2..].to_ascii_lowercase())
    } else {
        format!("0x{}", s.to_ascii_lowercase())
    }
}

// 调试：“设置余额”的情况2：缓存（可以把文件放到 assets/token_slot_cache.json）
fn load_slot_cache() -> HashMap<String, SlotInfo> {
    let path = Path::new("assets/token_slot_cache.json");
    if !path.exists() {
        return HashMap::new();
    }
    let Ok(s) = fs::read_to_string(path) else { return HashMap::new(); };

    // JSON: {"0x...":[slot,bool], ...}
    let Ok(map) = serde_json::from_str::<HashMap<String, (u64, bool)>>(&s) else {
        return HashMap::new();
    };
    map
}

//TODO：（12.29调试）增加save_slot_cache函数
pub fn save_slot_cache(map: &HashMap<String, (u64, bool)>) -> Result<()> {
    let path = Path::new("assets/token_slot_cache.json"); //构造要写入的文件路径对象：assets/token_slot_cache.json
    if let Some(parent) = path.parent() { //刚刚的path.parent() 取父目录：也就是 assets/
        fs::create_dir_all(parent)?;
    }

    let mut out: serde_json::Map<String, serde_json::Value> = serde_json::Map::new();//准备一个 JSON 的对象，取名叫做out
    for (k, (slot, is_vyper)) in map.iter() { //遍历传入的 map。k是代币地址，(slot, is_vyper) 是对应的 (u64, bool)，这里用解构直接拿到两个字段
        out.insert(k.clone(), json!([*slot, *is_vyper])); //向 out里插入一条 (k,[slot, is_vyper])
        //举例：插入的一条是："0x...tokenA": [9, false]
    }

    fs::write(path, serde_json::to_string_pretty(&out)?)?; //把字符串out写入文件"assets/token_slot_cache.json"
    Ok(())
}

//TODO：(12.29调试)增加update_slot_cache函数
pub fn update_slot_cache(token_norm: &str, slot: u64, is_vyper: bool) -> Result<()> { //拿到“代币地址”、“槽位slot”，“is_vyper(布尔值)”这三个量后，将其写入json文件中
    let mut map = load_slot_cache();          // 从磁盘读取已有缓存文件，反序列化成 HashMap
    map.insert(token_norm.to_string(), (slot, is_vyper)); //更新/新增一条缓存 (如果 key 已存在，会覆盖旧值)
    save_slot_cache(&map) //把更新后的 map 写回 assets/token_slot_cache.json
}


impl Contract {
    pub fn new(addr: String, is_receiver: bool, is_inner: bool, salt: Option<String>) -> Self {
        let mut name = hash_to_name(&addr);
        // Capitalize the first letter of the contract name
        // so that the lowercase variable name can be used.
        name = name[..1].to_uppercase() + &name[1..];

        Self {
            name,
            addr,
            is_receiver,
            is_inner,
            salt,
            ..Default::default()
        }
    }

    //把一个 contract 对象“生成/整理成最终可输出的形态”
    //针对一个合约（contract对象）：
    pub fn generate(
        &mut self, //函数允许修改当前合约对象内部字段
        // map<contract_var, sub_contracts>
        all_contracts: &HashMap<String, HashMap<String, SubContract>>, //这里的传参是Sub_contracts
        last_txhash: &str, //最后一笔交易的哈希字符串
        root_fn_sigs: &[&str], //根调用对应的函数签名字符串列表,在这里是无 ABI 情况下的 0x....() 形式（'"xb91e0731()")
        interface: &mut HashSet<String>, //接口
        struct_defs: &HashMap<String, StructDef>, //结构体定义表
    ) {
        //判断当前合约是否是 “receiver 合约”(PoC 的主合约/入口合约,负责setup等)
        if self.is_receiver {
            self.build_setup(last_txhash); //若是 receiver：生成/填充 setup_constructor 或 setUp() 相关内容
            self.build_receiver_constructor(); //执行receiver 合约的构造器生成逻辑(把constructor()改成普通函数)
        } else {
            self.build_constructor(interface, all_contracts, struct_defs); //为非 receiver 合约生成 constructor(说明和receiver是两套不同逻辑)
        }
        self.tidy_functions(root_fn_sigs, interface, all_contracts, struct_defs);//整理/转换函数集合(更精简，并把receiver排到前面)
        self.named_addresses.remove(&self.name.to_lowercase()); //从 contract_map的 named_addresses 里移除一个键(把合约自己去除)
        self.order_sub_contracts();//对子合约/依赖合约进行排序
    }

    pub fn build_function(&mut self, call: ParsedCall, struct_defs: &HashMap<String, StructDef>) {
        //找函数：如果已经存在同名函数就拿出来，不存在就创建
        let mut func = if let Some(func) = self.functions.remove(&call.fn_signature) {
            func
        } else {
            match call.generate_function(struct_defs) {
                Ok(func) => func,
                Err(_) => {
                    return;
                }
            }
        };

        let decoded_output = self.parse_output(&func.ret_signature, &call.raw_output);
        func.call_groups
            .push(CallGroup::new(call.sub_calls, call.raw_output, decoded_output));

        self.functions.insert(call.fn_signature, func);
    }

    //test1里生成vm_state的部分
    //向 test1() 的开头插入一段 Foundry fork 初始化代码，用“最后一笔交易所在区块”作为 fork 起点。
    pub fn setup_test1_vm_state(&mut self, first_state: VmState, last_state: VmState) {
        let calls = vec![
            format!(
                "vm.createSelectFork(\"{}\", {}); // tx.blockNumber - 1",
                last_state.forked_rpc, last_state.block_number //写入区块号信息// vm.createSelectFork("http://localhost:18545", 18476512); // tx.blockNumber - 1
            ),
            format!(
                "// vm.createSelectFork(\"{}\", bytes32({}));",
                first_state.forked_rpc, first_state.tx_hash
            ),
            String::new(),
        ];

        self.test1_calls.extend(calls); //把这些“代码行”追加到 test1
    }

    //调试
    //新增一个test3生成vm_state的部分
    //向 test3() 的开头插入一段 Foundry fork 初始化代码，用“最后一笔交易所在区块”（实则是这个真实区块号-1）作为 fork 起点。
    pub fn setup_test3_vm_state(&mut self, last_state: VmState) {
        let calls = vec![
            format!(
                "vm.createSelectFork(\"{}\", {}); // tx.blockNumber - 1",
                last_state.forked_rpc, last_state.block_number //写入区块号信息// vm.createSelectFork("http://localhost:18545", 18476512); // tx.blockNumber - 1
            ),
            String::new(),
        ];

        self.test3_calls.extend(calls); //把这些“代码行”追加到 test3
    }
    //调试结束

    //调试：新增函数：向poc写入“设置receiver余额”代码
    fn build_vm_store_line(token_norm: &str, slot: u64, is_vyper: bool, target: &str) -> String {
        if is_vyper {
            // Vyper：按你们约定 slot 在前
            format!(
                "vm.store(address({}), keccak256(abi.encode(uint256({}), RECEIVER)), bytes32(uint256({})));",
                token_norm, slot, target
            )
        } else {
            // Solidity：receiver 在前
            format!(
                "vm.store(address({}), keccak256(abi.encode(RECEIVER, uint256({}))), bytes32(uint256({})));",
                token_norm, slot, target
            )
        }
    }

    //调试：新增函数：设置receiver余额时的情况3：没有命中硬编码表也没有命中缓存，需要一个一个尝试
    fn build_guess_slot_block(token_norm: &str, target: &str) -> Vec<String> {
        // 情况3：slot=0..99 逐个尝试（Solidity layout），每次失败 revertTo(snap)
        // 命中就 break，并 emit 出 slot，方便你写回缓存
        vec![
            "{".to_string(),
            format!("address token = address({});", token_norm),
            format!("uint256 target = {};", target),
            "uint256 snap = vm.snapshot();".to_string(),
            "bool found = false;".to_string(),
            "uint256 foundSlot = type(uint256).max;".to_string(),
            "for (uint256 slot = 0; slot < 100; slot++) {".to_string(),
            "vm.revertTo(snap);".to_string(),
            "vm.store(token, keccak256(abi.encode(RECEIVER, uint256(slot))), bytes32(uint256(target)));".to_string(),
            "uint256 bal = IERC20(token).balanceOf(RECEIVER);".to_string(),
            "if (bal != target) continue;".to_string(),
            "found = true;".to_string(),
            "foundSlot = slot;".to_string(),
            "break;".to_string(),
            "}".to_string(),
            "require(found, \"GF: cannot find balance slot in 0..99\");".to_string(),
            "emit log_named_uint(\"GF: found balance slot\", foundSlot);".to_string(),
            "}".to_string(),
        ]
    }


    //新增函数
    fn dump_to_file<T: Serialize>(file: &str, name: &str, value: &T) {
            let full_path = format!("./test/{}", file);
            let mut f = OpenOptions::new()
                .create(true)
                .append(true)
                .open(&full_path)
                .unwrap();

            let s = serde_json::to_string_pretty(value).unwrap();
            let _ = writeln!(f, "\n=== {} ===\n{}\n", name, s);
        }

    pub fn push_test1_call(&mut self, root_call: ParsedCall, is_last_call: bool) {
        self.named_addresses.extend(root_call.named_addresses.clone());
        let calls = root_call.generate_test1_call(is_last_call, self);
        Self::dump_to_file(
            &format!("test1_calls_{}.json", if is_last_call { "last" } else { "mid" }),
            "generated_test1_calls",
            &calls,
        );
        self.test1_calls.extend(calls);
        Self::dump_to_file(
            "test1_calls_all.json",
            "test1_calls_all",
            &self.test1_calls,
        );
    }

    pub fn push_test2_call(&mut self, root_call: ParsedCall, is_first_call: bool, is_last_call: bool) {
        self.named_addresses.extend(root_call.named_addresses.clone());
        let calls = root_call.generate_test2_call(is_first_call, is_last_call, self);
        //打印
        Self::dump_to_file(
            &format!("test2_calls_{}.json", if is_last_call { "last" } else { "mid" }),
            "generated_test2_calls",
            &calls,
        );
        self.test2_calls.extend(calls);
        //打印
        Self::dump_to_file(
            "test2_calls_all.json",
            "test2_calls_all",
            &self.test2_calls,
        );
    }

    //调试：新增test3的函数体生成部分
    pub fn push_test3_call(&mut self, root_call: ParsedCall, is_last_call: bool) {
        // 原来的代码行(v1.0)
        // self.named_addresses.extend(root_call.named_addresses.clone()); 
        // let calls = root_call.generate_test3_call(is_last_call, self); 
        // self.test3_calls.extend(calls); 
        // //打印 
        // Self::dump_to_file( 
        //     "test3_calls_all.json", 
        //     "test3_calls_all", 
        //     &self.test3_calls, 
        // ); 

        //-------------------------------------------------------------------------------------------------------
        // //调试：新增功能：将10ETH赋值给receiver(v2.0)
        // // 仍然保留地址合并
        // self.named_addresses.extend(root_call.named_addresses.clone());
        // // 1) 先生成 test3 的所有语句（vm_state + mainTx 调用）
        // let mut calls = root_call.generate_test3_call(is_last_call, self);
        // // 2) 过滤空行
        // calls.retain(|s| !s.trim().is_empty());
        // // 3) 计算插入位置：插到 vm.roll(...) 之后
        // let deal_line = "vm.deal(RECEIVER, 10 ether);".to_string();
        // // 找到 "vm.roll(" 的行号，并插到它的下一行
        // let insert_pos = calls
        //     .iter()
        //     .position(|l| l.trim_start().starts_with("vm.roll("))
        //     .map(|i| i + 1)
        //     // 兜底：没有 roll 的话，先放到末尾（也可改成放到主调用前，见下方备注）
        //     .unwrap_or_else(|| calls.len());

        // calls.insert(insert_pos, deal_line);
        // // 4) 最终加入 test3_calls
        // self.test3_calls.extend(calls);

        //-------------------------------------------------------------------------------------------------------
        //TODO：调试：新增功能“给receiver赋大量余额，防止因为余额不够而回滚”(v3.0)
        self.named_addresses.extend(root_call.named_addresses.clone());

        // 1) 生成 test3 的语句（包含 vm_state + mainTx 调用）
        let mut calls = root_call.generate_test3_call(is_last_call, self);

        // 2) 过滤空行
        calls.retain(|s| !s.trim().is_empty());

        // 3) 找“mainTx 调用行”的位置：一般是形如 `x...();`
        //    优先插在 mainTx 调用之前；找不到再插到 vm.roll 后面
        let main_call_pos = calls
            .iter()
            .position(|l| {
                let t = l.trim();
                // 这个规则很宽松：以 x 开头、以 ");" 结尾，且不是 vm.xxx
                t.starts_with('x') && t.ends_with(");") && !t.starts_with("vm.")
            });

        let insert_pos = if let Some(p) = main_call_pos {
            p // ✅ 插在 mainTx 前
        } else {
            // 兜底：插在 vm.roll 后
            calls.iter()
                .position(|l| l.trim_start().starts_with("vm.roll("))
                .map(|i| i + 1)
                .unwrap_or_else(|| calls.len())
        };

        // 4) 构造要插入的行：先 deal，再 vm.store(...)
        let mut inject_lines: Vec<String> = vec![];
        inject_lines.push("vm.deal(RECEIVER, 10 ether);".to_string());

         // 给未知 token 写入的“特征余额：1e24”
        let target = "1000000000000000000000000"; // 1e24

        // 读取缓存（情况2）
        let slot_cache = load_slot_cache();

        // ===== 这里插入 ERC20 余额注入 =====
        // 你需要把 token_addrs 提供给这里（见下方两种方式）
        for token in self.token_addrs.iter() {
            let token_norm = norm_addr(token);

            if let Some(&(slot, is_vyper)) = KNOWN_TOKEN_SLOTS.get(&token_norm) {
                inject_lines.push(Self::build_vm_store_line(&token_norm, slot, is_vyper, target));
                continue;
            }

            //情况2：不在硬编码里，但在缓存里（理论上这个缓存表会越来越大）
            if let Some(&(slot, is_vyper)) = slot_cache.get(&token_norm) {
                inject_lines.push(Self::build_vm_store_line(&token_norm, slot, is_vyper, target));
                continue;
            }

            //情况3：硬编码和缓存都没有：从0..9槽位一个一个猜，如果猜对了就继续执行代码并将槽位记入缓存表里，如果没猜对就回滚
            inject_lines.extend(Self::build_guess_slot_block(&token_norm, target));
        }
        // ==================================

        // 5) 把 inject_lines 插入 calls
        calls.splice(insert_pos..insert_pos, inject_lines);

        // 6) 加入 test3_calls
        self.test3_calls.extend(calls);

    }

    pub fn init_address_vars(&self) -> Vec<String> {
        let mut calls = vec![];
        for sub in &self.ordered_sub_contracts {
            if let Some(ref salt) = sub.salt {
                if let Some(ref initcode_hash) = sub.initcode_hash {
                    calls.push(format!("bytes32 {} = {};", initcode_hash.var, initcode_hash.value));
                    calls.push(format!(
                        "{} = address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xff), r, bytes32({:?}), {})))));",
                        sub.var_name, salt, initcode_hash.var
                    ));
                }
            } else if !sub.is_inner {
                calls.push(format!(
                    "{} = address(new {}({}));",
                    sub.var_name, sub.name, sub.str_constructor_args
                ));
            }
        }
        calls
    }

    //把 self.functions 全部转成更适合输出 Solidity 的“精简函数”，并且确保在 receiver 合约中，属于 root 调用的入口函数排在最前面
    pub fn tidy_functions(
        &mut self,
        root_fn_sigs: &[&str],
        interface: &mut HashSet<String>,
        all_contracts: &HashMap<String, HashMap<String, SubContract>>,
        struct_defs: &HashMap<String, StructDef>,
    ) {
        let (mut funcs, mut ordered_funcs) = (vec![], vec![]);
        let functions = mem::take(&mut self.functions);

        for (fn_sig, func) in functions.into_iter() {
            let concise_fn = func.into_concise(self, interface, all_contracts, struct_defs);
            // We just need to make sure the root_fn appears first.
            if self.is_receiver && root_fn_sigs.contains(&fn_sig.as_str()) {
                ordered_funcs.push(concise_fn);
            } else {
                funcs.push(concise_fn);
            }
        }

        self.ordered_functions = ordered_funcs;
        self.ordered_functions.extend(funcs);
    }

    pub fn build_sub_contracts(&mut self, contracts: &[SubContract]) {
        for c in contracts {
            if c.addr == self.addr {
                continue;
            }

            if self.named_addresses.remove(&c.var_name).is_some() {
                self.sub_contracts.insert(c.var_name.clone(), c.clone());
            }
        }
    }

    pub fn flat_nested_sub_contracts(&mut self, sub_contract_map: &HashMap<String, HashMap<String, SubContract>>) {
        let keys = self
            .sub_contracts
            .iter()
            .filter(|(_, c)| c.is_inner)
            .map(|(k, _)| k.clone())
            .collect::<Vec<String>>();
        for v in keys.into_iter() {
            if let Some(sub) = sub_contract_map.get(&v) {
                self.sub_contracts.extend(sub.clone());
            }
        }
        self.sub_contracts.remove(self.name.to_lowercase().as_str());
    }

    pub fn build_sub_contracts_constructor_args(
        &mut self,
        sub_contracts: &mut HashMap<String, HashMap<String, SubContract>>,
    ) {
        let receiver_var = hash_to_name(&self.addr);
        for c in self.sub_contracts.values_mut() {
            c.constructor_args = sub_contracts
                .get(&hash_to_name(&c.addr))
                .map(|c| {
                    c.keys()
                        .map(|contract_var| (format!("a_{}", contract_var), contract_var.to_string()))
                        .collect::<HashMap<_, _>>()
                })
                .unwrap_or_default();

            c.str_constructor_args = c
                .constructor_args
                .values()
                .map(|v| if v == &receiver_var { "r".to_string() } else { v.clone() })
                .collect::<Vec<_>>()
                .join(", ");

            if let Some(ref salt) = c.salt {
                let var = format!("initcodeHash{salt}");
                let value = if c.str_constructor_args.is_empty() {
                    format!("keccak256(type({}).creationCode)", c.name)
                } else {
                    format!(
                        "keccak256(abi.encodePacked(type({}).creationCode, abi.encode({})))",
                        c.name, c.str_constructor_args
                    )
                };
                c.initcode_hash = Some(InitCodeHash { var, value });
            }
        }

        sub_contracts.insert(receiver_var, self.sub_contracts.clone());
    }

    pub fn tidy_named_addresses(&mut self) {
        let sub_contracts = self
            .ordered_sub_contracts
            .iter()
            .map(|c| c.var_name.clone())
            .collect::<HashSet<_>>();
        self.named_addresses.retain(|k, _| !sub_contracts.contains(k));
    }

    //为当前合约生成一个 setUp(),其中函数体只有一句 console2.log(txhash)，并把它保存到 self.setup_constructor 字段里
    fn build_setup(&mut self, last_txhash: &str) {
        let fn_def = "function setUp() public pure".to_string();
        let fn_calls = vec![format!("console2.log(\"{}\");", last_txhash)];

        self.setup_constructor = Some(SetupConstructor { fn_def, fn_calls });
    }

    // Change the constructor of the receiver to a normal function.
    //把 receiver 合约的构造器从 constructor() 改造成普通函数_constructor_()
    fn build_receiver_constructor(&mut self) {
        if let Some(mut func) = self.functions.remove("constructor()") { //从 contract_functions 里按 key 取出 "constructor()" 对应的函数，并同时从 map 中删除它
            let fn_sig = "_constructor_()".to_string();//定义新的函数签名字符串 fn_sig，值为 "_constructor_()"(这就是将来重新插回 self.functions 时使用的新 key（普通函数名))
            func.fn_def_signature = fn_sig.clone();//修改 func 内部的 fn_def_signature 字段,使得函数本体的“定义签名”也从 constructor() 变成 _constructor_()
            // Remove the returned runtime code.
            //注释：要移除“返回的 runtime code”
            if let Some(c) = func.call_groups.first_mut() {
                c.raw_output = String::new();
                // c.decoded_output = vec![];
            }

            self.functions.insert(fn_sig, func);//把改造后的函数重新插回 self.functions
            //self.functions 里不再有 "constructor()"。取而代之的是 "_constructor_()"，并且其第一段调用的 raw_output 被清空。
        }
    }

    //为非 receiver 合约构建“构造初始化逻辑”
    fn build_constructor(
        &mut self, //可变借用：说明此函数会修改当前 Contract 对象内部字段
        interface: &mut HashSet<String>,
        all_contracts: &HashMap<String, HashMap<String, SubContract>>, //全局合约/子合约信息表（这里的传参是Sub_contracts）
        struct_defs: &HashMap<String, StructDef>,
    ) {
        //把 self.sub_contracts 克隆一份到局部变量 sub_contracts
        let sub_contracts = self.sub_contracts.clone();
        // subcalls of `CREATE/CREATE2` go into the constructor
        let constructor = self.functions.remove("constructor()");//从 self.functions 里移除 key 为 "constructor()" 的函数对象
        if sub_contracts.is_empty() && constructor.is_none() {//如果sub_contracts 为空，也没有解析到 constructor 内容：直接结束
            return;
        }

        // constructor(address a_x6dd0, address a_x6dd1) payable
        //构造“constructor(...) payable”的函数头字符串 fn_def
        let fn_def = if sub_contracts.is_empty() { //如果构造器不需要参数，生成：constructor() payable
            "constructor() payable".to_string()
        } else {//否则进入 else：需要把子合约地址作为参数传入（依赖注入）
            let mut var_names = self.sub_contracts.keys().cloned().collect::<Vec<String>>(); //取出 self.sub_contracts 的所有 key（通常是子合约变量名，如 x6dd0），收集到 Vec<String>
            var_names.sort();//对变量名排序：保证生成的构造器参数顺序稳定、可复现（HashMap 遍历顺序不稳定）
            let args = var_names //构造参数列表字符串 args,对每个子合约变量名 var_name，生成一个参数：address a_<var_name>,例如 x6dd0 → address a_x6dd0
                .iter()
                .map(|var_name| format!("address a_{}", var_name))
                .collect::<Vec<_>>()
                .join(", ");
            format!("constructor({}) payable", args) //排好序然后用 ", " 拼起来，比如address a_x6dd0, address a_x6dd1, ...
        }; //最终得到完整构造器函数头，例如：constructor(address a_x6dd0, address a_x6dd1) payable。此时fn_def 生成结束

        //构造构造器内部语句列表 fn_calls
        let mut fn_calls = vec![]; //初始化一个空的调用/语句列表（Vec<String>）

        // sub_contracts
        // x6dd0 = a_x6dd0; // 0x6dd035a2bd0daf5ae0a73f2442b3ec05766a8b75 //这里就是想生成的代码示例
        //先把需要用到的合约依赖注入成赋值语句
        //sub_contracts里如果存在需要引用的合约：遍历 self.sub_contracts,对每个 (var_name, c) 生成一条语句："<var_name> = a_<var_name>; // <addr>"
        //例如：x6dd0 = a_x6dd0; // 0x6dd0...   （目的是方便引用。因为在前一步生成fn_def里就把a_x6dd0作为参数传入constructor，现在把a_x6dd0赋值给x6dd0变量后，接下来的constructor步骤里就只需要引用x6dd0变量就可以了）
        //然后用 extend(...) 把这些语句批量追加到 fn_calls
        if !sub_contracts.is_empty() {
            fn_calls.extend(
                self.sub_contracts
                    .iter()
                    .map(|(var_name, c)| format!("{} = a_{}; // {}", var_name, var_name, c.addr)),
            );
        }
        //这一小段执行完之后，就精确对应输出里第一行："x526e = a_x526e; // 0x526e8E98356194b64EaE4C2d443cC8AAD367336f"

        // sub_calls
        //再把 constructor 中解析出的调用（CREATE/CREATE2 子调用等）塞进来
        //如果前面确实取到了 "constructor()" 对应的函数对象 func，才会把其内部调用转成可输出形式
        if let Some(func) = constructor { //只有当 constructor 里确实有一个函数对象（解析到的 "constructor()"）时才执行
        //接下来可以理解成：把 trace 中的调用记录翻译成 Solidity 语句，并整理成若干组
            fn_calls.extend( //把这一步得到的“长序列”逐条追加到 fn_calls 末尾
                func.into_concise(self, interface, all_contracts, struct_defs)
                    .call_groups
                    .into_iter()
                    .flat_map(|c| c.calls), //把func里每个call_groups里的calls提取出来，然后压平，拼成一条长序列
            );
        }

        self.setup_constructor = Some(SetupConstructor { fn_def, fn_calls }); //把fn_def(函数定义)和fn_calls（函数实现）打包放在setup_constructor名下
        //注：可以从mainTx_contract_map(4)_after_generate.json文件中查看
    }

    fn build_counter_variable(&mut self, fn_signature: &str, func: &mut ConciseFn) {
        if func.call_groups.len() > 1 {
            let counter = format!("t_{}", fn_signature.split('(').next().unwrap_or_default());
            self.counters.push(counter.clone());
            func.counter = counter;
        }
    }

    fn parse_output(&mut self, ret_signature: &str, output: &str) -> Vec<String> {
        if output.is_empty() {
            return vec![];
        }

        if !ret_signature.is_empty() {
            if let Ok(ret) = self.abi_decode_output(ret_signature, output) {
                return ret;
            }
        }

        self.try_decode_output(output)
    }

    fn abi_decode_output(&mut self, ret_sig: &str, output: &str) -> Result<Vec<String>> {
        let mut abi = Abi::new();
        let args = abi.decode_output(ret_sig, output)?;

        let mut ret = vec![];
        // memory vars
        for var in &abi.memory_vars {
            ret.extend(var.generate_sol_code());
        }

        self.named_addresses.extend(abi.take_addresses());
        let args = args.into_iter().map(|a| a.to_string()).collect::<Vec<_>>();

        if args.len() == 1 {
            ret.push(format!("return {};", args[0]));
        } else {
            ret.push(format!("return ({});", args.join(", ")));
        }

        Ok(ret)
    }

    fn try_decode_output(&self, output: &str) -> Vec<String> {
        let parts = output
            .trim_start_matches("0x")
            .as_bytes()
            .chunks(64)
            .collect::<Vec<_>>();

        let mut updated = false;
        let mut chunks = vec![];
        for part in parts {
            let part = String::from_utf8_lossy(part);
            if let Some(addr) = self.bytes32_to_address(&part) {
                updated = true;
                chunks.push(format!("abi.encode(address({}))", addr));
            } else {
                chunks.push(format!("hex\"{}\"", part));
            }
        }

        let return_data = if updated {
            format!("abi.encodePacked({})", chunks.join(", "))
        } else {
            format!("hex\"{}\"", output.trim_start_matches("0x"))
        };

        vec![
            format!("bytes memory rt = {};", return_data),
            "assembly {".to_string(),
            "    return(add(rt, 0x20), mload(rt))".to_string(),
            "}".to_string(),
        ]
    }

    fn bytes32_to_address(&self, bytes32: &str) -> Option<String> {
        abi::bytes32_to_address(bytes32).map(|addr| self.as_named_address(addr))
    }

    fn as_named_address(&self, addr: String) -> String {
        let var_name = hash_to_name(&addr);
        if addr == self.addr {
            "r".to_string()
        } else if self.named_addresses.contains_key(&var_name) {
            var_name
        } else {
            addr
        }
    }

    fn order_sub_contracts(&mut self) {
        let mut ordered: Vec<SubContract> = vec![];
        for (var_name, c) in mem::take(&mut self.sub_contracts) {
            if let Some(idx) = ordered
                .iter()
                .position(|sub| sub.constructor_args.contains_key(&var_name))
            {
                ordered.insert(idx, c);
            } else {
                ordered.push(c);
            }
        }

        self.ordered_sub_contracts = ordered;
    }
}

impl From<&Contract> for SubContract {
    fn from(contract: &Contract) -> Self {
        SubContract {
            name: contract.name.clone(),
            var_name: contract.name.to_lowercase(),
            addr: contract.addr.clone(),
            is_receiver: contract.is_receiver,
            is_inner: contract.is_inner,
            salt: contract.salt.clone(),
            ..Default::default()
        }
    }
}

impl Function {
    pub fn merge_duplicate_calls(&mut self) {
        if self.call_groups.is_empty() {
            return;
        }

        let mut merged_calls = vec![];
        let mut prev = self.call_groups.first().unwrap().clone();
        for (idx, call) in self.call_groups.iter().enumerate().skip(1) {
            if &prev == call {
                prev.repeats.0 += 1;
            } else {
                merged_calls.push(prev);
                prev = call.clone();
            }
            prev.repeats.1 = idx;
        }

        merged_calls.push(prev);
        self.call_groups = merged_calls;
    }

    pub fn into_concise(
        mut self,
        contract: &mut Contract,
        interface: &mut HashSet<String>,
        all_contracts: &HashMap<String, HashMap<String, SubContract>>,
        struct_defs: &HashMap<String, StructDef>,
    ) -> ConciseFn {
        self.merge_duplicate_calls();

        // CallGroup -> ConciseCallGroup
        let concise_calls = self
            .call_groups
            .into_iter()
            .map(|c| c.into_concise(contract, interface, all_contracts, struct_defs))
            .collect::<Vec<_>>();

        let ret_signature = get_ret_def_signature(&self.ret_signature, struct_defs);

        let mut concise_fn = ConciseFn {
            is_view: self.is_view,
            fn_def_signature: self.fn_def_signature.clone(),
            ret_def_signature: ret_signature,
            call_groups: concise_calls,
            payable: self.payable,
            ..Default::default()
        };

        contract.build_counter_variable(&self.fn_def_signature, &mut concise_fn);
        concise_fn
    }
}

impl UnresolvedFn {
    pub fn new(selector: String, signature: String) -> Self {
        UnresolvedFn {
            fn_selector: selector,
            fn_signature: signature,
        }
    }
}

impl ParsedCall {
    pub fn has_memory_vars(&self) -> bool {
        !self.memory_vars.is_empty()
    }

    pub fn take_inner_create_vars(&mut self) -> HashSet<String> {
        mem::take(&mut self.inner_create_vars)
    }

    // Generate the string representation of this function call.
    // The result may be a multi-line string if there are memory variables.
    pub fn generate(
        &mut self,
        receiver_var: &str,
        all_contracts: &HashMap<String, HashMap<String, SubContract>>,
    ) -> Vec<String> {
        if self.ty == ParsedCallType::Parentheses {
            self.inner_create_vars.clear();
            return vec![self.fn_call.clone()];
        }

        let has_memory_vars = self.has_memory_vars();
        let mut fn_calls = vec![];

        if has_memory_vars {
            fn_calls.push(String::new());
        }
        fn_calls.extend(self.generate_memory_vars());

        for r in &self.return_data {
            fn_calls.push(r.to_string());
        }

        match self.ty {
            ParsedCallType::Create | ParsedCallType::Create2 => {
                let sub_var = hash_to_name(&self.target);
                if sub_var == receiver_var {
                    fn_calls.extend(self.call_self_constructor());
                } else {
                    fn_calls.extend(self.call_create_sub_contract(receiver_var, &sub_var, all_contracts));
                }
            }
            _ => {
                fn_calls.extend(self.generate_call_with_comment());
                if let Some(ref ret_decode_call) = self.ret_decode_call {
                    fn_calls.push(ret_decode_call.clone());
                }
            }
        }

        if has_memory_vars {
            fn_calls.push(String::new());
        }

        fn_calls
    }

    /// Generate a function call in the `test1` function.
    //根据当前 root_call，生成 test1() 中对应的代码行序列
    pub fn generate_test1_call(&self, is_last_call: bool, contract: &Contract) -> Vec<String> {
        let mut fn_calls = vec![];
        if is_last_call {
            fn_calls.extend(contract.init_address_vars());//只有在最后一个 root_call 时，才生成并插入地址变量初始化代码
        }

        fn_calls.extend(self.generate_memory_vars()); //为当前 root_call 生成它所需要的 局部内存变量(返回值临时变量,中间计算结果等)
        fn_calls.extend(self.generate_root_call_with_comment(is_last_call)); //生成真正的 外部调用语句，并附带注释
        fn_calls
    }

    /// Generate a function call in the `test2` function.
    pub fn generate_test2_call(&self, is_first_call: bool, is_last_call: bool, contract: &Contract) -> Vec<String> {
        let mut fn_calls = vec![];
        // The key difference between `test1` and `test2` is that `test2` needs to set the vm state before each call.
        if let Some(vm_state) = &self.vm_state {
            fn_calls.extend(vm_state.generate(is_first_call));
        }

        fn_calls.extend(self.generate_test1_call(is_last_call, contract));
        fn_calls
    }

    //调试：新增test3的函数体生成部分

    /// Generate a function call in the `test2` function.
    pub fn generate_test3_call(&self, is_last_call: bool, contract: &Contract) -> Vec<String> {
        let mut fn_calls = vec![];
        // The key difference between `test1` and `test2` is that `test2` needs to set the vm state before each call.
        if let Some(vm_state) = &self.vm_state {
            fn_calls.extend(vm_state.generate3()); //生成roll和wrap
        }
        
        fn_calls.extend(self.generate_test1_call(is_last_call, contract));
        fn_calls
    }
    //调试结束

    pub fn get_interface(&self, struct_defs: &HashMap<String, StructDef>) -> Option<String> {
        if self.ty != ParsedCallType::Interface || self.target_is_contract {
            return None;
        }

        match self.get_fn_def_signature(struct_defs) {
            Ok(fn_def_sig) => {
                let mut res = format!("function {}", fn_def_sig);
                if !self.ret_signature.is_empty() {
                    let sig = get_ret_def_signature(&self.ret_signature, struct_defs);
                    res.push_str(format!(" external payable returns ({})", sig).as_str());
                } else {
                    res.push_str(" external payable");
                }
                Some(res)
            }
            Err(e) => {
                error!("Failed to get fn_def_signature: {}, {:?}", e, self);
                None
            }
        }
    }

    pub fn generate_function(&self, struct_defs: &HashMap<String, StructDef>) -> Result<Function> {
        Ok(Function {
            is_view: self.sol_ty == "staticcall",
            fn_def_signature: self.get_fn_def_signature(struct_defs)?,
            ret_signature: self.ret_signature.clone(),
            payable: self.value != U256::ZERO,
            ..Default::default()
        })
    }

    pub fn add_returns(&mut self, output: &str, var_nonce: usize) -> Result<()> {
        if output.is_empty() {
            return Ok(());
        }

        let mut abi = Abi::new();
        let decoded = abi.decode_output(&self.ret_signature, output)?;
        self.named_addresses.extend(abi.take_addresses());
        self.struct_defs.extend(abi.take_struct_defs());

        let memory_vars = abi.take_memory_vars_map();
        self.return_data = ReturnData::from_decoded_output(decoded, memory_vars, var_nonce);
        for r in &self.return_data {
            self.return_vars.insert(r.value.to_string(), r.clone());
        }

        let vars = self.return_data.iter().map(|r| r.var_declaraion()).collect::<Vec<_>>();
        if self.ty == ParsedCallType::WithSelector {
            let var = self.return_data.first().unwrap().var.clone();
            self.fn_call = format!("(bool {var}_succ, bytes memory {var}_bytes) = {}", self.fn_call);
            self.ret_decode_call = Some(format!(
                "({vars}) = abi.decode({var}_bytes, ({sig}));",
                vars = vars.join(", "),
                var = var,
                sig = self.ret_signature
            ));
        } else {
            self.fn_call = if vars.len() == 1 {
                format!("{} = {}", vars.first().unwrap(), self.fn_call)
            } else {
                format!("({}) = {}", vars.join(", "), self.fn_call)
            };
        }

        Ok(())
    }

    /// Generate a console2.log to log the return values of a parsed_call.
    /// array/bytes values are not supported
    pub fn new_log(&self) -> Option<ParsedCall> {
        if self
            .return_data
            .iter()
            .any(|r| r.ty.ends_with("[]") || r.ty.starts_with("bytes"))
        {
            return None;
        }

        // "uint256 v0 = I(x1578).balanceOf(r);" -> "I(x1578).balanceOf(r)"
        let desc = {
            let start_idx = self.fn_call.find('=').map(|i| i + 2).unwrap_or_default();
            let end_idx = self.fn_call.len() - 1;
            &self.fn_call[start_idx..end_idx]
        };
        let tab = if desc.contains("(r)") { "\\t\\t" } else { "\\t" };

        let values = self
            .return_data
            .iter()
            .map(|r| {
                if r.ty == "uint256" {
                    utils::prettify_value(&r.value)
                } else {
                    r.var.clone()
                }
            })
            .collect::<Vec<_>>();

        let fn_call = format!("console2.log(\"{desc}{tab}->\", {});", values.join(", "));

        Some(ParsedCall {
            ty: ParsedCallType::HardhatCheat,
            sol_ty: "staticcall".to_string(),
            caller: self.caller.clone(),
            target: HARDHAT_CHEAT_ADDR.to_string(),
            fn_call,
            ..Default::default()
        })
    }

    pub fn left_parenthesis() -> Self {
        ParsedCall {
            ty: ParsedCallType::Parentheses,
            sol_ty: "staticcall".to_string(),
            fn_call: "{".to_string(),
            ..Default::default()
        }
    }

    pub fn right_parenthesis() -> Self {
        ParsedCall {
            ty: ParsedCallType::Parentheses,
            sol_ty: "staticcall".to_string(),
            fn_call: "}".to_string(),
            ..Default::default()
        }
    }

    fn generate_memory_vars(&self) -> Vec<String> {
        let mut fn_calls = vec![];
        for var in &self.memory_vars {
            fn_calls.extend(var.generate_sol_code());
        }

        fn_calls
    }

    fn generate_call_with_comment(&self) -> Vec<String> {
        let mut fn_calls = vec![];
        if let Some(comment) = &self.comment {
            fn_calls.push(comment.clone());
        }
        fn_calls.push(self.fn_call.clone());
        fn_calls
    }

    fn generate_root_call_with_comment(&self, is_last_call: bool) -> Vec<String> {
        if is_last_call {
            return self.generate_call_with_comment();
        }

        let mut fn_calls = vec![];
        if let Some(comment) = &self.comment {
            fn_calls.push(comment.clone());
        }
        fn_calls.push(format!("this.{}", self.fn_call));
        fn_calls
    }

    // this._constructor_{value: 100}();
    fn call_self_constructor(&self) -> Vec<String> {
        let fn_call = if let Some(args) = self.constructor_additional_args(&self.salt) {
            format!("this._constructor_{}();", args)
        } else {
            "_constructor_();".to_string()
        };

        vec![fn_call]
    }

    /* *
     * Create a sub contract.
     * e.g.
     * // x7704 is the sub_contract of xa612.
     * address x7704 = address(new X7704(r));
     * // xa612 is the sub_contract of r.
     * xa612 = address(new Xa612(r, x7704));
     */
    fn call_create_sub_contract(
        &mut self,
        receiver_var: &str,
        sub_var: &str,
        // map<contract_var, sub_contracts>
        all_contracts: &HashMap<String, HashMap<String, SubContract>>,
    ) -> Vec<String> {
        let mut fn_calls = vec![];

        let subs = all_contracts.get(receiver_var).unwrap();
        let sub_name = sub_var[..1].to_uppercase() + &sub_var[1..];
        let sub_contract = subs.get(sub_var).expect("sub_contract not found");

        let mut addr_vars = sub_contract.constructor_args.values().cloned().collect::<Vec<String>>();
        addr_vars.sort();
        let args = addr_vars
            .iter()
            .map(|addr_var| {
                if addr_var == receiver_var {
                    "r".to_string()
                } else {
                    if !subs.contains_key(addr_var) && !self.inner_create_vars.contains(addr_var) {
                        // address x7704 = address(new X7704(r));
                        let memory_vars = self
                            .call_create_sub_contract(sub_var, addr_var, all_contracts)
                            .into_iter()
                            .map(|code| {
                                if code.starts_with("address") {
                                    code
                                } else {
                                    format!("address {}", code)
                                }
                            })
                            .collect::<Vec<_>>();
                        fn_calls.extend(memory_vars);
                        self.inner_create_vars.insert(addr_var.clone());
                    }
                    addr_var.clone()
                }
            })
            .collect::<Vec<_>>()
            .join(", ");
        // xa612 = address(new Xa612(r, x7704));
        let mut fn_call = format!("{} = address(new {}", sub_var, sub_name);
        if let Some(additional_args) = self.constructor_additional_args(&sub_contract.salt) {
            fn_call.push_str(&additional_args);
        }
        fn_call.push_str(format!("({}));", args).as_str());

        fn_calls.push(fn_call);
        fn_calls
    }

    fn constructor_additional_args(&self, salt: &Option<String>) -> Option<String> {
        if self.value == U256::ZERO && salt.is_none() {
            return None;
        }

        let mut args = vec![];
        if self.value != U256::ZERO {
            args.push(format!("value: {}", self.value));
        }

        if let Some(salt) = salt {
            args.push(format!("salt: bytes32(\"{salt}\")"));
        }

        Some(format!("{{{}}}", args.join(", ")))
    }

    // The fn signature to define a function.
    fn get_fn_def_signature(&self, struct_defs: &HashMap<String, StructDef>) -> Result<String> {
        Abi::new().get_fn_def_signature(&self.fn_signature, struct_defs)
    }
}

impl ReturnData {
    pub fn from_decoded_output(
        decoded: Vec<DecodedArg>,
        memory_vars: HashMap<String, MemoryVar>,
        var_nonce: usize,
    ) -> Vec<Self> {
        decoded
            .into_iter()
            .enumerate()
            .map(|(i, arg)| {
                let var = format!("v{}", var_nonce + i);
                let value = if arg.is_dynamic {
                    memory_vars.get(&arg.value).and_then(|v| v.value()).unwrap_or_default()
                } else {
                    arg.value
                };

                ReturnData {
                    ty: arg.ty,
                    var,
                    value,
                    is_dynamic: arg.is_dynamic,
                }
            })
            .collect()
    }

    pub fn var_declaraion(&self) -> String {
        if self.is_dynamic {
            format!("{} memory {}", self.ty, self.var)
        } else {
            format!("{} {}", self.ty, self.var)
        }
    }

    // Try to replace the `target_val` with `self.var` if the types match.
    pub fn try_replace(&self, target_ty: &str, target_val: &str) -> String {
        if self.ty == target_ty {
            return self.var.clone();
        }

        // type conversion between uints with different size
        if self.ty.starts_with("uint") && target_ty.starts_with("uint") {
            let self_size = self.ty.trim_start_matches("uint").parse::<usize>().unwrap_or_default();
            let target_size = target_ty
                .trim_start_matches("uint")
                .parse::<usize>()
                .unwrap_or_default();
            if self_size > target_size {
                return format!("uint{}({})", target_size, self.var);
            }
        }

        target_val.to_string()
    }
}

impl CallGroup {
    pub fn new(calls: Vec<ParsedCall>, raw_output: String, decoded_output: Vec<String>) -> Self {
        CallGroup {
            calls,
            raw_output,
            decoded_output,
            repeats: (1, 0),
        }
    }

    pub fn into_concise(
        self,
        contract: &mut Contract,
        interface: &mut HashSet<String>,
        all_contracts: &HashMap<String, HashMap<String, SubContract>>,
        struct_defs: &HashMap<String, StructDef>,
    ) -> ConciseCallGroup {
        let receiver_var = contract.name.to_lowercase();
        let cond = self.get_cond();

        let mut calls = vec![];
        let mut inner_create_vars = HashSet::new();
        for mut call in self.calls {
            if let Some(i) = call.get_interface(struct_defs) {
                interface.insert(i);
            }

            call.inner_create_vars.extend(inner_create_vars);
            let fn_calls = call.generate(&receiver_var, all_contracts);
            inner_create_vars = call.take_inner_create_vars();
            calls.extend(fn_calls);
        }

        let outputs = self.decoded_output;
        ConciseCallGroup { calls, outputs, cond }
    }

    fn get_cond(&self) -> String {
        // in the generated code, the `counter++` is always placed before the `if`
        // block. so the `counter` starts from 1.
        if self.repeats.0 == 1 {
            format!(" == {}", self.repeats.1 + 1)
        } else {
            format!(" <= {}", self.repeats.1 + 1)
        }
    }
}

impl PartialEq for CallGroup {
    fn eq(&self, other: &Self) -> bool {
        self.calls == other.calls && self.raw_output == other.raw_output
    }
}

// The return signature to define a function.
fn get_ret_def_signature(ret_sig: &str, struct_defs: &HashMap<String, StructDef>) -> String {
    Abi::new()
        .get_ret_def_signature(ret_sig, struct_defs)
        .unwrap_or_default()
}
