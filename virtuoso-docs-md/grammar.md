<div>

<div>

<div>

<div>

## 9.30. SQL Grammar

</div>

</div>

</div>

``` programlisting
    sql_list
        : sql ';'

        | sql_list sql ';'

        ;

    sql
        : schema_element_list
        | view_def
        ;

    schema_element_list
        : schema_element
        | schema_element_list schema_element
        ;

    schema_element
        : base_table_def
        | create_index_def
        | drop_table
        | drop_index
        | add_column
        | table_rename
        | privilege_def
        | privilege_revoke
        | create_user_statement
        | delete_user_statement
        | set_pass
        | set_group_stmt
        ;

    base_table_def
        : CREATE TABLE new_table_name '(' base_table_element_commalist ')'

        ;

    base_table_element_commalist
        : base_table_element
        | base_table_element_commalist ',' base_table_element
        ;

    base_table_element
        : column_def
        | table_constraint_def
        ;

    column_def
        : column data_type column_def_opt_list
        ;

    references
        : REFERENCES q_table_name opt_column_commalist
        ;

    column_def_opt_list
        : /* empty */
        | column_def_opt_list column_def_opt
        ;

    column_def_opt
        : NOT NULLX
        | IDENTITY
        | NOT NULLX PRIMARY KEY opt_index_option_list
        | DEFAULT literal
        | references
        ;

    table_constraint_def
        : UNDER q_table_name
        | PRIMARY KEY '(' index_column_commalist ')' opt_index_option_list
        | FOREIGN KEY '(' column_commalist ')' references
        ;

    column_commalist
        : column
        | column_commalist ',' column
        ;

    index_column_commalist
        : column opt_asc_desc
        | index_column_commalist ',' column opt_asc_desc
        ;

    index_option
        : CLUSTERED
        | UNIQUE
        ;

    index_option_list
        : index_option
        | index_option_list index_option
        ;

    opt_index_option_list
        : /* empty */
        | index_option_list
        ;

    create_index_def
        : CREATE opt_index_option_list INDEX index
            ON new_table_name '(' index_column_commalist ')'

        ;

    drop_index
        : DROP INDEX NAME opt_table
        ;

    opt_table
        : /* empty */
        | q_table_name
        ;

    drop_table
        : DROP TABLE q_table_name
        ;

    add_col_column_def_list
        : column_def
        | add_col_column_def_list ',' column_def
        ;

    add_col_column_list
        : column
        | add_col_column_list ',' column
        ;

    add_column
        : ALTER TABLE q_table_name ADD opt_col_add_column add_col_column_def_list
        | ALTER TABLE q_table_name DROP opt_col_add_column add_col_column_list
        | ALTER TABLE q_table_name MODIFY opt_col_add_column column_def
        ;

    table_rename
        : ALTER TABLE q_table_name RENAME new_table_name
        ;

    view_def
        : CREATE VIEW new_table_name opt_column_commalist
            AS query_exp opt_with_check_option
        ;

    opt_with_check_option
        : /* empty */
        | WITH CHECK OPTION
        ;

    opt_column_commalist
        : /* empty */
        | '(' column_commalist ')'

        ;

    priv_opt_column_commalist
        : /* empty */
        | '(' column_commalist ')'

        ;

    privilege_def
        : GRANT ALL PRIVILEGES TO grantee
        | GRANT privileges ON table TO grantee_commalist opt_with_grant_option
        | GRANT grantee_commalist TO grantee_commalist opt_with_admin_option
        ;

    privilege_revoke
        : REVOKE ALL PRIVILEGES FROM grantee_commalist
        | REVOKE privileges ON table FROM grantee_commalist
        | REVOKE grantee_commalist FROM grantee_commalist
        ;

    opt_with_grant_option
        : /* empty */
        | WITH GRANT OPTION
        ;

    opt_with_admin_option
        : /* empty */
        | WITH ADMIN OPTION
        ;

    privileges
        : ALL PRIVILEGES
        | ALL
        | operation_commalist
        ;

    operation_commalist
        : operation
        | operation_commalist ',' operation
        ;

    operation
        : SELECT priv_opt_column_commalist
        | INSERT
        | DELETE
        | UPDATE priv_opt_column_commalist
        | EXECUTE
        ;

    grantee_commalist
        : grantee
        | grantee_commalist ',' grantee
        ;

    grantee
        : PUBLIC
        | user
        ;

    set_pass
        : SET PASSWORD NAME NAME
        ;

    create_user_statement
        : CREATE USER user
        | CREATE ROLE user
        ;

    delete_user_statement
        : DELETE USER user [CASCADE]
        | DROP ROLE user
        ;

    set_group_stmt
        : SET USER GROUP user user
        ;

    cursor_def
        : DECLARE NAME CURSOR FOR query_spec
        ;

    opt_order_by_clause
        : /* empty */
        | ORDER BY ordering_spec_commalist
        ;

    ordering_spec_commalist
        : ordering_spec
        | ordering_spec_commalist ',' ordering_spec
        ;

    ordering_spec
        : INTNUM opt_asc_desc
        | column_ref opt_asc_desc
        | function_ref opt_asc_desc
        ;

    opt_asc_desc
        : /* empty */
        | ASC
        | DESC
        ;

    sql
        : manipulative_statement
        ;

    manipulative_statement
        : query_exp
        | update_statement_positioned
        | update_statement_searched
        | insert_statement
        | delete_statement_positioned
        | delete_statement_searched
        | call_statement
        | admin_statement
        | use_statement
        ;

    use_statement
        : USE NAME
        ;

    close_statement
        : CLOSE cursor
        ;

    delete_statement_positioned
        : DELETE FROM table WHERE CURRENT OF cursor
        ;

    delete_statement_searched
        : DELETE FROM table opt_where_clause
        ;

    fetch_statement
        : FETCH cursor INTO target_commalist
        ;

    insert_mode
        : INTO
        | REPLACING
        | SOFT

    insert_statement
        : INSERT insert_mode table priv_opt_column_commalist values_or_query_spec
        ;

    values_or_query_spec
        : VALUES '(' insert_atom_commalist ')'
        | query_spec
        ;

    insert_atom_commalist
        : insert_atom
        | insert_atom_commalist ',' insert_atom
        ;

    insert_atom
        : scalar_exp
        ;

    cursor_option
        : EXCLUSIVE
        | PREFETCH INTNUM
        ;

    cursor_options_commalist
        : cursor_option
        | cursor_options_commalist ',' cursor_option
        ;

    opt_cursor_options_list
        : /* empty */
        | '(' cursor_options_commalist ')'

        ;

    open_statement
        : OPEN cursor opt_cursor_options_list
        ;

    with_opt_cursor_options_list
        : /* empty */
        | WITH opt_cursor_options_list
        ;

    select_statement
        : SELECT opt_all_distinct selection table_exp
        | SELECT opt_all_distinct selection
            INTO target_commalist table_exp with_opt_cursor_options_list
        ;

    opt_all_distinct
        : /* empty */
        | ALL
        | DISTINCT
        ;

    update_statement_positioned
        : UPDATE table SET assignment_commalist WHERE CURRENT OF cursor
        ;

    assignment_commalist
        : /* empty */
        | assignment
        | assignment_commalist ',' assignment
        ;

    assignment
        : column COMPARISON scalar_exp
        ;

    update_statement_searched
        : UPDATE table SET assignment_commalist opt_where_clause
        ;

    target_commalist
        : target
        | target_commalist ',' target
        ;

    target
        : column_ref
        ;

    opt_where_clause
        : /* empty */
        | where_clause
        ;

    query_exp
        : query_term
        | query_exp UNION query_term
        | query_exp UNION ALL query_term
        ;

    query_term
        : query_spec
        | '(' query_exp ')'

        ;

    query_spec
        : SELECT opt_all_distinct selection table_exp
        ;

    selection
        : scalar_exp_commalist
        ;

    table_exp
        : from_clause opt_where_clause opt_group_by_clause opt_having_clause
            opt_order_by_clause opt_lock_mode
        ;

    from_clause
        : FROM table_ref_commalist
        ;

    table_ref_commalist
        : table_ref
        | table_ref_commalist ',' table_ref
        ;

    table_ref
        : table
        | '(' query_exp ')' NAME
        | joined_table
        ;

    table_ref_nj
        : table
        | subquery NAME
        ;

    opt_outer
        : /* empty */
        | OUTER
        ;

    jtype
        : LEFT
        ;

    joined_table
        : table_ref jtype opt_outer JOIN table_ref_nj ON search_condition
        | BEGIN_OJ_X table_ref jtype opt_outer JOIN table_ref_nj
          ON search_condition ENDX
        ;

    where_clause
        : WHERE search_condition
        ;

    opt_group_by_clause
        : /* empty */
        | GROUP BY ordering_spec_commalist
        ;

    opt_having_clause
        : /* empty */
        | HAVING search_condition
        ;

    opt_lock_mode
        : /* empty */
        | FOR UPDATE
        ;

    search_condition
        : /* empty */
        | search_condition OR search_condition
        | search_condition AND search_condition
        | NOT search_condition
        | '(' search_condition ')'

        | predicate
        ;

    predicate
        : comparison_predicate
        | between_predicate
        | like_predicate
        | test_for_null
        | in_predicate
        | all_or_any_predicate
        | existence_test
        | scalar_exp_predicate
        ;

    scalar_exp_predicate
        : scalar_exp
        ;

    comparison_predicate
        : scalar_exp COMPARISON scalar_exp
        | scalar_exp COMPARISON subquery
        ;

    between_predicate
        : scalar_exp NOT BETWEEN scalar_exp AND scalar_exp
        | scalar_exp BETWEEN scalar_exp AND scalar_exp
        ;

    like_predicate
        : scalar_exp NOT LIKE scalar_exp opt_escape
        | scalar_exp LIKE scalar_exp opt_escape
        ;

    opt_escape
        : /* empty */
        | ESCAPE atom
        | BEGINX ESCAPE atom ENDX
        ;

    test_for_null
        : column_ref IS NOT NULLX
        | column_ref IS NULLX
        ;

    in_predicate
        : scalar_exp NOT IN subquery
        | scalar_exp IN subquery
        | scalar_exp NOT IN '(' scalar_exp_commalist ')'

        | scalar_exp IN '(' scalar_exp_commalist ')'

        ;

    all_or_any_predicate
        : scalar_exp COMPARISON any_all_some subquery
        ;

    any_all_some
        : ANY
        | ALL
        | SOME
        ;

    existence_test
        : EXISTS subquery
        ;

    subquery
        : '(' SELECT opt_all_distinct selection table_exp ')'

        ;

    scalar_exp
        : scalar_exp '+' scalar_exp
        | scalar_exp '-' scalar_exp
        | scalar_exp '*' scalar_exp
        | scalar_exp '/' scalar_exp
        | '+' scalar_exp %prec UMINUS
        | '-' scalar_exp %prec UMINUS
        | atom
        | column_ref
        | function_ref
        | '(' scalar_exp ')'

        | '(' scalar_exp ',' scalar_exp_commalist ')'

        | function_call
        | as_expression
        | assignment_statement
        | cvt_exp
        ;

    cvt_exp
        : CONVERT '(' data_type ',' scalar_exp ')'

        ;

    as_expression
        : scalar_exp AS NAME data_type
        | scalar_exp AS NAME
        ;

    opt_scalar_exp_commalist
        : /* empty */
        | scalar_exp_commalist
        ;

    function_call
        : q_table_name '(' opt_scalar_exp_commalist ')'

        | BEGIN_FN_X NAME '(' opt_scalar_exp_commalist ')' ENDX
        | BEGIN_FN_X USER '(' opt_scalar_exp_commalist ')' ENDX
        | BEGIN_FN_X CHARACTER '(' opt_scalar_exp_commalist ')' ENDX
        | CALL '(' scalar_exp ')' '(' opt_scalar_exp_commalist ')'

        ;

    obe_literal
        : BEGINX NAME atom ENDX
        ;

    scalar_exp_commalist
        : scalar_exp
        | scalar_exp_commalist ',' scalar_exp
        ;

    atom
        : parameter_ref
        | literal
        | USER
        | obe_literal
        ;

    parameter_ref
        : parameter
        | parameter parameter
        | parameter INDICATOR parameter
        ;

    function_ref
        : AMMSC '(' '*' ')'

        | AMMSC '(' DISTINCT scalar_exp ')'

        | AMMSC '(' ALL scalar_exp ')'

        | AMMSC '(' scalar_exp ')'

        ;

    literal
        : STRING
        | INTNUM
        | APPROXNUM
        | NULLX
        ;

    q_table_name
        : NAME
        | NAME '.' NAME
        | NAME '.' NAME '.' NAME
        | NAME '.'  '.' NAME
        ;

    new_table_name
        : NAME
        | NAME '.' NAME
        | NAME '.' NAME '.' NAME
        | NAME '.'  '.' NAME
        ;

    table
        : q_table_name
        | q_table_name AS NAME
        | q_table_name NAME
        ;

    column_ref
        : NAME
        | NAME '.' NAME
        | NAME '.' NAME '.' NAME
        | NAME '.' NAME '.' NAME '.' NAME
        | NAME '.' '.' NAME '.' NAME
        | '*'
        | NAME '.' '*'
        | NAME '.' NAME '.' '*'

        | NAME '.' NAME '.' NAME '.' '*'

        | NAME '.' '.' NAME '.' '*'

        ;

    data_type
        : CHARACTER
        | VARCHAR
        | VARCHAR '(' INTNUM ')'

        | CHARACTER '(' INTNUM ')'

        | NUMERIC
        | NUMERIC '(' INTNUM ')'

        | NUMERIC '(' INTNUM ',' INTNUM ')'

        | DECIMAL
        | DECIMAL '(' INTNUM ')'

        | DECIMAL '(' INTNUM ',' INTNUM ')'

        | INTEGER
        | SMALLINT
        | FLOAT
        | FLOAT '(' INTNUM ')'

        | REAL
        | DOUBLE PRECISION
        | LONG VARCHAR
        | LONG VARBINARY
        | TIMESTAMP
        | DATETIME
        | TIME
        | DATE
        | OWNER
        ;

    column
        : NAME
        ;

    index
        : NAME
        ;

    cursor
        : NAME
        ;

    parameter
        : PARAMETER
        ;

    user
        : NAME
        ;

    opt_log
        : /* empty */
        | scalar_exp
        ;

    comma_opt_log
        : /* empty */
        | ',' scalar_exp
        ;

    admin_statement
        : CHECKPOINT opt_log
        | SHUTDOWN opt_log
        | SET REPLICATION atom
        | LOG OFF
        | LOG ON
        ;

    sql
        : routine_declaration
        | trigger_def
        | drop_trigger
        ;

    routine_declaration
        : CREATE routine_head new_table_name rout_parameter_list
        opt_return compound_statement
        ;

    routine_head
        : FUNCTION
        | PROCEDURE
        ;

    opt_return
        : /* empty */
        | RETURNS data_type
        ;

    rout_parameter_list
        : '(' parameter_commalist ')'

        ;

    parameter_commalist
        : rout_parameter
        | parameter_commalist ',' rout_parameter
        ;

    rout_parameter
        : parameter_mode column_ref data_type
        ;

    parameter_mode
        : IN
        | OUT
        | INOUT
        ;

    routine_statement
        : select_statement
        | update_statement_positioned
        | update_statement_searched
        | insert_statement
        | delete_statement_positioned
        | delete_statement_searched
        | close_statement
        | fetch_statement
        | open_statement
        | commit_statement
    */
        | ';'

        ;

    compound_statement
        : BEGINX statement_list ENDX
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
        | NAME ':' statement
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

    condition
        : NOT FOUND
        | SQLSTATE STRING
        ;

    handler_declaration
        : WHENEVER condition GOTO NAME
        | WHENEVER condition GO TO NAME
        ;

    control_statement
        : call_statement ';'

        | return_statement ';'

        | assignment_statement ';'

        | if_statement
        | goto_statement ';'

        | while_statement
        ;

    assignment_statement
        : lvalue EQUALS scalar_exp
        ;

    lvalue
        : column_ref
        ;

    if_statement
        : IF '(' search_condition ')' statement opt_else
        ;

    opt_else
        : /* empty */
        | ELSE statement
        ;

    call_statement
        : CALL q_table_name '(' opt_scalar_exp_commalist ')'

        | function_call
        ;

    goto_statement
        : GOTO NAME
        | GO TO NAME
        ;

    return_statement
        : RETURN scalar_exp
        | RETURN
        ;

    while_statement
        : WHILE '(' search_condition ')' statement
        ;

    trigger_def
        : CREATE TRIGGER NAME action_time event ON q_table_name
                opt_old_ref compound_statement
        ;

    action_time
        : BEFORE
        | AFTER
        ;

    event
        : INSERT
        | UPDATE
        | DELETE
        ;

    opt_old_ref
        : /* empty */
        | REFERENCING old_commalist
        ;

    old_commalist
        : old_alias
        | old_commalist ',' old_alias
        ;

    old_alias
        : OLD AS NAME
        | NEW AS NAME
        ;

    drop_trigger
        : DROP TRIGGER q_table_name
        ;
```

</div>
