@echo off
setlocal EnableDelayedExpansion
::����������Ҫ��ĳ���Ҫ������ļ���·���硰pushd %~dp0^\text���ĳ�"pushd "c:\text""
pushd %~dp0^\text
::����
set /a index = 0
for /f %%i in ('dir /b /a-d *.*') do (
set /a index += 1
ren %%~nxi !index!%%~xi
)
echo ��ɨ�赽!index!���ļ�����
pause>nul