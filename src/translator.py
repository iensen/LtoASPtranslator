import sys
sys.path.insert(0, 'transformer')
sys.path.insert(0, 'transformer/submodules')
sys.path.insert(0, 'unparser')
import main
from labels import *
from transformer import *
from rewriter import *
from reassembler import *
from unparser import *

########## ########## ########## ########## ########## ########## ########## ##########

# Provide an L program in an input file:
file_input = sys.argv[1]
parsed = main.parse_file(file_input)

# Assign values to nodes in the control flow:
def assign():
    global transformed # is a parsed ASP program
    global rewritten # is an incomplete dictionary parsed ASP program
    global reassembled # is a dictionary parsed ASP program    
    global translated # is an ASP program
    transformed = transform(parsed)
    rewritten = rewrite(list_to_dict(parsed))
    reassembled = reassemble(rewritten)
    translated = unparse(transformed)

########## ########## ########## ########## ########## ########## ########## ##########

if __name__ == '__main__':
    assign()
    print(translated)
