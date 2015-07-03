@echo off
title 映射管理
::net use p: \\16.16.72.234\bfs_p\d bfs /user:"bfs" /persistent:yes
color 0a
set WinVer=VistaWin7
ver|find /i "5">nul && set WinVer=WinXP
if /I not "%WinVer%"=="WinXP" (
echo.
echo.请确定您已使用管理员身份运行该脚本
pause >nul
)
setlocal enabledelayedexpansion
for /f  "delims=" %%a in ('net use ^| findstr "16.16.72.234"') do (
	for /f "tokens=2 delims= " %%b in ("%%a") do (
	    if exist %%b\Bfs3450_BT3_Product.exe (
	    	echo "已检测到映射中的Bfs3450_BT3_Product.exe,正在处理"
	        set SrcFile=%%b\Bfs3450_BT3_Product.exe
	        ver | find "5.1." && set LnkFile="%USERPROFILE%\桌面\bfs++应用程序" || set LnkFile=%USERPROFILE%\desktop\bfs++应用程序
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
copy c:\TEMP\Bfs3450_BT3_Product.exe c:\bfs\Bfs3450_BT3_Product.exe /y
copy c:\TEMP\bfssys.ini c:\bfs\bfssys.ini /y
set SrcFile=c:\bfs\Bfs3450_BT3_Product.exe
ver | find "5.1." > nul && set LnkFile="%USERPROFILE%\桌面\bfs++应用程序" || set LnkFile=%USERPROFILE%\desktop\bfs++应用程序 
call :CreateShort !SrcFile! !LnkFile!
pause&exit

:CreateShort 
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(""%~2.lnk""):b.TargetPath=""%~1"":b.WorkingDirectory=""%~dp1"":b.Save:close") 
