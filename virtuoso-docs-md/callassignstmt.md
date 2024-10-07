<div id="callassignstmt" class="section">

<div class="titlepage">

<div>

<div>

### 11.7.9. call, assignment statements

</div>

</div>

</div>

``` programlisting
function_call
    : NAME '(' opt_scalar_exp_commalist ')'
    | call '(' scalar_exp ')' '('opt_scalar_exp_commalist ')'
    ;

call_statement
    : CALL NAME '(' opt_scalar_exp_commalist ')'
    | function_call
    ;

assignment_statement
    : lvalue EQUALS scalar_exp
    | lvalue '=' scalar_exp
    ;

lvalue  :  NAME
```

The call statement calls a specified procedure with the given arguments.
The procedure to call is resolved at run time, i.e. the latest
definition prevails, even if it has been made after the calling
procedure was defined. The CALL reserved word is optional and is
supported for compatibility.

If the called procedure has reference parameters (OUT or INOUT) the
matching actual parameter must be a variable or parameter.

There is a computed function call form of function_call. In this, the
scalar expression in parentheses following the call keyword should
evaluate to a string which then identifies the function to be called.

The assignment statement sets a value to a variable. The variable must
be either a local variable declared with declare or a procedure argument
declared in the procedure argument list. If the variable in question is
a reference parameter the assignment takes effect in the actual
parameter as will, i.e. the value of the argument variable in the caller
is set.

``` screen
CREATE PROCEDURE COMPUTED_CALL (IN Q INTEGER)
{
    DECLARE FN VARCHAR;

    FN := 'F';

    --- CALL FUNCTION FF WITH ARGUMENT 11.
    R := CALL (CONCATENATE (FN, 'F')) (11);
}
```

</div>
