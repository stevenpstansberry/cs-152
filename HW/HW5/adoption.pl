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

    % Who owns Rex?
    member(student(RexOwner, rex, _, _, _), Students),
    %What breed is the dog of lisa?

    member(student(lisa, _, _, LisaDogBreed, cs), Students),


    member(student(_, fluffy, _, _, cs), Students), % the cs major is adopting fluffy
    member(student(_, bear, _, _, data_science), Students), % ds major is adopting bear
    member(student(zoe, _, _, beagle, _), Students), % zoe is adopting a beagle
    member(student(steven, _, blue, _, _), Students), % steven is wearing a blue shirt
    member(student(alex, _, _, _, business), Students), % alex is a business makor
    member(student(_, fido, _, husky, _), Students), % fido is a husky

    % Detailed constraints ensuring unique setup
    first(Students, student(_, _, _, poodle, _)), % the first student is adopting the poodle
    behind(student(_, _, _, _, biology), student(_, _, _, _, software_engineering), Students), % bio major is somewere behind se major
    behind(student(alex, _, _, _, _), student(_, _, _, _, data_science), Students), % alex is behind ds major
    infront(student(_, _, purple, _, _), student(steven, _, _, _, _), Students), % purple shirt wearer is in front of steven
    behind(student(sarah, _, _, _, _), student(lisa, _, _, _, cs), Students), $ sarah is behind lisa
    behind(student(zoe, _, _, _, _), student(_, _, _, terrier, _), Students), % zoe is behind the adopter of the ettier
    behind(student(sarah, _, _, _, _), student(_, _, _, labradoodle, _), Students), % sarah is behind the adopter of the labradoodle
    behind(student(_, fido, _, _, _), student(_, bear, _, _, _), Students), % adopter of fido is behind adopter of bear
    next(student(_, _, red, _, _), student(_, _, green, _, _), Students). % red shirt wearing is next to green shirt
