{-Example 1: Simple Addition and Multiplication

Grammar:

<expr> → <expr> PLUS <term> | <term>
<term> → <term> TIMES <factor> | <factor>
<factor> → LPAREN <expr> RPAREN | NUMBER
Expression: 3 + 4 * 5
Question: Evaluate the expression 3 + 4 * 5 using the provided grammar rules.


23 since TIMES has a higher precedence than PLUS so we compute
3 + (4*5)
-}