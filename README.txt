L SOLVER

Produces answer sets of programs written in logic programming language L
Combines: 
    L-ASP translator (Evgenii Balai & Vu Phan) 
    Sparc (Evgenii Balai)
    Clingo (Potassco)

Example:
    Source L program:
    https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.l
    Translated ASP program:
    https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.sp
    Output models:
    https://github.com/iensen/LtoASPtranslator/blob/master/src/examples/ranking.txt

Download repository:
https://github.com/iensen/LtoASPtranslator/archive/master.zip


########## ########## ########## ########## ########## ########## ########## ##########
L SOLVER STANDALONE (Windows without Python)

https://github.com/iensen/LtoASPtranslator/blob/master/Lsolver.zip?raw=true


########## ########## ########## ########## ########## ########## ########## ##########
L SOLVER SOURCE CODE (Python 3.4)

Using a command-line interface:
    1.  Change current directory to "src"
    
    2.  Specify where to read source L program and OVERWRITE translated ASP program:
            python translator.py <path_to_L_program>   >   <path_to_ASP_program>
            
    3'. Answer set mode:
        Specify where to read translated ASP program:
            java -jar sparc.jar -solver clingo <path_to_ASP_program> -A -loutput
            
    3". Querying mode:
        Specify where to read translated ASP program:
            java -jar sparc.jar -solver clingo <path_to_ASP_program>
        Ask:
            <query>
            (Press Enter until "?- " reappears)
        Quit:
            exit
            
Example (Windows):
    1.
            cd/d E:\LtoASPtranslator\src
        
    2.
            python translator.py examples/ranking.l   >   examples/ranking.sp

    3'.
            java -jar sparc.jar -solver clingo examples/ranking.sp -A -loutput
        
    3".
            java -jar sparc.jar -solver clingo examples/ranking.sp
            student_rank(S, R)
            (Press Enter until all five atoms have been displayed)
            exit

            
########## ########## ########## ########## ########## ########## ########## ##########
REFERENCES

L specification:
    https://github.com/iensen/LtoASPtranslator/blob/master/Lspec/Lspec.pdf
L parser guide:
    https://github.com/iensen/LtoASPtranslator/blob/master/docs/Lparser_guide.txt
L-ASP translator specification:
    https://github.com/iensen/LtoASPtranslator/blob/master/docs/translator_spec.txt
Sparc manual:
    https://github.com/iensen/sparc/blob/master/User_Manual/Sparc_Manual.pdf
Clingo guide:
    http://sourceforge.net/projects/potassco/files/guide/2.0/guide-2.0.pdf
