# L-ASP TRANSLATOR: ISSUES
- distribution
  - making the L solver an Eclipse plug-in fragment to integrate with the L editor
- Sparc-related matters
  - Empty types
    - empty sorts are currently unsupported in Sparc
    - tricky to translate L programs with empty types into ASP programs without empty sorts
  - negative integers
    - terms which are evaluated to negative integers are currently unsupported in Sparc
    
## NOTES
- Closed-World Assumption
  - CWA for each predicate `p/n`:  
    `-p(V1,...,Vn) :- not p(V1,...,Vn), #prog_termS(V1),...,#prog_termS(Vn).`
  - **COMPUTER MEMORY**
    - Gringo grounds CWAs into many ground negative literals
    - may exhaust memory and crash computer, especially when
      - a predicate has large arity
        - possibly an auxiliary predicate added to avoid using `some typeName Var`
      - `#program_termS` has large size
- negation
  - L negation is ASP strong negation
  - Currently forbid negation of:
    - Non-trivial sentences: not p / p and q / p or q
    - Quantified atoms: p(every t) / q(some t)
