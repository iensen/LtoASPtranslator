
predicates

h1().
h().
h2().
b2().
b1().


rules

h.
h1 | h2 :- b1, -b2.
-h :- not h.
-b2 :- not b2.
-h2 :- not h2.
-h1 :- not h1.
-b1 :- not b1.

display

h1. h. h2. b2. b1. 
