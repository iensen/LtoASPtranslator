
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

#node = 
	1..5.

#types = 
	#node.

#universal = 
	#types.

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

removed(#universal).
edge(#universal, #universal).
disconnected().
reachable(#universal, #universal).

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

:-	0 > #count{0, N: removed(N)},
	#node(N).

:-	1 < #count{0, N: removed(N)},
	#node(N).

edge(X, Y) :-
	(X - (5 * (X / 5))) = ((Y + 1) - (5 * ((Y + 1) / 5))),
	#node(X),
	#node(Y).

edge(X, Y) :-
	(X - (5 * (X / 5))) = ((Y + 2) - (5 * ((Y + 2) / 5))),
	#node(X),
	#node(Y).

removed(N) |
-removed(N) :-
	#node(N).

reachable(X, X) :-
	-removed(X),
	#node(X).

reachable(X, Y) :-
	edge(X, Y),
	-removed(X),
	-removed(Y),
	#node(X),
	#node(Y).

reachable(X, Y) :-
	reachable(X, Z),
	reachable(Z, Y),
	-removed(X),
	-removed(Y),
	-removed(Z),
	#node(X),
	#node(Y),
	#node(Z).

disconnected :-
	-reachable(X, Y),
	-removed(X),
	-removed(Y),
	#node(X),
	#node(Y).

:-	1 > #count{0: disconnected}.

:-	1 < #count{0: disconnected}.


