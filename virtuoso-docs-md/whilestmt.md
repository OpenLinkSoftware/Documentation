<div>

<div>

<div>

<div>

### 11.7.5. if, while, for, foreach statements

</div>

</div>

</div>

``` programlisting
if_statement
    : IF '(' search_condition ')' statement opt_else

opt_else
    : /* empty */
    | ELSE statement

while_statement
    : WHILE '(' search_condition ')' statement

for_statement
  : FOR '(' for_init_statement_list ';' for_opt_search_cond ';' for_inc_statement_list ')' statement
  | FOREACH '(' data_type_ref identifier IN_L scalar_exp ')' DO statement
```

The IF statement executes the immediately following statement if the
condition is true. If there is an else clause and the condition is false
the statement immediately following the else keyword will be executed.

The while statement evaluates the search condition and executes the
following statement if the condition is true. It does this as long as
the condition is true. To exit from a loop, use goto. C-like break and
continue statements are not available.

The for statement initiates the for_init_statement_list and executes the
following statement until the search condition is true. After every
execution of the statement it executes for_inc_statement_list. You can
exit the loop with using goto syntax also.

The foreach statement executes the statement for each element from an
array and sets a variable to the corresponding element of that array.

``` screen
IF (A > B)
    A := A + 1;
ELSE
    B := B + 1;

WHILE (1 = 1) {
    A := A + 1;
}

FOR (declare X any, X := 1; X <= 2 ; X := X + 1){
    S := S + X;
}

FOR (declare X any, X := 1; X <= 2 ; ){
    S := S + X;
    X := X + 1;
}

FOR (declare X any, X := 1; ; X := X + 1){
    if (X > 2)
    goto exit_loop;
    S := S + X;
}
exit_loop:

declare X integer;
X := 1;
FOR (; X <= 2 ; X := X + 1){
    S := S + X;
}

ARR := vector (1,2);
FOREACH (int X in ARR) do {
    S := S + X;
}
```

</div>
