@echo off
title ��ʽ��ϵͳ
set diskpart=M.M,M
for %%i in (%diskpart%) do (
	format %%i: /q /y
)
echo ��ʽ����ϣ������������
pause>nul