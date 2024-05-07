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


% part 2

% Knowledge
student(steven, _, _, blue, _).
student(alex, _, _, _, business).
student(_, bear, _, _, data_science).
student(lisa, fluffy, _, _, cs).
student(_, fido, husky, _, _).

% solve method, still needs work 
solve(RexOwner, LisaDogBreed) :-
    Students = [student(alex, _, _, _, _),
            student(lisa, _, LisaDogBreed, _, _),
            student(sarah, _, _, _, _),
            student(steven, _, _, _, _),
            student(zoe, _, _, _, _)],

    % Shirt Colors Knowledge
    member(student(_, _, _, blue, _), Students),
    member(student(_, _, _, green, _), Students),
    member(student(_, _, _, purple, _), Students),
    member(student(_, _, _, red, _), Students),
    member(student(_, _, _, yellow, _), Students),
    
    % Dog Knowledge
    member(student(_, angel, _, _, _), Students),
    member(student(_, bear, _, _, _), Students),
    member(student(_, fido, husky, _, _), Students), % fido is a husky
    member(student(_, fluffy, _, _, _), Students),
    member(student(RexOwner, rex, _, _, _), Students),

    % Mapping
    member(student(steven, _, _, blue, _), Students), % steven is wearing a blue shirt
    member(student(lisa, fluffy, _, _, cs), Students), % lisa is adopting fluffy and is a cs major 
    member(student(sarah, _, _, _, _), Students),

    % idk if i did this right
    behind(Students, student(sarah, _, _, _, _), 
    student(lisa, _, _, _, _)),

    behind(Students, student(sarah, _, _, _, _), 
    student(_, _, labradoodle, _, _)),

    behind(Students, student(_, fido, _, _, _), 
    student(_, bear, _, _, _)).

