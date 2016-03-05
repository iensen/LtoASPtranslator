
sorts

#t1 = {1, g(b)}.
#t2 = 1..2.
#t3 = #t2.
#t4 = {f(1, 1), f(2, 1), f(1, g(b)), f(2, g(b))}.
#t5 = #t1 + #t2.
#t6 = #t1 * #t2.
#t7 = #t1 - #t2.
#t8 = {1, 2, g(b), f(1, 1), f(1, 2), f(g(b), 1), f(g(b), 2)}.
#t9 = {f(g(b), 2, a, 2, f(2), f(g(b))), f(1, 2, a, 2, f(2), f(1)), f(g(b), 1, a, 2, f(2), f(g(b))), f(1, 1, a, 2, f(2), f(1))}.
#t10 = {f1(1, d, f2(1, f3(5))), f1(2, d, f2(1, f3(5))), f1(1, d, f2(g(b), f3(5))), f1(2, d, f2(g(b), f3(5)))}.
#p9_1_termS = {0}.
#p2_1_termS = {1, f5(f7(1), 2), f7(1), f5(f7(1), 1), 2}.
#p9_2_termS = {3, 1, f16(2), f28(1, 3, f16(1)), f28(2, 3, f16(2)), f28(2, 3, f16(1)), f28(1, 3, f16(2)), 2, f16(1)}.
#p1_1_termS = {a1}.
#q1_1_termS = {a1}.
#p1_2_termS = {1, f1(1, 2, f3(1)), f1(1, 2, f3(g(b))), 2, f3(g(b)), f1(2, 2, f3(1)), g(b), f3(1), f1(2, 2, f3(g(b)))}.
#q1_2_termS = {g4(f1(1, d, f2(1, f3(5))), 3), g2(a4, g4(f1(2, d, f2(1, f3(5))), 3)), 3, a4, g2(a4, g4(f1(1, d, f2(g(b), f3(5))), 3)), f1(1, d, f2(1, f3(5))), 2, g1(1, g2(a4, g4(f1(1, d, f2(g(b), f3(5))), 3))), g1(2, g2(a4, g4(f1(1, d, f2(1, f3(5))), 3))), g4(f1(2, d, f2(1, f3(5))), 3), f1(2, d, f2(1, f3(5))), f1(1, d, f2(g(b), f3(5))), g1(2, g2(a4, g4(f1(2, d, f2(g(b), f3(5))), 3))), g1(1, g2(a4, g4(f1(1, d, f2(1, f3(5))), 3))), 1, g1(1, g2(a4, g4(f1(2, d, f2(g(b), f3(5))), 3))), g4(f1(2, d, f2(g(b), f3(5))), 3), g1(1, g2(a4, g4(f1(2, d, f2(1, f3(5))), 3))), f1(2, d, f2(g(b), f3(5))), g2(a4, g4(f1(1, d, f2(1, f3(5))), 3)), g1(2, g2(a4, g4(f1(2, d, f2(1, f3(5))), 3))), g4(f1(1, d, f2(g(b), f3(5))), 3), g1(2, g2(a4, g4(f1(1, d, f2(g(b), f3(5))), 3))), g2(a4, g4(f1(2, d, f2(g(b), f3(5))), 3))}.

predicates

q1(#q1_1_termS, #q1_2_termS).
p2(#p2_1_termS).
p1(#p1_1_termS, #p1_2_termS).
p9(#p9_1_termS, #p9_2_termS).
p3().


rules

p2(f5(f7(1), 2)) | p2(f5(f7(1), 1)) :- -p3.
p2(f5(f7(1), 2)) | p2(f5(f7(1), 1)) :- p9(0, f28(Some2, 3, f16(Some3))), #t2(Some3), #t2(Some2).
p1(a1, f1(Every0, 2, f3(Every1))) :- -p3, #t2(Every0), #t1(Every1).
p1(a1, f1(Every0, 2, f3(Every1))) :- p9(0, f28(Some2, 3, f16(Some3))), #t2(Some3), #t2(Every0), #t1(Every1), #t2(Some2).
q1(a1, g1(Every0, g2(a4, g4(Every1, 3)))) :- #t10(Every1), #t3(Every0).
-p3 :- not p3.
-p2(CWA_Var_1) :- not p2(CWA_Var_1), #p2_1_termS(CWA_Var_1).
-p9(CWA_Var_1, CWA_Var_2) :- not p9(CWA_Var_1, CWA_Var_2), #p9_2_termS(CWA_Var_2), #p9_1_termS(CWA_Var_1).
-q1(CWA_Var_1, CWA_Var_2) :- not q1(CWA_Var_1, CWA_Var_2), #q1_1_termS(CWA_Var_1), #q1_2_termS(CWA_Var_2).
-p1(CWA_Var_1, CWA_Var_2) :- not p1(CWA_Var_1, CWA_Var_2), #p1_2_termS(CWA_Var_2), #p1_1_termS(CWA_Var_1).

display

q1. p2. p1. p9. p3. 
