@echo off
cls
echo Processing...

set git_tmp=..\..\..\OneDrive\work\tmp
set name=tmp\brain

set l=%name%.l
set sp=%name%.sp
set txt=%name%.txt

set o=%name%.o
set lp=%name%.lp
set text=%name%.text

REM type %sp%

REM main %l%

REM .\translator.exe %l% > %sp%

REM java -jar sparc.jar -A -solver clingo %sp% -o %o% -solveropts "1"

.\clingo 1 %o% --text > %text%

echo:
echo Done