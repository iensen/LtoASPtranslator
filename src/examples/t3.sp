
sorts

#t1 = {5, 6, 7}.
#p_1_termS = {6, 5, 7}.
#q_1_termS = {6, 5, 7}.

predicates

p(#p_1_termS).
q(#q_1_termS).


rules

p(X) :- q(X), #t1(X).
-p(CWA_Var_1) :- not p(CWA_Var_1), #p_1_termS(CWA_Var_1).
-q(CWA_Var_1) :- not q(CWA_Var_1), #q_1_termS(CWA_Var_1).

display

p. q. 
