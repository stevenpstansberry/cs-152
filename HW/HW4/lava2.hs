{- CS 152 Homework 4:  Lava 2.0
   Team Name:          -}
module Lava2 where -- do not remove

import Tokens2 -- Make sure you run alex to generate you scanner after you modify tokens2.x

data ParseTree
  = NumNode Double
  | OpNode Char ParseTree ParseTree
  | IdentNode String
  | LetNode String ParseTree ParseTree
  | FunctionNode String ParseTree -- one formal parameter only lambda x (* 2 x)
  | Application ParseTree ParseTree -- First ParseTree is a FunctionNode
  deriving (Show)

-- Question 1 : implement the scan function below as a call to alexScanTokens
scan :: String -> [Token]
scan = alexScanTokens

-- Question 2: uncomment each step as you work on it
{-
parse :: [Token] -> ParseTree

-- <expr> ->  OPERATOR <expr> <expr>
--          | POSNUM
--          | IDENTIFIER
--          | LET  IDENTIFIER <expr>  IN <expr>
--          | <application>

expr :: [Token] -> (Maybe ParseTree, [Token])

-- <function> -> LAMBDA  IDENTIFIER  <expr>
function :: [Token] -> (Maybe ParseTree, [Token])

-- <application> ->   <function> <expr>
application :: [Token] -> (Maybe ParseTree, [Token])

stringToTree:: String -> ParseTree
stringToTree = parse.scan -- for testing convenience
-}

-- Question 3: uncomment each step as you work on it

{-
eval :: [(String, Double)] -> ParseTree -> Double

evalinit :: ParseTree -> Double

interpret :: String -> Double
interpret = evalinit.parse.scan
-}
