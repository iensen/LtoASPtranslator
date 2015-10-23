import sys
sys.path.insert(0, 'transformer')
sys.path.insert(0, 'transformer/submodules')
sys.path.insert(0, 'unparser')
import main
from transformer import *
from unparser import *

# Provide an L program in an input file:
file_input = sys.argv[1]
parsed = main.parse_file(file_input)

if __name__ == '__main__':
    translated = unparse(transform(parsed))
    print(translated)
