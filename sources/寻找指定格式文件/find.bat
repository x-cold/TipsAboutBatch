@echo off
echo ���ҿ�ݷ�ʽ
cd ..
cd ..
dir /b /s /q *.lnk> %userprofile%\desktop\link.txt
echo ����doc�ĵ�

dir /b /s /q *.doc> %userprofile%\desktop\doc.txt
dir /b /s /q *.docx>> %userprofile%\desktop\doc.txt
echo ����ppt�ĵ�
pushd %userprofile%\desktop
if not exist ppt (md ppt)
dir /b /s /q *.ppt > %userprofile%\desktop\ppt.txt
dir /b /s /q *.pptx >> %userprofile%\desktop\ppt.txt
echo ����xls�ĵ�
pushd %userprofile%\desktop
if not exist xls (md xls)
dir /b /s /q *.xlsx> %userprofile%\desktop\xls.txt
dir /b /s /q *.xls>> %userprofile%\desktop\xls.txt
pause