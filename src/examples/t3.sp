
sorts

#t1 = {5, 6, 7}.
#type_termS = #t1.
#rule_termS = {5, 6, 7}.
#prog_termS = #type_termS + #rule_termS.

predicates

p(#prog_termS). q(#prog_termS). 

rules

p(X) :- q(X), #t1(X).
-q(CWA0) :- not q(CWA0), #prog_termS(CWA0).
-p(CWA0) :- not p(CWA0), #prog_termS(CWA0).

display

p. q. 
