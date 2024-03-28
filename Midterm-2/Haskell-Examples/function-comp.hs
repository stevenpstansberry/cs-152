-- Write a Haskell function that ... you must use function composition


--Concatenate and Reverse Strings: Write a Haskell function 
--concatRev that takes two strings, concatenates them, 
--and then reverses the result. Use function composition.


concatRev :: String -> String -> String
concatRev x y =  (reverse . (++) y) x

doubleAndSum :: [Int] -> Int
doubleAndSum = sum . map (*2)


filterAndCount :: (a -> Bool) -> [a] -> Int
filterAndCount p  = length . filter p

squareAndMax :: [Int] -> Int
squareAndMax = maximum . map (^2)