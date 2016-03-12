
sorts

#node = 1..6.
#edge_1_termS = {3, 6, 1, 4, 5, 2}.
#reachable_2_termS = {3, 6, 1, 4, 5, 2}.
#disconnected_1_termS = {3, 6, 1, 4, 5, 2}.
#reachable_through_1_termS = {3, 6, 1, 4, 5, 2}.
#reachable_1_termS = {3, 6, 1, 4, 5, 2}.
#removed_1_termS = {3, 6, 1, 4, 5, 2}.
#edge_2_termS = {3, 6, 1, 4, 5, 2}.
#reachable_through_2_termS = {3, 6, 1, 4, 5, 2}.
#disconnected_2_termS = {3, 6, 1, 4, 5, 2}.
#reachable_through_3_termS = {3, 6, 1, 4, 5, 2}.

predicates

reachable_through(#reachable_through_1_termS, #reachable_through_2_termS, #reachable_through_3_termS).
removed(#removed_1_termS).
disconnected(#disconnected_1_termS, #disconnected_2_termS).
reachable(#reachable_1_termS, #reachable_2_termS).
edge(#edge_1_termS, #edge_2_termS).
disconnected_graph().


rules

edge(X, Y) :- (X - X / 6 * 6) = ((Y + 1) - (Y + 1) / 6 * 6), #node(X), #node(Y).
edge(X, Y) :- (X - X / 6 * 6) = ((Y + 2) - (Y + 2) / 6 * 6), #node(X), #node(Y).
edge(X, Y) :- edge(Y, X), #node(X), #node(Y).
removed(N) | -removed(N) :- #node(N).
:- 4 < #count{0, N: removed(N), #node(N)}.
:- 0 > #count{0, N: removed(N), #node(N)}.
reachable(X, X) :- -removed(X), #node(X).
reachable(X, Y) :- edge(X, Y), -removed(X), -removed(Y), #node(X), #node(Y).
reachable_through(X, Z, Y) :- reachable(X, Z), reachable(Z, Y), -removed(X), -removed(Y), -removed(Z), #node(X), #node(Z), #node(Y).
reachable(X, Y) :- reachable_through(X, QuantifiedVar0, Y), #node(X), #node(QuantifiedVar0), #node(Y).
disconnected(X, Y) :- -reachable(X, Y), -removed(X), -removed(Y), #node(X), #node(Y).
disconnected_graph :- disconnected(QuantifiedVar0, QuantifiedVar1), #node(QuantifiedVar0), #node(QuantifiedVar1).
:- 1 < #count{0: disconnected_graph}.
:- 1 > #count{0: disconnected_graph}.
-reachable_through(CWA_Var_1, CWA_Var_2, CWA_Var_3) :- not reachable_through(CWA_Var_1, CWA_Var_2, CWA_Var_3), #reachable_through_1_termS(CWA_Var_1), #reachable_through_3_termS(CWA_Var_3), #reachable_through_2_termS(CWA_Var_2).
-edge(CWA_Var_1, CWA_Var_2) :- not edge(CWA_Var_1, CWA_Var_2), #edge_2_termS(CWA_Var_2), #edge_1_termS(CWA_Var_1).
-disconnected_graph :- not disconnected_graph.
-removed(CWA_Var_1) :- not removed(CWA_Var_1), #removed_1_termS(CWA_Var_1).
-disconnected(CWA_Var_1, CWA_Var_2) :- not disconnected(CWA_Var_1, CWA_Var_2), #disconnected_2_termS(CWA_Var_2), #disconnected_1_termS(CWA_Var_1).
-reachable(CWA_Var_1, CWA_Var_2) :- not reachable(CWA_Var_1, CWA_Var_2), #reachable_2_termS(CWA_Var_2), #reachable_1_termS(CWA_Var_1).

display

reachable_through. removed. disconnected. reachable. edge. disconnected_graph. 
