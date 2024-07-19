# Issues

## Negation
- L negation is ASP strong negation
- currently forbid negation of:
  - non-trivial sentences: not p / p and q / p or q
  - quantified atoms: p(every t) / q(some t)

# Closed-World Assumption (CWA)
- CWA for each predicate `p/n`:  
  `-p(V_1,...,V_n) :- not p(V_1,...,V_n), #p_1_termS(V_1),...,#p_n_termS(V_n).`
- **computer memory**
  - Gringo converts CWAs into many ground rules
  - may exhaust memory and crash computer
    - especially when a predicate has large arity
      - possibly an auxiliary predicate added to avoid using `some typeName Var`

# Sparc-related matters
- empty types
  - empty sorts are currently unsupported in Sparc
  - tricky to translate L programs with empty types into ASP programs without empty sorts
- negative integers
  - terms which are evaluated to negative integers are currently unsupported in Sparc
