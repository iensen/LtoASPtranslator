%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

#node = 
	1..5.

#types = 
	#node.

#rule_gterms = 
	{2, 0, 5, 1}.

#universal = 
	#types + 
	#rule_gterms.

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

disconnected().
removed(#universal).
edge(#universal, #universal).
reachable(#universal, #universal).

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

% Closed-World Assumption:
-edge(AutoVar0, AutoVar1) :-
	not edge(AutoVar0, AutoVar1),
	#universal(AutoVar0),
	#universal(AutoVar1).

% Closed-World Assumption:
-reachable(AutoVar0, AutoVar1) :-
	not reachable(AutoVar0, AutoVar1),
	#universal(AutoVar0),
	#universal(AutoVar1).

% Closed-World Assumption:
-disconnected :-
	not disconnected.

% Closed-World Assumption:
-removed(AutoVar0) :-
	not removed(AutoVar0),
	#universal(AutoVar0).

:-	0 > #count{0, N: removed(N), #node(N)}.

:-	1 < #count{0, N: removed(N), #node(N)}.

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


%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
display
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

disconnected.
removed.
edge.
reachable.

