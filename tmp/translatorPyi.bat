cls
@echo off

REM OVERWRITE!!!
REM pyi-makespec translator.py --specpath=..\tmp\ -F

REM pyinstaller ..\tmp\translator.spec --distpath=.. --workpath=..\tmp\build\

cd ..
.\translator.exe tmp/fold/file.l
cd src
