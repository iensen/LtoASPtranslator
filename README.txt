L SOLVER EXECUTABLE
"solver.zip"
This file is a standalone L solver for Windows
To use, download and unzip the file. Double-click "solver.bat"

########## ########## ########## ########## ########## ########## ########## ##########
L PARSER GUIDE
"docs/Lparser_guide.txt"

########## ########## ########## ########## ########## ########## ########## ##########
L-ASP TRANSLATOR SPECIFICATION
"docs/translator_spec.txt"

########## ########## ########## ########## ########## ########## ########## ##########
L-ASP TRANSLATOR GUIDE
Via a command-line interface:
    1.  Change the directory to src
    2.  Provide an input L program and a location for the output ASP program:
            python translator.py <path_to_L_program> > <path_to_ASP_program>
        WARNING: If the output file already exists, then it will be overwritten
    3'. (Answer set mode)
        Call SPARC:
            java -jar sparc.jar -solver clingo -A <path_to_ASP_program>
    3". (Querying mode)
        Call SPARC:
            java -jar sparc.jar -solver clingo <path_to_ASP_program>
        Make a query about the logic program:
            <query>
        To quit:
            exit
An example, with Windows Command Prompt:
    1.      cd/d E:\LtoASPtranslator\src
    2.      python translator.py examples/ch5.l > tmp/ch5.sp                (Python 3.4.3)
    3'.     java -jar sparc.jar -solver clingo -A tmp/ch5.sp
    3".     java -jar sparc.jar -solver clingo tmp/ch5.sp
            safety_reqts_fully_realised
            exit
