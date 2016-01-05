
%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
sorts

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
	{0, 1}.

#universal = 
	#types + 
	#rule_gterms.


%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
predicates

p2(#universal).
p3(#universal).
p1(#universal, #universal).

%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
rules

-p2(CWA_Var0) :-
	not p2(CWA_Var0),
	#universal(CWA_Var0).

-p3(CWA_Var0) :-
	not p3(CWA_Var0),
	#universal(CWA_Var0).

-p1(CWA_Var0, CWA_Var1) :-
	not p1(CWA_Var0, CWA_Var1),
	#universal(CWA_Var0),
	#universal(CWA_Var1).

:-	1 > #count{0, V1: p1(V1, V2), #t1(V1), #t2(V2)},
	p2(V2),
	p3(V3),
	#t3(V3).

:-	1 < #count{0, V1: p1(V1, V2), #t1(V1), #t2(V2)},
	p2(V2),
	p3(V3),
	#t3(V3).


%%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%% %%%%%%%%%%
display

p2.
p3.
p1.

