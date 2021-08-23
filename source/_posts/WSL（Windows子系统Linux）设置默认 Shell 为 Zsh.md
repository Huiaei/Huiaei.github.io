---
title: 'WSL（Windows子系统Linux）设置默认 Shell 为 Zsh'
date: 2020-10-08 20:35:04
tags: []
published: true
hideInList: false
feature: 
isTop: false
---
1. 安装 Zsh ，nano或者vim（选择你会使用的文本编辑器）
2. 使用 Linux 设置默认 Shell 为 Zsh 命令
```BASH
    chsh -s /bin/zsh
```
3. 使用上述指令后，重新使用CMD或者PowerShell进入WSL时，会发现依旧为默认的Bash，此时需要编辑文件生效。使用你熟悉的文本编辑工具，vim或者nano，打开`~/bashrc`，向里面添加：

```
    [[ $- == *i* ]] && $(command -v zsh) || echo "ZSH is not installed"
```
之后保存即可。

----
 > 参考自：[WSL 中设置 zsh 为默认 SHELL](https://limxw.com/posts/wsl-use-zsh/)