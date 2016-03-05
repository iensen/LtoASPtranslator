/*
2016/03/04

UPDATE L SYNTAX
- allow negation of single basic atoms (both predicate atoms and built-in atoms)
- forbid negation of
  - a quantified atom, such as
    - `not p(every typeName)`
  - a non-trivial sentence, such as
    - `not (not s1)`
    - `not (s1 and s2)`
    - `not (s1 or s2)`
    where s1, s2 are sentences
*/

(not b11 or p12 or p21) and (not (p12 or p21) or b11).
