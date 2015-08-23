sorts

#t1 = {1}.
#t2 = {a, b}.
#t3 = {a, b, f1(c)}.
#t4 = {f2(1, b), 2, f3(a, b, 3), d}.
#t5 = #t1 + #t2 * #t3 - {a, 5}.
#t6 = {f3(a, b, c), a} - #t2.
#t7 = #t3.
#types = #t1 + #t2 + #t3 + #t4 + #t5 + #t6 + #t7.
#rule_gterms = {f1(1), f3(a, b, d), f2(a, 3), b, f1(2), a, 1}.
#universal = #types + #rule_gterms.

predicates

p9().
p1(#universal).
p8(#universal).
p4().
p7(#universal).
p5(#universal, #universal).
p3(#universal, #universal, #universal).
p2(#universal, #universal).
p0().
p6(#universal, #universal).

rules

p0.
p1(f1(1)).
p2(a, b).
p3(1, b, f2(a, 3)).
p4 | p5(f1(2), b) | p6(a, f2(a, 3)) :- p7(f3(a, b, d)), p8(1), not p9.
