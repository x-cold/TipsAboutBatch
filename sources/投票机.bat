@echo off
title QAQ
setlocal enabledelayedexpansion
pushd "%ProgramFiles(x86)%\Google\Chrome\Application"
set /a index=1
:start
set web=http://www.sojump.com/m/4779432.aspx
chrome.exe -incognito %web%
echo !date! !time!: sent the !index! time(s) request to %web%
set /a index+=1
ping 127.1 -n 1 > nul

:wait
tasklist | findstr "chrome.exe" > nul || goto start
ping 127.1 -n 5 > nul
goto wait