# 函数式编程

主要特征：

- 函数是**第一等公民**，即函数与其他数据类型一样处于平等的地位，可以赋值给其他变量，可以当作参数传入另一个函数，也可以作为函数的返回值。
- 函数是**纯函数**，这里的纯函数是指该函数十分类似数学领域里的函数，给定相同的输入必有相同的输出。而且纯函数没有副作用，函数内部的操作不会对外部产生任何影响。
- 函数式编程基本运算：
  - 函数合成（Compose）：将多个函数合并成一个函数。
  - 函数柯里化（Curring）：接收单一参数，并返回接收余下参数并返回结果的函数。
- 高阶函数：
  - 函数作为参数被传递
  - 函数作为返回值输出

 

## C++

- [lambda 表达式](https://changkun.de/modern-cpp/zh-cn/03-runtime/index.html#3-1-Lambda-%E8%A1%A8%E8%BE%BE%E5%BC%8F) 
- [std::function](https://changkun.de/modern-cpp/zh-cn/03-runtime/index.html#std-function)
- 柯里化 [std::bind 和 std::placeholder](https://changkun.de/modern-cpp/zh-cn/03-runtime/index.html#std-bind-%E5%92%8C-std-placeholder)



## Scheme



参考：

- [函数式编程入门教程 - 阮一峰](http://ruanyifeng.com/blog/2017/02/fp-tutorial.html)



控制系统复杂度的方法：

- 黑盒抽象
- 通用接口
- 元语言抽象

介绍新语言是：

- primitive elements （构成语言的基本元素）是什么？
- means of combination（组合的方法）是什么？
- means of abstraction（抽象的方法）是什么？



Lisp 基本元素

- number（3, 17.4, 5）
- “+” "<" "*" 等内置运算符

Lisp 组合方法

- 构造组合式 (+ 3 (+ 5 5))
- cond
- if

Lisp 抽象方法

- define，定义变量、定义过程

在 Lisp 中无法区分**内建元素**和**复合元素**之间的区别。