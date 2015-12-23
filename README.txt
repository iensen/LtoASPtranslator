README

########## ########## ########## ########## ########## ########## ########## ##########
L-ASP TRANSLATOR SPECIFICATION
"docs/translator_spec.txt"

########## ########## ########## ########## ########## ########## ########## ##########
L SOLVER STANDALONE (Windows without Python)
"solver.zip"
To use, download and unzip the file. Double-click "solver.bat"

########## ########## ########## ########## ########## ########## ########## ##########
L PARSER GUIDE (Python 3.4)
"docs/Lparser_guide.txt"
Using a command-line interface:
    1.  Change the current directory to "src"
    2.  Specify where to read source L program:
            python[3] main.py <path_to_L_program>
            (If "python" fails, then try "python3")
Example (on Windows):
    1.
            cd/d E:\LtoASPtranslator\src
    2.
            python main.py examples/pi2.l
You should see:
            [['rule', ['psent', ['patom', ('identifier', 'a')]], ['sent', ['patom', ('identifier', 'b')]]]]

########## ########## ########## ########## ########## ########## ########## ##########
L-ASP SOLVER GUIDE
Using a command-line interface:
    1.  Change the current directory to "src"
    
    2.  Specify where to read source L program and OVERWRITE translated ASP program:
            python translator.py <path_to_L_program> > <path_to_ASP_program>
            
    3'. Answer set mode:
        Specify where to read translated ASP program and OVERWRITE output models:
            java -jar sparc.jar -solver clingo -A -loutput <path_to_ASP_program>
            
    3". Querying mode:
        Specify where to read translated ASP program:
            java -jar sparc.jar -solver clingo <path_to_ASP_program>
        Ask:
            <query>
            (Press Enter until "?- " reappears)
        Quit:
            exit
            
Example:
    1.
            cd/d E:\LtoASPtranslator\src
        
    2.
            python translator.py examples/ranking.l > examples/ranking.sp

    3'.
            java -jar sparc.jar -solver clingo -A -loutput examples/ranking.sp
        
    3".
            java -jar sparc.jar -solver clingo examples/ranking.sp
            student_rank(S, R)
            (Press Enter until all five atoms have been displayed)
            exit
