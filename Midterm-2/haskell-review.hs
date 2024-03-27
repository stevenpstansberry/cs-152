

data SJSUColor = Blue| Yellow deriving (Show,Eq)


data Shape = Circle Float | 
            Rectangle Float Float 
            deriving (Show,Eq)

area :: Shape -> Float
area (Circle r) = pi *r **2
area (Rectangle l w) = l * w


