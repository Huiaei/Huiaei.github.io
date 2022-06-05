# Windows远程桌面连接使用微软账户登录

1. 打开`远程桌面连接`或者其他进行RDP连接的应用软件（以`远程桌面连接`为例）
2. `计算机`填写远程设备的IP地址或者域名（RDP默认端口为`3389`）
3. `用户名`填写微软账户的邮箱地址
4. 点击`连接`
5. 使用微软账户的密码进行登录

## 常见问题

### 微软账户的邮箱地址和密码输入正确但是无法登录

* 请尝试将`计算机`填写成 `MicrosoftAccount\{微软账户邮箱地址}`的形式
*   在远程连接目标设备上使用`运行`（Windows+R）执行下列任选一行

    ```
    runas /u:{微软账户邮箱地址} cmd.exe
    runas /u:MicrosoftAccount\{微软账户邮箱地址} cmd.exe
    ```

    在弹出来的CLI（命令行）窗口按照提示输入微软账户密码

    命令的意思是使用`{微软账户邮箱地址}`的身份运行`cmd.exe`

    此操作用意在于刷新微软账户在远程连接设备上的凭证缓存

## 参考

[Windows 10 RDP not working using Microsoft account (local accounts are working)](https://docs.microsoft.com/en-us/answers/questions/369584/windows-10-home-to-pro-upgrade-need-to-update-pers.html)
