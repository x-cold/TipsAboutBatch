::连接歌词神器bat
::使用说明书
::cmd下运行trans.bat %1 %2 %3
::其中%1，%2，%3为运行参数
::%1为时间记录文本
::%2为歌词记录文本
::%3为生成目标文本
::例子：“trans.bat 1.txt 2.txt 3.txt”
@echo off
title 歌词连接器~ByQQ：438952164
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