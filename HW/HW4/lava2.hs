{- CS 152 Homework 4:  Lava 2.0
   Team Name:   Boss Mode       -}
module Lava2 where -- do not remove

import Tokens2 -- Make sure you run alex to generate you scanner after you modify tokens2.x

data ParseTree
  = NumNode Double
  | OpNode Char ParseTree ParseTree
  | IdentNode String
  | LetNode String ParseTree ParseTree
  | FunctionNode String ParseTree -- one formal parameter only lambda x (* 2 x)
  | Application ParseTree ParseTree -- First ParseTree is a FunctionNode
  deriving (Show, Eq)

-- Question 1 : implement the scan function below as a call to alexScanTokens
scan :: String -> [Token]
scan = alexScanTokens

-- Question 2: uncomment each step as you work on it

--  stringToTree "lambda x + 5 x"
-- this test case is supposed to give an error but it works
--  stringToTree "let x 5  in lambda x 2"
-- same with this one
{-
ghci> stringToTree "let x 5  in lambda x 2"
LetNode "x" (NumNode 5.0) (FunctionNode "x" (NumNode 2.0))
ghci> stringToTree "lambda x + 5 x"
FunctionNode "x" (OpNode '+' (NumNode 5.0) (IdentNode "x"))
-}

parse :: [Token] -> ParseTree
parse ts =
  let (maybePt, r) = expr ts
   in case maybePt of
        Nothing -> error $ "Syntax Error: invalid expression " ++ show r
        Just pt -> case r of
          [] -> pt -- if all tokens are exhausted it means all tokens consumed
          _ -> error $ "Syntax Error: extra tokens " ++ show r -- extra tokens found, error

-- <expr> ->  OPERATOR <expr> <expr>
--          | POSNUM
--          | IDENTIFIER
--          | LET  IDENTIFIER <expr>  IN <expr>
--          | <application>

expr :: [Token] -> (Maybe ParseTree, [Token])
expr (Operator op : ts) =
  let (maybeE1, rest1) = expr ts -- recursive call to rest of tokens
   in case maybeE1 of
        Just e1 ->
          let (maybeE2, rest2) = expr rest1 -- recursive call to rest1
           in case maybeE2 of
                Just e2 -> (Just (OpNode op e1 e2), rest2)
                Nothing -> (Nothing, ts) -- checks second tree
        Nothing -> (Nothing, ts) -- checks first tree
expr [] = (Nothing, []) -- base case
-- POSNUM
expr (PosNum n : ts) = (Just (NumNode n), ts)
-- IDENTIFIER

expr (Identifier id : ts) = (Just (IdentNode id), ts)
-- LET  IDENTIFIER <expr>  IN <expr>

expr (Let : Identifier id : ts) =
  let (maybeE1, rest1) = expr ts
   in case rest1 of
        (In : rest2) ->
          let (maybeE2, rest3) = expr rest2
           in case (maybeE1, maybeE2) of
                (Just e1, Just e2) -> (Just (LetNode id e1 e2), rest3)
                _ -> (Nothing, ts)
        _ -> (Nothing, ts)
-- <application>

expr tokens = (Nothing, tokens)


-- <function> -> LAMBDA  IDENTIFIER  <expr>

function :: [Token] -> (Maybe ParseTree, [Token])
function (Lambda : Identifier parameter : ts) =
  let (body, rest1) = expr ts
   in case body of
    Just b -> case rest1 of
        [] -> (Just (FunctionNode parameter b), rest1)
        _ -> (Nothing, ts)
    Nothing -> (Nothing, ts)  -- Error in parsing the body of the function
function _ = (Nothing, [])

-- <application> ->   <function> <expr>
application :: [Token] -> (Maybe ParseTree, [Token])
application ts =
  let (maybeFunc, rest1) = function ts -- parse from start of ts
   in case maybeFunc of
        Just func ->
          -- successful parse
          let (maybeExpr, rest2) = expr rest1 -- read rest1 and attempt to create applicationNode
           in case maybeExpr of
                Just expr -> (Just (Application func expr), rest2) -- applicationNode returned
                Nothing -> (Nothing, rest1) -- rest1 failed parse
        Nothing -> (Nothing, ts) -- ts failed parse

stringToTree :: String -> ParseTree
stringToTree = parse . scan -- for testing convenience

-- Question 3: uncomment each step as you work on it

{-
eval :: [(String, Double)] -> ParseTree -> Double

evalinit :: ParseTree -> Double

interpret :: String -> Double
interpret = evalinit.parse.scan
-}
