
predicates

q(). c(). d(). b(). a(). g(). 

rules

b | -c :- d.
b | -c :- g.
a | -c :- d.
a | -c :- g.
-q | -c :- d.
-q | -c :- g.
-c :- not c.
-d :- not d.
-g :- not g.
-a :- not a.
-b :- not b.
-q :- not q.

display

q. c. d. b. a. g. 
