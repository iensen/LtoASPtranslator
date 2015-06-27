sorts

#t = 1..5.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

predicates

p1(#t). p2(#t).
p1b(#t). p2b(#t).

p3(#t,#t).
p3b(#t,#t).

p4(#t).
p4_every_t().
p5(#t).

p4b(#t).
p4b_every_t().
p5b(#t).

p1h(#t). p2h(#t).

p4h(#t). p5h(#t).

p1hb(#t). p2hb(#t).

p4hb(#t). p5hb(#t).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

rules

% some type

p1(1).
p2(2) :- p1(V).

% some type, part b

p2b(2) :- p1b(V).

% some typed variable

p3(1,2). p3(2,3).
p3(V1,V3) :- p3(V1,V2), p3(V2,V3).

% some typed variable, part b

p3b(1,2).
p3b(V1,V3) :- p3b(V1,V2), p3b(V2,V3).

% every type

p4(V).

-p4_every_t :- not p4(V).
p4_every_t :- not -p4_every_t.

p5(5) :- p4_every_t.

% every type, part b

p4b(4).

-p4b_every_t :- not p4b(V).
p4b_every_t :- not -p4b_every_t.

p5b(5) :- p4b_every_t.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RULE HEADS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% some type

p1h(1).
1 <= {p2h(V)} :- p1h(1).

% some type, part b

p1hb(1).
-p2hb(V) :- p1hb(1).

% every type

p4h(4).
p5h(V) :- p4h(4).

% every type, part b

p4hb(4).
1 <= {-p5hb(V)} :- p4hb(4).