
predicates

h().
b2().
h2().
h1().
b1().


rules

h.
h1 | h2 :- b1, -b2.
-b1 :- not b1.
-h1 :- not h1.
-h :- not h.
-h2 :- not h2.
-b2 :- not b2.

display

h. b2. h2. h1. b1. 
