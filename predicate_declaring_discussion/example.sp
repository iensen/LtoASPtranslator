sorts

#type1	=	{0,1}.
#type2	=	{a,b}.

#pred1_	=	#type1	+	#type2. % pred1 is unary, and its domain is the union of all sets of its arguments from https://github.com/iensen/LtoASPtranslator/blob/master/predicate_declaring_discussion/example.l.

#pred2_2_1	=	#type1. % pred2's domain is a 2-set Cartesian product in which the 1st set is #type1.
#pred2_2_2	=	#type2.

predicates

pred0().
pred1(#pred1_).
pred2(#pred2_2_1,	#pred2_2_2).

rules

pred0.

pred1(X)	:-	#type1(X).
pred1(X)	:-	#type2(X),	pred0.

pred2(X,Y)	:-	#type1(X),	#type2(Y).
