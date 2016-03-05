set work=..\..\..\OneDrive\work

cls
@echo off

REM pyi-makespec translator.py --specpath=%work% -F

pyinstaller %work%\translator.spec --distpath=.. --workpath=..\tmp\build\

cd ..
.\translator.exe src\examples\pi3.l
cd src