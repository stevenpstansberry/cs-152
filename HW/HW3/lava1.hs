{- CS 152 Homework 3:  Lava 1.0
   Team Name:          -}
module Lava1 where -- do not remove

import Tokens  -- Make sure you run alex to generate you scanner after you modify tokens.x


data ParseTree = NumNode Double
               | OpNode Char ParseTree ParseTree
        deriving Show

-- STEP 1 : implement the scan function below as a call to alexScanTokens
scan :: String ->[Token]
scan = alexScanTokens


-- STEP 2: uncomment each step as you work on it
{-
recognize :: [Token] -> Bool


-- <expr> -> OPERATOR <expr> <expr> | POSNUMBER
rexpr :: [Token] -> [Token]



check:: String -> Bool
check = recognize.scan
-}


-- STEP 3: uncomment each step as you work on it
{-
-- <expr> -> OPERATOR <expr> <expr> | POSNUMBER
expr :: [Token] -> (Maybe ParseTree, [Token])


stringToTree:: String -> ParseTree
stringToTree = parse.scan -- for testing convenience
-}


-- STEP 4: uncomment each step as you work on it

{-
eval ::  ParseTree -> Double

interpret :: String -> Double
interpret = eval.parse.scan
-}
