{- CS 152 Homework 3:  Lava 1.0
   Team Name:          -}
module Lava1 where -- do not remove

import Tokens  -- Make sure you run alex to generate you scanner after you modify tokens.x
import Graphics.Win32 (ptInRegion)


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
rexpr ts = error $ "Syntax Error - expected expression, got " ++ show ts  --idk if we are supposed to hardcode the empty list
   


check:: String -> Bool
check = recognize.scan



-- STEP 3: uncomment each step as you work on it

-- <expr> -> OPERATOR <expr> <expr> | POSNUMBER


expr :: [Token] -> (Maybe ParseTree, [Token])
expr (Operator op:tokens) = 
    case expr tokens of
        (Just leftTree, rest1) -> 
            case expr rest1 of
                (Just rightTree, rest2) -> (Just (OpNode op leftTree rightTree), rest2)
                _ -> (Nothing, tokens)
        _ -> (Nothing, tokens)
expr (PosNum num:tokens) = (Just (NumNode num), tokens)
expr _ = (Nothing, [])



                        

stringToTree:: String -> ParseTree
stringToTree = parse.scan -- for testing convenience

parse :: [Token] -> ParseTree
parse ts = let (maybePt, r) = expr ts in
    case maybePt of
        Nothing -> error $ "Syntax Error invalid expression " ++ show r
        Just pt -> case r of
            [] -> pt
            _  -> error $ "extra tokens" ++ show r



-- STEP 4: uncomment each step as you work on it


eval :: ParseTree -> Double
eval (NumNode n) = n
eval (OpNode op left right) =
    case op of
      '+' -> eval left + eval right
      '-' -> eval left - eval right
      '*' -> eval left * eval right
      '/' -> eval left / eval right
      _   -> error "Unknown operator"

interpret :: String -> Double
interpret = eval.parse.scan

