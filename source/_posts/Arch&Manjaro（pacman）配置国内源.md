---
title: 'Arch/Manjaro（pacman）配置国内源'
date: 2020-10-27 21:28:30
tags: []
published: true
hideInList: false
feature: 
isTop: false
---
1. 更改源
+ 使用`pacman-mirros`更改镜像软件库所在国家
`sudo pacman-mirrors -i -c China -m rank`
+ 或者使用nano或vim打开`/etc/pacman.d/mirrorlist`
添加源服务器链接并保存，例如，清华源
`Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch`
2. 使用命令`pacman -Syy`强制刷新软件库缓存

3. 可选选择
安装`archlinuxcn`
        1. 打开`/etc/pacman.conf`
        2. 在末尾添加
```
[archlinuxcn]
Server = https://mirrors.tuna.tsinghua.edu.cn/archlinuxcn/$arch
```
服务器可选以下，只需替换`Server =`之后的链接（搜集不全，如有缺失，欢迎补充）
|名字|链接|
|----|----|
| 中科大 | https://mirrors.ustc.edu.cn/archlinuxcn/$arch |
| 网易 | http://mirrors.163.com/archlinux-cn/$arch | 
| 腾讯云 | https://mirrors.cloud.tencent.com/archlinuxcn/$arch |
----

推荐参考资料：[archwiki](https://wiki.archlinux.org)