<div>

<div>

<div>

<div>

### 11.7.7. goto, return statements

</div>

</div>

</div>

``` programlisting
goto_statement
    : GOTO label
    ;

label   : NAME

return_statement
    : RETURN scalar_exp
    | RETURN
    ;
```

The goto statement unconditionally transfers control to the label
following it. The label can be anywhere within the same procedure. It is
in principle possible to jump into a block (e.g. loop body) from
outside.

The return statement causes the executing procedure to return. If a
return value is specified the expression is evaluated and returned as
the return value of the procedure. If no return value is specified the
procedure returns an undefined value.

Returning from a procedure automatically frees any resources associated
with the procedure. This includes values in local variables or call by
value (IN) parameters and any cursors that may be open.

<div>

|                            |                                                             |
|:--------------------------:|:------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See:                                                        |
|                            | <a href="plref.html#createprocstmt" class="link"            
                              title="11.7.1. Create Procedure Statement">Create Procedure  
                              statement</a>                                                |

</div>

</div>
