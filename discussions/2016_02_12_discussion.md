# L-ASP TRANSLATOR DISCUSSION: 2016/02/12

- `some type Var`
  - problem
    - the construct `some typeName VarName` might be too technical/unnatural
  - solution
    - change source L rules of the form  
      ```
      p if q(some type1 Var) and r(Var).
      ```  
      to  
      ```
      p if aux_predicate(some type1).  
      
      aux_predicate(type1 Var) if q(Var) and r(Var).
      ```
    - example from `brain.l`
      - old rule:
      ```
      adjusted_hop_sum(node N1, node N2, node N3, hopc Num) if
          hop_count(N2, N1, some hopc H1) and
          hop_count(N3, N1, some hopc H2) and
          hop_add(N2, N1, some hopc H3) and
          hop_add(N3, N1, some hopc H4) and
          H1 + H2 + H3 + H4 = Num.
      ```
      - new rules:
      ```
      adjusted_hop_sum(node N1, node N2, node N3, hopc Num) if 
          aux_predicate(N1, N2, N3, Num, some hopc, some hopc, some hopc, some hopc).

      aux_predicate(node N1, node N2, node N3, hopc Num, hopc H1, hopc H2, hopc H3, hopc H4) if
          hop_count(N2, N1, H1) and
          hop_count(N3, N1, H2) and
          hop_add(N2, N1, H3) and
          hop_add(N3, N1, H4) and
          H1 + H2 + H3 + H4 = Num.
      ```
