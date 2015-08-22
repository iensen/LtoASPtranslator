type t1 = {1}.
type t2 = {a, b}.
type t3 = {a, b, f1(c)}.
type t4 = {f2(1, b), 2, f3(a, b, 3), d}.
type t5 = t1 + t2 * t3 \ {a, 5}.
type t6 = {f3(a, b, c), a} \ t2.
type t7 = t3.

p0.
p1(f1(1)).
p2(a, b).
p3(1, b, f2(a, 3)).
p4 or p5(f1(2), b) or p6(a, f2(a, 3)) if p7(f3(a, b, d)) and p8(1) and not p9.
