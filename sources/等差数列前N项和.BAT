@echo ___________注：不支持小数点运算__________________
@echo off
@title 等差数列前N项和
@set /p x=首项
@set /p y=公差
@set /p n=第？项
@set /a z =%x%+(%n%-1)*%y%
@set qq = 0
@for /l %%i in (%x%,%y%,%z%) do (@set /a qq + = %%i) 
@echo --------%qq%-----------
@pause 