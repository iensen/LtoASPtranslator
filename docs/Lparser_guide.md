<h6>top

# L PARSER GUIDE
This module generates an abstract syntax tree from an input L program. The form of a parsed L program is described in the spec of the [generic parser][genparserSpec] used with L [lexicon][Llexicon] and [grammar][Lgrammar].

## USAGE
Using a command-line interface:
- Change current directory to `src`  
  *Example with Windows Command Prompt:*  
  `cd/d D:\repos\LtoASPtranslator\src`
- Specify where to read source L program  
  `python main.py examples/pi2.l`  
  (if `python` fails, then try `python3`)
- See result  
  `[['rule', ['psent', ['patom', ('identifier', 'a')]], ['sent', ['patom', ('identifier', 'b')]]]]`

[genparserSpec]: https://github.com/iensen/genparser/blob/master/docs/main/astgen.pdf
[Llexicon]: https://github.com/iensen/LtoASPtranslator/blob/master/src/lexicon
[Lgrammar]: https://github.com/iensen/LtoASPtranslator/blob/master/src/grammar
