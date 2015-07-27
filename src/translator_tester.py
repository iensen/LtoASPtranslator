import translator
import unparser
import subprocess
from main import *
import os

cur_dir = os.path.join(os.path.dirname(os.path.abspath(__file__))) + "/"
test_files = ['examples/vu_test.l']
test_outputs = [{frozenset(['h'])}]

def run_asp_program(program):
    """take clingo program and return the set of its answer sets"""
    process = subprocess.Popen([cur_dir + "solvers/clingo.exe"], stdout=subprocess.PIPE, stderr=subprocess.PIPE, stdin = subprocess.PIPE)
    stdout, stderr = process.communicate(input = program.encode('ascii'))
    print("LOL123123123")
    print(program)
    print(stdout)
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
       print(answers_out)
       if answers_out != answers_given:
           print("Compare Answers: FAILED")
       else:
           print("Compare Answers: OK")
 

def check_tree(asp_tree, asp_program):
    """  the function checks if the tree produced by the parser from the given program (asp_tree)
          is the same as the tree produced by the parser from program asp_program
    """
    asp_program = "h."
    lexicon_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), "translator/lexicon_ASP")
    grammar_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), "translator/grammar_ASP")
    lexer = Lexer(lexicon_file, False)
    parser = Parser(grammar_file, lexer.lexicon_dict.keys())
    tokens = lexer.get_lexing_sequence(asp_program)
    starting_symbol = "program"
    asp_tree_parsed = parser.get_ast(tokens, True, starting_symbol)
    if asp_tree_parsed == asp_program:
        print("Check ASP tree: OK")
    else:
        print("Check ASP tree: FAILED")


def main():

    for test_num in range(len(test_files)):
        test_file = test_files[test_num]
        print("testing file " + test_file) 
        l_parse_tree = parse_file(test_file)
      #  print(l_parse_tree)
        l_parse_tree = [['rule', ['sent', ['unit', ['literal', ['patom', ('identifier', 'h')]]]]], ['rule', ['sent', ['disj', ['unit', ['literal', ['patom', ('identifier', 'h1')]]], ['unit', ['literal', ['patom', ('identifier', 'h2')]]]]], ['sent', ['conj', ['unit', ['literal', ['patom', ('identifier', 'b1')]]], ['neg_literal', ['patom', ('identifier', 'b2')]]]]]]
        asp_translated_tree = translator.p(l_parse_tree)
        asp_unparsed_program = unparser.program(asp_translated_tree)
        print("?????????????????")
        print(asp_unparsed_program)
        answers_out = parse_clingo_output(run_asp_program(asp_unparsed_program))
        print(answers_out)
        compare_answers(answers_out, test_outputs[test_num])
        check_tree(asp_translated_tree, asp_unparsed_program)
        

main()


       

