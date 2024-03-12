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

-- Question 2:
-- Function wedge: arbitrary element e, list -> list
-- takes in an element, list and returns new list where
-- element is inserted between conscutive elements

wedge:: a -> [a] ->[a]
wedge n [x] = [x] -- pattern for the very last element of the list
wedge _ [] = [] -- empty list case
wedge n (x:xs) = x:n: wedge n xs -- pattern for when list has more than one element, constuct new list with x, element e, and the recursive call to wedge



--Question 5
--Function shortest  list of lists -> Maybe list
-- takes in list of lists and returns the shortest list, if it is an empty list, return Nothing
shortest :: [[a]] -> Maybe [a]
shortest [] = Nothing -- empty list base case 
shortest [x] = Just x -- if just one list in the list, return it
shortest (x:xs) = -- if the list has lists within it...
    case shortest xs of --define the call to shortest xs 
        Just currentShortest 
            | length x <= length currentShortest -> Just x -- if the length is less then previous call, return Just x to compare agsaisnt subsquent calls, Just x is now our shortest list
            | otherwise -> Just currentShortest -- the current list we are comparing agaisnt is not shortest, so we return the current shortest list.
        Nothing -> Just x -- indicates we have reached the end, and we can return Just x, since there are no more elements left to compare agaisnt







-- Question 7
-- Function shout: list of string(s) -> single string
-- takes in a list of strings/words and returns a single string where 
-- a '!' seperates words

shout:: [String] -> String
shout [] = [] -- empty list case
shout (x:xs) = x ++ "!" ++ shout xs -- when the list has elements, append '!' to each word, followed by recursive call to shout xs
--we want to use ++ since we are concatenting two list togethers, using : to construct list will result in error

add :: Int -> Int -> Int
add x y = x + y

double :: Int -> Int
double x = x * 2


--- Question 8
--- Function enhance: function a -> a
--- takes in a function as its arguement and applies its effect 3 times
enhance :: (a -> a)  -> (a -> a) -- we want to intake and return a function, since composiiton can only be applied to functions
enhance f =   (f . f).f
--the takeaway with 8 is that we compositin can only be applied to functions


-- Question 9
-- Function geoSequence: two Numeric types: a,r -> infinite list 
-- takes in two numeric types and returns infinite list reresenting geometric sequence [a,ar,ar^2 ... ar^n]
geoSequence:: Num b => b -> b -> [b]
geoSequence a r = a : geoSequenceHelper (a * r) r -- construct list with inital a, then use helper method to recursively build up list
    where --use where binding to take advantage of lazy evaluation 
        geoSequenceHelper a r = a : geoSequenceHelper (a * r) r -- recursively update previous a value by multiplying it by r and construct it to list

--geoSequenceNext :: Num a => a -> a -> [a]
--geoSequenceNext a r = a * r: geoSequenceNext (a * r) r
