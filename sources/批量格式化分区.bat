@echo off
title 格式化系统
set diskpart=M.M,M
for %%i in (%diskpart%) do (
	format %%i: /q /y
)
echo 格式化完毕，按任意键结束
pause>nul