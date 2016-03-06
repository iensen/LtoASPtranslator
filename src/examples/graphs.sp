
sorts

#node = 1..5.
#reachable_1_termS = {5, 1, 2, 3, 4}.
#edge_1_termS = {5, 1, 2, 3, 4}.
#reachable_2_termS = {5, 1, 2, 3, 4}.
#removed_1_termS = {5, 1, 2, 3, 4}.
#edge_2_termS = {5, 1, 2, 3, 4}.

predicates

reachable(#reachable_1_termS, #reachable_2_termS).
removed(#removed_1_termS).
edge(#edge_1_termS, #edge_2_termS).
disconnected().


rules

:- 0 > #count{0, N: removed(N), #node(N)}.
:- 1 < #count{0, N: removed(N), #node(N)}.
edge(X, Y) :- (X - 5 * X / 5) = ((Y + 1) - 5 * (Y + 1) / 5), #node(X), #node(Y).
edge(X, Y) :- (X - 5 * X / 5) = ((Y + 2) - 5 * (Y + 2) / 5), #node(X), #node(Y).
removed(N) | -removed(N) :- #node(N).
reachable(X, X) :- -removed(X), #node(X).
reachable(X, Y) :- edge(X, Y), -removed(X), -removed(Y), #node(X), #node(Y).
reachable(X, Y) :- reachable(X, Z), reachable(Z, Y), -removed(X), -removed(Y), -removed(Z), #node(Z), #node(X), #node(Y).
disconnected :- -reachable(X, Y), -removed(X), -removed(Y), #node(X), #node(Y).
:- 1 < #count{0: disconnected}.
:- 1 > #count{0: disconnected}.
-removed(CWA_Var_1) :- not removed(CWA_Var_1), #removed_1_termS(CWA_Var_1).
-disconnected :- not disconnected.
-reachable(CWA_Var_1, CWA_Var_2) :- not reachable(CWA_Var_1, CWA_Var_2), #reachable_2_termS(CWA_Var_2), #reachable_1_termS(CWA_Var_1).
-edge(CWA_Var_1, CWA_Var_2) :- not edge(CWA_Var_1, CWA_Var_2), #edge_1_termS(CWA_Var_1), #edge_2_termS(CWA_Var_2).

display

reachable. removed. edge. disconnected. 
