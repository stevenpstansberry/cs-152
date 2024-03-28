
Grammar Used for Examples:
```php
<expr> → <expr> PLUS <term> | <term>
<term> → <term> TIMES <factor> | <factor>
<factor> → NUMBER | LPAREN <expr> RPAREN
```
Where PLUS represents '+', TIMES represents '*', LPAREN represents '(', and RPAREN represents ')'.

## Example 1:

String: 3 + 4
Question: Is 3 + 4 valid in the language defined by the given grammar? If so, provide a leftmost derivation.

Yes

```php
<expr>

-> <expr> PLUS <expr>
-> <term> PLUS <term>
-> <factor> PLUS <term>
-> NUMBER PLUS <term>
-> NUMBER PLUS <expr>
-> NUMBER PLUS <factor>
-> NUMBER PLUS NUMBER

```


## Example 2:
String: (3 + 4) * 5


Question: Is (3 + 4) * 5 valid in the language defined by the given grammar? If so, provide a leftmost derivation.


## Example 3:


String: 3 +
Question: Is 3 + valid in the language defined by the given grammar? If not, what type of error is generated?


## Example 4:


String: 2 * (3 + 4
Question: Is 2 * (3 + 4 valid in the language defined by the given grammar? If not, what type of error is generated?


## Example 5:


String: 9 * 3 + (7 - 2)
Question: Is 9 * 3 + (7 - 2) valid in the language defined by the given grammar? If not, what type of error is generated?