-- CS 152
-- Boss Mode
-- Maryia Sakharava
-- Steven Stansberry

-- Question 1:
-- Function echo: list -> list
-- takes in a list of elements of artbitary type and returns new list where each
-- element is repeated twice, maintaining order 

echo:: [a] -> [a]
echo [] = [] -- if input list is empty, return an empty list
echo (x:xs) = x:x:echo xs -- when list has elements, construct a new list using first element twice alongside the recursive call to echo with the tail



