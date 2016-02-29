
predicates

b11().
p12().
p21().


rules

-b11 | p12 | p21.
-p12 | p21 | b11.
-b11 :- not b11.
-p12 :- not p12.
-p21 :- not p21.

display

b11. p12. p21. 
