---
title: 'Onedrive设置多线程传输'
date: 2020-06-28 18:34:57
tags: []
published: true
hideInList: false
feature: 
isTop: false
---
修改文件：
"%localappdata%\Microsoft\OneDrive\settings\Personal\global.ini"
向第一行加入：
numberOfConcurrentUploads=3
>PS：数值项即为线程数，最小值为1，最大值为3，根据实际需要选择即可

可通过`Windows`+`R`运行，或cmd里运行下面直接打开修改：
notepad "%localappdata%\Microsoft\OneDrive\settings\Personal\global.ini"

----
>[https://blog.tcpsoft.app/2020/03/let-onedrive-fly-scientifically/](https://blog.tcpsoft.app/2020/03/let-onedrive-fly-scientifically/)