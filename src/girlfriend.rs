use std::{
    collections::{HashMap, HashSet, VecDeque},
    fs::{self, OpenOptions, File},
    mem,
    path::Path,
    process::Command,
    vec,
};

use alloy_primitives::{hex, U256};
use anyhow::{anyhow, Result};
use regex::Regex;
use handlebars::{handlebars_helper, Handlebars};
use serde::Serialize;
use serde_json::Value;
use tracing::{debug, info};
use std::io::Write; // 顶部加这一行（如果还没有）
use serde_json;

#[derive(Debug, Serialize)]
struct TxTrace {
    tx: ConciseTx,
    trace: Value,
}

use crate::{
    abi::{
        signature::get_fn_signature,
        types::{DecodedArg, MemoryVar, StructDef},
        Abi,
    },
    call::Call,
    config::*,
    contract::{Contract, ParsedCall, ParsedCallType, ReturnData, SubContract, UnresolvedFn},
    kv::KV,
    tx::ConciseTx,
    utils::*,
};

const TEMPLATE: &str = include_str!("../assets/template.hbs");
const FN_SIGNATURES: &str = include_str!("../assets/fn_signatures.json");

// A template helper to add two numbers.
handlebars_helper!(add: |x: usize, y: usize| x + y);

#[derive(Debug)]
pub struct Girlfriend {
    // Output directory to store the foundry test files.
    output_dir: String,
    // A KV database to store the data from remote (fn signatures).
    db: KV,
    // ABI decoder.
    abi: Abi,
    // Nonce to generate salt for `CREATE2`.
    nonce: usize,
    // The attack tx
    tx: ConciseTx,
}

//TemplateArgs结构体
#[derive(Debug, Serialize, Default)]
struct TemplateArgs {
    file_name: String,
    receiver_name: String,
    last_txhash: String,
    chain_name: String,
    sender: String, //这是交易的发起者，可以复用
    sender_scan_url: String,
    // map<struct_signature, struct_def>
    struct_defs: HashMap<String, StructDef>,
    interface: HashSet<String>,
    contracts: Vec<Contract>,
}

#[derive(Debug)]
struct ParsedInput {
    fn_signature: String,
    ret_signature: String,
    fn_name: String,
    args: Vec<DecodedArg>,
}

//调试结构
#[derive(Serialize)]
struct TokenDebugDump {
    token_vars: Vec<String>,
    token_addrs: Vec<String>,
}

// //调试：已知代币 storage 槽位表（全局静态映射表）
// static KNOWN_TOKEN_SLOTS: Lazy<HashMap<String, (u64, bool)>> = Lazy::new(|| { //全局静态映射表,第一次用到时才初始化
//     let mut slots = HashMap::new();
//     // 主流稳定币和代币 (Solidity)
//     //slot: u64：该代币合约里 mapping(address => uint256) balances 的基准槽位编号
//     //提前写好slot，之后强行设置余额时就可以：类似于keccak256(abi.encode(sender, slot))
//     slots.insert("0x1f9840a85d5af5bf1d1762f925bdaddc4201f984".to_string(), (4, false));  // UNI
//     slots.insert("0xdac17f958d2ee523a2206206994597c13d831ec7".to_string(), (2, false));  // USDT
//     slots.insert("0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2".to_string(), (3, false));  // WETH
//     slots.insert("0x2260fac5e5542a773aa44fbcfedf7c193bc2c599".to_string(), (0, false));  // WBTC
//     slots.insert("0xa0b86991c6218b36c1d19d4a2e9eb0ce3606eb48".to_string(), (9, false));  // USDC //USDC 写死 (9,false)：表示它的 balances mapping 基准槽位是 9
//     slots.insert("0x6b175474e89094c44da98b954eedeac495271d0f".to_string(), (2, false));  // DAI
//     slots.insert("0xae7ab96520de3a18e5e111b5eaab095312d7fe84".to_string(), (0, false));  // stETH
//     slots.insert("0x514910771af9ca656af840dff83e8264ecf986ca".to_string(), (1, false));  // LINK
//     slots.insert("0x6982508145454ce325ddbe47a25d4ec3d2311933".to_string(), (0, false));  // PEPE
//     slots.insert("0x95ad61b0a150d79219dcf64e1e6cc01f0b64c4ce".to_string(), (0, false));  // SHIB
    
//     // Vyper 代币 (slot 顺序与 Solidity 相反)
//     slots.insert("0xd533a949740bb3306d119cc777fa900ba034cd52".to_string(), (3, true));   // CRV (Vyper 0.2.4)
    
//     slots
// });

impl Girlfriend {
    pub fn new(cfg: Config) -> Result<Self> {
        let db = KV::new(&cfg.comm.db_dir);
        let output_dir = String::from(&cfg.comm.output_dir);
        let tx = ConciseTx::new(cfg)?;
        db.load_fn_signatures(FN_SIGNATURES);

        Ok(Self {
            output_dir,
            db,
            abi: Abi::new(),
            nonce: 0,
            tx,
        })
    }

    /// Generate the foundry test file by the given txhash.
    /// Return (output_path, contract_name)

    //TODO:(12.29调试)（这是原本的gen函数，注释掉了，记得恢复！）
    // pub fn gen(&mut self, txhash: String) -> Result<(String, String)> {
    //     info!("🔥 Start generating: {:?}", txhash);
    //     // create directories if not exists
    //     if !Path::new(&self.output_dir).exists() {
    //         fs::create_dir_all(&self.output_dir)?;
    //     }

    //     // get txhash history
    //     let txs = self.tx.get_tx_history(&txhash)?;

    //     // get tx traces
    //     let traces = txs
    //         .iter()
    //         .map(|tx| self.tx.get_tx_trace(&tx.tx_hash))
    //         .collect::<Result<Vec<_>>>()?;

    //     // ============================
    //     // 👇 新增：把 txs / traces 保存到本地
    //     // ============================

    //     // 让文件名里带一点 txhash 方便区分
    //     let short = if txhash.len() > 10 { &txhash[..10] } else { &txhash };

    //     // 保存 txs（Vec<ConciseTx>）到 JSON
    //     let txs_path = format!("{}/debug_txs_{}.json", self.output_dir, short);
    //     let mut txs_file = File::create(&txs_path)?;
    //     // 如果 ConciseTx 已经派生了 Serialize，可以直接用这一句
    //     serde_json::to_writer_pretty(&mut txs_file, &txs)?;
    //     info!("💾 Saved tx history to {}", txs_path);

    //     // 保存 traces（Vec<serde_json::Value>）到 JSON
    //     let traces_path = format!("{}/debug_traces_{}.json", self.output_dir, short);
    //     let mut traces_file = File::create(&traces_path)?;
    //     serde_json::to_writer_pretty(&mut traces_file, &traces)?;
    //     info!("💾 Saved tx traces to {}", traces_path);

    //      // 再额外导出一个：每条记录里同时包含 tx 和 trace
    //     // 先把它们 zip 在一起
    //     let combined: Vec<TxTrace> = txs
    //         .iter()
    //         .cloned()          // 需要 ConciseTx: Clone
    //         .zip(traces.iter().cloned())   // Value 本身就是 Clone
    //         .map(|(tx, trace)| TxTrace { tx, trace })
    //         .collect();

    //     let combined_path = format!("{}/debug_tx_trace_{}.json", self.output_dir, short);
    //     let mut combined_file = File::create(&combined_path)?;
    //     serde_json::to_writer_pretty(&mut combined_file, &combined)?;
    //     info!("💾 Saved combined tx+trace to {}", combined_path);

    //     // ============================
    //     // 👆 到这里为止，你就能在本地看到：
    //     //  1) 所有 tx 列表
    //     //  2) 所有 trace 列表
    //     //  3) tx 与 trace 一一对应的组合文件
    //     // ============================

    //     let args = self.make_template_args(&txs, &traces)?;
    //     let res = self.render_test_file(&args)?;

    //     let _ = Command::new("forge").arg("fmt").output();
    //     Ok(res)
    // }

    //TODO:(12.29调试)（这是为了得到delegatecall而运行的阉割版gen函数，调试完成后记得删除！）
    pub fn gen_with_prefix(&mut self, id: &str, txhash: &str) -> Result<()> {
        let txhash = txhash.trim();
        let id = id.trim();

        info!("🔥 Start generating: id={}, tx={}", id, txhash);

        if !Path::new(&self.output_dir).exists() {
            fs::create_dir_all(&self.output_dir)?;
        }

        // get txhash history
        let txs = self.tx.get_tx_history(txhash)?;

        // get tx traces
        let traces = txs
            .iter()
            .map(|tx| self.tx.get_tx_trace(&tx.tx_hash))
            .collect::<Result<Vec<_>>>()?;

        // short tx for filename
        let short_tx = if txhash.len() > 10 { &txhash[..10] } else { txhash };

        // ✅ 文件名：2018-04-BEC_0xad89ff16fd.json
        let filename = format!("{}_{}", id, short_tx);

        let traces_path = format!("{}/{}.json", self.output_dir, filename);
        let mut traces_file = File::create(&traces_path)?;
        serde_json::to_writer_pretty(&mut traces_file, &traces)?;

        info!("💾 Saved tx traces to {}", traces_path);
        Ok(())
    }

    //这是一个递归函数：解析 call 这棵调用树（call.sub_calls），把每个子调用变成 ParsedCall
    fn parse_calls(
        &mut self,
        call: &Call,
        sender: &str,
        parent_call: &mut ParsedCall,
        contracts: &mut HashMap<String, Contract>,
        parsed_calls: &mut Vec<ParsedCall>,
    ) -> Vec<ParsedCall> {
        //预收集合约地址列表
        let contract_addrs = contracts.keys().cloned().collect::<Vec<_>>();
        // map<return_value, return_var>, clear return_vars every `CALL_STACK_MAX_DEPTH`
        // calls to avoid `stack too deep`.
        let (mut return_vars, mut return_vars_clear_idx) = (HashMap::new(), CALL_STACK_MAX_DEPTH);
        let mut has_parentheses = false;
        // there might be same return values in different calls, so the var_nonce is not
        // the same as return_vars.len()
        let mut var_nonce = 1;

        // parsed_sub_calls are pushed back, and parsed_calls are pushed front
        // so that the all_parsed are in the same order as the calls in trace
        //扁平序列容器（保持 trace 顺序）
        let mut all_parsed = VecDeque::new();

        //遍历当前节点的每个子调用,把 Call 解析成 ParsedCall
        for (idx, c) in call.sub_calls.iter().enumerate() {
            if idx == return_vars_clear_idx {
                return_vars.clear();
                return_vars_clear_idx += CALL_STACK_MAX_DEPTH;
                if !has_parentheses {
                    has_parentheses = true;
                    parsed_calls.push(ParsedCall::left_parenthesis());
                } else {
                    parsed_calls.push(ParsedCall::right_parenthesis());
                    parsed_calls.push(ParsedCall::left_parenthesis());
                }
            }

            let target = c.target.clone();
            let target_is_contract = contract_addrs.contains(&target);
            let receiver = contracts.get(&c.caller).map(|c| c.addr.clone()).unwrap_or_default();

            //把 Call 解析成 ParsedCall
            let mut parsed_call = self.parse_call(c, sender, &receiver, target_is_contract, &return_vars);
            //特殊处理 1：staticcall 的返回值绑定
            if parsed_call.sol_ty == "staticcall" && !parsed_call.ret_signature.is_empty() {
                // handle staticcall returns
                if let Ok(()) = parsed_call.add_returns(&c.output, var_nonce) {
                    var_nonce += parsed_call.return_data.len();
                    return_vars.extend(parsed_call.return_vars.clone());
                }
                //特殊处理 2：如果是create/create2，就新建一个Contract 结构，补全contracts 表
            } else if [ParsedCallType::Create, ParsedCallType::Create2].contains(&parsed_call.ty) {
                // handle inner create
                if !contracts.contains_key(&target) {
                    let contract = Contract::new(target.clone(), false, true, parsed_call.salt.clone());
                    contracts.insert(target.clone(), contract);
                }
            }
            //把该子调用对应的 ParsedCall 加入当前层的 parsed_calls
            parsed_calls.push(parsed_call.clone());

            // console2 accepts at most 4 arguments, including the first one `string`.
            #[cfg(debug_assertions)]
            //追加 console2.log 返回值
            if !parsed_call.return_data.is_empty() && parsed_call.return_data.len() < 4 {
                if let Some(log) = parsed_call.new_log() {
                    parsed_calls.push(log);
                }
            }

            // parse sub calls
            //递归解析更深层子调用(返回值 all_subs 是“parsed_call + 它全部子孙”的扁平序列)
            //把 all_subs 追加到 all_parsed 的尾部，保持和 trace 一致的顺序
            let mut parsed_sub_calls = vec![];
            let all_subs = self.parse_calls(c, sender, &mut parsed_call, contracts, &mut parsed_sub_calls);
            all_parsed.extend(all_subs);
        }
        if has_parentheses {
            parsed_calls.push(ParsedCall::right_parenthesis());
        }
        //把本层 parsed_calls 填入 parent_call.sub_calls(目的是处理好层次关系)
        parent_call.sub_calls = mem::take(parsed_calls);
        //构造扁平序列：把 parent 放在最前并返回
        all_parsed.push_front(parent_call.clone());
        all_parsed.into()
    }

    fn organize_parsed_calls(
        &self,
        parsed_calls: Vec<ParsedCall>,
        sender: &str,
        contracts: &mut HashMap<String, Contract>,
        struct_defs: &mut HashMap<String, StructDef>,
    ) {
        //遍历 parsed_calls(每个 parsed_call 表示一次完整函数调用,比如parsed_calls[0]，parsed_calls[1]  )
        for parsed_call in parsed_calls {
            let mut named_addresses = HashMap::new();
            //遍历 sub_calls（也就是函数内部的子调用）
            for sub_call in &parsed_call.sub_calls {
                //跳过括号类型(Parentheses 是 parse 过程中产生的“语法括号节点”，不是实际调用，直接无视)
                if sub_call.ty == ParsedCallType::Parentheses {
                    continue;
                }

                // handle unresolved functions
                //处理sub_calls中的未解析函数（Raw / WithSelector）
                if [ParsedCallType::Raw, ParsedCallType::WithSelector].contains(&sub_call.ty) {
                    //如果 ABI 没匹配上，这里会把 sub_call 推入 fallback 函数列表
                    self.push_fallback(sub_call.clone(), contracts);
                }

                //sub_call 解析到的 struct（来自 ABI）会加入全局 struct_defs
                //(如果交易没有任何 ABI 能解析出 struct 类型参数，因此 struct_defs 全为空，这也正常)
                struct_defs.extend(sub_call.struct_defs.clone());
                //收集 named_addresses(每个 sub_call 的 target（即被调用合约）会生成一个变量名,比如 x835f)
                let target = sub_call.target.clone();
                named_addresses.insert(hash_to_name(&target), target.clone());
                named_addresses.extend(sub_call.named_addresses.clone());
            }

            //遍历完sub_call之后，将结果写入 contract_map 中对应的 Contract
            //如果 parsed_call.target 没有出现在 contract_map 中，那么这条调用直接被忽略(说明不是核心受害合约的函数调用)
            //因为在初始化contract_map时，contract_map 里只存“核心要分析的合约”（例如受害合约）
            if let Some(contract) = contracts.get_mut(&parsed_call.target) {
                // build_function will parse the output and may generate named_addresses and
                // struct_defs
                //把“这一次 parsed_call 的函数调用信息”写进 contract 里对应的函数模型中(ps:不会生成test1,test2等等)
                contract.build_function(parsed_call, struct_defs);
                //补充信息：记录调用中涉及的地址映射
                //把 sub_call 中发现的“地址变量名 → 地址”写入 Contract,并删掉攻击者地址（攻击者不用记录）
                contract.named_addresses.extend(named_addresses);
                contract.named_addresses.remove(&hash_to_name(sender));
            }
        }
    }

    fn push_fallback(&self, parsed_call: ParsedCall, contracts: &mut HashMap<String, Contract>) {
        if let Some(contract) = contracts.get_mut(&parsed_call.target) {
            let fn_selector = parsed_call.raw_input[..10].to_string();
            let fn_signature = parsed_call.fn_signature.clone();
            contract
                .fallback
                .entry(fn_signature.clone())
                .or_insert(UnresolvedFn::new(fn_selector, fn_signature));
        }
    }

    //把一条 trace 里的 Call 解析成可用于生成 PoC的语句
    fn parse_call(
        &mut self,
        call: &Call,//当前这一次调用（含 caller/target/input/output/value/type 等）
        sender: &str,//交易发起方
        receiver: &str,//交易接收方（目标）
        target_is_contract: bool,//调用目标是否已经在合约表中
        // map<return_value, ReturnData>
        return_vars: &HashMap<String, ReturnData>,//已经解析过的返回值变量映射
    ) -> ParsedCall { //最终生成 PoC 需要的标准化调用描述 （这个函数被parsed_calls函数调用，并且其调用结果最终记录在parsed_calls文件中）
        //解析 call.input,得到：fn_signature（函数签名字符串），args（参数列表），ret_signature（返回值签名）
        let parsed_input = self.parse_input(call); 
        //得到call 的类型（CALL/STATICCALL等）
        let parsed_call_type = get_parsed_call_type(call, &parsed_input, target_is_contract);

        // contract variable name
        //推导“目标地址对应的变量名”（例如 x1234 这种）
        let mut contract_var = call.target_var.clone();
        //如果 receiver（当前上下文合约地址）== call.target（被调用地址）：把目标变量名强制写成 "r",如r.xxx(...)
        if receiver == call.target {
            contract_var = "r".to_string();
        //否则如果 sender == call.target：把目标变量名写成 address(tx.origin)
        } else if sender == call.target {
            contract_var = "address(tx.origin)".to_string();
        }

        // sender and receiver variable names
        //计算 sender/receiver 的“变量名”
        let sender_var = hash_to_name(sender); //把 sender 地址转换成一个稳定的变量名（例如 xdead / x1a2b 这种）
        //如果没有 receiver 上下文（空字符串），receiver_var 就置空,否则把 receiver 地址也转换成变量名
        let receiver_var = if receiver.is_empty() {
            "".to_string()
        } else {
            hash_to_name(receiver)
        };

        //提取返回值签名 ret_signature（如："uint256"）
        let ret_signature = parsed_input
            .as_ref()
            .map(|i| i.ret_signature.clone())
            .unwrap_or_default();

        let mut named_addresses = HashMap::new(); //准备容器，用于收集“在解析本次调用过程中发现的需要命名的地址”

        //根据 parsed_call_type 生成 fn_sig 与 fn_call (fn_sig是函数签名，如“balanceOf”或“flashLoanSimple”
        // fn_call是具体调用语句，如"I(x8787).flashLoanSimple(r, xc02a, 4000000000000000000000, \"\", 0);"可以直接粘贴到Poc里)
        //match函数：按“这条调用能解析到什么程度”选择不同的生成策略
        let (fn_sig, fn_call) = match parsed_call_type {
            //CREATE / CREATE2：内部创建合约语句
            ParsedCallType::Create | ParsedCallType::Create2 => call_inner_create(call, &contract_var),
            ParsedCallType::SelfDestruct => call_selfdestruct(&contract_var),//自毁调用语句
            ParsedCallType::WithSelector => call_with_selector(//无 ABI 但有 selector 的伪函数调用(就是xb91e0731() 这类，有 selector 但没有 ABI，只能生成伪函数名)
                call,
                &contract_var,
                &sender_var,
                &receiver_var,
                return_vars,
                &mut named_addresses,
            ),
            _ => {
                if let Ok(input) = parsed_input { //其它正常情况：优先使用 parsed_input,走“最完整、最语义化”的生成路径
                    //根据 input.fn_signature 和 call 类型修饰，生成最终 fn_sig
                    let fn_sig = format_fn_sig(&input.fn_signature, &parsed_call_type);
                    //参数
                    let fn_args =
                        format_fn_args(&input.args, &sender_var, &receiver_var, return_vars, &parsed_call_type);
                    //重要！！
                    //生成真正要输出的调用语句字符串,类似于"uint256 v1 = I(xc02a).balanceOf(r);",
                    let fn_call = format_fn_call(
                        call,
                        &input,
                        &parsed_call_type,
                        target_is_contract,
                        &contract_var,
                        &fn_args,
                    );
                    (fn_sig, fn_call)
                //parsed_input 失败时：Hardhat cheat 或 rawdata fallback
                } else if parsed_call_type == ParsedCallType::HardhatCheat {
                    generate_hardhat_comment(call, &sender_var, &receiver_var, return_vars)
                } else {
                    //兜底方案
                    //当这条调用的 input 既无法用 ABI/签名库解析出函数签名与参数，也不属于 hardhat cheat 这种可识别特例时，就退化为 rawdata 方式生成
                    call_with_rawdata(call, &contract_var)
                }
            }
        };
        //合并 ABI 解析器产生的命名地址(因为abi 在 parse_input 过程中可能缓存了一批“地址 → 名称”的映射)
        named_addresses.extend(self.abi.take_addresses());

        //如果是 CREATE2：生成 salt
        let salt = if parsed_call_type == ParsedCallType::Create2 {
            Some(self.generate_salt())
        } else {
            None
        };

        //最终返回一个结构体：ParsedCall 
        ParsedCall {
            ty: parsed_call_type, //"DelegateCall"
            sol_ty: call.ty.clone(),// "delegatecall"
            caller: call.caller.clone(),//"0x526e8E98356194b64EaE4C2d443cC8AAD367336f"
            target: call.target.clone(),// "0xFBEEAa651e5aBE3b820AE03cf4Db5AeCf96BAbAb"
            fn_signature: fn_sig,//"stringToAddress(string)"
            ret_signature,// ""
            fn_call,//"xfbee.delegatecall(abi.encodeWithSignature(\"stringToAddress(string)\", \"0x085bDfF2C522e8637D4154039Db8746bb8642BfF\"));",
            raw_input: call.input.to_string(),// "0x15706fdf0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000002a30783038356244664632433532326538363337443431353430333944623837343662623836343242664600000000000000000000000000000000000000000000",
            raw_output: call.output.to_string(),//"0x000000000000000000000000085bdff2c522e8637d4154039db8746bb8642bff",
            value: call.value,//"0x0",
            target_is_contract,
            memory_vars: self.take_memory_vars(&sender_var, &receiver_var),//[],
            named_addresses,
            struct_defs: self.abi.take_struct_defs(),
            salt,
            ..Default::default()
        }
    }

    // mock a function named `txhash[1..0]()` in the receiver contract.
    // the calls in trace will be parsed into this function.
    fn parse_pre_call(&mut self, tx: &ConciseTx, receiver: &str) -> ParsedCall {
        let fn_sig = format!("{}()", &tx.tx_hash[1..10]);
        let phalcon_link = format!("// {}/{}/{}", PHALCON_URL, tx.chain, tx.tx_hash);

        ParsedCall {
            ty: ParsedCallType::Interface,
            sol_ty: "call".to_string(),
            caller: tx.sender.to_string(),
            target: receiver.to_string(),
            fn_call: format!("{};", fn_sig),
            fn_signature: fn_sig,
            target_is_contract: true,
            comment: Some(phalcon_link),
            vm_state: Some(tx.generate_vm_state()),

            ..Default::default()
        }
    }

    // Root call is always an internal interface call.
    //作用：把一笔交易的根调用（root call，对应最外层那一次 CALL / CREATE 等）解析成一个 ParsedCall，用于后续生成 PoC 里的 fn_call 语句等
    fn parse_root_call(&mut self, tx: &ConciseTx, call: &Call) -> ParsedCall {
        //如果根调用是合约创建（CREATE/CREATE2），则不按普通“函数调用”解析，而是走 parse_pre_call
        if ["create", "create2"].contains(&call.ty.as_str()) {
            return self.parse_pre_call(tx, &call.target);
        }
        //尝试把 input 按 ABI 解析成“函数名 + 参数 + 返回签名
        let parsed_input = self.parse_input(call);
        let sender_var = hash_to_name(&call.caller);
        let ty = ParsedCallType::Interface;

        //先把“返回值签名”安全取出来（解析失败则空串）
        let ret_signature = parsed_input
            .as_ref()
            .map(|i| i.ret_signature.clone())
            .unwrap_or_default();

        //构造 fn_signature / fn_name / args（三元组）
        let (fn_signature, fn_name, args) = match parsed_input {
            Ok(input) => {
                let return_vars = HashMap::new();
                let fn_args = format_fn_args(&input.args, &sender_var, &call.target_var, &return_vars, &ty);

                (input.fn_signature, input.fn_name, fn_args)
            }
            Err(_) => {
                let fn_signature = format!("{}()", &call.input[1..10]);
                let fn_name = call.input[1..10].to_string();
                let args = "".to_string();
                (fn_signature, fn_name, args)
            }
        };

        //生成 Solidity 调用语句 fn_call
        let fn_call = if call.value != U256::ZERO {
            format!("this.{}{{value: {}}}({});", fn_name, call.value, args)
        } else {
            format!("{}({});", fn_name, args)
        };

        //根据模板，组装 phalcon 链接和最终 ParsedCall 对象
        let phalcon_link = format!("// {}/{}/{}", PHALCON_URL, tx.chain, tx.tx_hash);
        ParsedCall {
            ty,
            sol_ty: call.ty.clone(),
            caller: call.caller.clone(),
            target: call.target.clone(),
            fn_signature,
            ret_signature,
            fn_call,
            target_is_contract: true,
            raw_input: call.input.clone(),
            raw_output: call.output.clone(),
            value: call.value,
            memory_vars: self.take_memory_vars(&sender_var, &call.target_var),
            named_addresses: self.abi.take_addresses(),
            struct_defs: self.abi.take_struct_defs(),
            comment: Some(phalcon_link),
            vm_state: Some(tx.generate_vm_state()),
            ..Default::default()
        }
    }

    fn initialize_contracts(&mut self, receiver: &str) -> HashMap<String, Contract> {
        let recv_contract = Contract::new(receiver.to_string(), true, false, None);
        let mut contracts = HashMap::new();
        contracts.insert(recv_contract.addr.clone(), recv_contract);
        contracts
    }

    //解析一笔 EVM 调用的 input，尝试恢复:(1)函数签名fn_signature (2)返回值签名ret_signature (3)函数名fn_name (4)已解码的参数列表args
    fn parse_input(&mut self, call: &Call) -> Result<ParsedInput> {
        //input 长度检查:最小合法函数调用 input是10个字符。如果长度小于10，说明不是函数调用，可能是ETH转账或fallback等。这里选择忽略
        if call.input.len() < 10 {
            return Err(anyhow!("Ignore: {}", call.input));
        }

        //提取函数选择器 selector(取 input 前 10 个字符,比如“0xa9059cbb”。这就是函数选择器，后续所有函数签名查找都围绕这个 selector 进行)
        let selector = &call.input[..10];

        //尝试获取函数签名（先查本地缓存，查不到就在线找或者推断）
        //match self.db.get_fn_signature:从本地数据库中查找 selector 对应的fn_sig(函数签名字符串)和ret_sig（返回值签名）
        let (fn_sig, ret_sig) = match self.db.get_fn_signature(selector) {
            Some((fn_sig, ret_sig)) => { //本地数据库命中（Some）
                //如果fn_sig 为空：之前已经确认“查不到”，直接返回错误，避免错误推断
                if fn_sig.is_empty() {
                    return Err(anyhow!("Signature not found"));
                } else { //fn_sig 非空：成功命中缓存,直接返回fn_sig和ret_sig即可
                    debug!("Get fn signature from local: {}; ret_sig: {}", fn_sig, ret_sig);
                    (fn_sig, ret_sig)
                }
            }
            None => { //本地数据库未命中（None）(说明本地从未见过该 selector，需要尝试推断 / 查询)
                //查询 4byte / 本地规则,尝试通过 input / output / target 推断签名
                if let Ok((fn_sig, ret_sig)) = get_fn_signature(&call.input, &call.output, &call.target) {
                    //如果推断成功：写入缓存并返回
                    self.db.set_fn_signature(selector, &fn_sig, ret_sig.clone());
                    (fn_sig, ret_sig.unwrap_or_default())
                } else { //推断失败：记录“失败状态”并返回错误
                    self.db.set_fn_signature(selector, "", None);
                    return Err(anyhow!("Signature not found"));
                }
            }
        };

        //从函数签名中提取函数名,比如从"transfer(address,uint256)" 推断出函数名 "transfer"
        let fn_name = fn_sig.split('(').next().unwrap_or(selector).to_string();
        //ABI 解码函数参数
        let args = self.abi.decode_input(&fn_sig, &call.input)?;

        //最终返回结果：一个结构体
        Ok(ParsedInput {
            fn_signature: fn_sig, //完整 ABI 签名,如transfer(address,uint256)
            ret_signature: ret_sig,//返回值签名
            fn_name,//函数名
            args,//参数
        })
    }

    //新增函数
    fn dump_to_file<T: Serialize>(file: &str, _name: &str, value: &T) {
        let full_path = format!("./test/{}", file);
        let mut f = OpenOptions::new()
            .create(true)
            .append(true)
            .open(&full_path)
            .unwrap();

        let s = serde_json::to_string_pretty(value).unwrap();
        let _ = writeln!(f, "{}\n", s);
    }

    // //调试：新增“Vyper合约计算balance槽位”函数
    // /// Vyper 标准: keccak256(pad32(slot) ++ pad32(address))
    // /// 用于 Vyper 合约 (CRV, Curve 系列代币)
    // /// 注意: slot 和 address 的顺序与 Solidity 相反！
    // pub fn calc_balance_slot_vyper(address: &str, slot_index: u64) -> H256 {
    //     let addr: Address = address.parse().expect("Invalid address");
    //     let mut data = [0u8; 64];
        
    //     // 前 32 字节: slot (大端序, 左填充 0)
    //     let slot_u256 = U256::from(slot_index);
    //     slot_u256.to_big_endian(&mut data[0..32]);
        
    //     // 后 32 字节: address (左填充 0)
    //     data[44..64].copy_from_slice(&addr.to_fixed_bytes());
        
    //     keccak256(data).into()
    // }

    // //调试：新增Solidity标准中“计算余额槽位”函数
    // /// Solidity 标准: keccak256(pad32(address) ++ pad32(slot))
    // /// 用于大多数 ERC20 代币 (WETH, USDT, USDC, WBTC, etc.)
    // //作用：按照 Solidity 的标准 mapping 存储规则，计算 balances[address] 在 storage 中的槽位 key
    // //等价于 Solidity 里的：keccak256(abi.encode(address, slot_index))
    // pub fn calc_balance_slot_solidity(address: &str, slot_index: u64) -> H256 {
    //     //把字符串形式的地址解析为 Address 类型(合法以太坊地址)
    //     let addr: Address = address.parse().expect("Invalid address");
    //     //分配一个 64 字节的数组，全部初始化为 0x00
    //     let mut data = [0u8; 64];
        
    //     // 前 32 字节: address (左填充 0)
    //     data[12..32].copy_from_slice(&addr.to_fixed_bytes());
        
    //     // 后 32 字节: slot (大端序, 左填充 0)
    //     let slot_u256 = U256::from(slot_index);
    //     slot_u256.to_big_endian(&mut data[32..64]);
    //     //整体效果：左侧补 12 个 0，右侧放 20 字节 address
        
    //     keccak256(data).into()
    // }

    //调试：新增函数norm_addr，目的是将传入的地址全部转化为小写字母
    fn norm_addr(s: &str) -> String {
        let s = s.trim();
        if s.starts_with("0x") || s.starts_with("0X") {
            format!("0x{}", &s[2..].to_ascii_lowercase())
        } else {
            format!("0x{}", s.to_ascii_lowercase())
        }
    }

    /// 调试：你关心的“token主体调用”函数名集合：I(xTOKEN).fn(...)
    fn is_token_method(fn_name: &str) -> bool {
        matches!(
            fn_name,
            // ERC20 强信号
            "balanceOf" | "approve" | "transfer" | "transferFrom" | "allowance"
            | "totalSupply" | "decimals" | "symbol" | "name"
            // permit 系列（可选但常见）
            | "permit" | "nonces" | "DOMAIN_SEPARATOR"
            // // WETH/包装币（可选）
            // | "deposit" | "withdraw"
        )
    }

    /// 调试：“协议函数”中 token 常作为第一个参数出现：protocol.deposit(token, amount) / withdraw(token, amount)
    fn is_protocol_fn_with_token_first_arg(fn_name: &str) -> bool {
        matches!(
            fn_name,
            "deposit" | "withdraw"
            // 你后续可以按需要扩展，比如 "swap" / "exactInput" 等
        )
    }

    /// 调试：从一行 calls 字符串里提取 token 变量名：x1f98 这种
    fn extract_token_vars_from_line(line: &str, re_i_call: &Regex, re_protocol_first_arg: &Regex) -> HashSet<String> {
        let mut out = HashSet::new();

        // 规则 A：I(x????).<fn>(...) —— token 合约就是主体
        // 例：I(x1f98).approve(...)
        if let Some(cap) = re_i_call.captures(line) {
            let var = cap.get(1).unwrap().as_str().to_string();     // x1f98
            let fn_name = cap.get(2).unwrap().as_str();             // approve/balanceOf/...
            if Self::is_token_method(fn_name) {
                out.insert(var);
            }
        }

        // 规则 B：<protocol>.<deposit|withdraw>(xTOKEN, ...) —— token 是第一个参数
        // 例：I(xde7b).withdraw(x1f98, 1);
        if let Some(cap) = re_protocol_first_arg.captures(line) {
            let fn_name = cap.get(1).unwrap().as_str();             // deposit/withdraw
            let token_var = cap.get(2).unwrap().as_str().to_string(); // x1f98
            if Self::is_protocol_fn_with_token_first_arg(fn_name) {
                out.insert(token_var);
            }
        }

        out
    }

    //调试：给receiver设置金额的函数（防止这个本地合约因为没有足够余额而revert）
    fn get_tokens_from_contract_map(
        contract_map: &HashMap<String, Contract>,
    ) -> (HashSet<String>, HashSet<String>) {
        let re_i_call = Regex::new(r#"I\((x[0-9a-fA-F]{4})\)\.(\w+)\s*\("#).unwrap();
        let re_protocol_first_arg = Regex::new(r#"\.(\w+)\s*\(\s*(x[0-9a-fA-F]{4})\s*,"#).unwrap();

        let mut token_vars: HashSet<String> = HashSet::new();
        let mut token_addrs: HashSet<String> = HashSet::new();

        for (contract_addr, contract) in contract_map.iter() {
            // ① 变量 -> 地址
            // 你这里 JSON 里叫 named_addresses，Contract 里大概率也有同名字段
            // 假设是: contract.named_addresses: HashMap<String, String>
            let var2addr = &contract.named_addresses;

            // ② 遍历 ordered_functions -> call_groups -> calls（字符串行）
            // 假设是: contract.ordered_functions: Vec<OrderedFn>
            for f in contract.ordered_functions.iter() {
                let fn_sig = f.fn_def_signature.as_str();

                for cg in f.call_groups.iter() {
                    for line in cg.calls.iter() {
                        if line.trim_start().starts_with("//") { continue; }

                        let vars = Self::extract_token_vars_from_line(line, &re_i_call, &re_protocol_first_arg);
                        if vars.is_empty() { continue; }

                        for v in vars {
                            token_vars.insert(v.clone());

                            if let Some(addr) = var2addr.get(&v) {
                                token_addrs.insert(Self::norm_addr(addr)); // ✅ 归一化，后面更容易命中 KNOWN_TOKEN_SLOTS
                                println!(
                                    "[hit] contract={} fn={} token_var={} token_addr={} line={}",
                                    contract_addr, fn_sig, v, addr, line
                                );
                            } else {
                                println!(
                                    "[hit-but-no-mapping] contract={} fn={} token_var={} line={}",
                                    contract_addr, fn_sig, v, line
                                );
                            }
                        }
                    }
                }
            }
        }

        (token_vars, token_addrs)
    }



    //把 tx + trace → 解析成调用信息, 填充合约/接口/测试用例, 然后组装成 TemplateArgs 用来生成 PoC 模板文件
    fn make_template_args(&mut self, txs: &[ConciseTx], traces: &[Value]) -> Result<TemplateArgs> {
        let chain = self.tx.chain.clone();//链名

        let last_tx = txs.last().unwrap(); //最后一笔交易，通常就是“主要攻击 tx”
        let mut pre_calls = traces.iter().map(Call::from).collect::<Vec<_>>(); //前面几笔交易的根调用（如果有多笔 tx）
        let root_call = pre_calls.pop().unwrap(); //最后一笔交易的根调用
        let sender = root_call.caller.clone(); //攻击者地址（发起 root_call 的 caller）
        let receiver = root_call.target.clone(); //攻击最核心目标合约地址
        let file_name = format!("{}.t.sol", hash_to_name(&last_tx.tx_hash)); //用最后一笔 tx 的 hash 转个名字当 Sol 测试文件名，比如 x1234abcd.t.sol

        let mut contract_map = self.initialize_contracts(&receiver); //初始化一个 HashMap<String, Contract>，里头先只放“核心要分析的合约”，例如受害合约
        Self::dump_to_file("initiaize_contract_map.json", &format!("initiaize_contract_map"), &contract_map);
        let mut struct_defs = HashMap::new(); //全局的 struct 定义表（从 ABI 里解析出的 struct 会放在这里）

        let mut parsed_root_calls = vec![]; //保存每一笔交易的“根调用解析结果” (ParsedCall)

        // parse pre_calls
        //处理前置交易（pre_calls）
        for (idx, c) in pre_calls.iter().enumerate() {
            let mut pc = self.parse_pre_call(&txs[idx], &receiver);
            // ⭐  1、dump: pc
            Self::dump_to_file("debug_pc.json", &format!("pc[{}]", idx), &pc);
            struct_defs.extend(pc.struct_defs.clone());
            // 2、dump: struct_defs
            Self::dump_to_file("debug_struct_defs.json", &format!("struct_defs[{}]", idx), &struct_defs);
            parsed_root_calls.push(pc.clone());
            // ⭐3、dump: parsed_root_calls
            Self::dump_to_file("debug_root_calls.json", &format!("parsed_root_calls_after_{}", idx), &parsed_root_calls);
            let root_call = Call::mock_parent(&sender, &receiver, c);
            // 4、dump: mock root_call
            Self::dump_to_file("debug_root_call.json", &format!("root_call[{}]", idx), &root_call);
            let parsed_calls = self.parse_calls(&root_call, &sender, &mut pc, &mut contract_map, &mut vec![]);
            // 5、dump parse_calls result
            Self::dump_to_file("debug_parsed_calls.json", &format!("parsed_calls[{}]", idx), &parsed_calls);
            self.organize_parsed_calls(parsed_calls, &sender, &mut contract_map, &mut struct_defs);
            // dump contract_map after organize
            Self::dump_to_file("debug_contract_map.json", &format!("contract_map_after_{}", idx), &contract_map);
            Self::dump_to_file("debug_struct_defs_after_organize.json", &format!("struct_defs_after_organize[{}]", idx), &struct_defs);
        }

        // parse root_call
        //4.3 处理主攻击交易（最后一笔 tx）
        let mut pc = self.parse_root_call(last_tx, &root_call); //针对最后一笔 tx 做更精细的解析
        Self::dump_to_file("main_tx_pc.json", &format!("main_tx_pc"), &pc);
        struct_defs.extend(pc.struct_defs.clone()); //根据目前得到的主攻击交易的pc，扩展 struct_defs，压入 parsed_root_calls
        parsed_root_calls.push(pc.clone());
        Self::dump_to_file("parsed_root_calls_after_mainTx.json", &format!("parsed_root_calls_after_mainTx"), &parsed_root_calls);
        let root_call = if ["create", "create2"].contains(&root_call.ty.as_str()) {
            Call::mock_parent(&sender, &receiver, &root_call)
        } else {
            root_call
        };
        Self::dump_to_file("mainTx_root_call.json", &format!("mainTx_root_call"), &root_call);
        let parsed_calls = self.parse_calls(&root_call, &sender, &mut pc, &mut contract_map, &mut vec![]);
        Self::dump_to_file("mainTx_parsed_calls.json", &format!("mainTx_parsed_calls"), &parsed_calls);
        Self::dump_to_file("mainTx_contract_map.json", &format!("mainTx_contract_map"), &contract_map);
        self.organize_parsed_calls(parsed_calls, &sender, &mut contract_map, &mut struct_defs);
        Self::dump_to_file("mainTx_contract_map_1_after_organize.json", &format!("mainTx_contract_map_after_organize"), &contract_map);
        Self::dump_to_file("mainTx_struct_defs_after_organize.json", &format!("mainTx_struct_defs_after_organize"), &struct_defs);

        //4.4 构建子合约、接口、测试函数
        build_sub_contracts(&mut contract_map);
        //打印
        Self::dump_to_file("mainTx_contract_map_2_after_buildSub.json", &format!("mainTx_contract_map_after_buildSub"), &contract_map);
        for (addr, c) in &contract_map {
            Self::dump_to_file(
                "Contract_functions.json",
                &format!("contract_functions_{}", addr),
                &c.functions   // 如果 functions 没有实现 Serialize 会报错
            );
        }

        // build constructor args for sub contracts
        let mut sub_contracts = contract_map
            .values()
            .map(|c| (c.name.to_lowercase(), c.sub_contracts.clone()))
            .collect::<HashMap<_, _>>();
        //打印
        Self::dump_to_file("Sub_contracts.json", &format!("Sub_contracts"), &sub_contracts);
        
        for c in contract_map.values_mut() {
            c.build_sub_contracts_constructor_args(&mut sub_contracts);
        }
        //打印
        Self::dump_to_file("mainTx_contract_map_3_after_valuesMut.json", &format!("mainTx_contract_map_after_valuesMut"), &contract_map);
        Self::dump_to_file("Sub_contracts_after_valuesMut.json", &format!("Sub_contracts_after_valuesMut"), &sub_contracts);
        // Generate contracts
        //生成最终contract
        let root_fn_sigs = parsed_root_calls
            .iter()
            .map(|prc| prc.fn_signature.as_str())
            .collect::<Vec<_>>();
        //打印
        // ⭐ dump 时，把 &str 转成 String（仅用于 dump，不影响原 Vec<&str>）
        let root_fn_sigs_dump: Vec<String> = root_fn_sigs.iter().map(|s| s.to_string()).collect();
        Self::dump_to_file("root_fn_sigs.json","root_fn_sigs",&root_fn_sigs_dump);
        
        let mut interface = HashSet::new();
        Self::dump_to_file("interface_before_generate.json", "interface_before_generate", &interface);
        for c in contract_map.values_mut() { //循环遍历迭代器，对contract_map里每一个合约(contract对象)都执行generate函数
            c.generate(
                &sub_contracts,
                &last_tx.tx_hash,
                &root_fn_sigs,
                &mut interface,
                &struct_defs,
            )
        }
        //打印
        Self::dump_to_file("mainTx_contract_map_4_after_generate.json", &format!("mainTx_contract_map_after_generate"), &contract_map);
        //调试：设置receiver余额  只有在这里，contract_map_4才生成，才可以进行“查找代币地址”和“receiver余额修改”
        let receiver = root_call.target.clone();//攻击最核心目标合约地址
        //现在是make_template_args函数调用setup_token_balances，进行“给receiver设置代币余额”这个操作
        //这里直接用contract_map,不用dump出来的文件了
        let (token_vars, token_addrs_set) = Self::get_tokens_from_contract_map(&contract_map);
        // 需要 Vec 就转一下（可排序保证稳定）
        let mut token_addrs_vec: Vec<String> = token_addrs_set.into_iter().collect();
        token_addrs_vec.sort();

        // //看生成出来的代币地址token_addrs对不对
        // let debug_dump = TokenDebugDump {
        //     token_vars: token_vars.into_iter().collect(),
        //     token_addrs: token_addrs_vec,
        // };

        // Self::dump_to_file("token_addrs.json", "", &debug_dump);
        // //调试结束

        // Self::dump_to_file("interface_after_generate.json", "interface_after_generate", &interface);

        // Builder test1() and test2()
        //取出 receiver 合约：后面要往它里面塞 test1/test2 的内容(receiver：这次 PoC 的“主合约/攻击入口合约”的 key)
        let mut recv_contract = contract_map.remove(&receiver).unwrap();
        // build `test1()`: setup vm state one time for all calls
        Self::dump_to_file("before_test1_parsed_root_calls.json", &format!("before_test1_parsed_root_calls"), &parsed_root_calls);
        let first_state = parsed_root_calls.first().and_then(|pc| pc.vm_state.clone()).unwrap();
        Self::dump_to_file("first_state.json", &format!("first_state"), &first_state);
        let last_state = parsed_root_calls.last().and_then(|pc| pc.vm_state.clone()).unwrap();
        Self::dump_to_file("last_state.json", &format!("last_state"), &last_state);
        recv_contract.setup_test1_vm_state(first_state, last_state);
        
        for (i, prc) in parsed_root_calls.iter().enumerate() {
            let is_last_call = i == parsed_root_calls.len() - 1;
            recv_contract.push_test1_call(prc.clone(), is_last_call);
        }

        //如果交易次数>1：创建test2
        if txs.len() > 1 {
            // build `test2()`: setup vm state for each call
            for (i, prc) in parsed_root_calls.iter().enumerate() {
                let is_first_call = i == 0;
                let is_last_call = i == parsed_root_calls.len() - 1;
                recv_contract.push_test2_call(prc.clone(), is_first_call, is_last_call);
            }
        }

        //-----------------------调试：新建test3---------------------------------------------------
        //只复现mainTX即其之前的状态
        let last_state = parsed_root_calls.last().and_then(|pc| pc.vm_state.clone()).unwrap();
        //创建区块号
        recv_contract.setup_test3_vm_state(last_state);
        //然后是剩下的部分(roll和wrap，得到当前区块号)
        // for (i, prc) in parsed_root_calls.iter().enumerate() {
        //     let is_first_call = i == 0;
        //     let is_last_call = i == parsed_root_calls.len() - 1;
        //     recv_contract.push_test3_call(prc.clone(), is_first_call, is_last_call);
        // }

        // 只处理最后一笔 tx
        if let Some(prc) = parsed_root_calls.last() {
            recv_contract.token_addrs = token_addrs_vec.clone();
            recv_contract.push_test3_call(prc.clone(), true);
        }

        recv_contract.tidy_named_addresses();
        let receiver_name = recv_contract.name.clone();

        // 调试：dump test3_calls 到文件
        Self::dump_to_file(
            "debug_test3_calls",
            &format!("test3_{}", last_tx.tx_hash),
            &recv_contract.test3_calls,
        );
        //--------------------------------------调试结束（生成test3结束）--------------------------------------
        let mut contracts = vec![recv_contract];
        contracts.extend(contract_map.into_values());

        //调试：增加receiver
        let receiver = root_call.target.clone();//攻击最核心目标合约地址
        

        let args = TemplateArgs {
            file_name,
            receiver_name,
            last_txhash: last_tx.tx_hash.clone(),
            sender_scan_url: get_sender_scan_url(&chain, &sender),
            chain_name: chain,
            sender,
            struct_defs,
            interface,
            contracts,
        };
        Self::dump_to_file("args.json", &format!("args"), &args);

        Ok(args)
    }

    // Return (output_path, contract_name)
    fn render_test_file(&self, args: &TemplateArgs) -> Result<(String, String)> {
        let mut handlebars = Handlebars::new();
        handlebars.register_template_string("foundry_test", TEMPLATE)?;
        handlebars.register_helper("add", Box::new(add));

        let output_path = format!("{}/{}", self.output_dir, args.file_name);
        let output = File::create(&output_path)?;
        handlebars.render_to_write("foundry_test", args, output)?;

        Ok((output_path, args.receiver_name.clone()))
    }

    fn generate_salt(&mut self) -> String {
        self.nonce += 1;
        self.nonce.to_string()
    }

    fn take_memory_vars(&mut self, sender_var: &str, receiver_var: &str) -> Vec<MemoryVar> {
        let mut memory_vars = self.abi.take_memory_vars();
        for v in memory_vars.iter_mut() {
            v.replace_sender(sender_var);
            if !receiver_var.is_empty() {
                v.replace_receiver(receiver_var);
            }
        }

        memory_vars
    }
}

fn get_parsed_call_type(call: &Call, parsed_input: &Result<ParsedInput>, target_is_contract: bool) -> ParsedCallType {
    let input_is_parsed = parsed_input.is_ok();
    let fn_name = parsed_input.as_ref().map(|i| i.fn_name.to_string()).unwrap_or_default();

    let input_len = call.input.len();

    if call.target == HARDHAT_CHEAT_ADDR {
        ParsedCallType::HardhatCheat
    } else if "create" == call.ty {
        ParsedCallType::Create
    } else if "create2" == call.ty {
        ParsedCallType::Create2
    } else if "selfdestruct" == call.ty {
        ParsedCallType::SelfDestruct
    } else if "delegatecall" == call.ty {
        ParsedCallType::DelegateCall
    } else if input_is_parsed {
        if !target_is_contract && fn_name.starts_with("guessed_") {
            ParsedCallType::WithSelector
        } else {
            ParsedCallType::Interface
        }
    } else if input_len < 10 {
        ParsedCallType::SendValue
    } else if input_len >= 74 && (input_len - 10) % 64 == 0 {
        ParsedCallType::WithSelector
    } else {
        ParsedCallType::Raw
    }
}

fn call_inner_create(call: &Call, contract_var: &str) -> (String, String) {
    let contract_name = call.target_var[..1].to_uppercase() + &call.target_var[1..];
    let fn_signature = "constructor()".to_string();
    let fn_call = format!("{} = address(new {}());", contract_var, contract_name);

    (fn_signature, fn_call)
}

fn call_selfdestruct(contract_var: &str) -> (String, String) {
    let fn_signature = String::new();
    let fn_call = format!("selfdestruct(payable({}));", contract_var);

    (fn_signature, fn_call)
}

fn call_with_rawdata(call: &Call, contract_var: &str) -> (String, String) {
    let fn_signature = if call.input.len() < 10 {
        format!("{}()", call.ty)
    } else {
        format!("{}()", &call.input[1..10])
    };

    let args = if call.input.len() <= 2 {
        "\"\"".to_string()
    } else {
        format!("hex\"{}\"", &call.input[2..])
    };

    let mut fn_call = format!("{}.{}", contract_var, call.ty);
    //调试
    //这一条的意思：如果带了call.value，就在后面补上{value: xxx}但是这里没考虑到delegatecall的情况
    // if call.value != U256::ZERO {
    //     fn_call.push_str(format!("{{value: {}}}", call.value).as_str());
    // }
    //核心规则：只有 call 才允许 {value:...}，delegatecall/staticcall 永远不允许
    let can_set_value = call.ty == "call";
    if can_set_value && call.value != U256::ZERO {
        fn_call.push_str(format!("{{value: {}}}", call.value).as_str());
    }
    //调试结束
    fn_call.push_str(format!("({});", args).as_str());

    (fn_signature, fn_call)
}

fn generate_hardhat_comment(
    call: &Call,
    sender_var: &str,
    receiver_var: &str,
    return_vars: &HashMap<String, ReturnData>,
) -> (String, String) {
    let mut named_addresses = HashMap::new();
    let args = decode_bytes_arg(
        &call.input[10..],
        sender_var,
        receiver_var,
        return_vars,
        &mut named_addresses,
    );

    let fn_call = format!("// harhat.console.log({});", args.join(", "));
    (String::new(), fn_call)
}

fn call_with_selector(
    call: &Call,
    contract_var: &str,
    sender_var: &str,
    receiver_var: &str,
    return_vars: &HashMap<String, ReturnData>,
    named_addresses: &mut HashMap<String, String>,
) -> (String, String) {
    let fn_selector = &call.input[0..10];
    let fn_signature = format!("{}()", &call.input[1..10]);
    let args = decode_bytes_arg(
        &call.input[10..],
        sender_var,
        receiver_var,
        return_vars,
        named_addresses,
    );

    let mut fn_call = format!("{}.{}", contract_var, call.ty);
    if call.value != U256::ZERO {
        fn_call.push_str(format!("{{value: {}}}", call.value).as_str());
    }
    if args.is_empty() {
        fn_call.push_str(format!("(abi.encodeWithSelector({}));", fn_selector).as_str());
    } else {
        fn_call.push_str(format!("(abi.encodeWithSelector({}, {}));", fn_selector, args.join(", ")).as_str());
    }

    (fn_signature, fn_call)
}

fn format_fn_sig(fn_signature: &str, parsed_call_type: &ParsedCallType) -> String {
    match parsed_call_type {
        ParsedCallType::Create | ParsedCallType::Create2 => "constructor()".to_string(),
        ParsedCallType::SelfDestruct => String::new(),
        _ => fn_signature.to_string(),
    }
}

fn format_fn_args(
    args: &[DecodedArg],
    sender_var: &str,
    receiver_var: &str,
    return_vars: &HashMap<String, ReturnData>,
    parsed_call_type: &ParsedCallType,
) -> String {
    let args = args
        .iter()
        .map(|a| {
            if a.ty == "address" && a.value == sender_var {
                "tx.origin".to_string()
            } else if a.ty == "address" && a.value == receiver_var {
                "r".to_string()
            } else if a.value != "0" && return_vars.contains_key(&a.value) {
                return_vars.get(&a.value).unwrap().try_replace(&a.ty, &a.value)
            } else if parsed_call_type == &ParsedCallType::HardhatCheat && a.ty != "string" {
                format!("{}({})", a.ty, a.value)
            } else {
                a.to_string()
            }
        })
        .collect::<Vec<_>>()
        .join(", ");

    args
}

//生成fn_call的函数
//如："fn_call": "r.delegatecall{value: 7}(hex\"2ef48493000000000000000000000000000000000000000000000000...)
//注意：format_fn_call函数自己不直接拼 {value:...}，而是把工作分派给下游的 call_with_signature / call_with_interface 等函数去完成
fn format_fn_call(
    call: &Call,
    parsed_input: &ParsedInput,
    parsed_call_type: &ParsedCallType,
    target_is_contract: bool,
    contract_var: &str,
    args: &str,
) -> String {
    let contract_name = call.target_var[..1].to_uppercase() + &call.target_var[1..];
    let target = if target_is_contract && parsed_call_type == &ParsedCallType::Interface {
        format!("{}(payable({}))", contract_name, contract_var)
    } else if parsed_call_type == &ParsedCallType::Interface {
        format!("I({})", contract_var)
    } else {
        contract_var.to_string()
    };

    match parsed_call_type {
        ParsedCallType::DelegateCall => call_with_signature(target, call, parsed_input, args), //在这里实现了对delegatecall的处理
        ParsedCallType::HardhatCheat => call_hardhat_cheatcode(parsed_input, args),
        _ => call_with_interface(target, call, parsed_input, args),
    }
}

// Only support console2 for now.
fn call_hardhat_cheatcode(parsed_input: &ParsedInput, args: &str) -> String {
    format!("{}.{}({});", "console2", parsed_input.fn_name, args)
}

fn call_with_signature(target: String, call: &Call, parsed_input: &ParsedInput, args: &str) -> String {
    let fn_name = &call.ty; //fn_name 直接取 call.ty，也就是字符串 "call" / "delegatecall" / "staticcall" 等

    //构造低级调用的 calldata：abi.encodeWithSignature("foo(uint256,address)", a, b)
    let mut fn_args = format!("abi.encodeWithSignature(\"{}\"", parsed_input.fn_signature);
    if args.is_empty() {
        fn_args.push(')');
    } else {
        fn_args.push_str(format!(", {})", args).as_str());
    };

    let mut fn_call = format!("{}.{}", target, fn_name); //先拼出调用头：I(r).delegatecall（如果 target 是 I(r)）,或 r.delegatecall（如果 target 是 r）
    //只要 value 非 0，就拼 {value: ...}
    //但是delegatecall携带value在solidity里是禁止的
    if call.value != U256::ZERO {
        fn_call.push_str(format!("{{value: {}}}", call.value).as_str());
    }
    fn_call.push_str(format!("({});", fn_args).as_str());
    fn_call
}

fn call_with_interface(target: String, call: &Call, parsed_input: &ParsedInput, args: &str) -> String {
    let mut fn_call = format!("{}.{}", target, parsed_input.fn_name);
    if call.value != U256::ZERO {
        fn_call.push_str(format!("{{value: {}}}", call.value).as_str());
    }
    fn_call.push_str(format!("({});", args).as_str());
    fn_call
}

fn decode_bytes_arg(
    arg: &str,
    sender_var: &str,
    receiver_var: &str,
    return_vars: &HashMap<String, ReturnData>,
    named_addresses: &mut HashMap<String, String>,
) -> Vec<String> {
    // try decode bytes
    let bytes = hex::decode(arg).unwrap();
    let mut abi = Abi::new();
    abi.try_decode_bytes(&bytes);
    let decoded = abi.take_bytes();
    if decoded.len() != 1 {
        return vec![arg.to_string()];
    }
    let decoded = decoded.into_iter().next().unwrap();

    named_addresses.extend(abi.take_addresses());

    decoded
        .parts
        .into_iter()
        .map(|DecodedArg { ty, value, .. }| {
            if ty == "address" && value == sender_var {
                "tx.origin".to_string()
            } else if ty == "address" && value == receiver_var {
                "r".to_string()
            } else if value != "0" && return_vars.contains_key(&value) {
                return_vars.get(&value).unwrap().try_replace(&ty, &value)
            } else {
                value.to_string()
            }
        })
        .collect::<Vec<_>>()
}

fn build_sub_contracts(contracts: &mut HashMap<String, Contract>) {
    let concise_contracts = contracts.values().map(SubContract::from).collect::<Vec<_>>();
    for contract in contracts.values_mut() {
        contract.build_sub_contracts(&concise_contracts);
    }

    let sub_contract_map = contracts
        .values()
        .map(|c| (c.name.to_lowercase(), c.sub_contracts.clone()))
        .collect::<HashMap<_, _>>();
    for contract in contracts.values_mut() {
        contract.flat_nested_sub_contracts(&sub_contract_map);
    }
}
