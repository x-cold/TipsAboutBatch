@echo off
:begin
tasklist|find "LolClient.exe">nul&&taskkill -f -im LolClient.exe&&shutdown -f -r -t 0
ping -n 4 127.1>nul
goto begin