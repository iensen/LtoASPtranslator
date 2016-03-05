@echo off
cls
echo Processing...

set baseName=..\tmp\examples\file

set l=%baseName%.l
set sp=%baseName%.sp
set txt=%baseName%.txt

set o=%baseName%.o
set lp=%baseName%.lp
set text=%baseName%.text

main %l%

REM python translator.py %l% > %sp%

REM type %sp%
REM echo ___________________________________

REM java -jar sparc.jar -A -solver clingo %sp% -loutput
REM -o %o% -solveropts "1"

REM .\clingo 1 %o% --text > %text%

echo:
echo Done