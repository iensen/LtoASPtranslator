# L-ASP TRANSLATOR: ISSUES
- distribution:
  - making the L solver an Eclipse plug-in fragment to integrate with the L editor
- Sparc-related matters
  - Empty types
    - empty sorts are currently unsupported in Sparc
    - tricky to translate L programs with empty types into ASP programs without empty sorts
  - negative integers
    - terms which are evaluated to negative integers are currently unsupported in Sparc
    
## NOTES
- Closed-World Assumption
  - CWA for each possible predicate atom
  - may change later
- negation
  - L negation is ASP strong negation
  - Currently forbid negation of:
    - Non-trivial sentences: not p / p and q / p or q
    - Quantified atoms: p(every t) / q(some t)
