@echo off

::设置工作路径为本文件所在目录下的"AAA"文件夹
pushd %~dp0
if exist "999" goto work
md 999

:work
pushd %~dp0\AAA
for /f %%i in ('dir /b /a-d /on') do (
	move %%~nxi ..\999 > nul
	echo moved %%~nxi to .\999
)
pushd %~dp0\XXX
for /f %%i in ('dir /b /a-d /on') do (
	move %%~nxi ..\999 > nul
	echo moved %%~nxi to .\999
)

pause>nul