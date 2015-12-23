README

########## ########## ########## ########## ########## ########## ########## ##########
L-ASP TRANSLATOR SPECIFICATION
"docs/translator_spec.txt"

########## ########## ########## ########## ########## ########## ########## ##########
L SOLVER EXECUTABLE
"solver.zip"
This file is a standalone L solver for Windows
To use, download and unzip the file. Double-click "solver.bat"

########## ########## ########## ########## ########## ########## ########## ##########
L PARSER GUIDE
"docs/Lparser_guide.txt"


########## ########## ########## ########## ########## ########## ########## ##########
L-ASP TRANSLATOR GUIDE
Using a command-line interface:
    1.  Change the current directory to "src"
    
    2.  Specify where to read source L program and OVERWRITE translated ASP program:
            python translator.py <path_to_L_program> > <path_to_ASP_program>
            
    3'. Answer set mode:
        Specify where to read translated ASP program and OVERWRITE output models:
            java -jar sparc.jar -solver clingo -A -loutput <path_to_ASP_program> > <path_to_output_file>
            
    3". Querying mode:
        Specify where to read translated ASP program:
            java -jar sparc.jar -solver clingo <path_to_ASP_program>
        Ask:
            <query>
            (Press Enter until "?- " reappears)
        Quit:
            exit
            
Example (Python 3.4 on Windows):
    1.
            cd/d E:\LtoASPtranslator\src
        
    2.
            python translator.py examples/ranking.l > examples/ranking.sp

    3'.
            java -jar sparc.jar -solver clingo -A -loutput examples/ranking.sp > examples/ranking.txt
        
    3".
            java -jar sparc.jar -solver clingo examples/ranking.sp
            student_rank(S, R)
            (Press Enter until all five atoms have been displayed)
            exit
