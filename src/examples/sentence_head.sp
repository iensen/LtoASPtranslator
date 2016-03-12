
predicates

a().
d().
q().
g().
b().
c().


rules

b | -c :- g.
b | -c :- d.
-q | -c :- g.
-q | -c :- d.
a | -c :- g.
a | -c :- d.
-b :- not b.
-a :- not a.
-q :- not q.
-c :- not c.
-d :- not d.
-g :- not g.

display

a. d. q. g. b. c. 
