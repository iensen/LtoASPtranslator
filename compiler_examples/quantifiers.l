t = {1..5}.

/* some type */

p1(1).
p2(2) if p1(some t).

/* some type, part b */

p2b(2) if p1b(some t).

/* some typed variable */

p3(1,2). p3(2,3).
p3(t V1, t V3) if p3(V1, some t V2) and p3(V2,V3).

/* some typed variable, part b */

p3b(1,2).
p3b(t V1, t V3) if p3b(V1, some t V2) and p3b(V2,V3).

/* every type */

p4(t V).
p5(5) if p4(every t).

/* every type, part b */

p4b(4).
p5b(5) if p4b(every t).

/* %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% RULE HEADS %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% */

/* some type */

p1h(1).
p2h(some t) if p1h(1).

/* some type, part b */
p1hb(1).
not p2hb(some t) if p1hb(1).

/* every type */

p4h(4).
p5h(every t) if p4h(4).

/* every type, part b */

p4hb(4).
not p5hb(every t) if p4hb(4).