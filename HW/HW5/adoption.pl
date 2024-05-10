% CS 152 Homework 5 adoption
%  Team Name:   Boss Mode
%  Maryia Sakharava
%  Steven Stansberry


% Part 1

% behind predicate
behind(X, Y, [Y|T]) :- member(X, T).
behind(X, Y, [_|T]) :- behind(X, Y, T).

% first predicate
first([X|_], X).

% infront predicate
infront(X, Y, [X, Y|_]).
infront(X, Y, [_|T]) :- infront(X, Y, T).

% next predicate
next(X, Y, [X, Y|_]).
next(X, Y, [Y, X|_]).
next(X, Y, [_|T]) :- next(X, Y, T).


% part 2

fiveStudents([_, _, _, _, _]).


% solve method, still needs work
% student(name, dogname, shirtcolor, dogbreed, major)


% Revised solve method ensuring a unique solution and proper constraints application.

solve(RexOwner, LisaDogBreed) :-
    fiveStudents(Students),

    % Defining each student with more intertwined and specific properties
    member(student(RexOwner, rex, _, _, _), Students),
    member(student(lisa, _, _, LisaDogBreed, cs), Students),
    member(student(_, fluffy, _, _, cs), Students),
    member(student(_, bear, _, _, data_science), Students),
    member(student(zoe, _, _, beagle, _), Students),
    member(student(steven, _, blue, _, _), Students),
    member(student(alex, _, _, _, business), Students),
    member(student(_, fido, _, husky, _), Students),

    % Detailed constraints ensuring unique setup
    first(Students, student(_, _, _, poodle, _)),
    behind(student(_, _, _, _, biology), student(_, _, _, _, software_engineering), Students),
    behind(student(alex, _, _, _, _), student(_, _, _, _, data_science), Students),
    infront(student(_, _, purple, _, _), student(steven, _, _, _, _), Students),
    behind(student(sarah, _, _, _, _), student(lisa, _, _, _, cs), Students),
    behind(student(zoe, _, _, _, _), student(_, _, _, terrier, _), Students),
    behind(student(sarah, _, _, _, _), student(_, _, _, labradoodle, _), Students),
    behind(student(_, fido, _, _, _), student(_, bear, _, _, _), Students),
    next(student(_, _, red, _, _), student(_, _, green, _, _), Students).
