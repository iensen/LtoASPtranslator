"""
Copyright (c) 2014, Evgenii Balai
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright notice, this
   list of conditions and the following disclaimer.
2. Redistributions in binary form must reproduce the above copyright notice,
   this list of conditions and the following disclaimer in the documentation
   and/or other materials provided with the distribution.

THIS SOFTWARE IS PROVIDED BY EVGENII BALAI "AS IS" AND
ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL EVGENII BALAI OR CONTRIBUTORS BE LIABLE FOR
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

The views and conclusions contained in the software and documentation are those
of the authors and should not be interpreted as representing official policies,
either expressed or implied, of the FreeBSD Project.
"""
import os
from optparse import OptionParser
from astgen.src.astgen.parsing.lexer import *
from astgen.src.astgen.parsing.parser import *
from preprocessor import Preprocessor


def parse_arguments():
    """
    Returns the arguments passed to the program. The arguments are parsed from sys.argv.
    """
    parser = OptionParser()
    return parser.parse_args()[1]


def main():

    # read arguments
    args = parse_arguments()

    program_file = args[0]

    
    # create preprocessor instance
    preprocessor_instance = Preprocessor(program_file)

    rule_chunks = preprocessor_instance.get_rule_chunks()
    lexicon_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), "lexicon")
    grammar_file = os.path.join(os.path.dirname(os.path.abspath(__file__)), "grammar")

    lexer = Lexer(lexicon_file, False)
    parser = Parser(grammar_file, lexer.lexicon_dict.keys())

    for chunk in rule_chunks:
        rule_tokens = lexer.get_lexing_sequence(chunk.text)
        rule_tree = parser.get_ast(rule_tokens)
        if rule_tree is None:
            print("wrong rule: " + chunk.text + " at line number " + str(chunk.line_number))
        else:
            print(rule_tree.children[0])

if __name__ == '__main__':
    main()
