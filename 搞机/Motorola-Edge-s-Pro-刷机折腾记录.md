# Motorola Edge s Pro 刷机折腾记录

此文非教程，只记录本人的折腾之旅，只提供思路，不要照抄。 请保证你有相应的能力水平。

## 本人手机简述

Motorola Edge s Pro

* SOC ：高通骁龙870
* 内存 ：8GB
* 储存 ：256GB
* 型号 ：XT2153-1
* 代号 ：pstart

## 解锁BootLoader

### 需要工具：

* [Tiny Fastboot Script](https://bbs.ixmoe.com/t/topic/17646)
* [Motorola USB Driver](https://mirrors.lolinet.com/software/windows/Motorola/Drivers/)
* Motorola用户账号（用于获取解锁码）
* 还算过关的英语水平或者会使用翻译工具

### 操作

1. 打开“开发者选项”
   1. 打开手机系统`设置`
   2. 点击`关于手机`
   3. 连续点击`版本号`直到提示进入了`开发者模式`
2. 打开“OEM解锁”
   1. 打开手机系统`设置`
   2. 点击`系统`
   3. 点击`高级`
   4. 点击`开发者选项`
   5. 找到`OEM解锁`打开开关
3. 重启到“Fastboot”
   1. 长按`电源键`
   2. 点击`重启`
   3. 点击完后立即按住`音量减键`
   4. 进入`Fastboot`
   5. 解压安装`Motorola USB Driver`
   6. 解压使用`Tiny Fastboot Script`,请先阅读`请先阅读我`文本，按照提示指引使用。
      1. 双击`flash.bat`
      2. 使用数据线将手机和电脑连接
      3. 按照提示输入数字并回车，例如`[8] 解锁设备的 Bootloader`,输入`8`回车
      4. 获取解锁请求码
         1. 按照提示选择`[3] 获取解锁请求码`
         2. 进入后会给予一串代码，复制下来（命令行中使用鼠标左键选中，然后单机鼠标右键即可复制出来）
         3. 前往网页[unlock-your-device](https://motorola-global-portal.custhelp.com/app/standalone/bootloader/unlock-your-device-b),或者按照提示选择`[1] 打开 Motorola 解锁官网`
         4. 登录`Motorola账号`
         5. 将代码贴进文本框查询是否能解锁，通过即可继续往下，同意协议后即可获取解锁码，解锁码会发送到`Motorola账户`的注册邮箱中。
      5. 复制解锁码，按照提示返回，然后选择`[2] 解锁普通 Motorola 设备的 Bootloader（需要解锁码）`，按照要求复制进去即可（复制好后点击命令行窗口然后鼠标右键即可复制）
      6. 可能会弹出警告，请自行阅读并理解风险后自行决定。

## 刷入其他的发行版本或者第三方ROM

同样使用[Tiny Fastboot Script](https://bbs.ixmoe.com/t/topic/17646)工具，按照提示即可。

推荐几个网页： [由lolinet.com提供的手机系统镜像](https://mirrors.lolinet.com/firmware/motorola/pstar/) [Motorola 软件通道介绍，如何找到合适的官方固件](https://bbs.ixmoe.com/t/topic/22491) [汐梦社区](https://bbs.ixmoe.com/)

## 刷入Magisk Root

1. 下载对应的最新的官方固件
2. 解压提取`boot.img`
3. 传入手机中
4. 手机安装`Magisk Manager`
5. 选择安装修补
6. 选择传入手机的`boot.img`
7. 修补完成后，查看日志，找到修补过的boot.img文件位置
8. 将修补的`boot.img`传到电脑使用`Tiny Fastboot Script`刷入`Boot`分区
9. 重启手机

## 鸣谢

* [汐梦社区](https://bbs.ixmoe.com/)
* [lolinet.com](https://mirrors.lolinet.com)
* [chenchen](https://bbs.ixmoe.com/u/chenchen)的[Tiny Fastboot Script](https://bbs.ixmoe.com/t/topic/17646)
* [Magisk](https://github.com/topjohnwu/Magisk)
* [\[Guide\] Root Motorola with Magisk (UnLocked Bootloader)(Non-TWRP method)](https://forum.xda-developers.com/t/guide-root-motorola-with-magisk-unlocked-bootloader-non-twrp-method.4222583/)
