%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

q().
g().
a().
c().
b().
d().

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

% Closed-World Assumption:
-g :-
	not g.

% Closed-World Assumption:
-q :-
	not q.

% Closed-World Assumption:
-c :-
	not c.

% Closed-World Assumption:
-d :-
	not d.

% Closed-World Assumption:
-a :-
	not a.

% Closed-World Assumption:
-b :-
	not b.

a |
-c :-
	d.

a |
-c :-
	g.

b |
-c :-
	d.

b |
-c :-
	g.

-q |
-c :-
	d.

-q |
-c :-
	g.


