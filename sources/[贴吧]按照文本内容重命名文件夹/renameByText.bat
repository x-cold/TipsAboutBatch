@echo off
::请将该代码保存为bat、cmd后缀的文本文件
::放置于需要重命名的文件夹"a"的同一目录下

::初始化工作路径为批出所在的路径
pushd %~dp0

::读取文本信息
for /f "skip=2" %%i in (a\b.txt) do (
	set floderName=%%i
	goto endRead
)
:endRead

::重命名文件夹
ren a %floderName:~0,9%

echo 文件夹重命名成功
pause>nul