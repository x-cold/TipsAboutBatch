::���Ӹ������bat
::ʹ��˵����
::cmd������trans.bat %1 %2 %3
::����%1��%2��%3Ϊ���в���
::%1Ϊʱ���¼�ı�
::%2Ϊ��ʼ�¼�ı�
::%3Ϊ����Ŀ���ı�
::���ӣ���trans.bat 1.txt 2.txt 3.txt��
@echo off
title ���������~ByQQ��438952164
setlocal enabledelayedexpansion
cd. > %3
set line1 = 0
set line2 = 0
set line3 = 0
for /f "delims=" %%i in (%1) do (
	set /a line1 += 1 && set /a flag = !line1!%%2 && if "!flag!"=="1" (set /a n+=1&call,set "_%%n%%=%%i")
	)
for /f "delims=" %%i in (%1) do (
	set /a line2 += 1 && set /a flag1 = !line2!%%2 && if "!flag1!"=="0" (set /a t+=1&call,set ",%%t%%=%%i")
	)
for /f "delims=" %%i in (%2) do (
	set /a line3 += 1 && set /a flag2 = !line3!%%3 && if "!flag2!"=="0" (set /a m+=1&call,set ".%%m%%=%%i")
	)

if %n% gtr %m% (set "num=%n%") else (set "num=%m%") 
for /l %%i in (1,1,%num%) do ( 
if defined _%%i call,echo %%_%%i%% >> %3
if defined _%%i call,echo %%,%%i%% >> %3
if defined .%%i call,echo %%.%%i%% >> %3
)
endlocal
notepad %3
pause