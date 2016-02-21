
predicates

q(). c(). b(). d(). a(). g(). 

rules

a | -c :- d.
a | -c :- g.
b | -c :- d.
b | -c :- g.
-q | -c :- d.
-q | -c :- g.
-b :- not b.
-q :- not q.
-c :- not c.
-d :- not d.
-a :- not a.
-g :- not g.

display

q. c. b. d. a. g. 
