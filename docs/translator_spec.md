# L-to-ASP translator
- Given an L program, the translator produces a semantically equivalent (sorted) ASP program.
- This program has three modules: parser, transformer, and unparser.

## Parser
- Given an L program, the parser produces a parsed L program, in the form of an abstract syntax tree (AST).
- See the [parser guide][parser_guide].

## Transformer
- Given a parsed L program, the transformer produces the AST of an equivalent ASP program.
- This module has four submodules: typer, evaluator, dequantifier, and normalizer.
### Typer
The typer switches between typed and untyped variables.
### Evaluator
The evaluator
- grounds basic terms (making them free of variables) and
- evaluates those grounded terms (doing ground arithmetic).
### Dequantifier
The dequantifier changes quantified terms into
- variables, for universally/existentially quantified terms in heads/bodies of L rules,
- conjunctions, for universally quantified terms in bodies of L rules, and
- disjunctions, for existentially quantified terms in heads of L rules.
### Normalizer
- The normalizer converts the head/body of an L rule to conjunctive/disjunctive normal form.
- From those normalized clauses, this submodule creates an equivalent set of rules,
  in which heads/bodies can only contain disjunction/conjunction.

## Unparser
Given the AST of an ASP program, the unparser produces the ASP program.

[parser_guide]:https://github.com/iensen/LtoASPtranslator/blob/master/docs/parser_guide.md
