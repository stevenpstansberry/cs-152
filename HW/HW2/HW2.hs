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

--Question 2:
--Function wedge: arbitrary element e, list -> list
-- takes in an element, list and returns new list where
-- element is inserted between conscutive elements

wedge:: a -> [a] ->[a]
wedge n [x] = [x] -- pattern for the very last element of the list
wedge _ [] = [] -- empty list case
wedge n (x:xs) = x:n: wedge n xs -- pattern for when list has more than one element, constuct new list with x, element e, and the recursive call to wedge




