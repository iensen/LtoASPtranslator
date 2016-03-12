
predicates

b2().
h().
b1().
h1().
h2().


rules

h.
h1 | h2 :- b1, -b2.
-b2 :- not b2.
-b1 :- not b1.
-h1 :- not h1.
-h :- not h.
-h2 :- not h2.

display

b2. h. b1. h1. h2. 
