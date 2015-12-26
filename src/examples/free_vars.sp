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
	{0, 1, 7, 2}.

#universal = 
	#types + 
	#rule_gterms.

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

t(#universal, #universal).
p(#universal, #universal).
q(#universal).

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

% Closed-World Assumption:
-t(AutoVar0, AutoVar1) :-
	not t(AutoVar0, AutoVar1),
	#universal(AutoVar0),
	#universal(AutoVar1).

% Closed-World Assumption:
-q(AutoVar0) :-
	not q(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-p(AutoVar0, AutoVar1) :-
	not p(AutoVar0, AutoVar1),
	#universal(AutoVar0),
	#universal(AutoVar1).

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
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

t.
p.
q.

