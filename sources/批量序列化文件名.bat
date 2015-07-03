@echo off
setlocal EnableDelayedExpansion
::下面这个语句要请改成你要处理的文件夹路径如“pushd %~dp0^\text”改成"pushd "c:\text""
pushd %~dp0^\text
::计数
set /a index = 0
for /f %%i in ('dir /b /a-d *.*') do (
set /a index += 1
ren %%~nxi !index!%%~xi
)
echo 共扫描到!index!个文件名。
pause>nul