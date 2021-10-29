---
title: '获取EA Desktop客户端离线安装包的办法'
date: 2021-10-29 11:30:19
tags: []
published: true
hideInList: false
feature: 
isTop: false
---


# 获取EA Desktop客户端离线安装包的办法

## 方法

1. 首先获取最新的在线安装包 [EA Desktop Installer](https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EADesktopInstaller.exe)
2. 使用压缩工具打开`EAappInstaller.exe`，得到类似下方的目录
   ```
   0
   u0
   u1
   u2
   ```
3. 使用文本编辑工具打开第一个文件： `0` 
4. 使用搜索功能或者翻阅的方式找到类似于下方的链接（使用换行后大约在整体的中间部分）
   
   `https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAapp-12.0.150.5030-639.msi`

5. 使用下载工具下载该链接即可。
6. 请注意有些依赖文件，如果没有是需要下载安装的，推荐直接下载安装一遍，下载地址在发现此链接位置的附近。
   
   提供一个当前`12.0.150.5030`版本的所有下载列表，顺便说一句，下载的`EAapp.msi`安装时是可以选安装位置的。

   依赖安装完记得**重启计算机**。


   > vcredist10.x86.exe : https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/vc_redist-10.0.40219.x86.exe

   > vcredist14.x86.exe ：https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/vc_redist-14.28.29325.x86.exe

   > vcredist14.x64.exe : https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/vc_redist-14.28.29325.x64.exe

   > EAapp.msi : https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAapp-12.0.150.5030-639.msi


## 本人使用的工具
* 压缩工具：[7zip](https://www.7-zip.org/)

* 文本编辑工具：[Visual Studio Code](https://code.visualstudio.com/)

* 下载工具推荐使用多线程下载工具

## 其他的说明

>Q：什么时候发现的？
>
>A：在2021年10月28日23时左右（UTC+8），方法可能具有时效性。

>Q：第一步的下载的是`EA Desktop Installer`，为什么第二步是`EAappInstaller.exe`
>
>A：EA的下载链接跳转到EAappInstaller.exe，现在EA Desktop还处于开放测试阶段，不清楚之后会不会修改。

>Q：为什么我找到的离线完整包是`EADesktop-xx.x.xxx.xxxx`结尾的？
>
>A：早期的链接的确是这个结尾，后面EA可能修改文件名了，将新版本链接中的的`EAapp`修改为`EADesktop`测试是无法获取到资源的。

---

到此正文已经结束，下面是找到这个链接的过程，仅记录，不对方法有任何补充说明

---

## 折腾步骤

### 1. 找规律

一开始从网上收集了一下各位网友发布的离线完整包下载地址，我将链接收集保存下来并发现规律。

完整包的链接样式为`https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EADesktop-{version}.msi`，这个在后来挖掘文件的时候也发现了这个样式。在第二步中的`u0`中也发现类似的，使用压缩工具打开，进入`u0/.rsrc/EAX_CONFIG/`文件夹中的`INTEGRATION.CFG`，也发现了下面的内容

```toml
[updater]
    url = "https://autopatch-integration.juno.ea.com"
[installer]
    downloadurl = "https://origin-a.akamaihd.net/EA-Desktop-Client-Download/installer-releases/EAappInstaller-{version}.exe"
[telemetry]
    ratt.url = "https://ratt-dev.juno.ea.com/ratt/telm"
    pin.url = "https://pin-river-test.data.ea.com/pinEvents"
[machine]
    updateBucket = 999
```

可以发现`[installer]`处有个“格式化”的链接，但是到后面发现这个并不是，只要你带入版本号去下载，其实下载的还是在线安装包，不过EA可能也保存了之前老版本的安装器，毕竟能下载，不过这点没有去验证。

已经知道了链接的方式，那么我从收集来的下载链接中提取出版本号，也就是`{version}`的内容，并形成一张表（最后一行是最后加的）。

|  xx | .x | .xxx | .xxxx | -xxx |
|:---:|:---:|:----:|:-----:|:----:|
| 12  | 0  | 38   | 4820  | 153  |
| 12  | 0  | 100  | 4941  | 417  |
| 12  | 0  | 113  | 4970  | 474  |
| 12  | 0  | 150  | 5030  | 639  |

那么最新的版本号从哪里来？当时我也是突发想法，查看了`EAappInstaller.exe`的属性，查看这个文件的版本号，得到了`12.0.150.5030`，最后找到的结果也证实了确实是这个。

但是通过收集的链接会发现还有小尾巴 `-xxx`，如何得到？我当时通过表格企图找到规律，但是这个值不是简单的规律，只能知道`xx.x.xxx.xxxx`越大`-xxx`也越大。

### 2. 获取在线安装器的临时配置文件

参考[Can't install/reinstall EA Desktop - EA问答 ](https://answers.ea.com/t5/Bug-Reports-Technical-Issues/Can-t-install-reinstall-EA-Desktop/td-p/9805968)

按照方法，的确获取到了下载的链接。不过需要运行在线安装器，生成临时的配置文件。

### 3. 网络抓包

当时想着`{version}`会不会是通过网络获取的，而这个安装器是一个“通用”的安装器。（这个最后思考了下是不可能的，如果是通用的安装器，那么为什么程序的签名时间是最近的时间）

安装`fiddler`进行抓包，使用签名获取的版本号进行搜索，复现正常安装流程到下载文件阶段。

发现只有两个匹配的网络请求，最早出现版本号的位置再向更早的时间摸索，并没有发现有请求已经返回版本号的存在，所以当时判断不来源在线。

### 4. 挖掘文件

其实之前就一直在翻文件内容，只不过当时没有注意到没有换行，第二步发现的`0`其实也打开了不止三次，只是最后才更加注意了，发现是个长的单行，当时就打开自动换行功能，发现了链接位置。

~~(其实一直开着搜索版本号把文件都打开了一遍，发现这里有匹配项而已)~~
