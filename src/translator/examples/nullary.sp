predicates

p1(). p2(). p3().
p().
q1(). q2(). q3().
r().

rules

p1.

p1 | p2 | p3.

p :- q1.

p :- q1, q2, q3.

p :- not r.
