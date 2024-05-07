% Part 1


% q1: behind predicate
behind(X, Y, [Y|L]) :- member(X, L). % base case, check if Y is head and if so, check if x is in the tail of the list
behind(X, Y, [_|L]) :- behind(X, Y, L). % recursive case


% q2: first predicate
first([X|_], X).


% q3: infront predicate

infront(X, Y, [X, Y|_]). % base case, returns true if X and Y are two consecutive elements in that order
infront(X, Y, [_|L]) :- infront(X, Y, L). % recursive case


% q4: next predicate

next(X, Y, [X, Y|_]). % base case 1, if X immeditally precedes Y 
next(X, Y, [Y, X|_]). % base case 2, if Y immeditally precedes X
next(X, Y, [_|L]) :- next(X, Y, L). % recursive case, 









