import os
import subprocess
import sys
sys.path.insert(0, 'solvers')
sys.path.insert(0, 'transformer')
sys.path.insert(0, 'transformer/submodules')
sys.path.insert(0, 'unparser')

from main import *
import transformer
import rewriter
import reassembler
import unparser


cur_dir = os.path.join(os.path.dirname(os.path.abspath(__file__))) + "/"

test_files = ['examples/vu_test.l', 'examples/t3.l']
test_outputs = [{frozenset(['h'])}, {frozenset(['t1(5)', 't1(6)', 't1(7)'])}]


def run_asp_program(program):
    """take clingo program and return the set of its answer sets"""
    my_env = os.environ.copy()
    #my_env["PATH"] = cur_dir + "solvers:" + my_env["PATH"]
    process = subprocess.Popen(["java", "-jar", cur_dir + "solvers/sparc.jar",
        "-solver", "clingo", "-A"], stdout = subprocess.PIPE, stderr = subprocess.PIPE,
        stdin = subprocess.PIPE,env = my_env)
    stdout, stderr = process.communicate(input = program.encode('ascii'))
    return stdout

    
def parse_clingo_output(output):
    """take clingo output and return the set of its answer sets in the form
    where each answer set is a set of literals represented in form of strings"""
    lines = output.decode("ascii").split('\n')
    idx = 0
    result = set()
    while idx < len(lines):
       if lines[idx].startswith("Answer"):
           answerSet=frozenset()
           idx+=1
           answerSetLine = lines[idx]
           if len(answerSetLine) > 0 and not answerSetLine.isspace():
                answerSet|= frozenset(answerSetLine.split())
           result.add(answerSet)
       idx+=1
    return result;

    
def compare_answers(answers_out, answers_given):
    if answers_out != answers_given:
        print("Compare Answers: FAILED")
        print('Answers out:\n', answers_out)
        print('Answers given:\n', answers_given)
    else:
        print("Compare Answers: OK")
 

def parse_asp_program(asp_program):
    """ the function takes an asp program in form of a string
    and produces asp tree using corresponding lexicon and grammar 
    files 
    """
    lexicon_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), "lexicon_ASP")
    grammar_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), "grammar_ASP")
    lexer = Lexer(lexicon_file, False)
    parser = Parser(grammar_file, lexer.lexicon_dict.keys())
    tokens = lexer.get_lexing_sequence(asp_program)
    starting_symbol = "program"
    asp_tree = parser.get_ast(tokens, True, starting_symbol)
    return asp_tree.repr()
    
    
def check_tree(asp_tree, asp_program):
    """
    the function checks if the tree produced by the parser from the given program (asp_tree)
    is the same as the tree produced by the parser from program asp_program
    """
    if parse_asp_program(asp_program) == asp_tree:
        print("Check ASP tree: OK")
    else:
        print("Check ASP tree: FAILED")


def main():
    for test_num in range(len(test_files)):
        print('\n')
        test_file = test_files[test_num]
        print("testing file " + test_file) 
        l_parse_tree = parse_file(test_file)
        asp_transformed_tree = transformer.transform(l_parse_tree)
        asp_translated_program = unparser.unparse(asp_transformed_tree)
        answers_out = parse_clingo_output(run_asp_program(asp_translated_program))
        compare_answers(answers_out, test_outputs[test_num])
        check_tree(asp_transformed_tree, asp_translated_program)

        
if __name__ == '__main__':
    main()
    print('\nPress Enter to quit.')
    input() # Hold console open
