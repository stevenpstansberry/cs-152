% CS 152 Homework 5 adoption
%  Team Name:   Boss Mode
%  Maryia Sakharava
%  Steven Stansberry


% Part 1

% behind predicate, intakes X and Y, and List L. checks to see if X appears somewhere behind Y in list
behind(X, Y, [Y|T]) :- member(X, T).
behind(X, Y, [_|T]) :- behind(X, Y, T).


% first predicate, checks to see if X is the first element of the list
first([X|_], X).

% infront predicate, intakes two elements, X and Y, and list L, returns true if X is immeditally in front of y
infront(X, Y, [X, Y|_]).
infront(X, Y, [_|T]) :- infront(X, Y, T).

% next predicate, takes in two elements X and Y, and list L. Returns true if X and Y are immeditally next to each other in the list
next(X, Y, [X, Y|_]).
next(X, Y, [Y, X|_]).
next(X, Y, [_|T]) :- next(X, Y, T).


% part 2


fiveStudents([_, _, _, _, _]).


solve(RexOwner, LisaDogBreed) :-
    fiveStudents(Students),
    
    % Establish knowledge about students
    member(student(alex, _, _, _, business), Students),   % alex is a business major 15
    member(student(steven, _, blue, _, _), Students), % steven is wearing a blue shirt 14
    member(student(sarah, _, _, _, _), Students), % sarah is behind lisa 9
    member(student(zoe, _, _, beagle, _), Students), % zoe is adopting a beagle 7 
    member(student(lisa, _, _, LisaDogBreed, cs), Students), % lisa is a cs major 17
    
    % Establish knowledge about dogs
    member(student(RexOwner, rex, _, _, _), Students),  % Who owns Rex?
    member(student(_, fluffy, _, _, cs), Students),  % the cs major is adopting fluffy 5
    member(student(_, bear, _, _, data_science), Students), % ds major is adopting bear 6
    member(student(_, fido, _, husky, _), Students),  % fido is a husky 18
    member(student(_, angel, _, _, _), Students), % adopter of angel is behind bussiness major 4

    % Establish positional knowledge
    first(Students, student(_, _, _, poodle, _)), % the first student is adopting the poodle 1
    behind(student(_, _, _, _, biology), student(_, _, _, _, software_engineering), Students),% bio major is somewere behind se major 2
    behind(student(alex, _, _, _, _), student(_, _, _, _, data_science), Students), % alex is behind ds major 3
    behind(student(_, angel, _, _, _), student(_, _, _, _, business), Students), % adopter of angel is behind bussiness major 4
    infront(student(_, _, purple, _, _), student(steven, _, _, _, _), Students), % purple shirt wearer is in front of steven 8
    behind(student(sarah, _, _, _, _), student(lisa, _, _, _, _), Students), % sarah is behind lisa 9
    behind(student(zoe, _, _, _, _), student(_, _, _, terrier, _), Students), % zoe is behind the adopter of the terrier 10
    behind(student(sarah, _, _, _, _), student(_, _, _, labradoodle, _), Students), % sarah is behind the adopter of the labradoodle 11
    behind(student(_, fido, _, husky, _), student(_, bear, _, _, _), Students), % adopter of fido is behind adopter of bear 12
    next(student(_, _, red, _, _), student(_, _, green, _, data_science), Students), % red shirt wearing is next to green shirt 13
    member(student(_, _, green, _, data_science), Students). % ds major is wearing a green shirt 16
