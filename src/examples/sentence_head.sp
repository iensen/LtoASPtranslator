
predicates

g().
q().
a().
d().
c().
b().


rules

-q | -c :- g.
-q | -c :- d.
b | -c :- g.
b | -c :- d.
a | -c :- g.
a | -c :- d.
-q :- not q.
-b :- not b.
-c :- not c.
-g :- not g.
-a :- not a.
-d :- not d.

display

g. q. a. d. c. b. 
