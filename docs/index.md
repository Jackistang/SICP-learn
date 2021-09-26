# Getting Started Guide

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

## 学习资源

仓库 resources 目录下有一些该书籍配套的资源：

- [Code From The Book](https://mitpress.mit.edu/sites/default/files/sicp/code/index.html)：该书籍里的代码以及部分练习答案。
- [SICP-Solutions](http://community.schemewiki.org/?SICP-Solutions)：书中练习题答案。
- [Sample Programming Assignments](https://mitpress.mit.edu/sites/default/files/sicp/psets/index.html)：MIT 课程里提供的作业。
- [Doraemonzzz 博主提供的 assignments 作业答案](https://doraemonzzz.com/tags/%E8%AE%A1%E7%AE%97%E6%9C%BA%E7%A8%8B%E5%BA%8F%E7%9A%84%E6%9E%84%E9%80%A0%E5%92%8C%E8%A7%A3%E9%87%8A/)
- [GitHub 仓库有一些 assignments 答案](https://github.com/AyberkSorgun?tab=repositories)

基本表达式：

- 数
- 内部运算符
- 其他名字

```lisp
(cond   (<p1> <e1>)
        (<p2> <e2>)
        ...
        (<pn> <en>))

(cond   (<p1> <e1>)
        (<p2> <e2>)
        ...
        (else <en>))

(if <predicate> <consequent> <alternative>)

(lambda (<formal-parameters>) <body>)

(list <a1> <a2> ... <an>)

```

- 基于类型进行分派的组织方式
- 数据导向的程序设计方式
- 消息传递


- [How to Debug Chez Scheme Programs](https://scheme.com/debug/debug.html)