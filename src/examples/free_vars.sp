
sorts

#type1 = {1, 2, 5}.
#type2 = {1, 2}.
#p_1_termS = {5, 2, 1}.
#t_2_termS = {2, 1}.
#p_2_termS = {2, 1}.
#q_1_termS = {5, 2, 1}.
#t_1_termS = {5, 2, 1}.

predicates

p(#p_1_termS, #p_2_termS).
q(#q_1_termS).
t(#t_1_termS, #t_2_termS).


rules

p(X, Y) :- (X + Y) = 7, #type2(Y), #type1(X).
q(X) | -q(X) :- #type1(X).
:- 2 < #count{0, X: t(X, Y), #type1(X)}, q(Y), #type2(Y).
:- 1 > #count{0, X: t(X, Y), #type1(X)}, q(Y), #type2(Y).
-q(CWA_Var_1) :- not q(CWA_Var_1), #q_1_termS(CWA_Var_1).
-t(CWA_Var_1, CWA_Var_2) :- not t(CWA_Var_1, CWA_Var_2), #t_2_termS(CWA_Var_2), #t_1_termS(CWA_Var_1).
-p(CWA_Var_1, CWA_Var_2) :- not p(CWA_Var_1, CWA_Var_2), #p_2_termS(CWA_Var_2), #p_1_termS(CWA_Var_1).

display

p. q. t. 
