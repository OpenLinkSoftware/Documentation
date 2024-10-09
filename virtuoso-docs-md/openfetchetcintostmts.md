<div>

<div>

<div>

<div>

### 11.7.10. open, fetch, close, select ... into statements

</div>

</div>

</div>

``` programlisting
SELECT opt_all_distinct selection
    INTO target_commalist
    table_exp
    with_opt_cursor_options_list
    ;

opt_all_distinct
    : /* empty */
    | ALL
    | DISTINCT
    ;

with_opt_cursor_options_list
    : /* empty */
    | WITH opt_cursor_options_list
    ;

cursor_option
    : EXCLUSIVE
    ;

cursor_options_commalist
    : cursor_option
    | cursor_options_commalist ',' cursor_option
    ;

opt_cursor_options_list
    : /* empty */
    | '(' cursor_options_commalist ')'
    ;

cursor_def : DECLARE NAME CURSOR FOR query_exp
           | DECLARE NAME (DYNAMIC|KEYSET|STATIC) CURSOR FOR query_exp

open_statement
    : OPEN cursor opt_cursor_options_list
    ;

fetch_statement : FETCH cursor INTO target_commalist
                | FETCH cursor (FIRST|NEXT|PREVIOUS|LAST) INTO target_commalist
                | FETCH cursor BOOKMARK scalar_exp INTO target_commalist

target_commalist
    : variable
    | target_commalist ',' variable
    ;

close_statement
    : CLOSE cursor
    ;
```

The open, fetch and close statements manipulate cursors in Virtuoso/PL
statements. Cursors are declared with the declare cursor statement. The
select into statement is a shorthand for a cursor declaration, open,
fetch and close.

A forward-only cursor declaration is a declaration only and executing
one does not take time. The open statement effectively starts the search
associated with the forward-only cursor.

The forward-only cursor options used with open and select into allow
controlling how the cursor sets locks on selected rows and how many rows
it fetches at a time. The EXCLUSIVE option should be used if intending
to update or delete a row in the cursor's evaluation. This causes
selected rows to be locked with exclusive (write) locks.

``` screen
The statements:

{
    DECLARE CR CURSOR FOR SELECT C_NAME FROM CUSTOMER WHERE C_ID = ID;
    OPEN CR;
    FETCH CR INTO NAME;
    CLOSE CR;
}

and

SELECT C_NAME INTO NAME FROM CUSTOMER WHERE C_ID = ID;

have the same effect.
```

<div>

|                            |                                                    |
|:--------------------------:|:---------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See:                                               |
|                            | the TPC C Bench Marking chapter for more examples. |

</div>

</div>
