sorts

#t1 = {5, 6, 7}.
#types = #t1.
#universal = #types.

predicates

q(#universal).
p(#universal).

rules

p(X) :- q(X), #t1(X).

