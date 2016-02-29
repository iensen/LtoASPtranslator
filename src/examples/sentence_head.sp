
predicates

d().
a().
c().
g().
q().
b().


rules

a | -c :- d.
a | -c :- g.
b | -c :- d.
b | -c :- g.
-q | -c :- d.
-q | -c :- g.
-d :- not d.
-g :- not g.
-q :- not q.
-a :- not a.
-b :- not b.
-c :- not c.

display

d. a. c. g. q. b. 
