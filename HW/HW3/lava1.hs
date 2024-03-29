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


--data Token = Operator Char
--           | PosNum Double
--    deriving (Show, Eq)


recognize :: [Token] -> Bool
recognize ts = let r = rexpr ts
               in case r of
               [] -> True
               _  -> error $ "Syntax Error - extra tokens: " ++ show r

-- <expr> -> OPERATOR <expr> <expr> | POSNUMBER
rexpr :: [Token] -> [Token]
rexpr (Operator _ : rest) = rexpr (rexpr rest) -- Operator <expr> <expr> case
rexpr (PosNum _ : rest) = rest -- PosNum Case
rexpr _ = error $ "Syntax Error - expected expression, got " --idk if we are supposed to hardcode the empty list
   


check:: String -> Bool
check = recognize.scan



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
