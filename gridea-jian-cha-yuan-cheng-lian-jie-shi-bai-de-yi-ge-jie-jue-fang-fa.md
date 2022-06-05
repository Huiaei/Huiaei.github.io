# Gridea 检查远程连接失败的一个解决方法

我使用的是 Windows 版本，Gridea 版本是 0.9.1 。 当时键入了配置完成；保存；检查远程连接。发现提示 **远程连接失败，请检查仓库、用户名和 Token 设置**，在其**开发者工具**中提示

```
    message: "fatal: No such remote 'origin'↵"
    success: false
```

之后我向 Gridea 提出 issue 。 [yz0812](https://github.com/yz0812) 提示了 Gridea 其保存目录的 .git/config 文件中 url 格式应为

```
https://username:token@github.com/**.github.io.git
```

后，我打开所在文件，并没有发现有类似格式。

***

也受其提示，突发奇想。先将 Page 项目使用 git 给 clone 下来；完成后，打开项目文件夹，打开其 .git/config 文件，将包括上面 url 格式的那一段，复制到 Gridea 的 .git/config 中，保存文件。之后再检查连接，成功。
