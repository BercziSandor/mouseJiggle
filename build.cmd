@echo off

SET Aut2Exe=c:\Users\sberczi\Dropbox\prog\_\autoIt\autoIt\Aut2Exe\Aut2exe_x64.exe

cd /d %~dp0
SET APP=mouseJiggle
for %%a in (.\src\%APP%.au3) do set version=%%~ta
SET version2=%version::=%
SET version2=%version2: =_%
SET version2=%version2:.=%

if not exist %Aut2Exe% (
	echo ERROR: AutoIt not found, set it's location in this file first and try again.
	echo download location: https://www.autoitscript.com/site/autoit/downloads/ -> https://www.autoitscript.com/cgi-bin/getfile.pl?autoit3/autoit-v3.zip
	pause
	exit 1
)

del .\bin\%APP%.exe
echo Building %APP%: version: %version%... (Console)
%Aut2Exe% /in .\src\%APP%.au3 /out bin/%APP%.exe          /icon	.\res\mouse.ico /pack /companyname "Sandor Berczi" /productversion "%version%"

mkdir .\bin\res\
copy /Y .\res\*.* .\bin\res\

echo Creating distribution files
mkdir dist
if exist ./dist/%APP%_%version2%.zip (
	rm ./dist/%APP%_%version2%.zip
)
cd bin
zip -r ../dist/%APP%_%version2%.zip ./%APP%*.exe ./res/ ../README.md

rem pause
