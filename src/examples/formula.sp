
predicates

p12(). b11(). p21(). 

rules

-b11 | p12 | p21.
-p12 | p21 | b11.
-p12 :- not p12.
-b11 :- not b11.
-p21 :- not p21.

display

p12. b11. p21. 
