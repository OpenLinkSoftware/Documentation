<div>

<div>

<div>

<div>

### 11.7.6. compound statement

</div>

</div>

</div>

``` programlisting
compound_statement
    : '{' statement_list '}'
    ;

statement_list
    : statement_in_cs
    | statement_list statement_in_cs
    ;

statement_in_cs
    : local_declaration ';'
    | compound_statement
    | routine_statement ';'
    | control_statement
    | label ':' statement
    ;

statement
    : routine_statement ';'
    | control_statement
    | compound_statement
    ;

local_declaration
    : cursor_def
    | variable_declaration
    | handler_declaration
    ;

variable_declaration
    : DECLARE variable_list data_type
    ;

variable_list
    : NAME
    | variable_list ',' NAME
    ;
```

The compound statement is the main building block of procedures.
Statements in a compound statement are executed left to right, unless
the flow of control is changed with a goto statement. The compound
statement allows declaring local variables and exception handlers. See
'Scope Rules' above for a description of the scope of declarations.

Labeled statements (goto targets) and declarations can only occur within
a compound statement.

<div>

|                            |                                                             |
|:--------------------------:|:------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See:                                                        |
|                            | <a href="plref.html#createprocstmt" class="link"            
                              title="11.7.1. Create Procedure Statement">Create Procedure  
                              statement</a>                                                |

</div>

</div>
