sorts 

#ground_terms = {1, 2, a}. 

predicates 

q2(). s2(). p0(). q3(). r(). s3(). s1(). 
p2(#ground_terms, #ground_terms). p3(#ground_terms, #ground_terms, #ground_terms). 
q1(). 

rules 

p0. 
p2(2, 2). 
p3(1, 2, a). 
q1 | q2 | q3. 
r :- s1, s2, not s3. 
