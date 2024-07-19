# L parser
- Given an L program, the L parser generates an abstract syntax tree (AST).
- The form of a parsed L program is described in the specification of the [generic parser][genparser_spec],
  used with the L [lexicon][l_lexicon] and [grammar][l_grammar].

## Command-line interface
- Change current directory to `src`  
  *Example with Windows Command Prompt:*  
  `cd src`
- Specify where to read source L program  
  `python3 main.py examples/pi2.l`
- See output AST  
  `[['rule', ['psent', ['patom', ('identifier', 'a')]], ['sent', ['patom', ('identifier', 'b')]]]]`

[genparser_spec]: https://github.com/iensen/genparser/blob/master/docs/main/astgen.pdf
[l_lexicon]: https://github.com/iensen/LtoASPtranslator/blob/master/src/lexicon
[l_grammar]: https://github.com/iensen/LtoASPtranslator/blob/master/src/grammar
