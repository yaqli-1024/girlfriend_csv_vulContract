//! Back Tester

use std::{
    collections::{HashMap, HashSet},
    fs::{self, File},
    io::{Read, Write},
    path::{Path, PathBuf},
    process::{Command, Stdio},
    time,
};

use anyhow::Result;
use clap::{command, Parser};
use girlfriend::{config::Config, logger, Girlfriend};
use lazy_static::lazy_static;
use regex::Regex;
use tracing::{error, info};
use girlfriend::contract::update_slot_cache;
use std::fs::OpenOptions;
//(12.24)调试：引入slot_cache.rs中的apply_slot_cache_from_output函数。该函数是“整体解析器”。作用：对poc运行时生成的日志（log）输出进行解析，并将其写入json日志中
use girlfriend::slot_cache::apply_slot_cache_from_output;


lazy_static! {
    static ref COLOR: Regex = Regex::new(r"\x1B\[([0-9]{1,2}(;[0-9]{1,2})?)?[m|K]").unwrap();
}

#[derive(Debug, Parser)]
#[command(version, about, long_about = None)]
struct CmdArgs {
    /// the config file path
    #[arg(short, long, default_value = "config/config.toml")]
    config: String,
    /// the back test txhashes file path
    //TODO：(12.29)（这是原txhash_path路径，现在注释掉了，调试完成后记得恢复）
    // #[arg(short, long, default_value = "assets/eth_tx.txt")]
    //TODO：（12.29）这是调试时临时的txhash_path路径，调试完成后记得删除！！
    #[arg(short, long, default_value = "assets/tx_hash_id_until_2023-08-Zunami.csv")]
    //TODO：（12.29）调试结束
    txhashes_path: String,
    /// the result dir
    #[arg(short, long, default_value = "eth_back_test")]
    result_dir: String,
}

//TODO：(12.29)调试：增加结构体（记得删除！）
#[derive(Debug, serde::Deserialize)]
struct Row {
    id: String,
    tx_hash: String,
}

//TODO：（12.29调试）这是原本的main函数，调试完成后记得恢复！
// fn main() -> Result<()>{
//     logger::init(); //初始化日志系统
//     let args = CmdArgs::parse(); //把命令行参数解析成结构体 CmdArgs
//     let cfg = Config::new(&args.config).expect("Failed to load config"); //用 args.config 指定的配置文件路径加载配置，生成 cfg

//     // clean up
//     let _ = fs::remove_dir_all("test"); //删除旧的test目录
//     let _ = fs::remove_dir_all(&args.result_dir); //删除结果目录 args.result_dir（上一次运行的输出）

//     let txhashes = fs::read_to_string(&args.txhashes_path).expect("Failed to read txhashes");//读取 args.txhashes_path 文件内容到字符串 txhashes
//     let testcases = txhashes.lines().collect::<Vec<_>>(); //按行切分 txhashes（每一行一个 tx hash）,收集成 Vec<&str>,每个元素是原字符串里的一行

//     let mut test_result = TestResult::new(); //创建一个 test_result 用于汇总统计
//     for txhash in testcases { //遍历每一个测试用例（每个交易哈希）
//         //每轮txhash开始之前，把test文件夹清空并重建
//         // ✅ 每轮开始都保证 test/ 干净
//         let _ = fs::remove_dir_all("test");
//         fs::create_dir_all("test")?;
//         //调试结束
//         let now = time::Instant::now(); //记录当前时间点，用来统计后续操作耗时
//         match Girlfriend::new(cfg.clone()).unwrap().gen(txhash.to_string()) {//构造一个 Girlfriend 实例,对当前的txhash执行gen()  //其中match 用于区分 gen 成功或失败
//             Ok((output_path, _)) => { //如果gen 返回 Ok //注意：这里output_path是生成的 Foundry 测试文件/目录路径（后面要拿去跑 forge_test）
//                 info!(
//                     "🎉 Foundry test file: {}, time elapsed: {:?}",
//                     output_path, //输出生成的测试文件路径 output_path
//                     now.elapsed() //输出从 now 到现在的耗时(生成poc花了多长时间)
//                 );
//                 let result = forge_test(&output_path, &args.result_dir).unwrap(); //调用forge_test函数，对刚刚那个生成的poc跑一遍。其中output_path传生成的测试文件路径，&args.result_dir传结果目录根路径
//                 test_result.insert(&result, txhash); //把当前 txhash 按 result 分类存入汇总结构里
//             }
//             Err(e) => error!("Error: {}", e),
//         }
//     }

//     let summary_path = Path::new(&args.result_dir).join("summary.txt");
//     test_result.summary(summary_path);

//     Ok(())
// }


//TODO：（12.29调试）这是为了得到traces而生成的阉割版的main函数，调试完成后记得删除！
fn main() -> Result<()> {
    logger::init();
    let args = CmdArgs::parse();
    let cfg = Config::new(&args.config).expect("Failed to load config");

    // clean up
    let _ = fs::remove_dir_all("test");
    let _ = fs::remove_dir_all(&args.result_dir);

    // ✅ 从 CSV 读取
    let mut rdr = csv::ReaderBuilder::new()
        .flexible(true)
        .from_path(&args.txhashes_path)?; // 这里复用你原来的参数名 txhashes_path

    for result in rdr.deserialize::<Row>() {
        let row = match result {
            Ok(r) => r,
            Err(e) => {
                error!("CSV row parse error: {}", e);
                continue;
            }
        };

        let id = row.id.trim().to_string();
        let tx_field = row.tx_hash.trim();

        if id.is_empty() || tx_field.is_empty() {
            continue;
        }

        // ✅ 支持 “多个 tx_hash 用分号分隔”
        let txhash_list = tx_field
            .split(';')
            .map(|s| s.trim())
            .filter(|s| !s.is_empty());

        for txhash in txhash_list {

            let now = time::Instant::now();

            // ✅ 关键：把 id 传给 gen，用于命名 traces 文件
            match Girlfriend::new(cfg.clone()).unwrap().gen_with_prefix(&id, txhash) {
                Ok(()) => {
                    info!("🎉 Generate OK! id={}, tx={}, cost={:?}", id, txhash, now.elapsed());
                }
                Err(e) => {
                    error!("Error: id={}, tx={}, err={}", id, txhash, e);
                }
            }
        }
    }

    Ok(())
}

fn forge_test(output_path: &str, result_dir: &str) -> Result<String> {
    //回测代码v1.0
    // let output_path = Path::new(output_path);
    // let filename = output_path.file_stem().unwrap().to_str().unwrap(); //把字符串路径转成 Path，并取文件名

    // info!("forge test -vvvvv ...");


    //启动 forge 子进程，只捕获 stdout
    // let mut forge_cmd = Command::new("forge")
    //     .arg("test")
    //     .arg("--via-ir") //使用 via-IR 编译路径（Foundry 编译选项）
    //     .arg("-vvvvv") //最高级别输出
    //     .stdout(Stdio::piped()) //把标准输出 stdout 接到管道里，这样 Rust 程序能读取它
    //     .spawn()?;

    //准备结果目录
    // let mut result_dir = PathBuf::from(result_dir);
    // let mut result = String::new();

    // if let Some(ref mut forge_stdout) = forge_cmd.stdout { //如果 stdout 存在，就读出来并处理
    //     let mut buf = String::new();
    //     forge_stdout.read_to_string(&mut buf)?; //读 stdout 到字符串
    //     let log = remove_color(&buf); //去掉颜色控制字符（forge test -vvvvv 输出常带颜色控制码，这里是将那些不必要的控制序列删除，获得干净的纯文本）
    //     result = get_test_result(&log); //从 log 中解析测试结果（判断整个测试是success还是unknown）

    //     result_dir = result_dir.join(&result); //把结果目录拼成 result_dir/result  (比如：success/x4b4f...)
    //     // create result dir if not exists
    //     if !result_dir.exists() { //如果目录不存在就创建
    //         fs::create_dir_all(&result_dir)?;
    //     }

    //     let html_path = result_dir.join(format!("{}.log", filename)); //把日志写到 {result_dir}/{filename}.log
    //     let mut output_file = File::create(&html_path)?;
    //     output_file.write_all(log.as_bytes())?;
    //     info!("🎉 Foundry test result: {}", html_path.to_str().unwrap());
    // }

    // forge_cmd.wait()?; //等待 forge 运行完并退出

    // // move `test/*` to result_dir
    // info!("mv {:?} {}", output_path, result_dir.to_str().unwrap());
    // Command::new("mv").arg(output_path).arg(result_dir).output()?; //把 output_path 指向的文件或目录，移动到 result_dir 里

    // Ok(result)

    // 调试：回测代码V2.0(同时读取 stdout + stderr，再合并成 log)
    // let output_path = Path::new(output_path);
    // let filename = output_path.file_stem().unwrap().to_str().unwrap();

    // info!("forge test -vvvvv ...");

    // let mut forge_cmd = Command::new("forge")
    //     .arg("test")
    //     // .arg("--via-ir")
    //     .arg("-vvvvv")
    //     .stdout(Stdio::piped()) //把 stdout 接到管道，Rust 可以读
    //     .stderr(Stdio::piped()) //把 stderr 也接到管道，Rust 也可以读
    //     .spawn()?;

    // // ✅ 1) 分别读取 stdout / stderr
    // let mut out_buf = String::new(); //out_buf 用来存 stdout 文本
    // let mut err_buf = String::new(); //err_buf 用来存 stderr 文本

    // if let Some(ref mut forge_stdout) = forge_cmd.stdout {//如果 stdout 管道存在:把 stdout 内容全部读完到 out_buf
    //     forge_stdout.read_to_string(&mut out_buf)?;
    // }
    // if let Some(ref mut forge_stderr) = forge_cmd.stderr { //同理：把 stderr 全部读完到 err_buf
    //     forge_stderr.read_to_string(&mut err_buf)?;
    // }

    // // ✅ 2) 等进程结束（建议在读完后 wait，避免阻塞/死锁风险）
    // forge_cmd.wait()?;

    // // ✅ 3) 合并日志（stderr 往往更关键，你也可以反过来拼）
    // let combined = format!("{}{}", out_buf, err_buf); //把 stdout 和 stderr 拼接成一个字符串 combined
    // let log = remove_color(&combined); //去掉日志里的 ANSI 颜色控制字符

    // // ✅ 4) 之后逻辑保持不变
    // let mut result_dir = PathBuf::from(result_dir); //把 &str 的结果目录根路径转成 PathBuf
    // let result = get_test_result(&log); //从 log 文本里解析测试结果(判断整个测试是success还是unknown）

    // apply_slot_cache_from_output(&log)?;//调用slot_cache.rs中的apply_slot_cache_from_output函数，从这一次跑poc生成的日志里解析想写入缓存的 “代币token地址及其对应slot” 的信息，并写入JSON文件中

    // result_dir = result_dir.join(&result); //把结果目录变成：{result_dir}/{result}
    // if !result_dir.exists() {//如果该目录不存在就递归创建
    //     fs::create_dir_all(&result_dir)?;
    // }

    // let html_path = result_dir.join(format!("{}.log", filename)); 
    // let mut output_file = File::create(&html_path)?;
    // output_file.write_all(log.as_bytes())?;
    // info!("🎉 Foundry test result: {}", html_path.to_str().unwrap());

    // // move `test/*` to result_dir
    // info!("mv {:?} {}", output_path, result_dir.to_str().unwrap());
    // Command::new("mv").arg(output_path).arg(&result_dir).output()?;

    // Ok(result)

    //(12.25)调试：回测代码V3.0(同时拿 stdout+stderr（不死锁），而且灵活切换多种配置)
    let output_path = Path::new(output_path);
    let filename = output_path.file_stem().unwrap().to_str().unwrap();

    // 你希望的重试顺序（可调整）
    let profiles = ["default", "ir28_noir", "ir26", "ir26_noopt", "ir30", "ir30_noopt"]; //每个字符串代表一个配置块

    info!("forge test -vvvvv ... (with fallback profiles)");

    let mut final_log = String::new(); //final_log：保存最后一次尝试的完整日志
    let mut final_profile = "default"; //保存最后一次尝试用的 profile 名

    for p in profiles {  //遍历 profiles：逐个尝试运行 forge test
        info!("▶ running with FOUNDRY_PROFILE={}", p);

        // ✅ 最稳：output() 一次性收集 stdout+stderr，避免卡死
        //用 .output() 同时收集 stdout+stderr，避免死锁
        let out = Command::new("forge")
            .env("FOUNDRY_PROFILE", p)
            .arg("test")
            .arg("--match-path")
            .arg(output_path.to_str().unwrap())
            .arg("-vvvvv")
            .output()?;

        //合并 stdout + stderr，并去掉颜色控制字符
        let combined = format!(
            "{}{}",
            String::from_utf8_lossy(&out.stdout),
            String::from_utf8_lossy(&out.stderr)
        );
        let log = remove_color(&combined);

        // 记录本次尝试日志（便于定位）
        final_log = log.clone();
        final_profile = p;

        // 对于本次日志，用字符串关键词判断“这次失败是否属于编译器层面崩溃”
        let is_compiler_crash =
            log.contains("SIGSEGV") ||
            log.contains("solc exited with signal: 11") ||
            log.contains("Yul assertion failed") ||
            log.contains("Compiler run failed");

        // ✅ 也可以根据退出码辅助判断（success() 等价于退出码为 0（通常 0 表示成功））
        let failed = !out.status.success();

        //如果确认时编译器崩溃：换下一个 profile 重试
        if failed && is_compiler_crash {
            info!("⚠️ compiler crash detected under profile={}, retry next...", p);
            continue;
        }

        // 走到这里：要么成功，要么是“正常失败”(revert/test failed)，就不再换 profile
        break;
    }

    // ✅ （之后逻辑保持不变）后续逻辑：解析结果、写日志、写缓存、搬运 test 文件
    let mut result_dir = PathBuf::from(result_dir);
    let result = get_test_result(&final_log);

    apply_slot_cache_from_output(&final_log)?;

    result_dir = result_dir.join(&result);
    if !result_dir.exists() {
        fs::create_dir_all(&result_dir)?;
    }

    let log_path = result_dir.join(format!("{}.log", filename));
    let mut output_file = File::create(&log_path)?;
    output_file.write_all(final_log.as_bytes())?;

    info!("🎉 Foundry test result: {} (profile={})", log_path.to_str().unwrap(), final_profile);

    info!("mv {:?} {}", output_path, result_dir.to_str().unwrap());
    Command::new("mv").arg(output_path).arg(&result_dir).output()?;

    Ok(result)


}

fn get_test_result(log: &str) -> String {
    let pass = "[PASS] test";
    let fail_start = "[FAIL. Reason: ";
    let fail_end = "] test";

    if log.contains(pass) {
        "success".to_string()
    } else if let Some(reason) = extract_text(log, fail_start, fail_end) {
        reason
    } else {
        "unknown".to_string()
    }
}

fn extract_text(log: &str, start: &str, end: &str) -> Option<String> {
    let start_index = log.find(start)? + start.len();
    let end_index = log.find(end)?;
    let reason = log[start_index..end_index].trim().replace(':', "").replace(' ', "_");
    Some(reason)
}

#[derive(Debug)]
struct TestResult {
    // key: result, value: txhashes
    inner: HashMap<String, HashSet<String>>,
}

impl TestResult {
    pub fn new() -> Self {
        Self { inner: HashMap::new() }
    }

    pub fn insert(&mut self, res_type: &str, txhash: &str) {
        let value = txhash.to_string();
        self.inner.entry(res_type.to_string()).or_default().insert(value);
    }

    pub fn summary(&self, path: impl AsRef<Path>) {
        let mut summary = String::new();
        summary.push_str("=============== Summary ===============\n");
        summary.push_str(&format!("[total] {}\n\n", self.inner.values().flatten().count())); //统计 所有 txhash 的总数量
        //按 result 类型逐组输出
        for (result, txhashes) in &self.inner { //result：结果类型字符串(success、unknown)
            summary.push_str(&format!("[{}] {}\n", result, txhashes.len())); //输出分组标题，如：[success] 36
            summary.push_str(&format!(
                "{}\n\n",
                txhashes.iter().cloned().collect::<Vec<_>>().join("\n") //输出该分组下的所有txhash
            ));
        }

        let mut output_file = File::create(path).unwrap();
        output_file.write_all(summary.as_bytes()).unwrap();
    }
}

fn remove_color(input: &str) -> String {
    COLOR.replace_all(input, "").to_string()
}
