t1 = {11..13}.
t2 = {21..23}.
t3 = {31..33}.
t4 = {41..43}.

/* every, head */

p1(every t1 V).

p2(every t2 V) if p2b(11). p2b(11).

p3(every t3 V) if p3b(V).

/* every, body */

p4h(11) if p4(every t4 V).

p4(every t4 V).
