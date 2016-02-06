# L-TO-ASP TRANSLATOR SPECIFICATION
Given an L program, the translator produces a semantically equivalent (sorted) ASP program.

## MODULES
The translator has three modules:
- parser (input -> output)
  - L program (text) -> parsed L program (AST)
- transformer
  - parsed L program (AST) -> parsed ASP program (AST)
- unparser
  - parsed ASP program (AST) -> ASP program (text)

### PARSER
This module generates an abstract syntax tree from an input L program.

### TRANSFORMER
From the AST of an L program, this module creates the AST of an equivalent ASP program.
There are four submodules:
- TYPER  
  switches between typed and untyped variables
- EVALUATOR
  - grounds basic terms (making them free of variables)
  - evaluates those grounded terms (doing ground arithmetic)
- DEQUANTIFIER  
  changes L quantified terms into:
  - variables, for:
    - universally quantified terms in heads of L rules
    - existentially quantified terms in bodies of L rules  
  - conjunctions, for universally quantified terms in bodies of L rules
  - disjunctions, for existentially quantified terms in heads of L rules
- NORMALIZER  
  - in an L rule, converts the [head/body] to [conjunctive/disjunctive] normal form
  - from those normalized clauses, creates an equivalent set of rules, in which  
    [heads/bodies] can only contain [disjunction/conjunction]
    
### UNPARSER
From an AST of an ASP program, makes a text file
