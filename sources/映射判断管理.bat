@echo off
title ӳ�����
::net use p: \\16.16.72.234\bfs_p\d bfs /user:"bfs" /persistent:yes
color 0a
set WinVer=VistaWin7
ver|find /i "5">nul && set WinVer=WinXP
if /I not "%WinVer%"=="WinXP" (
echo.
echo.��ȷ������ʹ�ù���Ա������иýű�
pause >nul
)
setlocal enabledelayedexpansion
for /f  "delims=" %%a in ('net use ^| findstr "16.16.72.234"') do (
	for /f "tokens=2 delims= " %%b in ("%%a") do (
	    if exist %%b\Bfs3450_BT3_Product.exe (
	    	echo "�Ѽ�⵽ӳ���е�Bfs3450_BT3_Product.exe,���ڴ���"
	        set SrcFile=%%b\Bfs3450_BT3_Product.exe
	        ver | find "5.1." && set LnkFile="%USERPROFILE%\����\bfs++Ӧ�ó���" || set LnkFile=%USERPROFILE%\desktop\bfs++Ӧ�ó���
	        call :CreateShort !SrcFile! !LnkFile!
	        pause&exit 
	     )
	) 
)

echo "�޷��ҵ���Ӧ��ӳ�䣬���ڵ��ñ����ļ�"
if not exist c:\bfs\ (
	echo " c:\bfs �ļ��в����� "
	echo "�������ļ��� c:\bfs\ "
	md c:\bfs
)
copy c:\TEMP\Bfs3450_BT3_Product.exe c:\bfs\Bfs3450_BT3_Product.exe /y
copy c:\TEMP\bfssys.ini c:\bfs\bfssys.ini /y
set SrcFile=c:\bfs\Bfs3450_BT3_Product.exe
ver | find "5.1." > nul && set LnkFile="%USERPROFILE%\����\bfs++Ӧ�ó���" || set LnkFile=%USERPROFILE%\desktop\bfs++Ӧ�ó��� 
call :CreateShort !SrcFile! !LnkFile!
pause&exit

:CreateShort 
mshta VBScript:Execute("Set a=CreateObject(""WScript.Shell""):Set b=a.CreateShortcut(""%~2.lnk""):b.TargetPath=""%~1"":b.WorkingDirectory=""%~dp1"":b.Save:close") 
