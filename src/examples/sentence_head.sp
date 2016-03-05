
predicates

b().
c().
g().
q().
d().
a().


rules

-q | -c :- g.
-q | -c :- d.
a | -c :- g.
a | -c :- d.
b | -c :- g.
b | -c :- d.
-b :- not b.
-g :- not g.
-a :- not a.
-q :- not q.
-d :- not d.
-c :- not c.

display

b. c. g. q. d. a. 
