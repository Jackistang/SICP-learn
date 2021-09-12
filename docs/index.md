## 环境搭建

- 操作系统：Win10 64-bit
- 解释器：[Chez Scheme](https://cisco.github.io/ChezScheme/)
- 编辑器：VSCode

### Scheme 安装

首先需要安装 Scheme，登录 Scheme [仓库](https://github.com/cisco/ChezScheme/releases/tag/v9.5.4)下载最新的发布版本，并按照默认选项安装，安装路径一般为："C:\Program Files\Chez Scheme 9.5.4"。

将 `scheme` 可执行文件路径 "C:\Program Files\Chez Scheme 9.5.4\bin\ta6nt" 添加到环境变量 `PATH` 。

打开命令行输入下述代码测试是否安装成功：

```shell
PS C:\Users\M2019> scheme
Chez Scheme Version 9.5.4
Copyright 1984-2020 Cisco Systems, Inc.

> (define pow (lambda (x) (* x x)))
> (define xdof (lambda (f x) (f x)))
> (xdof pow 7)
49
> (exit)
```

### VSCode 插件配置

使用的 VSCode 插件为：

- [vscode-scheme](https://github.com/sjhuangx/vscode-scheme)
- [Code Runner](https://github.com/formulahendry/vscode-code-runner)

在 VSCode 的插件市场里安装这两个插件，然后配置 Code Runner：

打开 "settings.json" 文件，在里面添加：

```json
    "code-runner.runInTerminal": true,
    "code-runner.executorMapByFileExtension": {
        ".ss": "scheme"
    },
```

并且找到 `"code-runner.executorMap"` 对象，将其里面的 `"Scheme"` 对象更改为：

```json
"scheme": "scheme",
```

最终的结果应为：

```json
    "code-runner.runInTerminal": true,
    "code-runner.executorMapByFileExtension": {
        ".ss": "scheme"
    },
    "code-runner.executorMap": {
        ......
        
        "scheme": "scheme",
        
        ......
    }
```

创建一个 "getting_start.ss" 文件测试，在该文件里添加内容：

```lisp
(define pow (lambda (x) (* x x)))
(display (pow 49))
(exit)
```

通过快捷键 `Ctrl + Alt + N` 运行 Code Runner，看到下列信息表明搭建成功：

```shell
PS E:\Github\SICP> scheme "e:\Github\SICP\docs\getting_start.ss"
Chez Scheme Version 9.5.4
Copyright 1984-2020 Cisco Systems, Inc.

240
```

