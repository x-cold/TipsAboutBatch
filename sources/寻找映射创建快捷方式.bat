@echo off
title 映射管理
:: net use \\127.0.0.1\LOL /user:"pengfei"
setlocal enabledelayedexpansion
for /f  "delims=" %%a in ('net use ^| findstr "127.0.0.1"') do (
	for /f "tokens=2 delims= " %%b in ("%%a") do (
	    if exist %%b\123.exe (
	    	echo "已检测到映射中的123.exe,正在处理"
	        set SrcFile=%%b\123.exe
	        set LnkFile=%USERPROFILE%\desktop\romete
	        call :CreateShort !SrcFile! !LnkFile!
	        pause&exit 
	     )
	) 
)

echo "无法找到对应的映射，正在调用本地文件"
if not exist c:\bfs\ (
	echo " c:\bfs 文件夹不存在 "
	echo "建立新文件夹 c:\bfs\ "
	md c:\bfs
)
copy c:\TEMP\123.exe c:\bfs\123.exe /y
copy c:\TEMP\456.ini c:\bfs\456.ini /y
set SrcFile=c:\bfs\123.exe
set LnkFile=%USERPROFILE%\desktop\local
call :CreateShort !SrcFile! !LnkFile!
pause&exit

:CreateShort 
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(""%~2.lnk""):b.TargetPath=""%~1"":b.WorkingDirectory=""%~dp1"":b.Save:close") 