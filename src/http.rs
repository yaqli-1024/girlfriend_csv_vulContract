use std::{ops::Deref, thread, time::Duration};

use anyhow::Result;
use lazy_static::lazy_static;
use reqwest::{blocking::Response as BlockingResp, header::CONTENT_TYPE, Method, Response};

/// The maximum number of attempts for HTTP requests.
const MAX_ATTEMPTS: usize = 3;

lazy_static! {
    pub static ref HTTPC: BlockingClient = BlockingClient::new();
}

#[derive(Debug, Clone, Default)]
pub struct BlockingClient {
    inner: reqwest::blocking::Client,
}

// Impl `Deref` to allow `Client` to be used as a `reqwest::blocking::Client`.
impl Deref for BlockingClient {
    type Target = reqwest::blocking::Client;

    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

impl BlockingClient {
    pub fn new() -> Self {
        Self::default()
    }

    //原始get函数：
    // pub fn get(&self, url: &str) -> Result<BlockingResp> {
    //     self.try_request(Method::GET, url, None)
    // }

    //修改：
    pub fn get(&self, url: &str) -> Result<BlockingResp> {
        let chainid = 1;  // 例如，1 代表以太坊主网

        let mut url = url.to_string();

        // 如果 URL 中没有 `chainid` 参数，则添加
        if !url.contains("chainid=") {
            // 检查是否已有查询参数（如果没有则使用 `?`，如果有则使用 `&`）
            let separator = if url.contains('?') { "&" } else { "?" };
            url = format!("{}{}chainid={}", url, separator, chainid);
        }

        self.try_request(Method::GET, &url, None)
    }

    //原始post函数：
    // pub fn post(&self, url: &str, body: String) -> Result<BlockingResp> {
    //     self.try_request(Method::POST, url, Some(body))
    // }

    //修改：
    pub fn post(&self, url: &str, body: String) -> Result<BlockingResp> {
        let chainid = 1;  // 例如，1 代表以太坊主网
        let mut url = url.to_string();

        // 如果 URL 中没有 `chainid` 参数，则添加
        if !url.contains("chainid=") {
            // 检查是否已有查询参数（如果没有则使用 `?`，如果有则使用 `&`）
            let separator = if url.contains('?') { "&" } else { "?" };
            url = format!("{}{}chainid={}", url, separator, chainid);
        }
        self.try_request(Method::POST, &url, Some(body))
    }


    //原始try_request函数：
    // pub fn try_request(&self, method: Method, url: &str, body: Option<String>) -> Result<BlockingResp> {
    //     let mut req = self.request(method.clone(), url).timeout(Duration::from_secs(180));
    //     if method == Method::POST {
    //         let body = body.unwrap_or_default();
    //         req = req.header(CONTENT_TYPE, "application/json").body(body);
    //     }

    //     let mut tries = 0;
    //     loop {
    //         match req.try_clone().unwrap().send() {
    //             Ok(resp) => return Ok(resp),
    //             Err(e) => {
    //                 tries += 1;
    //                 thread::sleep(Duration::from_secs(1));
    //                 if tries >= MAX_ATTEMPTS {
    //                     return Err(e)?;
    //                 }
    //             }
    //         }
    //     }
    // }

    //修改：
    pub fn try_request(&self, method: Method, url: &str, body: Option<String>) -> Result<BlockingResp> {
        let chainid = 1;  // 例如，1 代表以太坊主网
        // 如果 URL 中没有 `chainid` 参数，则添加
        let mut url = url.to_string();
        // 去掉 URL 末尾的 `/`（如果有的话）
        if url.ends_with('/') {
            url = url.trim_end_matches('/').to_string();
        }
        println!("URL without /: {}", url);

        // 检查 URL 是否已经包含 `chainid` 参数
        if !url.contains("chainid=") {
            // 检查是否已有查询参数（如果没有则使用 `?`，如果有则使用 `&`）
            let separator = if url.contains('?') { "&" } else { "?" };
            url = format!("{}{}chainid={}", url, separator, chainid);
        }

        //调试
        println!("Request URL after processing: {}", url);

        //调试结束

        let mut req = self.request(method.clone(), &url).timeout(Duration::from_secs(180));
        if method == Method::POST {
            let body = body.unwrap_or_default();
            req = req.header(CONTENT_TYPE, "application/json").body(body);
        }

        let mut tries = 0;
        loop {
            match req.try_clone().unwrap().send() {
                //调试

                Ok(resp) => return Ok(resp),

            //     Ok(mut resp) => { 
            //     let body = resp.text()?;  // 获取响应体文本
            //     println!("Response body: {}", body);  // 打印响应体内容
            //     return Ok(resp);  // 返回响应体文本，而不是整个 `resp`
            // }


                //调试结束
                Err(e) => {
                    tries += 1;
                    thread::sleep(Duration::from_secs(1));
                    if tries >= MAX_ATTEMPTS {
                        return Err(e)?;
                    }
                }
            }
        }

    }





}

#[derive(Debug, Clone, Default)]
pub struct AsyncClient {
    inner: reqwest::Client,
}

// Impl `Deref` to allow `Client` to be used as a `reqwest::Client`.
impl Deref for AsyncClient {
    type Target = reqwest::Client;

    fn deref(&self) -> &Self::Target {
        &self.inner
    }
}

impl AsyncClient {
    pub fn new() -> Self {
        let inner = reqwest::Client::builder()
            .timeout(Duration::from_secs(180))
            .danger_accept_invalid_certs(true)
            .build()
            .unwrap();

        Self { inner }
    }

    pub async fn get(&self, url: &str) -> Result<Response> {
        self.try_request(Method::GET, url, None).await
    }

    pub async fn post(&self, url: &str, body: String) -> Result<Response> {
        self.try_request(Method::POST, url, Some(body)).await
    }

    pub async fn try_request(&self, method: Method, url: &str, body: Option<String>) -> Result<Response> {
        let mut req = self.request(method.clone(), url).timeout(Duration::from_secs(180));
        if method == Method::POST {
            let body = body.unwrap_or_default();
            req = req.header(CONTENT_TYPE, "application/json").body(body);
        }

        let mut tries = 0;
        loop {
            match req.try_clone().unwrap().send().await {
                Ok(resp) => return Ok(resp),
                Err(e) => {
                    tries += 1;
                    tokio::time::sleep(Duration::from_secs(1)).await;
                    if tries >= MAX_ATTEMPTS {
                        return Err(e)?;
                    }
                }
            }
        }
    }
}
