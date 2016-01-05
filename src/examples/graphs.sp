
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts

#node = 
	1..5.

#types = 
	#node.

#rule_gterms = 
	{5, 2, 0, 1}.

#universal = 
	#types + 
	#rule_gterms.


%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates

edge(#universal, #universal).
removed(#universal).
reachable(#universal, #universal).
disconnected().

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules

-removed(CWA_Var0) :-
	not removed(CWA_Var0),
	#universal(CWA_Var0).

-disconnected :-
	not disconnected.

-edge(CWA_Var0, CWA_Var1) :-
	not edge(CWA_Var0, CWA_Var1),
	#universal(CWA_Var0),
	#universal(CWA_Var1).

-reachable(CWA_Var0, CWA_Var1) :-
	not reachable(CWA_Var0, CWA_Var1),
	#universal(CWA_Var0),
	#universal(CWA_Var1).

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

edge.
removed.
reachable.
disconnected.

