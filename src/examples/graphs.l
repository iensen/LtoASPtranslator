/* Program "k-connectivity" from page 16 of L spec */

const n = 6.
const k = 5.

type node = {1..n}.
edge(node X, node Y) if X%n = (Y+1)%n.
edge(node X, node Y) if X%n = (Y+2)%n.
edge(node X, node Y) if edge(Y,X).

maybe removed(node N).
0 <= |{removed(node N)}| <= k-1.
reachable(node X, X) if not removed(X).

reachable(node X,node Y) if edge(X,Y) 
                            and not removed(X)                                                                                                               
                            and not removed(Y). 

reachable_through(node X,node Z, node Y) if reachable(X,Z)
                            and reachable(Z,Y) 
                            and not removed(X) 
                            and not removed(Y) 
                            and not removed(Z).
                            

reachable(node X,node Y) if reachable_through(X,some node, Y).

disconnected(node X, node Y)  if    not reachable(X, Y) 
                   and not removed(X)
                   and not removed(Y).                


disconnected_graph  if   disconnected(some node, some node).                 


1<=|{disconnected_graph}|<=1.

