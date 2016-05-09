@echo off
cls
echo Processing...

set baseName=examples/ranking

set l=%baseName%.l
set sp=%baseName%.sp
set txt=%baseName%.txt

set o=%baseName%.o
set lp=%baseName%.lp
set text=%baseName%.text

REM main %l%

REM python translator.py %l% | java -jar sparc.jar -solver clingo -loutput

python translator.py %l% > %sp%

java -jar sparc.jar -solver clingo %sp% -loutput -A > %txt%
REM -o %o% 
REM -solveropts "1"

REM .\clingo 0 %o% 
REM --text > %text%

echo:
echo Done
