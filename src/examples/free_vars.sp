
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts

#type1 = 
	{1, 2, 5}.

#type2 = 
	{1, 2}.

#types = 
	#type1 + 
	#type2.

#rule_gterms = 
	{7, 0, 2, 1}.

#universal = 
	#types + 
	#rule_gterms.


%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates

q(#universal).
p(#universal, #universal).
t(#universal, #universal).

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules

-p(CWA_Var0, CWA_Var1) :-
	not p(CWA_Var0, CWA_Var1),
	#universal(CWA_Var0),
	#universal(CWA_Var1).

-q(CWA_Var0) :-
	not q(CWA_Var0),
	#universal(CWA_Var0).

-t(CWA_Var0, CWA_Var1) :-
	not t(CWA_Var0, CWA_Var1),
	#universal(CWA_Var0),
	#universal(CWA_Var1).

p(X, Y) :-
	(X + Y) = 7,
	#type1(X),
	#type2(Y).

q(X) |
-q(X) :-
	#type1(X).

:-	1 > #count{0, X: t(X, Y), #type1(X), #type2(Y)},
	q(Y).

:-	2 < #count{0, X: t(X, Y), #type1(X), #type2(Y)},
	q(Y).


%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
display

q.
p.
t.

