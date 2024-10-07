<div id="wheneverstmt" class="section">

<div class="titlepage">

<div>

<div>

### 11.7.8. whenever statement

</div>

</div>

</div>

``` programlisting
condition
    : NOT FOUND
    | SQLSTATE STRING
    ;

handler_declaration
    : WHENEVER condition GOTO NAME
    ;
```

This declares that control should be transferred to a particular label
in the procedure whenever a condition occurs within the lexical scope of
the WHENEVER declaration. This is similar to the statement of the same
name found in most embedded SQL implementations.

The scope of the declaration is all the lines lexically following the
declaration. A previous declaration is replaced by a new declaration for
the same \<condition\>.

``` screen
CREATE PROCEDURE COUNT_CUSTOMERS (IN C_NAME VARCHAR)
{
    DECLARE COUNT INTEGER;

    COUNT := 0;

    DECLARE C CURSOR FOR SELECT C_ID FROM CUSTOMER WHERE C_NAME = C_NAME;

    WHENEVER SQLSTATE '4001' GOTO DEADLOCK;

    WHENEVER NOT FOUND GOTO DONE;

    OPEN C;
    WHILE (1=1)
    {
    FETCH C INTO N;
    COUNT := COUNT + 1;
    }

DONE:
    RETURN COUNT;

DEADLOCK:
    RETURN -1;
}
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                             |
|:----------------------------:|:----------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                       |
|                              | This is about the same as select count (\*) from CUSTOMER where C_NAME = ?; |

</div>

</div>
