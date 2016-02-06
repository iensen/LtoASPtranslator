
predicates

b1(). b2(). h(). h2(). h1(). 

rules

h.
h1 | h2 :- b1, -b2.
-h :- not h.
-h2 :- not h2.
-b2 :- not b2.
-h1 :- not h1.
-b1 :- not b1.

display

b1. b2. h. h2. h1. 
