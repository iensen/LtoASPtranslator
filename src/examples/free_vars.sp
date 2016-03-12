
sorts

#type1 = {1, 2, 5}.
#type2 = {1, 2}.
#t_2_termS = {1, 2}.
#q_1_termS = {1, 5, 2}.
#p_1_termS = {1, 5, 2}.
#p_2_termS = {1, 2}.
#t_1_termS = {5, 1, 2}.

predicates

p(#p_1_termS, #p_2_termS).
t(#t_1_termS, #t_2_termS).
q(#q_1_termS).


rules

p(X, Y) :- (X + Y) = 7, #type1(X), #type2(Y).
q(X) | -q(X) :- #type1(X).
:- 1 > #count{0, X: t(X, Y), #type1(X)}, q(Y), #type2(Y).
:- 2 < #count{0, X: t(X, Y), #type1(X)}, q(Y), #type2(Y).
-p(CWA_Var_1, CWA_Var_2) :- not p(CWA_Var_1, CWA_Var_2), #p_2_termS(CWA_Var_2), #p_1_termS(CWA_Var_1).
-t(CWA_Var_1, CWA_Var_2) :- not t(CWA_Var_1, CWA_Var_2), #t_2_termS(CWA_Var_2), #t_1_termS(CWA_Var_1).
-q(CWA_Var_1) :- not q(CWA_Var_1), #q_1_termS(CWA_Var_1).

display

p. t. q. 
