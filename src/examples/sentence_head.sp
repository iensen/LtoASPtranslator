
predicates

a(). g(). b(). c(). d(). q(). 

rules

b | -c :- d.
b | -c :- g.
-q | -c :- d.
-q | -c :- g.
a | -c :- d.
a | -c :- g.
-g :- not g.
-b :- not b.
-a :- not a.
-d :- not d.
-c :- not c.
-q :- not q.

display

a. g. b. c. d. q. 
