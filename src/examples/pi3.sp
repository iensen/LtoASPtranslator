
sorts

#t1 = {5, 6, 7}.
#t2 = {0, 1, 2}.
#type_termS = #t1 + #t2.
#rule_termS = {2, 7, 0, 6, 1, 5}.
#prog_termS = #type_termS + #rule_termS.

predicates

p(#prog_termS). q(#prog_termS). 

rules

p(N) :- q((N + 5)), #t2(N).
q(N) | -q(N) :- #t1(N).
:- 2 < #count{0, N: q(N), #t1(N)}.
:- 1 > #count{0, N: q(N), #t1(N)}.
-p(CWA0) :- not p(CWA0), #prog_termS(CWA0).
-q(CWA0) :- not q(CWA0), #prog_termS(CWA0).

display

p. q. 
