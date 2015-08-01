@echo off
title 寻找树莓派NAS
setlocal enabledelayedexpansion

:: 检测局域网内树莓派的连接状态
echo 检测局域网...
net view | findstr "\\RASPBERRYPI" > nul && echo 局域网内发现树莓派的连接 && goto testNetUse
echo 局域网内未连接上树莓派
pause>nul
exit

:: 检查NET USE连接状态
:testNetUse
set part=Z,Y,X,W,V,U,T,S,R,Q,P,O,N,M,L,K,J,I,H,G,F,E,D,C
for /f "delims=," %%a in ("%part%") do (
	net use | findstr "%%a:" && net use | findstr "\\RASPBERRYPI" &&  net use | findstr OK && echo 已存在树莓派的映射，正在建立快捷方式 && set dest=%%a&& goto createLink
)
for /f "delims=," %%b in ("%part%") do (
	if not exist %%b:\ (
		net use %%b: \\RASPBERRYPI\jingkao
		set dest=%%b
		echo 未找到树莓派的网络映射，将树莓派映射到%%b:
		goto createLink
	)
)

:: 建立映射，创建快捷方式
:createLink
set SrcFile=%dest%:
ver > nul | findstr "5.1." && set LnkFile=%USERPROFILE%\桌面\ || set LnkFile=%USERPROFILE%\desktop\
echo 成功建立快捷方式!LnkFile!树莓派.lnk
call :CreateShort !SrcFile! !LnkFile!
pause&exit

:CreateShort 
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(""%~2树莓派.lnk""):b.TargetPath=""%~1"":b.WorkingDirectory=""%~dp1"":b.Save:close") 
