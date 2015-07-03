@echo off
pushd %userprofile%\desktop
if not exist link (md link)
cd ..
cd ..
for /f %%i in ('dir /b /s /q *.lnk') do (
	copy %%i %userprofile%\desktop\link
)
pause