@echo off
setlocal enabledelayedexpansion
::设置工作路径为本文件所在目录下的"AAA"文件夹
pushd %~dp0\AAA
set /a num=1
for /f %%i in ('dir /b /a-d /on') do (
	ren %%~nxi AAA-0!num!-%%~nxi
	echo 成功将 %%~nxi 重命名为 AAA-0!num!-%%~nxi
	set /a num+=1
)
endlocal
pause>nul