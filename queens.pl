% Author:
% Date: 2013-10-23

take([H|T], H, T).
take([H|T], R, [H|S]) :- take(T, R, S).

perm([],[]).
perm(L,[H|T]) :- take(L,H,R), perm(R,T).

eightQueens(R) :- perm([1,2,3,4,5,6,7,8], R),
                  checkDiagonals(R).
              
checkDiagonals([]).

checkDiagonals([H|T]) :- checkQueen(H, T, 1),
                         checkDiagonals(T).

checkQueen(_, [], _).
checkQueen(Q, [H|T], XDist) :- H-Q =\= XDist,
                               Q-H =\= XDist,
                               NewDist is XDist + 1,
                               checkQueen(Q, T, NewDist).

intList(0, []).
intList(N, [H|T]) :- H=N, N1 is N-1, intList(N1, T).

nQueens(N, Solution) :- intList(N, X),
                        perm(X, Solution),
                        checkDiagonals(Solution).