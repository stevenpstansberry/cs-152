{- Recursive descent recognizer for mini-English language described by the grammar below:
<sentence> → <noun-phrase><verb-phrase> PERIOD
<noun-phrase> →  ARTICLE NOUN
<verb-phrase> → VERB <noun-phrase>

 -}
module MiniEnglish where

data Token  = Article String 
            | Noun String    
            | Verb String    
            | Period
    deriving (Show, Eq)


--  recognizer
recognize :: [Token] -> Bool
recognize  ts = let r = rsentence ts
                in case r of
                [] -> True
                _ -> error $ "Syntax Error - extra tokens: " ++ show r

-- <sentence> → <noun-phrase><verb-phrase> PERIOD
rsentence:: [Token] -> [Token]
rsentence ts = let  r1 = rnounphrase ts
                    r2 = rverbphrase r1
                in case r2 of
                Period:r3 ->  r3
                _     -> error$ "Syntax Error - expected Period, got "++show r2


-- <verb-phrase> → VERB <noun-phrase>
rverbphrase:: [Token] -> [Token]
rverbphrase (Verb _:rest) = rnounphrase rest
rverbphrase ts = error $ "Syntax Error - expected Verb, got " ++ show ts


-- <noun-phrase> →  ARTICLE NOUN
rnounphrase:: [Token] ->  [Token]
rnounphrase (Article _:Noun _:rest) = rest
rnounphrase ts = error $ "Syntax Error - expected Noun phrase, got " ++ show ts