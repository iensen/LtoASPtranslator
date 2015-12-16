
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

#type1 = 
	{1, 2, 5}.

#type2 = 
	{1, 2}.

#types = 
	#type1 + 
	#type2.

#rule_gterms = 
	{7, 2, 1, 0}.

#universal = 
	#types + 
	#rule_gterms.

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

q(#universal).
p(#universal, #universal).
t(#universal, #universal).

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

p(X, Y) :-
	(X + Y) = 7,
	#type1(X),
	#type2(Y).

q(X) |
-q(X) :-
	#type1(X).

:-	1 > #count{0, X: t(X, Y)},
	q(Y),
	#type1(X),
	#type2(Y).

:-	2 < #count{0, X: t(X, Y)},
	q(Y),
	#type1(X),
	#type2(Y).


