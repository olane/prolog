% Author:
% Date: 2013-11-06

% Move two missionaries right
route((ML, CL, MR, CR), (ML1, CL, MR1, CR)) :-
                  ML >= 2, ML1 is ML-2, MR1 is MR+2.
                  
% Move two missionaries left
route((ML, CL, MR, CR), (ML1, CL, MR1, CR)) :-
                  MR >= 2, MR1 is MR-2, ML1 is ML+2.

%Move two cannibals right
route((ML, CL, MR, CR), (ML, CL1, MR, CR1)) :-
                  CL >= 2, CL1 is CL-2, CR1 is CR+2.

%Move two cannibals left
route((ML, CL, MR, CR), (ML, CL1, MR, CR1)) :-
                  CR >= 2, CR1 is CR-2, CL1 is CL+2.
                  
% Move one missionary right
route((ML, CL, MR, CR), (ML1, CL, MR1, CR)) :-
                  ML >= 1, ML1 is ML-1, MR1 is MR+1.

%Move one missionary left
route((ML, CL, MR, CR), (ML1, CL, MR1, CR)) :-
                  MR >= 1, MR1 is MR-1, ML1 is ML+1.
                  
%Move one cannibal right
route((ML, CL, MR, CR), (ML, CL1, MR, CR1)) :-
                  CL >= 1, CL1 is CL-1, CR1 is CR+1.

%Move one cannibal left
route((ML, CL, MR, CR), (ML, CL1, MR, CR1)) :-
                  CR >= 1, CR1 is CR-1, CL1 is CL+1.

%Move one of each right
route((ML, CL, MR, CR), (ML1, CL1, MR1, CR1)) :-
                  ML >= 1, CL >= 1, ML1 is ML-1, CL1 is CL-1, MR1 is MR+1, CR1 is CR+1.

%Move one of each left
route((ML, CL, MR, CR), (ML1, CL1, MR1, CR1)) :-
                  MR >= 1, CR >= 1, MR1 is MR-1, CR1 is CR-1, ML1 is ML+1, CL1 is CL+1.
                  

nobodyEaten((ML,CL,MR,CR)) :- ML >= CL, MR >= CR.

canMove(A, B) :- route(A, B), nobodyEaten(B).

travelSafeLog(A, A, _, []).
travelSafeLog(A, C, Closed, [A-B|Steps]) :-
           canMove(A, B),
           not(member(B, Closed)),
           travelSafeLog(B, C, [B|Closed], Steps).

start((3,3,0,0)).
finish((0,0,3,3)).

solve(Steps) :- start(A), finish(B), travelSafeLog(A, B, [], Steps).
