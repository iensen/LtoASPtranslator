# L-ASP TRANSLATOR: 2015/12/05 DISCUSSION
Evgenii and Vu

## NEGATIVE INTEGERS
- Problem:
  - L allows negative integers while SPARC does not
- Decision:
  - Now:
    - Temporarily avoid expressions which evaluate to negative integers (such as `1 - 2`)
  - Later:
    - Allow negative integers in SPARC
    
## MODULO
- Problem:
  - L allows modulo while SPARC does not
- Decision:
  - Now:
    - Translate L modulo via its definition: `a % b := a - a/b * b`
  - Later:
    - Allow modulo in SPARC (operator `\` in Clingo)
      
## SET CONSTRUCTS
- Problem:
  - L's type declarations are more flexible than SPARC's sort definitions
  - For instance:
    - L:
    ```
    type t0 = {5..7}.
    type t1 = 10 + V where V in t0.
    ```
    - SPARC:
    ```
    #t0 = 5..7.
    #t1 = 10 + #t0. % Error
    ```
- Decision:
    - Continue to translate L set constructs through grounding:
    ```
    #t0 = 5..7.
    #t1 = {15, 16, 17}. # Implicitly grounded
    ```

## EMPTY TYPE
- Problem: 
  - L permits empty type: `type t = {}.`
  - SPARC forbids empty sort: `#t = {}. % Error`
- Decision:
  - Now:
    - Temporarily avoid L empty type.
  - Later:
    - Allow Boolean constants in SPARC: `#true`, `#false` (as in Clingo)
    - Implicitly translate L empty type
    - For example:
      - From:
      ```
      type t = {}.
      p1 if p2(every t).
      q1 if q2(some t).
      ```
      - Into:
      ```
      % Do not explicitly define: #t = {}.
      p1 :- #true.
      q1 :- #false.
      ```  
      This translation strategy may fail in some cases

## SPARC AGGREGATE: DEFAULT NEGATION
For instance:
- L cardinality constraint: `b1 <= |{p(t V)}| <= b2.`
- SPARC:
```
% Error:
:- not b1 <= #count{0, V: p(V), t(V)} <= b2. 

% Use two integrity constraints instead:
:- b1 > #count{0, V: p(V), t(V)}.
:- b2 < #count{0, V: p(V), t(V)}.
```
  
## SPARC AGGREGATE: SCOPE OF VARIABLE
For example:
- L cardinality constraint: `b <= |{q(t1 V1, t2 V2)}| <= b if p(V2).`
- SPARC:
```
% `V2` in aggregate becomes "contained":
:- #count{0, q(V1, V2): q(V1, V2), t1(V1), t2(V2)} != b, p(V2).

% Remove `V2` from term tuple to make `V2` "global":
:- #count{0, V1: q(V1, V2), t1(V1), t2(V2)} != b, p(V2).
% The term `0` is to make the term tuple non-empty,
% in case there is no contained variable,
% such as when the predicate `q` is nullary
```
