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

{-
Example 2: Expression with Parentheses

Grammar remains the same as in Example 1.
Expression: (3 + 4) * 5
Question: Evaluate the expression (3 + 4) * 5 using the provided grammar rules.


3 + 4 = 7

7 * 5 = 35
-}

{-
Example 3: Nested Expressions

Grammar remains the same as in Example 1.
Expression: 3 + (4 * (2 + 1))
Question: Evaluate the expression 3 + (4 * (2 + 1)) 
using the provided grammar rules.

2 + 1 =3

4 * 3 = 12

3 + 12 = 15

-}



{-

Example 4: Left Associativity of Minus Operator

Extended Grammar:
<expr> → <expr> MINUS <term> | <term>
<term> → <term> TIMES <factor> | <factor>
<factor> → LPAREN <expr> RPAREN | NUMBER
Expression: 10 - 2 - 1
Question: Evaluate the expression 10 - 2 - 1 based on the left 
associativity of the minus operator as defined in the grammar.


10 -2 -1 = 7
-}


{-
Example 5: Right Associativity of Exponentiation

Extended Grammar:
<expr> → <term> EXP <expr> | <term>
<term> → <term> TIMES <factor> | <factor>
<factor> → LPAREN <expr> RPAREN | NUMBER
Expression: 2 EXP 3 EXP 2
Question: Evaluate the expression 2 EXP 3 EXP 2
based on the right associativity of the exponentiation operator 
as defined in the grammar.

3^2 = 9
2^9 = 512

-}