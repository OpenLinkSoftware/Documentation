<div>

<div>

<div>

<div>

### 11.7.12. SET statement

</div>

</div>

</div>

``` programlisting
Set_statement:
    SET option '=' scalar_exp
    | SET option OFF
    | SET option ON
    ;

option:
    ISOLATION
    | LOCK_ESCALATION_PCT
    | TRIGGERS
    | PARAM_BATCH
    ;
```

The SET statement sets an option to a value. Options may control trigger
invocation, transaction isolation and other settable parameters of the
engine. A SET inside a procedure takes effect inside the procedure and
invoked procedures, counting from time of execution. Control must pass
through the SET statement for it to take effect, i.e. SET is not a
declaration. The effect of a SET does typically not persist across
procedure return.

A SET given at top level, i.e. directly executed and by a client as the
statement of a SQLExecute sets an option at the connection level. This
may only be reversed by another SET.

The option may be:

</div>
