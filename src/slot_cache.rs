use regex::Regex;
use anyhow::Result;
use std::fs::OpenOptions;
use std::io::Write;
use std::path::Path;
//TODO:引入contract.rs中的update_slot_cache函数（其作用是：先加载“记录了代币地址和其对应slot”的JSON文件，然后更新某个 token 的 slot，然后立刻写回JSON文件）
use crate::contract::update_slot_cache;

//工具函数，写日志到 assets/slot_cache.log
pub fn slot_cache_log(msg: &str) -> std::io::Result<()> {
    // ✅ 确保目录存在
    let dir = Path::new("assets");
    std::fs::create_dir_all(dir)?;

    let path = dir.join("slot_cache.log");

    let mut f = OpenOptions::new() //用“打开文件的选项”来打开日志文件
        .create(true) //文件不存在就创建
        .append(true) //以追加模式写入（不会覆盖旧内容）
        .open(&path)?;

    writeln!(f, "{}", msg)?; //写入时自带换行
    Ok(())
}

//工具函数：从跑poc生成的log文件中抓取出“代码地址及其对应slot”信息，将其写入缓存（即JSON文件），方便下一个Poc查阅
//作用：从 forge 输出里提取 (token, slot, is_vyper)
pub fn extract_slot_cache_records(output_no_color: &str) -> Vec<(String, u64, bool)> { //参数output_no_color：是去掉颜色控制符后的 forge 输出全文。返回值是一个列表，每条是 (token, slot, is_vyper)
    // 示例输出长这样（Foundry 常见格式）：
    //  [PASS] ...
    //  Logs:
    //    GF_SLOT_CACHE_TOKEN: 0x....
    //    GF_SLOT_CACHE_SLOT: 9
    //    GF_SLOT_CACHE_IS_VYPER: 0

    let re_token = Regex::new(r"GF_SLOT_CACHE_TOKEN:\s*(0x[a-fA-F0-9]{40})").unwrap(); //编译一个正则，匹配类似GF_SLOT_CACHE_TOKEN: 0x...，我们要抓获0x...这个地址
    let re_slot  = Regex::new(r"GF_SLOT_CACHE_SLOT:\s*([0-9]+)").unwrap();//同理，抓出 slot 的十进制数字
    let re_vy    = Regex::new(r"GF_SLOT_CACHE_IS_VYPER:\s*([01])").unwrap();//编译正则，抓出 0/1

    let tokens: Vec<String> = re_token  //在整段输出里迭代所有匹配到的 token 行,统一为小写，收集为 Vec<String>
        .captures_iter(output_no_color)
        .filter_map(|c| c.get(1).map(|m| m.as_str().to_lowercase()))
        .collect();
    let slots: Vec<u64> = re_slot //同样迭代所有 slot 行并收集
        .captures_iter(output_no_color)
        .filter_map(|c| c.get(1).and_then(|m| m.as_str().parse::<u64>().ok()))
        .collect();
    let vys: Vec<bool> = re_vy  //同样提取所有vys，抓出 0/1，并映射成 bool
        .captures_iter(output_no_color)
        .filter_map(|c| c.get(1).map(|m| m.as_str() == "1"))
        .collect();

    // 这里按出现顺序 zip，通常 1 组日志对应 1 条记录
    let n = tokens.len().min(slots.len()).min(vys.len()); //取三者的最小长度 n，避免其中一个少了导致越界
    (0..n).map(|i| (tokens[i].clone(), slots[i], vys[i])).collect() //生成 0..n 的索引,每个 i 产出一个三元组(tokens, slots, vys)，并返回这个
}

//调试：解析器(整体)。作用：对日志（log）输出进行解析，并将其写入json日志中
pub fn apply_slot_cache_from_output(output_no_color: &str) -> anyhow::Result<()> { //参数：同样是无颜色的输出
    slot_cache_log("[slot-cache] apply_slot_cache_from_output called")?; //先写一条日志：函数被调用了
    let recs = extract_slot_cache_records(output_no_color); //调用前面的extract_slot_cache_records函数，拿到所有的三元组记录列表
    let n = recs.len();   // ✅ 先保存长度

    if n == 0 { //如果没有解析到任何记录:写日志标记 recs=0,直接返回成功
        slot_cache_log("[slot-cache] recs=0")?;
        return Ok(());
    }

    for (token, slot, is_vyper) in recs { //如果记录不为空：遍历每条记录
        update_slot_cache(&token, slot, is_vyper)?;//调用contract.rs中的update_slot_cache函数，把该 token 的 slot 信息写入 assets/token_slot_cache.json 文件中
        slot_cache_log(&format!( //对每条写入都打一条日志
            "[slot-cache] wrote {} -> ({}, {})",
            token, slot, is_vyper
        ))?;
    }

    slot_cache_log(&format!("[slot-cache] recs={}", n))?; //最后写一条汇总日志：本次共处理了多少条记录
    Ok(())
}


