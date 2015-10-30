import main

import sys
sys.path.insert(0, 'modules')

import transformer
import rewriter
import reassembler
import unparser

########## ########## ########## ########## ########## ########## ########## ##########

# Provide an L program in an input file:
file_input = sys.argv[1]
parsed = main.parse_file(file_input)

########## ########## ########## ########## ########## ########## ########## ##########
    
def assign(p):
    global transformed # is a parsed ASP program
    global rewritten # is an incomplete dictionary parsed ASP program
    global reassembled # is a dictionary parsed ASP program    
    global translated # is an ASP program
    transformed = transformer.transform(p)
    rewritten = rewriter.rewrite(transformer.list_to_dict(p))
    reassembled = reassembler.reassemble(rewritten)
    translated = unparser.unparse(transformed)

########## ########## ########## ########## ########## ########## ########## ##########
    
if __name__ == '__main__':
    assign(parsed)
    print(translated)
