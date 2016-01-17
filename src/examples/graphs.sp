
sorts

#node = 1..5.
#type_termS = #node.
#rule_termS = {5, 1, 4, 3, 2}.
#prog_termS = #type_termS + #rule_termS.

predicates

reachable(#prog_termS, #prog_termS). disconnected(). edge(#prog_termS, #prog_termS). removed(#prog_termS). 

rules

:- 0 > #count{0, N: removed(N), #node(N)}.
:- 1 < #count{0, N: removed(N), #node(N)}.
edge(X, Y) :- (X - 5*X/5) = ((Y + 1) - 5*(Y + 1)/5), #node(Y), #node(X).
edge(X, Y) :- (X - 5*X/5) = ((Y + 2) - 5*(Y + 2)/5), #node(Y), #node(X).
removed(N) | -removed(N) :- #node(N).
reachable(X, X) :- -removed(X), #node(X).
reachable(X, Y) :- edge(X, Y), -removed(X), -removed(Y), #node(Y), #node(X).
reachable(X, Y) :- reachable(X, Z), reachable(Z, Y), -removed(X), -removed(Y), -removed(Z), #node(Y), #node(Z), #node(X).
disconnected :- -reachable(X, Y), -removed(X), -removed(Y), #node(Y), #node(X).
:- 1 < #count{0: disconnected}.
:- 1 > #count{0: disconnected}.
-reachable(CWA0, CWA1) :- not reachable(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-disconnected :- not disconnected.
-edge(CWA0, CWA1) :- not edge(CWA0, CWA1), #prog_termS(CWA0), #prog_termS(CWA1).
-removed(CWA0) :- not removed(CWA0), #prog_termS(CWA0).

display

reachable. disconnected. edge. removed. 
