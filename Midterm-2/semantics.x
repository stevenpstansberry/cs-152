{- in order to define tokens we have to first create the Token data type 
We formulate the data type declration by looking at the productions

In our examples:

<expr> → <expr> PLUS <term> | <expr> MINUS <term> | <term>
<term> → <term> TIMES <factor> | <factor>
<factor> → LPAREN <expr> RPAREN | <number>
<number> → INT 

We aren't factoring in precedence right now, we just have to declare
what the tokens actually are

-}

data Token = Plus 
            | Minus
            | Times
            | LParen
            | RParen
            | Number Int
        deriving (Show,Eq)    

{-
now we have to add regex to identify what tokens to return for the scanner
-}


tokens :-
$white+         ;
\+              {\s -> Plus}
\-              {\s -> Minus}
\(              {\s -> LParen}
\)              {\s -> RParen}
[0-9]+          {\s -> Number(read :: Int)}