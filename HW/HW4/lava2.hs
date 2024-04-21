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
expr tokens = case tokens of
  -- OPERATOR <expr> <expr
  (Operator op : ts) ->
    let (Just e1, ts1) = expr ts
        (Just e2, ts2) = expr ts1
     in (Just (OpNode op e1 e2), ts2)
  --  POSNUM
  (PosNum n : ts) ->
    (Just (NumNode n), ts)
  -- IDENTIFIER
  (Identifier id : ts) ->
    (Just (IdentNode id), ts)
  -- LET  IDENTIFIER <expr>  IN <expr>
  (Let : Identifier id : ts) ->
    let (Just e1, In : ts1) = expr ts
        (Just e2, ts2) = expr ts1
     in (Just (LetNode id e1 e2), ts2)
  _ -> (Nothing, tokens) -- unexpected token or empty list

-- <function> -> LAMBDA  IDENTIFIER  <expr>

function :: [Token] -> (Maybe ParseTree, [Token])
function (Lambda : Identifier parameter : ts) =
  let (Just body, ts') = expr ts
   in (Just (FunctionNode parameter body), ts')
function _ = (Nothing, [])

-- <application> ->   <function> <expr>
application :: [Token] -> (Maybe ParseTree, [Token])
application tokens =
  let (maybeFunc, restTokens) = function tokens
   in case maybeFunc of
        Just func ->
          let (maybeExpr, finalTokens) = expr restTokens
           in case maybeExpr of
                Just expr -> (Just (Application func expr), finalTokens)
                Nothing -> (Nothing, restTokens)
        Nothing -> (Nothing, tokens)

stringToTree :: String -> ParseTree
stringToTree = parse . scan -- for testing convenience

{-
> stringToTree "let grade + 80 1 in * grade 1.2"

LetNode "grade" (OpNode '+' (NumNode 80.0) (NumNode 1.0)) (OpNode '*' (IdentNode "grade") (NumNode 1.2))

> stringToTree "lambda x + x * 2  x 5"

Application (FunctionNode "x" (OpNode '+' (IdentNode "x") (OpNode '*' (NumNode 2.0) (IdentNode "x")))) (NumNode 5.0)

> stringToTree   "let first 1 in let second 2 in + first second"

LetNode "first" (NumNode 1.0) (LetNode "second" (NumNode 2.0) (OpNode '+' (IdentNode "first") (IdentNode "second")))

> stringToTree  "let y 6 in lambda x + x * y  3 5"

LetNode "y" (NumNode 6.0) (Application (FunctionNode "x" (OpNode '+' (IdentNode "x") (OpNode '*' (IdentNode "y") (NumNode 3.0)))) (NumNode 5.0))

> stringToTree "+ 4 1  grade"

\*** Exception: Syntax Error - extra tokens:  [Identifier "grade"]

> stringToTree "let grade 5 + grade 6   "

Exception: Syntax Error - invalid expression [Let,Identifier "grade",PosNum 5.0,Operator '+',Identifier "grade",PosNum 6.0]

> stringToTree "lambda x + 5 x"

\*** Exception: Syntax Error - invalid expression []

i> stringToTree "lambda 3 +x 800"

\*** Exception: Syntax Error - invalid expression [Lambda,PosNum 3.0,Operator '+',Identifier "x",PosNum 800.0]

>  stringToTree "let x 5  in lambda x 2"

\*** Exception: Syntax Error - invalid expression [Lambda,Identifier "x",PosNum 2.0]

-}

-- Question 3: uncomment each step as you work on it

{-
eval :: [(String, Double)] -> ParseTree -> Double

evalinit :: ParseTree -> Double

interpret :: String -> Double
interpret = evalinit.parse.scan
-}
