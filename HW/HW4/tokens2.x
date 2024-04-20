{
module Tokens2  where
}

%wrapper "basic"

-- Add your token regular expressions and associated actions below.
tokens :-
  $white+                        ;


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