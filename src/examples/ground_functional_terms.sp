sorts

#t1 = {1}.
#t2 = {a, b}.
#t3 = {a, b, f1(c)}.
#t4 = {f2(1, b), 2, f3(a, b, 3), d}.
#t5 = #t1 + #t2 * #t3 - {a, 5}.
#t6 = {f3(a, b, c), a} - #t2.
#t7 = #t3.
#types = #t1 + #t2 + #t3 + #t4 + #t5 + #t6 + #t7.
#rule_gterms = {b, 1, f1(2), f3(a, b, d), f1(1), a, f2(a, 3)}.
#universal = #types + #rule_gterms.

predicates

p4().
p1(#universal).
p6(#universal, #universal).
p9().
p2(#universal, #universal).
p5(#universal, #universal).
p8(#universal).
p0().
p7(#universal).
p3(#universal, #universal, #universal).

rules

p0.
p1(f1(1)).
p2(a, b).
p3(1, b, f2(a, 3)).
p4 | p5(f1(2), b) | p6(a, f2(a, 3)) :- p7(f3(a, b, d)), p8(1), not p9.
