@echo off
setlocal enabledelayedexpansion
::���ù���·��Ϊ���ļ�����Ŀ¼�µ�"AAA"�ļ���
pushd %~dp0\AAA
set /a num=1
for /f %%i in ('dir /b /a-d /on') do (
	ren %%~nxi AAA-0!num!-%%~nxi
	echo �ɹ��� %%~nxi ������Ϊ AAA-0!num!-%%~nxi
	set /a num+=1
)
endlocal
pause>nul