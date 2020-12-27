Vim的基本操作
========
转到第10行：10G

## 删除操作
删除所选的内容：先用[n]G跳转到指定的行，然后使用以下命令：
:9,.d

范围删除:[start],[end]d

.表示当前行，$表示最后一行，%所有行

:%d删除所有行

## 跳转操作
% 跳转到配对的括号去
[[跳转到代码块的开头去
gD跳转到局部变量的定义处
''跳转到光标上次停靠的地方
mx设置书签，x只能是a-z的字母
`x跳转到书签x处


vim必备插件
========

# clangd是什么？language server
ycm可以基于clangd实现C/C++代码的补全！
clangd是基于compile_commands.json文件来完成对项目的解析，并支持代码补全和跳转。

# You Complete Me
编译ycm：python3 install.py --clangd-completer

Clangd completer enabled. If you are using .ycm_extra_conf.py files, make sure 
they use Settings() instead of the old and deprecated FlagsForFile().

## vim不加载.ycm_extra_conf.py的原因？
用--clangd-completer编译ycm后，可加载配置文件。
加载vimrc中指定的配置时，不会提示吗？

# global命令的使用[https://www.gnu.org/software/global/globaldoc_toc.html]
global -r fun2 #查找引用
global -x fun2 #显示详细信息
global -a func2 #产生绝对路径

# ag的使用


文本对象
========
编辑命令的结构：

```
<number> <operator> <text object or motion>
```

number: 数字用于在文本对象或移动操作上进行多次执行。

operator: change, delete, yank. 操作符也是可选的.
:h operator查看帮助文档

text object或motion可以是一个文本对象，比如单词，句子，段落或者一个移动，比如向
下移动一行，向后翻页，到最后一行。

:h text-objects
:h motion

dw删除一个单词


