type t1 = {1, a, g(b)}.
type t2 = {1..2}.
type t3 = t2.
type t4 = f(V2, V1, V2) where V1 in t1, V2 in t2.
type t5 = t1 + t2.
type t6 = t1 * t2.
type t7 = t1 \ t2.
type t8 = (t1 + t2) \ (t1 * t2) + t3 + f(V2, V1, V2) where V1 in t1, V2 in t2.
type t9 = f(V1, V2, a, 2, f(2), f(V1, f(V1, f(V1)))) where V1 in t1, V2 in t2.
type t10 = f1(V2, d, f2(V1, f3(5))) where V2 in t2, V1 in t1.


p1(a1, f1(every t2, 2, f3(every t1))) and p2(f5(f7(1), some t2)) if 
    not p3 or p9(0, f28(some t2, some t1, 3, f16(some t2))).

q1(a1, g1(every t3, g2(a4, g4(every t10, 3)))).
