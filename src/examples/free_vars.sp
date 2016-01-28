
sorts

#type1 = {1, 2, 5}.
#type2 = {1, 2}.
#type_termS = #type1 + #type2.
#rule_termS = {1, 5, 2}.
#prog_termS = #type_termS + #rule_termS.

predicates

p(#prog_termS, #prog_termS). q(#prog_termS). t(#prog_termS, #prog_termS). 

rules

p(X, Y) :- (X + Y) = 7, #type1(X), #type2(Y).
q(X) | -q(X) :- #type1(X).
:- 1 > #count{0, X: t(X, Y), #type1(X)}, q(Y), #type2(Y).
:- 2 < #count{0, X: t(X, Y), #type1(X)}, q(Y), #type2(Y).
-p(CWA0, CWA1) :- not p(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-q(CWA0) :- not q(CWA0), #prog_termS(CWA0).
-t(CWA0, CWA1) :- not t(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).

display

p. q. t. 
