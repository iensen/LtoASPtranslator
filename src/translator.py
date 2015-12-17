'''
This translator converts an L program into a semantically equivalent ASP program.

To run 'translator' via a command-line interface:
    1.  Change the directory to src.
    2.  Provide an input L program and a location for the output ASP program:
            python translator.py <path_to_L_program> > <path_to_ASP_program>
        WARNING: If the output file already exists, then it will be overwritten.
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
    1.  Enter:
            cd/d E:\LtoASPtranslator\src
    2.  Enter:
            python translator.py examples/ch5.l > tmp/ch5.sp
        (Python 3.4.3)
    3'. Enter:
            java -jar sparc.jar -solver clingo -A tmp/ch5.sp
    3". Enter:
            java -jar sparc.jar -solver clingo tmp/ch5.sp
        Enter:
            safety_reqts_fully_realised
        Enter:
            exit
'''

########## ########## ########## ########## ########## ########## ########## ##########

import sys

import main
import modules.transformer
import modules.unparser

########## ########## ########## ########## ########## ########## ########## ##########
   
if __name__ == '__main__':
    l = sys.argv[1]
    parsed = main.parse_file(l)
    transformed = modules.transformer.transform(parsed)
    asp = modules.unparser.unparse(transformed)
    print(asp)
