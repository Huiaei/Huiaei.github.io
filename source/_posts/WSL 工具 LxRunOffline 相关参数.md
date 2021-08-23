---
title: 'WSL 工具 LxRunOffline 相关参数'
date: 2020-10-08 21:00:25
tags: []
published: true
hideInList: false
feature: 
isTop: false
---
> 基于版本3.5.0
> 项目地址：[https://github.com/DDoSolitary/LxRunOffline](https://github.com/DDoSolitary/LxRunOffline)

+ 支持的操作有：


| 简写参数 | 完整参数 | 解释 |
| ----:        | :----        | :---- |
| l | list | 列出所有已安装的发行版 |
| gd | get-default | 获取默认分发，由bash.exe使用 |
| sd | set-default | 设置默认分发，由bash.exe使用 |
| i | install | 安装新的发行版 |
| ui | uninstall | 卸载发行版 |
| rg | register | 注册现有的安装目录 |
| ur | unregister | 注销发行版，但不删除安装目录 |
| m | move | 将发行版移动到新目录 |
| d | duplicate | 在新目录中复制现有发行版 |
| e | export | 将发行版的文件系统导出到.tar.gz文件，该文件可以通过“install”命令导入 |
| r | run | 在发行版中运行命令 |
| di | get-dir | 获取发行版的安装目录 |
| gv | get-version | 获取发行版的文件系统版本 |
| ge | get-env | 获取发行版的默认环境变量 |
| se | set-env | 设置发行版的默认环境变量。 |
| ae | add-env | 添加到发行版的默认环境变量。 |
| re | remove-env | 从发行版的默认环境变量中删除。 |
| gu | get-uid | 获取发行版的默认用户的UID。 |
| su | set-uid | 设置发行版的默认用户的UID。 |
| gk | get-kernelcmd | 获取发行版的默认内核命令行。 |
| sk | set-kernelcmd | 设置发行版的默认内核命令行。 |
| gf | get-flags | 获取一些发行版的标志。有关详细信息，请参见[url](https://docs.microsoft.com/en-us/previous-versions/windows/desktop/api/wslapi/ne-wslapi-wsl_distribution_flags) |
| sf | set-flags | 设置发行版的一些标志。有关详细信息，请参见[url](https://docs.microsoft.com/en-us/previous-versions/windows/desktop/api/wslapi/ne-wslapi-wsl_distribution_flags) |
| s | shortcut | 创建启动发布的快捷方式。 |
| ec | export-config | 将发行版的配置导出到XML文件。 |
| ic | import-config | 从XML文件导入发行版的配置 |
| sm | summary | 获取发行版的基本信息 |
|  | version | 获取有关LxRunOffline版本信息 |

+ 附属参数：(可能不完整)


|参数|参数解释|
|----|:----|
|-n|发行版的名称|
|-d|发行版安装目录|
|-f|包含要安装的发行版的根文件系统的tar文件。如果存在一个扩展名为.xml的相同名称的文件，并且没有指定“-c”，则该文件将作为配置文件导入。|
|-r|要提取的tar文件中的目录，可选选项|
|-c|要使用的配置文件，可选选项|
|-v|要使用的文件系统版本，如果未指定，则为最新可用版本。|
|-s|在桌面上创建快捷方式|