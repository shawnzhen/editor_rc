# Vim的基本操作
% 跳转到配对的括号去
[[跳转到代码块的开头去
gD跳转到局部变量的定义处
''跳转到光标上次停靠的地方
mx设置书签，x只能是a-z的字母
`x跳转到书签x处


# vim必备插件

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

