@echo off
::�뽫�ô��뱣��Ϊbat��cmd��׺���ı��ļ�
::��������Ҫ���������ļ���"a"��ͬһĿ¼��

::��ʼ������·��Ϊ�������ڵ�·��
pushd %~dp0

::��ȡ�ı���Ϣ
for /f "skip=2" %%i in (a\b.txt) do (
	set floderName=%%i
	goto endRead
)
:endRead

::�������ļ���
ren a %floderName:~0,9%

echo �ļ����������ɹ�
pause>nul