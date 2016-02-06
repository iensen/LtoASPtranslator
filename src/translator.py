'''
This translator converts an L program into a semantically equivalent ASP program.
'''

########## ########## ########## ########## ########## ########## ########## ##########

import main
import modules.transformer
import modules.unparser

########## ########## ########## ########## ########## ########## ########## ##########

if __name__ == '__main__':
    import sys
    l = sys.argv[1]
    parsed = main.parse_file(l)
    transformed = modules.transformer.transform(parsed)
    asp = modules.unparser.unparse(transformed)
    print(asp)
