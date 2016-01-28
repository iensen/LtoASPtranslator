
predicates

h2(). h1(). b2(). h(). b1(). 

rules

h.
h1 | h2 :- b1, -b2.
-h :- not h.
-h2 :- not h2.
-h1 :- not h1.
-b2 :- not b2.
-b1 :- not b1.

display

h2. h1. b2. h. b1. 
