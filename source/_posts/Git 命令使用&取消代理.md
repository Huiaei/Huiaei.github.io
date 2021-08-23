---
title: 'Git 命令使用/取消代理'
date: 2020-02-15 11:45:36
tags: []
published: true
hideInList: false
feature: 
isTop: false
---
假设代理到目标 socks5://127.0.0.1:10808 
1. 全局代理
   	git config --global http.proxy socks5://127.0.0.1:10808
	git config --global https.proxy socks5://127.0.0.1:10808
2. 部分代理
   git config --global http.https://github.com.proxy socks5://127.0.0.1:10808
   git config --global https.https://github.com.proxy socks5://127.0.0.1:10808
3. 取消代理
    git config --global --unset http.proxy
    git config --global --unset https.proxy

>参考自:
   https://blog.gobyte.cn/post/1a22163b.html
   https://blog.csdn.net/tanningzhong/article/details/52817399