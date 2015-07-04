sorts

#t1 = 11..13.
#t2 = 21..23.
#t3 = 31..33.
#t4 = 41..43.
#t = #t1 + #t2 + #t3 + #t4.

predicates

p1(#t).
p2(#t). p2b(#t).
p3(#t). p3b(#t).
p4h(#t). p4(#t). p4_every_t4().

rules

% every, head

p1(V) :- #t1(V).

p2(V) :- #t2(V), p2b(11). p2(11).

p3(V) :- #t3(V), p3b(V).

% every, body

p4h(11) :- p4_every_t4.

-p4_every_t4 :- not p4(V), #t4(V).
p4_every_t4 :- not -p4_every_t4.

p4(V) :- #t4(V).