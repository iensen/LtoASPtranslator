
from enum import Enum
import os
from genparser.src.astgen.parsing.lexer import *
from genparser.src.astgen.parsing.parser import *
from preprocessor import Preprocessor


tests = ['sentence_head.l','commas.l', 'brain.l', 'ch5.l', 'graphs.l', 'mix_types_rules.l', 'safety.l',
        't1.l', 't2.l', 't3.l', 't4.l']
prefix = os.path.join(os.path.dirname(os.path.abspath(__file__))) + "/examples/"
# enumerate of the types of program elements
class Element(Enum):
     type_decl = "type declaration"
     const_decl = "constant declaration"
     rule = "rule"


def try_parse_program(chunks, lexer, parser):
    """
    Returns True iff each chunk in chunks is either a constant declaration,
    type declaration or a rule
    """

    # result
    trees = []

    # the name of an element of a program which is expected to be in the current chunk
    expected_element = Element.const_decl


    for chunk in chunks:
        tokens = lexer.get_lexing_sequence(chunk.text)
        starting_symbol = "statement"
        statement_tree = parser.get_ast(tokens, True, starting_symbol)
        if statement_tree is None:
           return False


    return True


def main():

    # create lexer and parser instances:
    lexicon_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), "lexicon")
    grammar_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), "grammar")
    lexer = Lexer(lexicon_file, False)
    parser = Parser(grammar_file, lexer.lexicon_dict.keys())

    # run tests:
    for test in tests:

        # create preprocessor instance
        preprocessor_instance = Preprocessor(prefix + test)
        chunks = preprocessor_instance.get_chunks()
        ok = try_parse_program(chunks, lexer, parser)
        print("test " + test + " " + ("PASSED" if ok else "FAILED"))




if __name__ == '__main__':
    main()


