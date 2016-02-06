
sorts

#t1 = 1..2.
#t2 = #t1.
#t3 = #t2.
#type_termS = #t1 + #t2 + #t3.
#rule_termS = {1, 2}.
#prog_termS = #type_termS + #rule_termS.

predicates

p2(#prog_termS). p1(#prog_termS, #prog_termS). p3(#prog_termS). 

rules

:- 1 > #count{0, V1: p1(V1, V2), #t1(V1)}, p2(V2), p3(V3), #t2(V2), #t3(V3).
:- 1 < #count{0, V1: p1(V1, V2), #t1(V1)}, p2(V2), p3(V3), #t2(V2), #t3(V3).
-p2(CWA0) :- not p2(CWA0), #prog_termS(CWA0).
-p1(CWA0, CWA1) :- not p1(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-p3(CWA0) :- not p3(CWA0), #prog_termS(CWA0).

display

p2. p1. p3. 
