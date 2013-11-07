% Author: Oli Lane
% Date: 2013-10-23

take([H|T], H, T).
take([H|T], R, [H|S]) :- take(T, R, S).

perm([],[]).
perm(L,[H|T]) :- take(L,H,R), perm(R,T).


append([],A,A).
append([H|T],A,[H|R]) :- append(T,A,R).


anagram(Input, Output) :- perm(Input, Output),
                          word(Output).

anagram2(Input1, Input2, Output1, Output2) :- append(Input1, Input2, In),
                                              append(Output1, Output2, Out),
                                              word(Output1),
                                              word(Output2),
                                              perm(In, Out).
                                              
