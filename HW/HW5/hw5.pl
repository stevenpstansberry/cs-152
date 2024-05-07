% Part 1


% q1: behind predicate



% q2: first predicate



% q3: infront predicate



% q4: next predicate

next(X, Y, [X, Y|_]). % base case 1, if X immeditally precedes Y 
next(X, Y, [Y, X|_]). % base case 2, if Y immeditally precedes X
next(X, Y, [_|L]) :- next(X, Y, L). % recursive case, 










