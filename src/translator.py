'''
This translator converts an L program into a semantically equivalent ASP program.

To run 'translator' via a command-line interface:
    1.  Change the directory to src.
    2.  Provide an input L program and a location for the output ASP program:
            python translator.py <path_to_L_program> > <path_to_ASP_program>
        Warning: If the output file already exists, then it will be overwritten.
    3.  Call SPARC:
            java -jar sparc.jar <path_to_ASP_program>
    4.  Make a query about the logic program:
            <query>

An example, with Windows Command Prompt:
    1.  Type:
            cd/d E:\LtoASPtranslator\src
    2.  Type:
            python translator.py examples/ch5.l > tmp/ch5.sp
        (Python 3.4.3)
    3.  Type:
            java -jar sparc.jar tmp/ch5.sp
    4.  Type:
            safety_reqts_fully_realised
'''

########## ########## ########## ########## ########## ########## ########## ##########

import main

import sys
sys.path.insert(0, 'modules')
import transformer
import unparser

########## ########## ########## ########## ########## ########## ########## ##########
   
if __name__ == '__main__':
    l = sys.argv[1]
    parsed = main.parse_file(l)
    transformed = transformer.transform(parsed)
    asp = unparser.unparse(transformed)
    print(asp)
