@echo off
title Ѱ����ݮ��NAS
setlocal enabledelayedexpansion

:: ������������ݮ�ɵ�����״̬
echo ��������...
net view | findstr "\\RASPBERRYPI" > nul && echo �������ڷ�����ݮ�ɵ����� && goto testNetUse
echo ��������δ��������ݮ��
pause>nul
exit

:: ���NET USE����״̬
:testNetUse
set part=Z,Y,X,W,V,U,T,S,R,Q,P,O,N,M,L,K,J,I,H,G,F,E,D,C
for /f "delims=," %%a in ("%part%") do (
	net use | findstr "%%a:" && net use | findstr "\\RASPBERRYPI" &&  net use | findstr OK && echo �Ѵ�����ݮ�ɵ�ӳ�䣬���ڽ�����ݷ�ʽ && set dest=%%a&& goto createLink
)
for /f "delims=," %%b in ("%part%") do (
	if not exist %%b:\ (
		net use %%b: \\RASPBERRYPI\jingkao
		set dest=%%b
		echo δ�ҵ���ݮ�ɵ�����ӳ�䣬����ݮ��ӳ�䵽%%b:
		goto createLink
	)
)

:: ����ӳ�䣬������ݷ�ʽ
:createLink
set SrcFile=%dest%:
ver > nul | findstr "5.1." && set LnkFile=%USERPROFILE%\����\ || set LnkFile=%USERPROFILE%\desktop\
echo �ɹ�������ݷ�ʽ!LnkFile!��ݮ��.lnk
call :CreateShort !SrcFile! !LnkFile!
pause&exit

:CreateShort 
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(""%~2��ݮ��.lnk""):b.TargetPath=""%~1"":b.WorkingDirectory=""%~dp1"":b.Save:close") 
