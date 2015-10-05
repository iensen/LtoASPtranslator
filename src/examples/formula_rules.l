a1 and not a2.

b1 and b2 if 
    c1 or not c2.

not (not f1 and f2 or f3) if 
    g1 and (g2 or not g3).

/* ********** ********** ********** ********** ********** ********** ********** */

type t1 = {1..3}.
type t2 = t1 + {a, f(b)}.
type t3 = f(V2, V1) where V1 in t1, V2 in t2.

not (p0(t1 X1, t2 X2, t3 X3) or p1(X3, X2, X1)) if 
    p2(X1) or p3(a, X2, X3) and p4.
