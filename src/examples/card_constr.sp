%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

#t1 = 
	1..2.

#t2 = 
	#t1.

#t3 = 
	#t2.

#types = 
	#t1 + 
	#t2 + 
	#t3.

#rule_gterms = 
	{1, 0}.

#universal = 
	#types + 
	#rule_gterms.

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

p3(#universal).
p1(#universal, #universal).
p2(#universal).

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%

% Closed-World Assumption:
-p3(AutoVar0) :-
	not p3(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-p2(AutoVar0) :-
	not p2(AutoVar0),
	#universal(AutoVar0).

% Closed-World Assumption:
-p1(AutoVar0, AutoVar1) :-
	not p1(AutoVar0, AutoVar1),
	#universal(AutoVar0),
	#universal(AutoVar1).

:-	1 > #count{0, V1: p1(V1, V2), #t1(V1), #t2(V2)},
	p2(V2),
	p3(V3),
	#t3(V3).

:-	1 < #count{0, V1: p1(V1, V2), #t1(V1), #t2(V2)},
	p2(V2),
	p3(V3),
	#t3(V3).


