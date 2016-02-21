
sorts

#t1 = {1, g(b)}.
#t2 = 1..2.
#t3 = #t2.
#t4 = {f(1, g(b)), f(1, 1), f(2, g(b)), f(2, 1)}.
#t5 = #t1 + #t2.
#t6 = #t1 * #t2.
#t7 = #t1 - #t2.
#t8 = {1, g(b), 2, f(g(b), 2), f(1, 2), f(1, 1), f(g(b), 1)}.
#t9 = {f(1, 2, a, 2, f(2), f(1)), f(g(b), 1, a, 2, f(2), f(g(b))), f(g(b), 2, a, 2, f(2), f(g(b))), f(1, 1, a, 2, f(2), f(1))}.
#t10 = {f1(2, d, f2(g(b), f3(5))), f1(1, d, f2(1, f3(5))), f1(2, d, f2(1, f3(5))), f1(1, d, f2(g(b), f3(5)))}.
#type_termS = #t1 + #t2 + #t3 + #t4 + #t5 + #t6 + #t7 + #t8 + #t9 + #t10.
#rule_termS = {1, g1(2, g2(a4, g4(f1(1, d, f2(g(b), f3(5))), 3))), f1(1, d, f2(g(b), f3(5))), g4(f1(1, d, f2(g(b), f3(5))), 3), g4(f1(2, d, f2(1, f3(5))), 3), 3, g2(a4, g4(f1(2, d, f2(g(b), f3(5))), 3)), 0, g1(2, g2(a4, g4(f1(2, d, f2(1, f3(5))), 3))), f28(1, 3, f16(2)), f28(1, 3, f16(1)), f1(1, 2, f3(1)), g1(2, g2(a4, g4(f1(1, d, f2(1, f3(5))), 3))), g4(f1(2, d, f2(g(b), f3(5))), 3), f1(1, d, f2(1, f3(5))), g1(1, g2(a4, g4(f1(1, d, f2(g(b), f3(5))), 3))), f1(1, 2, f3(g(b))), f5(f7(1), 2), f3(1), g1(2, g2(a4, g4(f1(2, d, f2(g(b), f3(5))), 3))), g1(1, g2(a4, g4(f1(1, d, f2(1, f3(5))), 3))), f1(2, d, f2(g(b), f3(5))), f16(2), f1(2, 2, f3(g(b))), g2(a4, g4(f1(1, d, f2(g(b), f3(5))), 3)), g1(1, g2(a4, g4(f1(2, d, f2(g(b), f3(5))), 3))), f1(2, 2, f3(1)), a1, g2(a4, g4(f1(1, d, f2(1, f3(5))), 3)), f1(2, d, f2(1, f3(5))), g4(f1(1, d, f2(1, f3(5))), 3), g2(a4, g4(f1(2, d, f2(1, f3(5))), 3)), g(b), f7(1), f3(g(b)), f5(f7(1), 1), a4, 2, f28(2, 3, f16(1)), f16(1), f28(2, 3, f16(2)), g1(1, g2(a4, g4(f1(2, d, f2(1, f3(5))), 3)))}.
#prog_termS = #type_termS + #rule_termS.

predicates

p2(#prog_termS). p1(#prog_termS, #prog_termS). p3(). q1(#prog_termS, #prog_termS). p9(#prog_termS, #prog_termS). 

rules

p1(a1, f1(Every0, 2, f3(Every1))) :- p9(0, f28(Some2, 3, f16(Some3))), #t2(Some2), #t1(Every1), #t2(Every0), #t2(Some3).
p1(a1, f1(Every0, 2, f3(Every1))) :- -p3, #t1(Every1), #t2(Every0).
p2(f5(f7(1), 1)) | p2(f5(f7(1), 2)) :- p9(0, f28(Some2, 3, f16(Some3))), #t2(Some2), #t2(Some3).
p2(f5(f7(1), 1)) | p2(f5(f7(1), 2)) :- -p3.
q1(a1, g1(Every0, g2(a4, g4(Every1, 3)))) :- #t3(Every0), #t10(Every1).
-p2(CWA0) :- not p2(CWA0), #prog_termS(CWA0).
-p3 :- not p3.
-p1(CWA0, CWA1) :- not p1(CWA0, CWA1), #prog_termS(CWA1), #prog_termS(CWA0).
-q1(CWA0, CWA1) :- not q1(CWA0, CWA1), #prog_termS(CWA1), #prog_termS(CWA0).
-p9(CWA0, CWA1) :- not p9(CWA0, CWA1), #prog_termS(CWA1), #prog_termS(CWA0).

display

p2. p1. p3. q1. p9. 
