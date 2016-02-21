
sorts

#t = {1, 2, 3}.
#type_termS = #t.
#rule_termS = {3, 2, 1}.
#prog_termS = #type_termS + #rule_termS.

predicates

p(#prog_termS). q(#prog_termS). 

rules

p(X) :- q(X), #t(X).
-p(CWA0) :- not p(CWA0), #prog_termS(CWA0).
-q(CWA0) :- not q(CWA0), #prog_termS(CWA0).

display

p. q. 
