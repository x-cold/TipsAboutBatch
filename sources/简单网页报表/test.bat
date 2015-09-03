@echo off
echo ^<html^>^<head^>^<link href="style.css" rel="stylesheet"/^>^</head^>^<body^>^<p^> > %2

for /f "delims=" %%a in (%1) do (echo %%a >>%2 && echo ^<br^> >> %2)

echo ^</p^>^</body^>^</html^>^ >> %2

echo body{width:100%;overflow:hidden;} >> style.css
echo p{width:720px;background-color:#f2f2f2;border:1px solid #508F2F;margin:0 151px;padding:40px 0px;} >> style.css
echo p{color:#508f2F;font-size:20px;font-weight:700;text-align:center;} >> style.css

play.bat %2
pause>nul