{
module Tokens2  where
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
  "let"               { \s -> Let }
  "lambda"            { \s -> Lambda }
  "in"                { \s -> In }
  [a-zA-Z_][a-zA-Z0-9_]*    { \s -> Identifier s }

{
-- Each action has type :: String -> Token

-- The token type:

data Token = Operator Char
           | PosNum Double
           | Let
           | Lambda
           | In
           | Identifier String
    deriving (Show, Eq)
}