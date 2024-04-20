{
module Tokens  where
}

%wrapper "basic"

-- Add your token regular expressions and associated actions below.
tokens :-
  $white+                        ;
  "+"     { \s -> Operator '+' }
  "-"     { \s -> Operator '-' }
  "*"     { \s -> Operator '*' }
  "/"     { \s -> Operator '/' }
  [0-9]+(\.[0-9]+)?       { \s -> PosNum (read s) }


{
-- Each action has type :: String -> Token

-- The token type:

data Token = Operator Char
           | PosNum Double
    deriving (Show, Eq)

main = do
  s <- getContents
  print (alexScanTokens s)
}