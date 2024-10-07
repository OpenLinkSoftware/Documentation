<div id="ch-appendixa" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 23. Appendix A

</div>

<div>

<div class="abstract">

**Abstract**

This reference chapter contains information that needs to be found
quickly and accurately without specific guide lines to the topics in
question. This chapter contains the SQL Grammar, listings of all system
errors messages, release notes for the product, how to get support on
the product and a list of the system tables and there schema
definitions.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">23.1. [YACC SQL Grammar
Reference](ch-appendixa.html#yacc)</span>

<span class="section">23.2. [Error Codes Reference](errors.html)</span>

<span class="section">23.2.1. [Virtuoso Error
Codes](errors.html#errorcodes)</span>

<span class="section">23.2.2. [Data Type
Errors](datatypeerror.html)</span>

<span class="section">23.3. [Signals and Exit
codes](signalsandexitcodes.html)</span>

<span class="section">23.3.1. [Exit
codes](signalsandexitcodes.html#signalsandexitcodesc)</span>

<span class="section">23.3.2.
[Signals](signalsandexitcodess.html)</span>

<span class="section">23.4. [Release Notes](apparelnotes.html)</span>

<span class="section">23.4.1. [New
Features](apparelnotes.html#feat30)</span>

<span class="section">23.4.2. [Bugs Fixed](ptrs30.html)</span>

<span class="section">23.5. [Product Support](support.html)</span>

<span class="section">23.5.1. [OpenLink Discussion
Forums](support.html#discussionforums)</span>

<span class="section">23.6. [Virtuoso System
Tables](systemtables.html)</span>

<span class="section">23.6.1. [Core System
Tables](systemtables.html#systables)</span>

<span class="section">23.6.2. [System Tables](usersystables.html)</span>

<span class="section">23.6.3. [Row Level Security
Table](rowlevelsectab.html)</span>

<span class="section">23.6.4. [SYS_CHARSETS](charsetsystab.html)</span>

<span class="section">23.6.5. [Collations System
Table](sys_collations.html)</span>

<span class="section">23.6.6. [UDDI Schema](uddischema.html)</span>

<span class="section">23.6.7. [Web Robot System
Tables](robotsystables.html)</span>

<span class="section">23.6.8. [Web Server & DAV System
Tables](davsystables.html)</span>

<span class="section">23.6.9. [Mail Table
Description](smtptabledesc.html)</span>

<span class="section">23.6.10. [NNTP Server
Tables](newssrvtables.html)</span>

<span class="section">23.6.11. [WS Reliable
Messaging](systabswsrm.html)</span>

<span class="section">23.6.12. [WS Trust](wstschema.html)</span>

<span class="section">23.6.13. [SyncML Schema
Objects](syncmlschema.html)</span>

<span class="section">23.6.14. [INFORMATION_SCHEMA
views](views_information_schema.html)</span>

<span class="section">23.7. [Basic Syntax of Regular
Expressions](apndxregexp.html)</span>

<span class="section">23.8. [Server & client versions
compatibility](apndxclientcompilance.html)</span>

</div>

<div id="yacc" class="section">

<div class="titlepage">

<div>

<div>

## 23.1. YACC SQL Grammar Reference

</div>

</div>

</div>

``` programlisting
/*
 *
 *  SQL Parser
 *
 *  Copyright (C) 1998-2024 OpenLink Software.
 *  All Rights Reserved.
 *
 *  The copyright above and this notice must be preserved in all
 *  copies of this source code.  The copyright above does not
 *  evidence any actual or intended publication of this source code.
 *
 *  This is unpublished proprietary trade secret of OpenLink Software.
 *  This source code may not be copied, disclosed, distributed, demonstrated
 *  or licensed except as authorized by OpenLink Software.
 */

Grammar

    0 $accept: sql_list $end

    1 sql_list: sql_list1 ';'
    2         | sql_list1

    3 sql_list1: sql

    4 sql: schema_element_list
    5    | view_def
    6    | xml_view
    7    | create_xml_schema
    8    | alter_constraint
    9    | create_library
   10    | create_assembly
   11    | drop_library
   12    | drop_assembly

   13 schema_element_list: schema_element
   14                    | add_column
   15                    | schema_element_list schema_element
   16                    | schema_element_list add_column

   17 schema_element: base_table_def
   18               | create_index_def
   19               | drop_table
   20               | drop_index
   21               | table_rename
   22               | privilege_def
   23               | privilege_revoke
   24               | create_user_statement
   25               | delete_user_statement
   26               | set_pass
   27               | set_group_stmt
   28               | add_group_stmt
   29               | delete_group_stmt
   30               | user_defined_type
   31               | user_defined_type_drop
   32               | user_defined_type_alter

   33 identifier: NAME
   34           | TYPE
   35           | FINAL_L
   36           | METHOD
   37           | CHECKED
   38           | SYSTEM
   39           | GENERATED
   40           | SOURCE
   41           | RESULT
   42           | LOCATOR
   43           | INSTANCE_L
   44           | CONSTRUCTOR
   45           | SELF_L
   46           | OVERRIDING
   47           | STYLE
   48           | SQL_L
   49           | GENERAL
   50           | DETERMINISTIC
   51           | NO
   52           | CONTAINS
   53           | READS
   54           | DATA
   55           | MODIFIES
   56           | INPUT
   57           | CALLED
   58           | ADA
   59           | C
   60           | COBOL
   61           | FORTRAN
   62           | MUMPS
   63           | PASCAL_L
   64           | PLI
   65           | NAME_L
   66           | TEXT_L
   67           | JAVA
   68           | INOUT_L
   69           | REMOTE
   70           | KEYSET
   71           | VALUE
   72           | PARAMETER
   73           | VARIABLE
   74           | CLR
   75           | TEMPORARY
   76           | ADMIN_L
   77           | __SOAP_DOC
   78           | __SOAP_DOCW
   79           | __SOAP_HEADER
   80           | __SOAP_HTTP
   81           | __SOAP_NAME
   82           | __SOAP_TYPE
   83           | __SOAP_XML_TYPE
   84           | __SOAP_FAULT
   85           | __SOAP_DIME_ENC
   86           | __SOAP_ENC_MIME
   87           | __SOAP_OPTIONS
   88           | START_L
   89           | ATTRIBUTE
   90           | REXECUTE
   91           | PERMISSION_SET
   92           | AUTOREGISTER_L
   93           | LIBRARY_L
   94           | ASSEMBLY_L
   95           | SAFE_L
   96           | UNRESTRICTED
   97           | INCREMENT_L
   98           | FOREACH

   99 base_table_def: CREATE TABLE new_table_name '(' base_table_element_commalist ')'

  100 base_table_element_commalist: base_table_element
  101                             | base_table_element_commalist ',' base_table_element

  102 base_table_element: column_def
  103                   | table_constraint_def

  104 column_def: column column_data_type column_def_opt_list

  105 opt_referential_triggered_action: /* empty */
  106                                 | referential_rule
  107                                 | referential_rule referential_rule

  108 referential_rule: ON UPDATE referential_action
  109                 | delete_referential_rule

  110 delete_referential_rule: ON DELETE_L referential_action

  111 opt_on_delete_referential_rule: /* empty */
  112                               | delete_referential_rule

  113 referential_action: CASCADE
  114                   | SET NULLX
  115                   | SET DEFAULT

  116 references: REFERENCES q_table_name opt_column_commalist opt_referential_triggered_action

  117 column_def_opt_list: /* empty */
  118                    | column_def_opt_list column_def_opt

  119 identity_opt: START_L WITH signed_literal
  120             | INCREMENT_L BY INTNUM

  121 identity_opt_list: identity_opt
  122                  | identity_opt_list ',' identity_opt

  123 column_def_opt: NOT NULLX
  124               | NULLX
  125               | IDENTITY
  126               | IDENTITY '(' identity_opt_list ')'
  127               | PRIMARY KEY
  128               | DEFAULT signed_literal
  129               | COLLATE q_table_name
  130               | references
  131               | IDENTIFIED BY column
  132               | CHECK '(' search_condition ')'
  133               | WITH SCHEMA column_xml_schema_def
  134               | UNIQUE

  135 column_xml_schema_def: '(' STRING ',' STRING ')'
  136                      | '(' STRING ',' STRING ',' STRING ')'

  137 table_constraint_def: UNDER q_table_name
  138                     | opt_constraint_name PRIMARY KEY '(' index_column_commalist ')' opt_index_option_list
  139                     | opt_constraint_name FOREIGN KEY '(' column_commalist ')' references
  140                     | opt_constraint_name CHECK '(' search_condition ')'
  141                     | opt_constraint_name UNIQUE '(' column_commalist ')'

  142 opt_constraint_name: /* empty */
  143                    | CONSTRAINT identifier

  144 column_commalist: column
  145                 | column_commalist ',' column

  146 index_column_commalist: column opt_asc_desc
  147                       | index_column_commalist ',' column opt_asc_desc

  148 index_option: CLUSTERED
  149             | UNIQUE
  150             | OBJECT_ID

  151 index_option_list: index_option
  152                  | index_option_list index_option

  153 opt_index_option_list: /* empty */
  154                      | index_option_list

  155 create_index_def: CREATE opt_index_option_list INDEX index ON new_table_name '(' index_column_commalist ')'

  156 drop_index: DROP INDEX identifier opt_table

  157 opt_table: /* empty */
  158          | q_table_name

  159 drop_table: DROP TABLE q_table_name
  160           | DROP VIEW q_table_name

  161 opt_col_add_column: /* empty */
  162                   | COLUMN

  163 add_col_column_def_list: column_def
  164                        | add_col_column_def_list ',' column_def

  165 add_col_column_list: column
  166                    | add_col_column_list ',' column

  167 add_column: ALTER TABLE q_table_name ADD opt_col_add_column add_col_column_def_list
  168           | ALTER TABLE q_table_name DROP opt_col_add_column add_col_column_list
  169           | ALTER TABLE q_table_name MODIFY opt_col_add_column column_def

  170 table_rename: ALTER TABLE q_table_name RENAME new_table_name

  171 constraint_op: ADD
  172              | DROP
  173              | MODIFY

  174 opt_drop_behavior: /* empty */
  175                  | CASCADE
  176                  | RESTRICT

  177 opt_table_constraint_def: CONSTRAINT identifier opt_drop_behavior
  178                         | table_constraint_def

  179 alter_constraint: ALTER TABLE q_table_name constraint_op opt_table_constraint_def

  180 create_xml_schema: CREATE XML SCHEMA STRING

  181 view_query_spec: query_exp
  182                | query_no_from_spec

  183 @1: /* empty */

  184 view_def: CREATE VIEW new_table_name @1 opt_column_commalist AS view_query_spec opt_with_check_option
  185         | CREATE PROCEDURE VIEW new_table_name AS q_table_name '(' column_commalist_or_empty ')' '(' proc_col_list ')'

  186 opt_with_check_option: /* empty */
  187                      | WITH CHECK OPTION

  188 opt_column_commalist: /* empty */
  189                     | '(' column_commalist ')'

  190 priv_opt_column_commalist: /* empty */
  191                          | '(' column_commalist ')'

  192 privilege_def: GRANT ALL PRIVILEGES TO grantee
  193              | GRANT privileges ON table TO grantee_commalist opt_with_grant_option
  194              | GRANT EXECUTE ON function_name TO grantee_commalist opt_with_grant_option
  195              | GRANT REXECUTE ON STRING TO grantee_commalist
  196              | GRANT UNDER ON q_old_type_name TO grantee_commalist opt_with_grant_option
  197              | GRANT grantee_commalist TO grantee_commalist opt_with_admin_option

  198 opt_with_admin_option: /* empty */
  199                      | WITH ADMIN_L OPTION

  200 privilege_revoke: REVOKE privileges ON table FROM grantee_commalist
  201                 | REVOKE EXECUTE ON function_name FROM grantee_commalist
  202                 | REVOKE UNDER ON q_old_type_name FROM grantee_commalist
  203                 | REVOKE REXECUTE ON STRING FROM grantee_commalist
  204                 | REVOKE grantee_commalist FROM grantee_commalist

  205 opt_with_grant_option: /* empty */
  206                      | WITH GRANT OPTION

  207 privileges: ALL PRIVILEGES
  208           | ALL
  209           | operation_commalist

  210 operation_commalist: operation
  211                    | operation_commalist ',' operation

  212 operation: SELECT priv_opt_column_commalist
  213          | INSERT
  214          | DELETE_L
  215          | UPDATE priv_opt_column_commalist
  216          | REFERENCES priv_opt_column_commalist

  217 grantee_commalist: grantee
  218                  | grantee_commalist ',' grantee

  219 grantee: PUBLIC
  220        | user

  221 set_pass: SET PASSWORD identifier identifier

  222 create_user_statement: CREATE USER user
  223                      | CREATE ROLE_L user

  224 delete_user_statement: DELETE_L USER user
  225                      | DELETE_L USER user CASCADE
  226                      | DROP USER user
  227                      | DROP USER user CASCADE
  228                      | DROP ROLE_L user

  229 set_group_stmt: SET USER GROUP user user

  230 add_group_stmt: ADD USER GROUP user user

  231 delete_group_stmt: DELETE_L USER GROUP user user

  232 opt_attach_primary_key: /* empty */
  233                       | PRIMARY KEY '(' column_commalist ')'

  234 attach_table: ATTACH TABLE attach_q_table_name opt_attach_primary_key opt_as FROM literal opt_login opt_not_select opt_remote_name

  235 opt_as: /* empty */
  236       | AS new_table_name

  237 opt_login: /* empty */
  238          | USER scalar_exp PASSWORD scalar_exp

  239 opt_not_select: /* empty */
  240               | NOT SELECT

  241 opt_remote_name: /* empty */
  242                | REMOTE AS scalar_exp

  243 cursor_type: STATIC_L
  244            | DYNAMIC
  245            | KEYSET

  246 cursor_def: DECLARE identifier CURSOR FOR query_exp
  247           | DECLARE identifier cursor_type CURSOR FOR query_exp

  248 opt_order_by_clause: /* empty */
  249                    | ORDER BY ordering_spec_commalist

  250 ordering_spec_commalist: ordering_spec
  251                        | ordering_spec_commalist ',' ordering_spec

  252 ordering_spec: scalar_exp opt_asc_desc
  253              | mssql_xml_col opt_asc_desc

  254 opt_asc_desc: /* empty */
  255             | ASC
  256             | DESC

  257 create_snapshot_log: CREATE SNAPSHOT LOGX FOR q_table_name

  258 drop_snapshot_log: DROP SNAPSHOT LOGX FOR q_table_name

  259 purge_snapshot_log: PURGE SNAPSHOT LOGX FOR q_table_name

  260 opt_snapshot_string_literal: /* empty */
  261                            | STRING

  262 opt_snapshot_where_clause: /* empty */
  263                          | WHERE STRING

  264 create_snapshot: CREATE SNAPSHOT q_table_name FROM q_table_name opt_snapshot_string_literal opt_snapshot_where_clause
  265                | CREATE NONINCREMENTAL SNAPSHOT q_table_name AS STRING

  266 opt_with_delete: /* empty */
  267                | WITH DELETE_L

  268 drop_snapshot: DROP SNAPSHOT q_table_name opt_with_delete

  269 opt_nonincremental: /* empty */
  270                   | AS NONINCREMENTAL

  271 refresh_snapshot: UPDATE SNAPSHOT q_table_name opt_nonincremental

  272 create_freetext_index: CREATE TEXT_L opt_xml INDEX ON q_table_name '(' column ')' opt_with_key opt_deffer_generation opt_with opt_data_modification_action opt_lang opt_enc

  273 opt_data_modification_action: /* empty */
  274                             | USING FUNCTION

  275 opt_column: /* empty */
  276           | '(' column ')'

  277 create_freetext_trigger: CREATE TEXT_L TRIGGER ON q_table_name opt_column

  278 drop_freetext_trigger: DROP TEXT_L TRIGGER ON q_table_name opt_column

  279 opt_xml: /* empty */
  280        | XML

  281 opt_with_key: /* empty */
  282             | WITH KEY column

  283 opt_with: /* empty */
  284         | CLUSTERED WITH '(' column_commalist ')'

  285 opt_lang: /* empty */
  286         | LANGUAGE STRING

  287 opt_enc: /* empty */
  288        | ENCODING STRING

  289 opt_deffer_generation: /* empty */
  290                      | NOT INSERT

  291 sql: manipulative_statement

  292 manipulative_statement: query_exp
  293                       | query_no_from_spec
  294                       | update_statement_positioned
  295                       | update_statement_searched
  296                       | insert_statement
  297                       | delete_statement_positioned
  298                       | delete_statement_searched
  299                       | call_statement
  300                       | static_method_invocation
  301                       | METHOD CALL static_method_invocation
  302                       | top_level_method_invocation
  303                       | set_statement
  304                       | drop_xml_view
  305                       | commit_statement
  306                       | rollback_statement
  307                       | admin_statement
  308                       | use_statement
  309                       | attach_table
  310                       | create_snapshot_log
  311                       | drop_snapshot_log
  312                       | purge_snapshot_log
  313                       | create_snapshot
  314                       | drop_snapshot
  315                       | refresh_snapshot
  316                       | create_freetext_index
  317                       | create_freetext_trigger
  318                       | drop_freetext_trigger

  319 use_statement: USE identifier

  320 close_statement: CLOSE cursor

  321 commit_statement: COMMIT WORK

  322 delete_statement_positioned: DELETE_L FROM table WHERE CURRENT OF cursor

  323 delete_statement_searched: DELETE_L FROM table opt_where_clause

  324 fetch_statement: FETCH cursor INTO target_commalist
  325                | FETCH cursor NAME INTO target_commalist
  326                | FETCH cursor NAME scalar_exp INTO target_commalist

  327 insert_mode: INTO
  328            | REPLACING
  329            | SOFT

  330 insert_statement: INSERT insert_mode table priv_opt_column_commalist values_or_query_spec

  331 values_or_query_spec: VALUES '(' insert_atom_commalist ')'
  332                     | query_spec

  333 insert_atom_commalist: insert_atom
  334                      | insert_atom_commalist ',' insert_atom

  335 insert_atom: scalar_exp

  336 sql_option: ORDER
  337           | HASH
  338           | LOOP
  339           | INDEX identifier
  340           | INDEX PRIMARY KEY
  341           | INDEX TEXT_L KEY
  342           | NAME INTNUM

  343 sql_opt_commalist: sql_option
  344                  | sql_opt_commalist ',' sql_option

  345 opt_sql_opt: /* empty */
  346            | OPTION '(' sql_opt_commalist ')'

  347 opt_table_opt: /* empty */
  348              | TABLE OPTION '(' sql_opt_commalist ')'

  349 cursor_option: EXCLUSIVE
  350              | PREFETCH INTNUM

  351 cursor_options_commalist: cursor_option
  352                         | cursor_options_commalist ',' cursor_option

  353 opt_cursor_options_list: /* empty */
  354                        | '(' cursor_options_commalist ')'

  355 open_statement: OPEN cursor opt_cursor_options_list

  356 rollback_statement: ROLLBACK WORK

  357 with_opt_cursor_options_list: /* empty */
  358                             | WITH opt_cursor_options_list

  359 select_statement: SELECT opt_top selection INTO target_commalist table_exp with_opt_cursor_options_list

  360 opt_all_distinct: /* empty */
  361                 | ALL
  362                 | DISTINCT

  363 opt_ties: /* empty */
  364         | WITH TIES

  365 opt_top: opt_all_distinct
  366        | opt_all_distinct TOP INTNUM opt_ties
  367        | opt_all_distinct TOP '(' scalar_exp ')' opt_ties
  368        | opt_all_distinct TOP INTNUM ',' INTNUM opt_ties
  369        | opt_all_distinct TOP '(' scalar_exp ',' scalar_exp ')' opt_ties

  370 update_statement_positioned: UPDATE table SET assignment_commalist WHERE CURRENT OF cursor

  371 assignment_commalist: /* empty */
  372                     | assignment
  373                     | assignment_commalist ',' assignment

  374 assignment: column COMPARISON scalar_exp

  375 update_statement_searched: UPDATE table SET assignment_commalist opt_where_clause

  376 target_commalist: target
  377                 | target_commalist ',' target

  378 target: column_ref
  379       | member_observer
  380       | lvalue_array_ref

  381 opt_where_clause: /* empty */
  382                 | where_clause

  383 opt_best: /* empty */
  384         | BEST

  385 query_exp: query_term
  386          | non_final_union_exp opt_best UNION opt_corresponding query_term
  387          | non_final_union_exp opt_best UNION ALL opt_corresponding query_term
  388          | non_final_union_exp INTERSECT opt_corresponding query_term
  389          | non_final_union_exp INTERSECT ALL opt_corresponding query_term
  390          | non_final_union_exp EXCEPT opt_corresponding query_term
  391          | non_final_union_exp EXCEPT ALL opt_corresponding query_term

  392 non_final_union_exp: non_final_query_term
  393                    | non_final_union_exp opt_best UNION opt_corresponding non_final_query_term
  394                    | non_final_union_exp opt_best UNION ALL opt_corresponding non_final_query_term
  395                    | non_final_union_exp INTERSECT opt_corresponding non_final_query_term
  396                    | non_final_union_exp INTERSECT ALL opt_corresponding non_final_query_term
  397                    | non_final_union_exp EXCEPT opt_corresponding non_final_query_term
  398                    | non_final_union_exp EXCEPT ALL opt_corresponding non_final_query_term

  399 non_final_query_term: non_final_query_spec
  400                     | XPATH STRING

  401 query_term: query_spec
  402           | '(' query_exp ')' opt_order_by_clause
  403           | XPATH STRING

  404 opt_corresponding: /* empty */
  405                  | CORRESPONDING BY '(' column_commalist ')'

  406 non_final_query_spec: SELECT opt_top selection non_final_table_exp

  407 query_spec: SELECT opt_top selection table_exp

  408 query_no_from_spec: SELECT opt_top selection

  409 selection: select_scalar_exp_commalist

  410 non_final_table_exp: from_clause opt_where_clause opt_group_by_clause opt_having_clause

  411 table_exp: from_clause opt_where_clause opt_group_by_clause opt_having_clause opt_order_by_clause opt_lock_mode opt_sql_opt

  412 from_clause: FROM table_ref_commalist

  413 table_ref_commalist: table_ref
  414                    | table_ref_commalist ',' table_ref

  415 proc_col_list: column_def
  416              | proc_col_list ',' column_def

  417 opt_proc_col_list: '(' proc_col_list ')'

  418 column_commalist_or_empty: /* empty */
  419                          | column_commalist

  420 table_ref: table
  421          | '(' query_exp ')' identifier
  422          | '(' query_exp ')' AS identifier
  423          | joined_table
  424          | q_table_name '(' column_commalist_or_empty ')' opt_proc_col_list identifier

  425 table_ref_nj: table
  426             | subquery identifier
  427             | subquery AS identifier
  428             | '(' joined_table ')'

  429 jtype: /* empty */
  430      | LEFT opt_outer
  431      | RIGHT opt_outer
  432      | FULL opt_outer
  433      | INNER
  434      | CROSS

  435 opt_outer: /* empty */
  436          | OUTER

  437 join: NATURAL jtype
  438     | jtype

  439 joined_table: joined_table_1
  440             | BEGIN_OJ_X joined_table_1 ENDX
  441             | '(' joined_table_1 ')'

  442 joined_table_1: table_ref join JOIN table_ref_nj join_condition

  443 join_condition: /* empty */
  444               | ON search_condition
  445               | USING '(' column_commalist ')'

  446 where_clause: WHERE search_condition

  447 opt_group_by_clause: /* empty */
  448                    | GROUP BY ordering_spec_commalist
  449                    | GROUP BY ROLLUP '(' ordering_spec_commalist ')'
  450                    | GROUP BY CUBE '(' ordering_spec_commalist ')'

  451 opt_having_clause: /* empty */
  452                  | HAVING search_condition

  453 opt_lock_mode: /* empty */
  454              | FOR UPDATE
  455              | FOR XML NAME
  456              | FOR XML NAME NAME

  457 search_condition: search_condition OR search_condition
  458                 | search_condition AND search_condition
  459                 | NOT search_condition
  460                 | '(' search_condition ')'
  461                 | predicate

  462 predicate: comparison_predicate
  463          | between_predicate
  464          | like_predicate
  465          | test_for_null
  466          | in_predicate
  467          | all_or_any_predicate
  468          | existence_test
  469          | scalar_exp_predicate

  470 scalar_exp_predicate: scalar_exp

  471 comparison_predicate: scalar_exp COMPARISON scalar_exp

  472 between_predicate: scalar_exp NOT BETWEEN scalar_exp AND scalar_exp
  473                  | scalar_exp BETWEEN scalar_exp AND scalar_exp

  474 like_predicate: scalar_exp NOT LIKE scalar_exp opt_escape
  475               | scalar_exp LIKE scalar_exp opt_escape

  476 opt_escape: /* empty */
  477           | ESCAPE atom
  478           | BEGINX ESCAPE atom ENDX

  479 test_for_null: scalar_exp IS NOT NULLX
  480              | scalar_exp IS NULLX

  481 in_predicate: scalar_exp NOT IN_L subquery
  482             | scalar_exp IN_L subquery
  483             | scalar_exp NOT IN_L '(' scalar_exp_commalist ')'
  484             | scalar_exp IN_L '(' scalar_exp_commalist ')'

  485 all_or_any_predicate: scalar_exp COMPARISON any_all_some subquery

  486 any_all_some: ANY
  487             | ALL
  488             | SOME

  489 existence_test: EXISTS subquery

  490 scalar_subquery: subquery

  491 subquery: '(' SELECT opt_top selection table_exp ')'

  492 scalar_exp: scalar_exp '-' scalar_exp
  493           | scalar_exp '+' scalar_exp
  494           | scalar_exp '*' scalar_exp
  495           | scalar_exp '/' scalar_exp
  496           | '+' scalar_exp
  497           | '-' scalar_exp
  498           | assignment_statement
  499           | string_concatenation_operator
  500           | column_ref
  501           | scalar_exp_no_col_ref
  502           | obe_literal

  503 scalar_exp_no_col_ref: atom_no_obe
  504                      | aggregate_ref
  505                      | scalar_subquery
  506                      | '(' scalar_exp ')'
  507                      | '(' scalar_exp ',' scalar_exp_commalist ')'
  508                      | function_call
  509                      | new_invocation
  510                      | cvt_exp
  511                      | cast_exp
  512                      | simple_case
  513                      | searched_case
  514                      | coalesce_exp
  515                      | nullif_exp
  516                      | array_ref
  517                      | static_method_invocation
  518                      | method_invocation
  519                      | member_observer

  520 scalar_exp_no_col_ref_no_mem_obs_chain: atom_no_obe
  521                                       | aggregate_ref
  522                                       | scalar_subquery
  523                                       | '(' scalar_exp ')'
  524                                       | '(' scalar_exp ',' scalar_exp_commalist ')'
  525                                       | function_call
  526                                       | new_invocation
  527                                       | cvt_exp
  528                                       | cast_exp
  529                                       | simple_case
  530                                       | searched_case
  531                                       | coalesce_exp
  532                                       | nullif_exp
  533                                       | array_ref
  534                                       | static_method_invocation
  535                                       | method_invocation
  536                                       | member_observer_no_id_chain

  537 cvt_exp: CONVERT '(' data_type ',' scalar_exp ')'

  538 opt_collate_exp: /* empty */
  539                | COLLATE q_table_name

  540 cast_exp: CAST '(' scalar_exp AS data_type opt_collate_exp ')'

  541 mssql_xml_col: MSSQL_XMLCOL_NAME1 MSSQL_XMLCOL_INTNUM MSSQL_XMLCOL_NAMEZ
  542              | MSSQL_XMLCOL_NAME1 MSSQL_XMLCOL_INTNUM MSSQL_XMLCOL_NAMEYZ
  543              | MSSQL_XMLCOL_NAME1 MSSQL_XMLCOL_INTNUM MSSQL_XMLCOL_NAME MSSQL_XMLCOL_NAMEZ

  544 as_expression: scalar_exp AS identifier data_type
  545              | scalar_exp AS identifier
  546              | scalar_exp identifier
  547              | scalar_exp AS mssql_xml_col

  548 array_ref: scalar_exp_no_col_ref '[' scalar_exp ']'
  549          | lvalue_array_ref

  550 lvalue_array_ref: column_ref '[' scalar_exp ']'

  551 opt_scalar_exp_commalist: /* empty */
  552                         | scalar_exp_commalist

  553 function_name: identifier
  554              | identifier '.' method_identifier
  555              | identifier '.' identifier '.' method_identifier
  556              | identifier '.' identifier '.' identifier '.' method_identifier
  557              | identifier '.' '.' method_identifier
  558              | identifier '.' '.' identifier '.' method_identifier
  559              | LEFT
  560              | RIGHT
  561              | LOGX

  562 kwd_commalist: identifier KWD_TAG scalar_exp
  563              | kwd_commalist ',' identifier KWD_TAG scalar_exp

  564 as_commalist: as_expression
  565             | as_commalist ',' as_expression
  566             | as_commalist ',' scalar_exp

  567 opt_arg_commalist: /* empty */
  568                  | kwd_commalist
  569                  | scalar_exp_commalist
  570                  | scalar_exp_commalist ',' kwd_commalist
  571                  | scalar_exp_commalist ',' as_commalist
  572                  | as_commalist

  573 function_call: function_name '(' opt_arg_commalist ')'
  574              | TIMESTAMP_FUNC '(' SQL_TSI ',' scalar_exp ',' scalar_exp ')'
  575              | EXTRACT '(' NAME FROM scalar_exp ')'
  576              | BEGIN_FN_X identifier '(' opt_scalar_exp_commalist ')' ENDX
  577              | BEGIN_FN_X LEFT '(' opt_scalar_exp_commalist ')' ENDX
  578              | BEGIN_FN_X RIGHT '(' opt_scalar_exp_commalist ')' ENDX
  579              | BEGIN_FN_X LOGX '(' opt_scalar_exp_commalist ')' ENDX
  580              | BEGIN_FN_X identifier '(' scalar_exp IN_L scalar_exp ')' ENDX
  581              | BEGIN_CALL_X function_name '(' opt_scalar_exp_commalist ')' ENDX
  582              | BEGIN_CALL_X function_name ENDX
  583              | BEGIN_FN_X USER '(' opt_scalar_exp_commalist ')' ENDX
  584              | BEGIN_FN_X CHARACTER '(' opt_scalar_exp_commalist ')' ENDX
  585              | BEGIN_FN_X TIMESTAMP_FUNC '(' SQL_TSI ',' scalar_exp ',' scalar_exp ')' ENDX
  586              | BEGIN_FN_X CONVERT '(' scalar_exp ',' NAME ')' ENDX
  587              | BEGIN_FN_X EXTRACT '(' NAME FROM scalar_exp ')' ENDX
  588              | CALL '(' scalar_exp ')' '(' opt_arg_commalist ')'
  589              | CURRENT_DATE
  590              | CURRENT_TIME
  591              | CURRENT_TIME '(' scalar_exp ')'
  592              | CURRENT_TIMESTAMP
  593              | CURRENT_TIMESTAMP '(' scalar_exp ')'
  594              | GROUPING '(' column_ref ')'

  595 sql: BEGIN_EQCALL_X q_table_name ENDX
  596    | BEGIN_EQCALL_X q_table_name '(' opt_scalar_exp_commalist ')' ENDX

  597 obe_literal: BEGINX identifier atom ENDX
  598            | BEGIN_U_X STRING ENDX

  599 scalar_exp_commalist: scalar_exp
  600                     | scalar_exp_commalist ',' scalar_exp

  601 select_scalar_exp_commalist: scalar_exp
  602                            | as_expression
  603                            | select_scalar_exp_commalist ',' scalar_exp
  604                            | select_scalar_exp_commalist ',' as_expression

  605 atom_no_obe: parameter_ref
  606            | literal
  607            | USER

  608 atom: atom_no_obe
  609     | obe_literal

  610 simple_case: CASE scalar_exp simple_when_list ENDX

  611 searched_case: CASE searched_when_list ENDX

  612 searched_when_list: searched_when
  613                   | searched_when_list searched_when

  614 simple_when_list: simple_when
  615                 | simple_when_list simple_when

  616 simple_when: WHEN scalar_exp THEN scalar_exp
  617            | ELSE scalar_exp

  618 searched_when: WHEN search_condition THEN scalar_exp
  619              | ELSE scalar_exp

  620 coalesce_exp: COALESCE '(' scalar_exp_commalist ')'

  621 nullif_exp: NULLIF '(' scalar_exp ',' scalar_exp ')'

  622 parameter_ref: parameter
  623              | parameter parameter
  624              | parameter INDICATOR parameter

  625 aggregate_ref: AGGREGATE function_name '(' opt_arg_commalist ')'
  626              | AMMSC '(' DISTINCT scalar_exp ')'
  627              | AMMSC '(' ALL scalar_exp ')'
  628              | AMMSC '(' scalar_exp ')'

  629 literal: STRING
  630        | WSTRING
  631        | INTNUM
  632        | APPROXNUM
  633        | BINARYNUM
  634        | NULLX

  635 signed_literal: STRING
  636               | WSTRING
  637               | INTNUM
  638               | '-' INTNUM
  639               | '+' INTNUM
  640               | APPROXNUM
  641               | '-' APPROXNUM
  642               | '+' APPROXNUM
  643               | BINARYNUM
  644               | NULLX

  645 q_table_name: identifier
  646             | identifier '.' identifier
  647             | identifier '.' identifier '.' identifier
  648             | identifier '.' '.' identifier

  649 attach_q_table_name: identifier
  650                    | identifier '.' identifier
  651                    | identifier '.' identifier '.' identifier
  652                    | identifier '.' '.' identifier

  653 new_proc_or_bif_name: identifier
  654                     | identifier '.' identifier
  655                     | identifier '.' identifier '.' identifier
  656                     | identifier '.' '.' identifier

  657 new_table_name: identifier
  658               | identifier '.' identifier
  659               | identifier '.' identifier '.' identifier
  660               | identifier '.' '.' identifier

  661 table: q_table_name opt_table_opt
  662      | q_table_name AS identifier opt_table_opt
  663      | q_table_name identifier opt_table_opt

  664 column_ref: identifier
  665           | identifier '.' identifier
  666           | identifier '.' identifier '.' identifier
  667           | identifier '.' identifier '.' identifier '.' identifier
  668           | identifier '.' '.' identifier '.' identifier
  669           | '*'
  670           | identifier '.' '*'
  671           | identifier '.' identifier '.' '*'
  672           | identifier '.' identifier '.' identifier '.' '*'
  673           | identifier '.' '.' identifier '.' '*'

  674 base_data_type: NUMERIC
  675               | NUMERIC '(' INTNUM ')'
  676               | NUMERIC '(' INTNUM ',' INTNUM ')'
  677               | DECIMAL
  678               | DECIMAL '(' INTNUM ')'
  679               | DECIMAL '(' INTNUM ',' INTNUM ')'
  680               | INTEGER
  681               | SMALLINT
  682               | FLOAT
  683               | FLOAT '(' INTNUM ')'
  684               | REAL
  685               | DOUBLE PRECISION
  686               | LONG VARCHAR
  687               | LONG VARBINARY
  688               | VARBINARY
  689               | VARBINARY '(' INTNUM ')'
  690               | BINARY '(' INTNUM ')'
  691               | TIMESTAMP
  692               | DATETIME
  693               | TIME
  694               | DATE
  695               | NCHAR
  696               | NCHAR '(' INTNUM ')'
  697               | NVARCHAR
  698               | NVARCHAR '(' INTNUM ')'
  699               | LONG NVARCHAR
  700               | ANY
  701               | ANY '(' INTNUM ')'

  702 data_type: base_data_type
  703          | CHARACTER
  704          | VARCHAR
  705          | VARCHAR '(' INTNUM ')'
  706          | CHARACTER '(' INTNUM ')'

  707 array_modifier: ARRAY
  708               | ARRAY '[' INTNUM ']'

  709 data_type_ref: data_type_ref array_modifier
  710              | data_type
  711              | q_type_name

  712 column_data_type: base_data_type
  713                 | CHARACTER
  714                 | VARCHAR
  715                 | VARCHAR '(' INTNUM ')'
  716                 | CHARACTER '(' INTNUM ')'
  717                 | q_type_name
  718                 | LONG q_type_name
  719                 | LONG XML

  720 column: identifier
  721       | identifier '.' identifier '.' identifier '.' identifier

  722 index: identifier

  723 cursor: identifier

  724 parameter: PARAMETER_L
  725          | NAMED_PARAMETER

  726 user: identifier

  727 opt_log: /* empty */
  728        | STRING

  729 comma_opt_log: /* empty */
  730              | ',' STRING

  731 admin_statement: SHUTDOWN opt_log
  732                | CHECKPOINT opt_log
  733                | CHECKPOINT STRING STRING
  734                | BACKUP STRING
  735                | CHECK
  736                | SYNC REPLICATION opt_log comma_opt_log
  737                | DISCONNECT REPLICATION opt_log
  738                | LOGX ON
  739                | LOGX OFF

  740 sql: user_aggregate_declaration
  741    | routine_declaration
  742    | module_declaration
  743    | method_declaration
  744    | trigger_def
  745    | drop_trigger
  746    | drop_proc

  747 user_aggregate_declaration: CREATE AGGREGATE new_table_name rout_parameter_list opt_return FROM new_proc_or_bif_name ',' new_proc_or_bif_name ',' new_proc_or_bif_name user_aggregate_merge_opt

  748 user_aggregate_merge_opt: /* empty */
  749                         | ',' new_proc_or_bif_name

  750 routine_declaration: CREATE routine_head new_table_name rout_parameter_list opt_return rout_alt_type compound_statement
  751                    | ATTACH routine_head attach_q_table_name rout_parameter_list opt_return rout_alt_type opt_as FROM literal
  752                    | CREATE routine_head new_table_name rout_parameter_list opt_return rout_alt_type LANGUAGE external_language_name EXTERNAL NAME_L STRING opt_type_option_list

  753 module_body_part: routine_head identifier rout_parameter_list opt_return rout_alt_type compound_statement

  754 module_body: module_body_part ';'
  755            | module_body module_body_part ';'

  756 module_declaration: CREATE MODULE new_table_name BEGINX module_body ENDX

  757 routine_head: FUNCTION
  758             | PROCEDURE

  759 opt_return: /* empty */
  760           | RETURNS data_type_ref

  761 rout_parameter_list: '(' ')'
  762                    | '(' parameter_commalist ')'

  763 parameter_commalist: rout_parameter
  764                    | parameter_commalist ',' rout_parameter

  765 rout_parameter: parameter_mode column_ref data_type_ref rout_alt_type
  766               | parameter_mode column_ref data_type_ref DEFAULT signed_literal rout_alt_type
  767               | parameter_mode column_ref data_type_ref EQUALS signed_literal rout_alt_type

  768 parameter_mode: IN_L
  769               | OUT_L
  770               | INOUT_L

  771 opt_parameter_mode: /* empty */
  772                   | parameter_mode

  773 opt_soap_enc_mode: /* empty */
  774                  | __SOAP_DIME_ENC IN_L
  775                  | __SOAP_DIME_ENC OUT_L
  776                  | __SOAP_DIME_ENC INOUT_L
  777                  | __SOAP_ENC_MIME IN_L
  778                  | __SOAP_ENC_MIME OUT_L
  779                  | __SOAP_ENC_MIME INOUT_L

  780 soap_proc_opt_list: soap_proc_opt
  781                   | soap_proc_opt_list ',' soap_proc_opt

  782 soap_proc_opt: NAME EQUALS signed_literal

  783 soap_kwd: __SOAP_TYPE
  784         | __SOAP_HEADER
  785         | __SOAP_FAULT
  786         | __SOAP_DOC
  787         | __SOAP_XML_TYPE
  788         | __SOAP_DOCW
  789         | __SOAP_HTTP

  790 rout_alt_type: /* empty */
  791              | __SOAP_OPTIONS '(' soap_kwd EQUALS STRING opt_soap_enc_mode ',' soap_proc_opt_list ')'
  792              | soap_kwd STRING opt_soap_enc_mode

  793 routine_statement: select_statement
  794                  | update_statement_positioned
  795                  | update_statement_searched
  796                  | insert_statement
  797                  | delete_statement_positioned
  798                  | delete_statement_searched
  799                  | close_statement
  800                  | fetch_statement
  801                  | open_statement
  802                  | rollback_statement
  803                  | commit_statement
  804                  | /* empty */

  805 @2: /* empty */

  806 compound_statement: BEGINX @2 statement_list ENDX

  807 statement_list: statement_in_cs
  808               | statement_list statement_in_cs

  809 statement_in_cs: local_declaration ';'
  810                | compound_statement

  811 @3: /* empty */

  812 statement_in_cs: @3 statement_in_cs_oper

  813 statement_in_cs_oper: routine_statement ';'
  814                     | control_statement
  815                     | identifier COLON statement_in_cs
  816                     | HTMLSTR
  817                     | COMPARISON scalar_exp HTMLSTR
  818                     | '/' scalar_exp HTMLSTR

  819 statement: compound_statement

  820 @4: /* empty */

  821 statement: @4 routine_statement ';'

  822 @5: /* empty */

  823 statement: @5 control_statement

  824 local_declaration: cursor_def
  825                  | variable_declaration
  826                  | handler_declaration

  827 variable_declaration: DECLARE variable_list data_type_ref

  828 variable_list: identifier
  829              | variable_list ',' identifier

  830 condition: NOT FOUND
  831          | SQLSTATE STRING
  832          | SQLSTATE VALUE STRING
  833          | SQLEXCEPTION
  834          | SQLWARNING

  835 handler_statement: compound_statement
  836                  | routine_statement
  837                  | call_statement
  838                  | method_invocation
  839                  | static_method_invocation
  840                  | set_statement
  841                  | RESIGNAL
  842                  | RESIGNAL scalar_exp
  843                  | return_statement
  844                  | assignment_statement
  845                  | if_statement
  846                  | goto_statement
  847                  | for_statement
  848                  | while_statement

  849 handler_declaration: WHENEVER condition GOTO identifier
  850                    | WHENEVER condition GO TO identifier
  851                    | WHENEVER condition DEFAULT
  852                    | DECLARE handler_type HANDLER FOR cond_value_list handler_statement

  853 handler_type: CONTINUE
  854             | EXIT

  855 cond_value_list: condition
  856                | cond_value_list ',' condition

  857 control_statement: call_statement ';'
  858                  | method_invocation ';'
  859                  | static_method_invocation ';'
  860                  | set_statement ';'
  861                  | RESIGNAL ';'
  862                  | RESIGNAL scalar_exp ';'
  863                  | return_statement ';'
  864                  | assignment_statement ';'
  865                  | if_statement
  866                  | goto_statement ';'
  867                  | for_statement
  868                  | while_statement

  869 assignment_statement: lvalue EQUALS scalar_exp
  870                     | column_ref '[' scalar_exp ']' EQUALS scalar_exp

  871 lvalue: column_ref
  872       | member_observer

  873 if_statement: IF '(' search_condition ')' statement opt_else

  874 opt_else: /* empty */
  875         | ELSE statement

  876 call_statement: CALL function_name '(' opt_arg_commalist ')'
  877               | function_call

  878 set_statement: SET identifier COMPARISON scalar_exp
  879              | SET identifier ON
  880              | SET identifier OFF

  881 goto_statement: GOTO identifier
  882               | GO TO identifier

  883 return_statement: RETURN scalar_exp
  884                 | RETURN

  885 while_statement: WHILE '(' search_condition ')' statement

  886 for_init_statement: assignment_statement
  887                   | variable_declaration
  888                   | call_statement
  889                   | static_method_invocation

  890 for_init_statement_list: /* empty */
  891                        | for_init_statement
  892                        | for_init_statement_list ',' for_init_statement

  893 for_inc_statement: assignment_statement
  894                  | call_statement
  895                  | static_method_invocation

  896 for_inc_statement_list: /* empty */
  897                       | for_inc_statement
  898                       | for_inc_statement_list ',' for_inc_statement

  899 for_opt_search_cond: /* empty */
  900                    | search_condition

  901 for_statement: FOR query_exp DO statement
  902              | FOR '(' for_init_statement_list ';' for_opt_search_cond ';' for_inc_statement_list ')' statement
  903              | FOREACH '(' data_type_ref identifier IN_L scalar_exp ')' DO statement

  904 trigger_def: CREATE TRIGGER identifier action_time event ON q_table_name opt_order opt_old_ref trig_action

  905 opt_order: /* empty */
  906          | ORDER INTNUM

  907 trig_action: compound_statement

  908 action_time: BEFORE
  909            | AFTER
  910            | INSTEAD OF

  911 event: INSERT
  912      | UPDATE opt_column_commalist
  913      | DELETE_L

  914 opt_old_ref: /* empty */
  915            | REFERENCING old_commalist

  916 old_commalist: old_alias
  917              | old_commalist ',' old_alias

  918 old_alias: OLD AS identifier
  919          | NEW AS identifier

  920 drop_trigger: DROP TRIGGER q_table_name

  921 drop_proc: DROP AGGREGATE q_table_name
  922          | DROP routine_head q_table_name
  923          | DROP MODULE q_table_name

  924 opt_element: /* empty */
  925            | AS identifier

  926 xml_col: column_ref
  927        | scalar_exp AS identifier
  928        | scalar_exp IN_L identifier

  929 xml_col_list: xml_col
  930             | xml_col_list ',' xml_col

  931 opt_xml_col_list: '(' xml_col_list ')'

  932 opt_pk: /* empty */
  933       | PRIMARY KEY '(' column_commalist ')'

  934 opt_join: /* empty */
  935         | ON '(' search_condition ')'

  936 opt_elt: /* empty */
  937        | NAME

  938 xml_join_elt: q_table_name identifier opt_element opt_xml_col_list opt_join opt_pk opt_elt opt_xml_child

  939 opt_xml_child: /* empty */
  940              | BEGINX xml_join_list ENDX

  941 top_xml_child: query_spec
  942              | BEGINX xml_join_list ENDX

  943 xml_join_list: xml_join_elt
  944              | xml_join_list ',' xml_join_elt

  945 opt_persist: /* empty */
  946            | PERSISTENT

  947 opt_interval: /* empty */
  948             | INTERVAL INTNUM

  949 opt_metas: /* empty */
  950          | DTD INTERNAL
  951          | DTD EXTERNAL
  952          | DTD STRING
  953          | SCHEMA EXTERNAL
  954          | SCHEMA STRING

  955 opt_publish: /* empty */
  956            | PUBLIC STRING identifier STRING opt_persist opt_interval opt_metas

  957 xmlview_param_value: NAME
  958                    | STRING

  959 xmlview_param: NAME COMPARISON xmlview_param_value

  960 xmlview_params: xmlview_param
  961               | xmlview_params xmlview_param

  962 opt_xmlview_params: /* empty */
  963                   | '[' xmlview_params ']'

  964 xml_view: CREATE XML VIEW new_table_name AS opt_xmlview_params top_xml_child opt_elt opt_publish

  965 drop_xml_view: DROP XML VIEW q_table_name

  966 string_concatenation_operator: scalar_exp STRING_CONCAT_OPERATOR scalar_exp

  967 q_type_name: identifier
  968            | identifier '.' identifier
  969            | identifier '.' identifier '.' identifier
  970            | identifier '.' '.' identifier

  971 q_old_type_name: identifier
  972                | identifier '.' identifier
  973                | identifier '.' identifier '.' identifier
  974                | identifier '.' '.' identifier

  975 new_type_name: identifier
  976              | identifier '.' identifier
  977              | identifier '.' identifier '.' identifier
  978              | identifier '.' '.' identifier

  979 @6: /* empty */

  980 user_defined_type: CREATE TYPE new_type_name opt_subtype_clause opt_external_and_language_clause @6 opt_as_type_representation opt_type_option_list opt_method_specification_list

  981 user_defined_type_drop: DROP TYPE q_old_type_name opt_drop_behavior

  982 opt_external_and_language_clause: /* empty */
  983                                 | LANGUAGE language_name EXTERNAL NAME_L STRING
  984                                 | EXTERNAL NAME_L STRING LANGUAGE language_name
  985                                 | LANGUAGE language_name

  986 opt_subtype_clause: /* empty */
  987                   | UNDER q_type_name

  988 opt_as_type_representation: /* empty */
  989                           | AS type_representation

  990 type_representation: '(' type_member_list ')'

  991 type_member_list: type_member
  992                 | type_member_list ',' type_member

  993 opt_external_clause: /* empty */
  994                    | EXTERNAL NAME_L STRING
  995                    | EXTERNAL NAME_L STRING EXTERNAL TYPE STRING
  996                    | EXTERNAL TYPE STRING

  997 opt_soap_clause: /* empty */
  998                | __SOAP_NAME STRING
  999                | __SOAP_TYPE STRING
  1000                | __SOAP_TYPE STRING __SOAP_NAME STRING
  1001                | __SOAP_NAME STRING __SOAP_TYPE STRING

  1002 opt_external_type: /* empty */
  1003                  | EXTERNAL TYPE STRING

  1004 type_member: identifier data_type_ref opt_reference_scope_check opt_default_clause opt_collate_exp opt_external_clause opt_soap_clause

  1005 opt_reference_scope_check: /* empty */
  1006                          | REFERENCES ARE CHECKED opt_on_delete_referential_rule
  1007                          | REFERENCES ARE NOT CHECKED

  1008 opt_default_clause: /* empty */
  1009                   | DEFAULT signed_literal

  1010 opt_type_option_list: /* empty */
  1011                     | type_option_list

  1012 type_option_list: type_option
  1013                 | type_option_list type_option

  1014 type_option: FINAL_L
  1015            | NOT FINAL_L
  1016            | REF USING data_type_ref
  1017            | REF FROM '(' column_commalist ')'
  1018            | REF IS SYSTEM GENERATED
  1019            | CAST '(' SOURCE AS REF ')' WITH identifier
  1020            | CAST '(' REF AS SOURCE ')' WITH identifier
  1021            | SELF_L AS REF
  1022            | TEMPORARY
  1023            | UNRESTRICTED
  1024            | __SOAP_TYPE STRING

  1025 opt_method_specification_list: /* empty */
  1026                              | method_specification_list

  1027 method_specification_list: method_specification
  1028                          | method_specification_list ',' method_specification

  1029 method_type: /* empty */
  1030            | STATIC_L
  1031            | INSTANCE_L

  1032 decl_parameter_list: '(' ')'
  1033                    | '(' decl_parameter_commalist ')'

  1034 decl_parameter_commalist: decl_parameter
  1035                         | decl_parameter_commalist ',' decl_parameter

  1036 decl_parameter: opt_parameter_mode column_ref data_type_ref opt_external_type

  1037 partial_method_specification: method_type METHOD method_identifier decl_parameter_list RETURNS data_type_ref opt_specific_method_name
  1038                             | CONSTRUCTOR METHOD method_identifier decl_parameter_list opt_specific_method_name

  1039 method_specification: partial_method_specification opt_self_result opt_method_characteristics
  1040                     | OVERRIDING partial_method_specification

  1041 opt_self_result: /* empty */
  1042                | SELF_L AS RESULT
  1043                | SELF_L AS LOCATOR
  1044                | SELF_L AS RESULT SELF_L AS LOCATOR

  1045 opt_specific_method_name: /* empty */
  1046                         | SPECIFIC new_table_name

  1047 opt_method_characteristics: /* empty */
  1048                           | method_characteristics

  1049 method_characteristics: method_characteristic
  1050                       | method_characteristics method_characteristic

  1051 method_characteristic: LANGUAGE language_name
  1052                      | PARAMETER STYLE SQL_L
  1053                      | PARAMETER STYLE GENERAL
  1054                      | DETERMINISTIC
  1055                      | NOT DETERMINISTIC
  1056                      | NO SQL_L
  1057                      | CONTAINS SQL_L
  1058                      | READS SQL_L DATA
  1059                      | MODIFIES SQL_L DATA
  1060                      | RETURNS NULLX ON NULLX INPUT
  1061                      | CALLED ON NULLX INPUT
  1062                      | EXTERNAL NAME_L STRING
  1063                      | EXTERNAL VARIABLE NAME_L STRING
  1064                      | EXTERNAL TYPE STRING

  1065 external_language_name: ADA
  1066                       | C
  1067                       | COBOL
  1068                       | FORTRAN
  1069                       | MUMPS
  1070                       | PASCAL_L
  1071                       | PLI
  1072                       | JAVA
  1073                       | CLR

  1074 language_name: external_language_name
  1075              | SQL_L

  1076 opt_constructor_return: /* empty */
  1077                       | RETURNS new_type_name

  1078 method_declaration: CREATE method_type METHOD method_identifier rout_parameter_list opt_return rout_alt_type FOR q_type_name compound_statement
  1079                   | CREATE CONSTRUCTOR METHOD q_table_name rout_parameter_list opt_constructor_return FOR q_type_name compound_statement

  1080 static_method_invocation: q_type_name DOUBLE_COLON method_identifier '(' opt_arg_commalist ')'

  1081 identifier_chain: identifier '.' identifier '.' identifier '.' method_identifier
  1082                 | identifier '.' '.' identifier '.' method_identifier
  1083                 | identifier '.' identifier_chain

  1084 identifier_chain_method: identifier '.' identifier '.' identifier '.' identifier '.' method_identifier
  1085                        | identifier '.' '.' identifier '.' identifier '.' method_identifier
  1086                        | identifier '.' identifier_chain_method

  1087 method_invocation: scalar_exp_no_col_ref_no_mem_obs_chain '.' method_identifier '(' opt_arg_commalist ')'
  1088                  | identifier_chain_method '(' opt_arg_commalist ')'
  1089                  | '(' scalar_exp_no_col_ref AS q_type_name ')' '.' method_identifier '(' opt_arg_commalist ')'
  1090                  | '(' column_ref AS q_type_name ')' '.' method_identifier '(' opt_arg_commalist ')'

  1091 top_level_method_invocation: METHOD CALL scalar_exp_no_col_ref_no_mem_obs_chain '.' method_identifier '(' opt_arg_commalist ')'
  1092                            | METHOD CALL identifier_chain_method '(' opt_arg_commalist ')'
  1093                            | METHOD CALL '(' scalar_exp_no_col_ref AS q_type_name ')' '.' method_identifier '(' opt_arg_commalist ')'
  1094                            | METHOD CALL '(' column_ref AS q_type_name ')' '.' method_identifier '(' opt_arg_commalist ')'

  1095 member_observer: member_observer_no_id_chain
  1096                | identifier '.' identifier_chain

  1097 member_observer_no_id_chain: scalar_exp_no_col_ref_no_mem_obs_chain '.' method_identifier
  1098                            | '(' scalar_exp_no_col_ref AS q_type_name ')' '.' method_identifier
  1099                            | '(' column_ref AS q_type_name ')' '.' method_identifier

  1100 method_identifier: identifier
  1101                  | EXTRACT

  1102 new_invocation: NEW q_type_name '(' opt_arg_commalist ')'

  1103 user_defined_type_alter: ALTER TYPE q_type_name alter_type_action

  1104 alter_type_action: ADD ATTRIBUTE type_member
  1105                  | DROP ATTRIBUTE identifier opt_drop_behavior
  1106                  | ADD method_specification
  1107                  | DROP partial_method_specification opt_drop_behavior

  1108 opt_with_permission_set: /* empty */
  1109                        | WITH PERMISSION_SET COMPARISON SAFE_L
  1110                        | WITH PERMISSION_SET COMPARISON UNRESTRICTED

  1111 opt_with_autoregister: /* empty */
  1112                      | WITH AUTOREGISTER_L

  1113 create_library: CREATE LIBRARY_L q_table_name AS scalar_exp opt_with_permission_set opt_with_autoregister

  1114 create_assembly: CREATE ASSEMBLY_L q_table_name FROM scalar_exp opt_with_permission_set opt_with_autoregister

  1115 drop_library: DROP LIBRARY_L q_table_name

  1116 drop_assembly: DROP ASSEMBLY_L q_table_name

Terminals, with rules where they appear

$end (0) 0
'(' (40) 99 126 132 135 136 138 139 140 141 155 185 189 191 233 272
    276 284 331 346 348 354 367 369 402 405 417 421 422 424 428 441
    445 449 450 460 483 484 491 506 507 523 524 537 540 573 574 575
    576 577 578 579 580 581 583 584 585 586 587 588 591 593 594 596
    620 621 625 626 627 628 675 676 678 679 683 689 690 696 698 701
    705 706 715 716 761 762 791 873 876 885 902 903 931 933 935 990
    1017 1019 1020 1032 1033 1080 1087 1088 1089 1090 1091 1092 1093
    1094 1098 1099 1102
')' (41) 99 126 132 135 136 138 139 140 141 155 185 189 191 233 272
    276 284 331 346 348 354 367 369 402 405 417 421 422 424 428 441
    445 449 450 460 483 484 491 506 507 523 524 537 540 573 574 575
    576 577 578 579 580 581 583 584 585 586 587 588 591 593 594 596
    620 621 625 626 627 628 675 676 678 679 683 689 690 696 698 701
    705 706 715 716 761 762 791 873 876 885 902 903 931 933 935 990
    1017 1019 1020 1032 1033 1080 1087 1088 1089 1090 1091 1092 1093
    1094 1098 1099 1102
'*' (42) 494 669 670 671 672 673
'+' (43) 493 496 639 642
',' (44) 101 122 135 136 145 147 164 166 211 218 251 334 344 352 368
    369 373 377 414 416 507 524 537 563 565 566 570 571 574 585 586
    600 603 604 621 676 679 730 747 749 764 781 791 829 856 892 898
    917 930 944 992 1028 1035
'-' (45) 492 497 638 641
'.' (46) 554 555 556 557 558 646 647 648 650 651 652 654 655 656 658
    659 660 665 666 667 668 670 671 672 673 721 968 969 970 972 973
    974 976 977 978 1081 1082 1083 1084 1085 1086 1087 1089 1090 1091
    1093 1094 1096 1097 1098 1099
'/' (47) 495 818
';' (59) 1 754 755 809 813 821 857 858 859 860 861 862 863 864 866
    902
'[' (91) 548 550 708 870 963
']' (93) 548 550 708 870 963
error (256)
NAME (258) 33 325 326 342 455 456 575 586 587 782 937 957 959
STRING (259) 135 136 180 195 203 261 263 265 286 288 400 403 598 629
    635 728 730 733 734 752 791 792 831 832 952 954 956 958 983 984
    994 995 996 998 999 1000 1001 1003 1024 1062 1063 1064
WSTRING (260) 630 636
INTNUM (261) 120 342 350 366 368 631 637 638 639 675 676 678 679 683
    689 690 696 698 701 705 706 708 715 716 906 948
APPROXNUM (262) 632 640 641 642
NUM_ERROR (263)
AMMSC (264) 626 627 628
PARAMETER_L (265) 724
NAMED_PARAMETER (266) 725
BEGIN_EQCALL_X (267) 595 596
HTMLSTR (268) 816 817 818
SQL_TSI (269) 574 585
TIMESTAMP_FUNC (270) 574 585
BINARYNUM (271) 633 643
MSSQL_XMLCOL_NAME (272) 543
MSSQL_XMLCOL_NAME1 (273) 541 542 543
MSSQL_XMLCOL_NAMEYZ (274) 542
MSSQL_XMLCOL_NAMEZ (275) 541 543
MSSQL_XMLCOL_INTNUM (276) 541 542 543
TYPE (277) 34 980 981 995 996 1003 1064 1103
FINAL_L (278) 35 1014 1015
METHOD (279) 36 301 1037 1038 1078 1079 1091 1092 1093 1094
CHECKED (280) 37 1006 1007
SYSTEM (281) 38 1018
GENERATED (282) 39 1018
SOURCE (283) 40 1019 1020
RESULT (284) 41 1042 1044
LOCATOR (285) 42 1043 1044
INSTANCE_L (286) 43 1031
CONSTRUCTOR (287) 44 1038 1079
SELF_L (288) 45 1021 1042 1043 1044
OVERRIDING (289) 46 1040
STYLE (290) 47 1052 1053
SQL_L (291) 48 1052 1056 1057 1058 1059 1075
GENERAL (292) 49 1053
DETERMINISTIC (293) 50 1054 1055
NO (294) 51 1056
CONTAINS (295) 52 1057
READS (296) 53 1058
DATA (297) 54 1058 1059
MODIFIES (298) 55 1059
INPUT (299) 56 1060 1061
CALLED (300) 57 1061
ADA (301) 58 1065
C (302) 59 1066
COBOL (303) 60 1067
FORTRAN (304) 61 1068
MUMPS (305) 62 1069
PASCAL_L (306) 63 1070
PLI (307) 64 1071
NAME_L (308) 65 752 983 984 994 995 1062 1063
TEXT_L (309) 66 272 277 278 341
JAVA (310) 67 1072
INOUT_L (311) 68 770 776 779
REMOTE (312) 69 242
KEYSET (313) 70 245
VALUE (314) 71 832
PARAMETER (315) 72 1052 1053
VARIABLE (316) 73 1063
ADMIN_L (317) 76 199
ROLE_L (318) 223 228
TEMPORARY (319) 75 1022
CLR (320) 74 1073
ATTRIBUTE (321) 89 1104 1105
__SOAP_DOC (322) 77 786
__SOAP_DOCW (323) 78 788
__SOAP_HEADER (324) 79 784
__SOAP_HTTP (325) 80 789
__SOAP_NAME (326) 81 998 1000 1001
__SOAP_TYPE (327) 82 783 999 1000 1001 1024
__SOAP_XML_TYPE (328) 83 787
__SOAP_FAULT (329) 84 785
__SOAP_DIME_ENC (330) 85 774 775 776
__SOAP_ENC_MIME (331) 86 777 778 779
__SOAP_OPTIONS (332) 87 791
FOREACH (333) 98 903
ARE (334) 1006 1007
REF (335) 1016 1017 1018 1019 1020 1021
STATIC_L (336) 243 1030
SPECIFIC (337) 1046
DYNAMIC (338) 244
COLUMN (339) 162
START_L (340) 88 119
AS (341) 184 185 236 242 265 270 422 427 540 544 545 547 662 918 919
    925 927 964 989 1019 1020 1021 1042 1043 1044 1089 1090 1093 1094
    1098 1099 1113
DOUBLE_COLON (342) 1080
COLON (343) 815
OR (344) 457
AND (345) 458 472 473
NOT (346) 123 240 290 459 472 474 479 481 483 830 1007 1015 1055
COMPARISON (347) 374 471 485 817 878 959 1109 1110
EQUALS (348) 767 782 791 869 870
STRING_CONCAT_OPERATOR (349) 966
UMINUS (350)
ALL (351) 192 207 208 361 387 389 391 394 396 398 487 627
ANY (352) 486 700 701
ATTACH (353) 234 751
ASC (354) 255
AUTHORIZATION (355)
BETWEEN (356) 472 473
BY (357) 120 131 249 405 448 449 450
CASCADE (358) 113 175 225 227
CHARACTER (359) 584 703 706 713 716
CHECK (360) 132 140 187 735
CLOSE (361) 320
COMMIT (362) 321
CONSTRAINT (363) 143 177
CONTINUE (364) 853
CREATE (365) 99 155 180 184 185 222 223 257 264 265 272 277 747 750
    752 756 904 964 980 1078 1079 1113 1114
CUBE (366) 450
CURRENT (367) 322 370
CURSOR (368) 246 247
DECIMAL (369) 677 678 679
DECLARE (370) 246 247 827 852
DEFAULT (371) 115 128 766 851 1009
DELETE_L (372) 110 214 224 225 231 267 322 323 913
DESC (373) 256
DISTINCT (374) 362 626
DOUBLE (375) 685
DROP (376) 156 159 160 168 172 226 227 228 258 268 278 920 921 922
    923 965 981 1105 1107 1115 1116
ESCAPE (377) 477 478
EXISTS (378) 489
FETCH (379) 324 325 326
FLOAT (380) 682 683
FOR (381) 246 247 257 258 259 454 455 456 852 901 902 1078 1079
FOREIGN (382) 139
FOUND (383) 830
FROM (384) 200 201 202 203 204 234 264 322 323 412 575 587 747 751
    1017 1114
GOTO (385) 849 881
GO (386) 850 882
GRANT (387) 192 193 194 195 196 197 206
GROUP (388) 229 230 231 448 449 450
GROUPING (389) 594
HAVING (390) 452
IN_L (391) 481 482 483 484 580 768 774 777 903 928
INDEX (392) 155 156 272 339 340 341
INDICATOR (393) 624
INSERT (394) 213 290 330 911
INTEGER (395) 680
INTO (396) 324 325 326 327 359
IS (397) 479 480 1018
KEY (398) 127 138 139 233 282 340 341 933
LANGUAGE (399) 286 752 983 984 985 1051
ENCODING (400) 288
LIKE (401) 474 475
NULLX (402) 114 123 124 479 480 634 644 1060 1061
NUMERIC (403) 674 675 676
OF (404) 322 370 910
ON (405) 108 110 155 193 194 195 196 200 201 202 203 272 277 278 444
    738 879 904 935 1060 1061
OPEN (406) 355
OPTION (407) 187 199 206 346 348
ORDER (408) 249 336 906
PRECISION (409) 685
PRIMARY (410) 127 138 233 340 933
PRIVILEGES (411) 192 207
PROCEDURE (412) 185 758
PUBLIC (413) 219 956
REAL (414) 684
REFERENCES (415) 116 216 1006 1007
RESTRICT (416) 176
ROLLBACK (417) 356
ROLLUP (418) 449
SCHEMA (419) 133 180 953 954
SELECT (420) 212 240 359 406 407 408 491
SET (421) 114 115 221 229 370 375 878 879 880
SMALLINT (422) 681
SOME (423) 488
SQLCODE (424)
SQLERROR (425)
TABLE (426) 99 159 167 168 169 170 179 234 348
TO (427) 192 193 194 195 196 197 850 882
UNION (428) 386 387 393 394
UNIQUE (429) 134 141 149
UPDATE (430) 108 215 271 370 375 454 912
USER (431) 222 224 225 226 227 229 230 231 238 583 607
VALUES (432) 331
VIEW (433) 160 184 185 964 965
WHENEVER (434) 849 850 851
WHERE (435) 263 322 370 446
WITH (436) 119 133 187 199 206 267 282 284 358 364 1019 1020 1109 1110
    1112
WORK (437) 321 356
ARRAY (438) 707 708
CONTIGUOUS (439)
OBJECT_ID (440) 150
UNDER (441) 137 196 202 987
CLUSTERED (442) 148 284
VARCHAR (443) 686 704 705 714 715
VARBINARY (444) 687 688 689
BINARY (445) 690
LONG (446) 686 687 699 718 719
REPLACING (447) 328
SOFT (448) 329
HASH (449) 337
LOOP (450) 338
SHUTDOWN (451) 731
CHECKPOINT (452) 732 733
BACKUP (453) 734
REPLICATION (454) 736 737
SYNC (455) 736
ALTER (456) 167 168 169 170 179 1103
ADD (457) 167 171 230 1104 1106
RENAME (458) 170
DISCONNECT (459) 737
MODIFY (460) 169 173
BEFORE (461) 908
AFTER (462) 909
INSTEAD (463) 910
TRIGGER (464) 277 278 904 920
REFERENCING (465) 915
OLD (466) 918
AGGREGATE (467) 625 747 921
FUNCTION (468) 274 757
OUT_L (469) 769 775 778
HANDLER (470) 852
IF (471) 873
THEN (472) 616 618
ELSE (473) 617 619 875
ELSEIF (474)
WHILE (475) 885
BEGINX (476) 478 597 756 806 940 942
ENDX (477) 440 478 576 577 578 579 580 581 582 583 584 585 586 587
    595 596 597 598 610 611 756 806 940 942
RETURN (478) 883 884
CALL (479) 301 588 876 1091 1092 1093 1094
RETURNS (480) 760 1037 1060 1077
DO (481) 901 903
EXCLUSIVE (482) 349
PREFETCH (483) 350
SQLSTATE (484) 831 832
SQLWARNING (485) 834
SQLEXCEPTION (486) 833
EXIT (487) 854
RESIGNAL (488) 841 842 861 862
REVOKE (489) 200 201 202 203 204
PASSWORD (490) 221 238
OFF (491) 739 880
LOGX (492) 257 258 259 561 579 738 739
TIMESTAMP (493) 691
DATE (494) 694
DATETIME (495) 692
TIME (496) 693
EXECUTE (497) 194 201
REXECUTE (498) 90 195 203
MODULE (499) 756 923
BEGIN_FN_X (500) 576 577 578 579 580 583 584 585 586 587
BEGIN_CALL_X (501) 581 582
BEGIN_OJ_X (502) 440
BEGIN_U_X (503) 598
CONVERT (504) 537 586
CASE (505) 610 611
WHEN (506) 616 618
IDENTITY (507) 125 126
LEFT (508) 430 559 577
RIGHT (509) 431 560 578
FULL (510) 432
OUTER (511) 436
INNER (512) 433
CROSS (513) 434
NATURAL (514) 437
USING (515) 274 445 1016
JOIN (516) 442
USE (517) 319
COALESCE (518) 620
CAST (519) 540 1019 1020
NULLIF (520) 621
NEW (521) 919 1102
CORRESPONDING (522) 405
EXCEPT (523) 390 391 397 398
INTERSECT (524) 388 389 395 396
BEST (525) 384
TOP (526) 366 367 368 369
PERCENT (527)
TIES (528) 364
XML (529) 180 280 455 456 719 964 965
XPATH (530) 400 403
PERSISTENT (531) 946
INTERVAL (532) 948
INCREMENT_L (533) 97 120
DTD (534) 950 951 952
INTERNAL (535) 950
EXTERNAL (536) 752 951 953 983 984 994 995 996 1003 1062 1063 1064
COLLATE (537) 129 539
NCHAR (538) 695 696
NVARCHAR (539) 697 698 699
INCREMENTAL (540)
NONINCREMENTAL (541) 265 270
PURGE (542) 259
SNAPSHOT (543) 257 258 259 264 265 268 271
IDENTIFIED (544) 131
EXTRACT (545) 575 587 1101
KWD_TAG (546) 562 563
LEXICAL_ERROR (547)
CURRENT_DATE (548) 589
CURRENT_TIME (549) 590 591
CURRENT_TIMESTAMP (550) 592 593
PERMISSION_SET (551) 91 1109 1110
AUTOREGISTER_L (552) 92 1112
LIBRARY_L (553) 93 1113 1115
ASSEMBLY_L (554) 94 1114 1116
SAFE_L (555) 95 1109
UNRESTRICTED (556) 96 1023 1110

Nonterminals, with rules where they appear

$accept (313)
    on left: 0
sql_list (314)
    on left: 1 2, on right: 0
sql_list1 (315)
    on left: 3, on right: 1 2
sql (316)
    on left: 4 5 6 7 8 9 10 11 12 291 595 596 740 741 742 743 744 745
    746, on right: 3
schema_element_list (317)
    on left: 13 14 15 16, on right: 4 15 16
schema_element (318)
    on left: 17 18 19 20 21 22 23 24 25 26 27 28 29 30 31 32,
    on right: 13 15
identifier (319)
    on left: 33 34 35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
    51 52 53 54 55 56 57 58 59 60 61 62 63 64 65 66 67 68 69 70 71
    72 73 74 75 76 77 78 79 80 81 82 83 84 85 86 87 88 89 90 91 92
    93 94 95 96 97 98, on right: 143 156 177 221 246 247 319 339 421
    422 424 426 427 544 545 546 553 554 555 556 557 558 562 563 576
    580 597 645 646 647 648 649 650 651 652 653 654 655 656 657 658
    659 660 662 663 664 665 666 667 668 670 671 672 673 720 721 722
    723 726 753 815 828 829 849 850 878 879 880 881 882 903 904 918
    919 925 927 928 938 956 967 968 969 970 971 972 973 974 975 976
    977 978 1004 1019 1020 1081 1082 1083 1084 1085 1086 1096 1100
    1105
base_table_def (320)
    on left: 99, on right: 17
base_table_element_commalist (321)
    on left: 100 101, on right: 99 101
base_table_element (322)
    on left: 102 103, on right: 100 101
column_def (323)
    on left: 104, on right: 102 163 164 169 415 416
opt_referential_triggered_action (324)
    on left: 105 106 107, on right: 116
referential_rule (325)
    on left: 108 109, on right: 106 107
delete_referential_rule (326)
    on left: 110, on right: 109 112
opt_on_delete_referential_rule (327)
    on left: 111 112, on right: 1006
referential_action (328)
    on left: 113 114 115, on right: 108 110
references (329)
    on left: 116, on right: 130 139
column_def_opt_list (330)
    on left: 117 118, on right: 104 118
identity_opt (331)
    on left: 119 120, on right: 121 122
identity_opt_list (332)
    on left: 121 122, on right: 122 126
column_def_opt (333)
    on left: 123 124 125 126 127 128 129 130 131 132 133 134,
    on right: 118
column_xml_schema_def (334)
    on left: 135 136, on right: 133
table_constraint_def (335)
    on left: 137 138 139 140 141, on right: 103 178
opt_constraint_name (336)
    on left: 142 143, on right: 138 139 140 141
column_commalist (337)
    on left: 144 145, on right: 139 141 145 189 191 233 284 405 419
    445 933 1017
index_column_commalist (338)
    on left: 146 147, on right: 138 147 155
index_option (339)
    on left: 148 149 150, on right: 151 152
index_option_list (340)
    on left: 151 152, on right: 152 154
opt_index_option_list (341)
    on left: 153 154, on right: 138 155
create_index_def (342)
    on left: 155, on right: 18
drop_index (343)
    on left: 156, on right: 20
opt_table (344)
    on left: 157 158, on right: 156
drop_table (345)
    on left: 159 160, on right: 19
opt_col_add_column (346)
    on left: 161 162, on right: 167 168 169
add_col_column_def_list (347)
    on left: 163 164, on right: 164 167
add_col_column_list (348)
    on left: 165 166, on right: 166 168
add_column (349)
    on left: 167 168 169, on right: 14 16
table_rename (350)
    on left: 170, on right: 21
constraint_op (351)
    on left: 171 172 173, on right: 179
opt_drop_behavior (352)
    on left: 174 175 176, on right: 177 981 1105 1107
opt_table_constraint_def (353)
    on left: 177 178, on right: 179
alter_constraint (354)
    on left: 179, on right: 8
create_xml_schema (355)
    on left: 180, on right: 7
view_query_spec (356)
    on left: 181 182, on right: 184
view_def (357)
    on left: 184 185, on right: 5
@1 (358)
    on left: 183, on right: 184
opt_with_check_option (359)
    on left: 186 187, on right: 184
opt_column_commalist (360)
    on left: 188 189, on right: 116 184 912
priv_opt_column_commalist (361)
    on left: 190 191, on right: 212 215 216 330
privilege_def (362)
    on left: 192 193 194 195 196 197, on right: 22
opt_with_admin_option (363)
    on left: 198 199, on right: 197
privilege_revoke (364)
    on left: 200 201 202 203 204, on right: 23
opt_with_grant_option (365)
    on left: 205 206, on right: 193 194 196
privileges (366)
    on left: 207 208 209, on right: 193 200
operation_commalist (367)
    on left: 210 211, on right: 209 211
operation (368)
    on left: 212 213 214 215 216, on right: 210 211
grantee_commalist (369)
    on left: 217 218, on right: 193 194 195 196 197 200 201 202 203
    204 218
grantee (370)
    on left: 219 220, on right: 192 217 218
set_pass (371)
    on left: 221, on right: 26
create_user_statement (372)
    on left: 222 223, on right: 24
delete_user_statement (373)
    on left: 224 225 226 227 228, on right: 25
set_group_stmt (374)
    on left: 229, on right: 27
add_group_stmt (375)
    on left: 230, on right: 28
delete_group_stmt (376)
    on left: 231, on right: 29
opt_attach_primary_key (377)
    on left: 232 233, on right: 234
attach_table (378)
    on left: 234, on right: 309
opt_as (379)
    on left: 235 236, on right: 234 751
opt_login (380)
    on left: 237 238, on right: 234
opt_not_select (381)
    on left: 239 240, on right: 234
opt_remote_name (382)
    on left: 241 242, on right: 234
cursor_type (383)
    on left: 243 244 245, on right: 247
cursor_def (384)
    on left: 246 247, on right: 824
opt_order_by_clause (385)
    on left: 248 249, on right: 402 411
ordering_spec_commalist (386)
    on left: 250 251, on right: 249 251 448 449 450
ordering_spec (387)
    on left: 252 253, on right: 250 251
opt_asc_desc (388)
    on left: 254 255 256, on right: 146 147 252 253
create_snapshot_log (389)
    on left: 257, on right: 310
drop_snapshot_log (390)
    on left: 258, on right: 311
purge_snapshot_log (391)
    on left: 259, on right: 312
opt_snapshot_string_literal (392)
    on left: 260 261, on right: 264
opt_snapshot_where_clause (393)
    on left: 262 263, on right: 264
create_snapshot (394)
    on left: 264 265, on right: 313
opt_with_delete (395)
    on left: 266 267, on right: 268
drop_snapshot (396)
    on left: 268, on right: 314
opt_nonincremental (397)
    on left: 269 270, on right: 271
refresh_snapshot (398)
    on left: 271, on right: 315
create_freetext_index (399)
    on left: 272, on right: 316
opt_data_modification_action (400)
    on left: 273 274, on right: 272
opt_column (401)
    on left: 275 276, on right: 277 278
create_freetext_trigger (402)
    on left: 277, on right: 317
drop_freetext_trigger (403)
    on left: 278, on right: 318
opt_xml (404)
    on left: 279 280, on right: 272
opt_with_key (405)
    on left: 281 282, on right: 272
opt_with (406)
    on left: 283 284, on right: 272
opt_lang (407)
    on left: 285 286, on right: 272
opt_enc (408)
    on left: 287 288, on right: 272
opt_deffer_generation (409)
    on left: 289 290, on right: 272
manipulative_statement (410)
    on left: 292 293 294 295 296 297 298 299 300 301 302 303 304 305
    306 307 308 309 310 311 312 313 314 315 316 317 318,
    on right: 291
use_statement (411)
    on left: 319, on right: 308
close_statement (412)
    on left: 320, on right: 799
commit_statement (413)
    on left: 321, on right: 305 803
delete_statement_positioned (414)
    on left: 322, on right: 297 797
delete_statement_searched (415)
    on left: 323, on right: 298 798
fetch_statement (416)
    on left: 324 325 326, on right: 800
insert_mode (417)
    on left: 327 328 329, on right: 330
insert_statement (418)
    on left: 330, on right: 296 796
values_or_query_spec (419)
    on left: 331 332, on right: 330
insert_atom_commalist (420)
    on left: 333 334, on right: 331 334
insert_atom (421)
    on left: 335, on right: 333 334
sql_option (422)
    on left: 336 337 338 339 340 341 342, on right: 343 344
sql_opt_commalist (423)
    on left: 343 344, on right: 344 346 348
opt_sql_opt (424)
    on left: 345 346, on right: 411
opt_table_opt (425)
    on left: 347 348, on right: 661 662 663
cursor_option (426)
    on left: 349 350, on right: 351 352
cursor_options_commalist (427)
    on left: 351 352, on right: 352 354
opt_cursor_options_list (428)
    on left: 353 354, on right: 355 358
open_statement (429)
    on left: 355, on right: 801
rollback_statement (430)
    on left: 356, on right: 306 802
with_opt_cursor_options_list (431)
    on left: 357 358, on right: 359
select_statement (432)
    on left: 359, on right: 793
opt_all_distinct (433)
    on left: 360 361 362, on right: 365 366 367 368 369
opt_ties (434)
    on left: 363 364, on right: 366 367 368 369
opt_top (435)
    on left: 365 366 367 368 369, on right: 359 406 407 408 491
update_statement_positioned (436)
    on left: 370, on right: 294 794
assignment_commalist (437)
    on left: 371 372 373, on right: 370 373 375
assignment (438)
    on left: 374, on right: 372 373
update_statement_searched (439)
    on left: 375, on right: 295 795
target_commalist (440)
    on left: 376 377, on right: 324 325 326 359 377
target (441)
    on left: 378 379 380, on right: 376 377
opt_where_clause (442)
    on left: 381 382, on right: 323 375 410 411
opt_best (443)
    on left: 383 384, on right: 386 387 393 394
query_exp (444)
    on left: 385 386 387 388 389 390 391, on right: 181 246 247 292
    402 421 422 901
non_final_union_exp (445)
    on left: 392 393 394 395 396 397 398, on right: 386 387 388 389
    390 391 393 394 395 396 397 398
non_final_query_term (446)
    on left: 399 400, on right: 392 393 394 395 396 397 398
query_term (447)
    on left: 401 402 403, on right: 385 386 387 388 389 390 391
opt_corresponding (448)
    on left: 404 405, on right: 386 387 388 389 390 391 393 394 395
    396 397 398
non_final_query_spec (449)
    on left: 406, on right: 399
query_spec (450)
    on left: 407, on right: 332 401 941
query_no_from_spec (451)
    on left: 408, on right: 182 293
selection (452)
    on left: 409, on right: 359 406 407 408 491
non_final_table_exp (453)
    on left: 410, on right: 406
table_exp (454)
    on left: 411, on right: 359 407 491
from_clause (455)
    on left: 412, on right: 410 411
table_ref_commalist (456)
    on left: 413 414, on right: 412 414
proc_col_list (457)
    on left: 415 416, on right: 185 416 417
opt_proc_col_list (458)
    on left: 417, on right: 424
column_commalist_or_empty (459)
    on left: 418 419, on right: 185 424
table_ref (460)
    on left: 420 421 422 423 424, on right: 413 414 442
table_ref_nj (461)
    on left: 425 426 427 428, on right: 442
jtype (462)
    on left: 429 430 431 432 433 434, on right: 437 438
opt_outer (463)
    on left: 435 436, on right: 430 431 432
join (464)
    on left: 437 438, on right: 442
joined_table (465)
    on left: 439 440 441, on right: 423 428
joined_table_1 (466)
    on left: 442, on right: 439 440 441
join_condition (467)
    on left: 443 444 445, on right: 442
where_clause (468)
    on left: 446, on right: 382
opt_group_by_clause (469)
    on left: 447 448 449 450, on right: 410 411
opt_having_clause (470)
    on left: 451 452, on right: 410 411
opt_lock_mode (471)
    on left: 453 454 455 456, on right: 411
search_condition (472)
    on left: 457 458 459 460 461, on right: 132 140 444 446 452 457
    458 459 460 618 873 885 900 935
predicate (473)
    on left: 462 463 464 465 466 467 468 469, on right: 461
scalar_exp_predicate (474)
    on left: 470, on right: 469
comparison_predicate (475)
    on left: 471, on right: 462
between_predicate (476)
    on left: 472 473, on right: 463
like_predicate (477)
    on left: 474 475, on right: 464
opt_escape (478)
    on left: 476 477 478, on right: 474 475
test_for_null (479)
    on left: 479 480, on right: 465
in_predicate (480)
    on left: 481 482 483 484, on right: 466
all_or_any_predicate (481)
    on left: 485, on right: 467
any_all_some (482)
    on left: 486 487 488, on right: 485
existence_test (483)
    on left: 489, on right: 468
scalar_subquery (484)
    on left: 490, on right: 505 522
subquery (485)
    on left: 491, on right: 426 427 481 482 485 489 490
scalar_exp (486)
    on left: 492 493 494 495 496 497 498 499 500 501 502,
    on right: 238 242 252 326 335 367 369 374 470 471 472 473 474 475
    479 480 481 482 483 484 485 492 493 494 495 496 497 506 507 523
    524 537 540 544 545 546 547 548 550 562 563 566 574 575 580 585
    586 587 588 591 593 599 600 601 603 610 616 617 618 619 621 626
    627 628 817 818 842 862 869 870 878 883 903 927 928 966 1113 1114
scalar_exp_no_col_ref (487)
    on left: 503 504 505 506 507 508 509 510 511 512 513 514 515 516
    517 518 519, on right: 501 548 1089 1093 1098
scalar_exp_no_col_ref_no_mem_obs_chain (488)
    on left: 520 521 522 523 524 525 526 527 528 529 530 531 532 533
    534 535 536, on right: 1087 1091 1097
cvt_exp (489)
    on left: 537, on right: 510 527
opt_collate_exp (490)
    on left: 538 539, on right: 540 1004
cast_exp (491)
    on left: 540, on right: 511 528
mssql_xml_col (492)
    on left: 541 542 543, on right: 253 547
as_expression (493)
    on left: 544 545 546 547, on right: 564 565 602 604
array_ref (494)
    on left: 548 549, on right: 516 533
lvalue_array_ref (495)
    on left: 550, on right: 380 549
opt_scalar_exp_commalist (496)
    on left: 551 552, on right: 576 577 578 579 581 583 584 596
function_name (497)
    on left: 553 554 555 556 557 558 559 560 561, on right: 194 201
    573 581 582 625 876
kwd_commalist (498)
    on left: 562 563, on right: 563 568 570
as_commalist (499)
    on left: 564 565 566, on right: 565 566 571 572
opt_arg_commalist (500)
    on left: 567 568 569 570 571 572, on right: 573 588 625 876 1080
    1087 1088 1089 1090 1091 1092 1093 1094 1102
function_call (501)
    on left: 573 574 575 576 577 578 579 580 581 582 583 584 585 586
    587 588 589 590 591 592 593 594, on right: 508 525 877
obe_literal (502)
    on left: 597 598, on right: 502 609
scalar_exp_commalist (503)
    on left: 599 600, on right: 483 484 507 524 552 569 570 571 600
    620
select_scalar_exp_commalist (504)
    on left: 601 602 603 604, on right: 409 603 604
atom_no_obe (505)
    on left: 605 606 607, on right: 503 520 608
atom (506)
    on left: 608 609, on right: 477 478 597
simple_case (507)
    on left: 610, on right: 512 529
searched_case (508)
    on left: 611, on right: 513 530
searched_when_list (509)
    on left: 612 613, on right: 611 613
simple_when_list (510)
    on left: 614 615, on right: 610 615
simple_when (511)
    on left: 616 617, on right: 614 615
searched_when (512)
    on left: 618 619, on right: 612 613
coalesce_exp (513)
    on left: 620, on right: 514 531
nullif_exp (514)
    on left: 621, on right: 515 532
parameter_ref (515)
    on left: 622 623 624, on right: 605
aggregate_ref (516)
    on left: 625 626 627 628, on right: 504 521
literal (517)
    on left: 629 630 631 632 633 634, on right: 234 606 751
signed_literal (518)
    on left: 635 636 637 638 639 640 641 642 643 644,
    on right: 119 128 766 767 782 1009
q_table_name (519)
    on left: 645 646 647 648, on right: 116 129 137 158 159 160 167
    168 169 170 179 185 257 258 259 264 265 268 271 272 277 278 424
    539 595 596 661 662 663 904 920 921 922 923 938 965 1079 1113 1114
    1115 1116
attach_q_table_name (520)
    on left: 649 650 651 652, on right: 234 751
new_proc_or_bif_name (521)
    on left: 653 654 655 656, on right: 747 749
new_table_name (522)
    on left: 657 658 659 660, on right: 99 155 170 184 185 236 747
    750 752 756 964 1046
table (523)
    on left: 661 662 663, on right: 193 200 322 323 330 370 375 420
    425
column_ref (524)
    on left: 664 665 666 667 668 669 670 671 672 673,
    on right: 378 500 550 594 765 766 767 870 871 926 1036 1090 1094
    1099
base_data_type (525)
    on left: 674 675 676 677 678 679 680 681 682 683 684 685 686 687
    688 689 690 691 692 693 694 695 696 697 698 699 700 701,
    on right: 702 712
data_type (526)
    on left: 702 703 704 705 706, on right: 537 540 544 710
array_modifier (527)
    on left: 707 708, on right: 709
data_type_ref (528)
    on left: 709 710 711, on right: 709 760 765 766 767 827 903 1004
    1016 1036 1037
column_data_type (529)
    on left: 712 713 714 715 716 717 718 719, on right: 104
column (530)
    on left: 720 721, on right: 104 131 144 145 146 147 165 166 272
    276 282 374
index (531)
    on left: 722, on right: 155
cursor (532)
    on left: 723, on right: 320 322 324 325 326 355 370
parameter (533)
    on left: 724 725, on right: 622 623 624
user (534)
    on left: 726, on right: 220 222 223 224 225 226 227 228 229 230
    231
opt_log (535)
    on left: 727 728, on right: 731 732 736 737
comma_opt_log (536)
    on left: 729 730, on right: 736
admin_statement (537)
    on left: 731 732 733 734 735 736 737 738 739, on right: 307
user_aggregate_declaration (538)
    on left: 747, on right: 740
user_aggregate_merge_opt (539)
    on left: 748 749, on right: 747
routine_declaration (540)
    on left: 750 751 752, on right: 741
module_body_part (541)
    on left: 753, on right: 754 755
module_body (542)
    on left: 754 755, on right: 755 756
module_declaration (543)
    on left: 756, on right: 742
routine_head (544)
    on left: 757 758, on right: 750 751 752 753 922
opt_return (545)
    on left: 759 760, on right: 747 750 751 752 753 1078
rout_parameter_list (546)
    on left: 761 762, on right: 747 750 751 752 753 1078 1079
parameter_commalist (547)
    on left: 763 764, on right: 762 764
rout_parameter (548)
    on left: 765 766 767, on right: 763 764
parameter_mode (549)
    on left: 768 769 770, on right: 765 766 767 772
opt_parameter_mode (550)
    on left: 771 772, on right: 1036
opt_soap_enc_mode (551)
    on left: 773 774 775 776 777 778 779, on right: 791 792
soap_proc_opt_list (552)
    on left: 780 781, on right: 781 791
soap_proc_opt (553)
    on left: 782, on right: 780 781
soap_kwd (554)
    on left: 783 784 785 786 787 788 789, on right: 791 792
rout_alt_type (555)
    on left: 790 791 792, on right: 750 751 752 753 765 766 767 1078
routine_statement (556)
    on left: 793 794 795 796 797 798 799 800 801 802 803 804,
    on right: 813 821 836
compound_statement (557)
    on left: 806, on right: 750 753 810 819 835 907 1078 1079
@2 (558)
    on left: 805, on right: 806
statement_list (559)
    on left: 807 808, on right: 806 808
statement_in_cs (560)
    on left: 809 810 812, on right: 807 808 815
@3 (561)
    on left: 811, on right: 812
statement_in_cs_oper (562)
    on left: 813 814 815 816 817 818, on right: 812
statement (563)
    on left: 819 821 823, on right: 873 875 885 901 902 903
@4 (564)
    on left: 820, on right: 821
@5 (565)
    on left: 822, on right: 823
local_declaration (566)
    on left: 824 825 826, on right: 809
variable_declaration (567)
    on left: 827, on right: 825 887
variable_list (568)
    on left: 828 829, on right: 827 829
condition (569)
    on left: 830 831 832 833 834, on right: 849 850 851 855 856
handler_statement (570)
    on left: 835 836 837 838 839 840 841 842 843 844 845 846 847 848
   , on right: 852
handler_declaration (571)
    on left: 849 850 851 852, on right: 826
handler_type (572)
    on left: 853 854, on right: 852
cond_value_list (573)
    on left: 855 856, on right: 852 856
control_statement (574)
    on left: 857 858 859 860 861 862 863 864 865 866 867 868,
    on right: 814 823
assignment_statement (575)
    on left: 869 870, on right: 498 844 864 886 893
lvalue (576)
    on left: 871 872, on right: 869
if_statement (577)
    on left: 873, on right: 845 865
opt_else (578)
    on left: 874 875, on right: 873
call_statement (579)
    on left: 876 877, on right: 299 837 857 888 894
set_statement (580)
    on left: 878 879 880, on right: 303 840 860
goto_statement (581)
    on left: 881 882, on right: 846 866
return_statement (582)
    on left: 883 884, on right: 843 863
while_statement (583)
    on left: 885, on right: 848 868
for_init_statement (584)
    on left: 886 887 888 889, on right: 891 892
for_init_statement_list (585)
    on left: 890 891 892, on right: 892 902
for_inc_statement (586)
    on left: 893 894 895, on right: 897 898
for_inc_statement_list (587)
    on left: 896 897 898, on right: 898 902
for_opt_search_cond (588)
    on left: 899 900, on right: 902
for_statement (589)
    on left: 901 902 903, on right: 847 867
trigger_def (590)
    on left: 904, on right: 744
opt_order (591)
    on left: 905 906, on right: 904
trig_action (592)
    on left: 907, on right: 904
action_time (593)
    on left: 908 909 910, on right: 904
event (594)
    on left: 911 912 913, on right: 904
opt_old_ref (595)
    on left: 914 915, on right: 904
old_commalist (596)
    on left: 916 917, on right: 915 917
old_alias (597)
    on left: 918 919, on right: 916 917
drop_trigger (598)
    on left: 920, on right: 745
drop_proc (599)
    on left: 921 922 923, on right: 746
opt_element (600)
    on left: 924 925, on right: 938
xml_col (601)
    on left: 926 927 928, on right: 929 930
xml_col_list (602)
    on left: 929 930, on right: 930 931
opt_xml_col_list (603)
    on left: 931, on right: 938
opt_pk (604)
    on left: 932 933, on right: 938
opt_join (605)
    on left: 934 935, on right: 938
opt_elt (606)
    on left: 936 937, on right: 938 964
xml_join_elt (607)
    on left: 938, on right: 943 944
opt_xml_child (608)
    on left: 939 940, on right: 938
top_xml_child (609)
    on left: 941 942, on right: 964
xml_join_list (610)
    on left: 943 944, on right: 940 942 944
opt_persist (611)
    on left: 945 946, on right: 956
opt_interval (612)
    on left: 947 948, on right: 956
opt_metas (613)
    on left: 949 950 951 952 953 954, on right: 956
opt_publish (614)
    on left: 955 956, on right: 964
xmlview_param_value (615)
    on left: 957 958, on right: 959
xmlview_param (616)
    on left: 959, on right: 960 961
xmlview_params (617)
    on left: 960 961, on right: 961 963
opt_xmlview_params (618)
    on left: 962 963, on right: 964
xml_view (619)
    on left: 964, on right: 6
drop_xml_view (620)
    on left: 965, on right: 304
string_concatenation_operator (621)
    on left: 966, on right: 499
q_type_name (622)
    on left: 967 968 969 970, on right: 711 717 718 987 1078 1079 1080
    1089 1090 1093 1094 1098 1099 1102 1103
q_old_type_name (623)
    on left: 971 972 973 974, on right: 196 202 981
new_type_name (624)
    on left: 975 976 977 978, on right: 980 1077
user_defined_type (625)
    on left: 980, on right: 30
@6 (626)
    on left: 979, on right: 980
user_defined_type_drop (627)
    on left: 981, on right: 31
opt_external_and_language_clause (628)
    on left: 982 983 984 985, on right: 980
opt_subtype_clause (629)
    on left: 986 987, on right: 980
opt_as_type_representation (630)
    on left: 988 989, on right: 980
type_representation (631)
    on left: 990, on right: 989
type_member_list (632)
    on left: 991 992, on right: 990 992
opt_external_clause (633)
    on left: 993 994 995 996, on right: 1004
opt_soap_clause (634)
    on left: 997 998 999 1000 1001, on right: 1004
opt_external_type (635)
    on left: 1002 1003, on right: 1036
type_member (636)
    on left: 1004, on right: 991 992 1104
opt_reference_scope_check (637)
    on left: 1005 1006 1007, on right: 1004
opt_default_clause (638)
    on left: 1008 1009, on right: 1004
opt_type_option_list (639)
    on left: 1010 1011, on right: 752 980
type_option_list (640)
    on left: 1012 1013, on right: 1011 1013
type_option (641)
    on left: 1014 1015 1016 1017 1018 1019 1020 1021 1022 1023 1024
   , on right: 1012 1013
opt_method_specification_list (642)
    on left: 1025 1026, on right: 980
method_specification_list (643)
    on left: 1027 1028, on right: 1026 1028
method_type (644)
    on left: 1029 1030 1031, on right: 1037 1078
decl_parameter_list (645)
    on left: 1032 1033, on right: 1037 1038
decl_parameter_commalist (646)
    on left: 1034 1035, on right: 1033 1035
decl_parameter (647)
    on left: 1036, on right: 1034 1035
partial_method_specification (648)
    on left: 1037 1038, on right: 1039 1040 1107
method_specification (649)
    on left: 1039 1040, on right: 1027 1028 1106
opt_self_result (650)
    on left: 1041 1042 1043 1044, on right: 1039
opt_specific_method_name (651)
    on left: 1045 1046, on right: 1037 1038
opt_method_characteristics (652)
    on left: 1047 1048, on right: 1039
method_characteristics (653)
    on left: 1049 1050, on right: 1048 1050
method_characteristic (654)
    on left: 1051 1052 1053 1054 1055 1056 1057 1058 1059 1060 1061
    1062 1063 1064, on right: 1049 1050
external_language_name (655)
    on left: 1065 1066 1067 1068 1069 1070 1071 1072 1073,
    on right: 752 1074
language_name (656)
    on left: 1074 1075, on right: 983 984 985 1051
opt_constructor_return (657)
    on left: 1076 1077, on right: 1079
method_declaration (658)
    on left: 1078 1079, on right: 743
static_method_invocation (659)
    on left: 1080, on right: 300 301 517 534 839 859 889 895
identifier_chain (660)
    on left: 1081 1082 1083, on right: 1083 1096
identifier_chain_method (661)
    on left: 1084 1085 1086, on right: 1086 1088 1092
method_invocation (662)
    on left: 1087 1088 1089 1090, on right: 518 535 838 858
top_level_method_invocation (663)
    on left: 1091 1092 1093 1094, on right: 302
member_observer (664)
    on left: 1095 1096, on right: 379 519 872
member_observer_no_id_chain (665)
    on left: 1097 1098 1099, on right: 536 1095
method_identifier (666)
    on left: 1100 1101, on right: 554 555 556 557 558 1037 1038 1078
    1080 1081 1082 1084 1085 1087 1089 1090 1091 1093 1094 1097 1098
    1099
new_invocation (667)
    on left: 1102, on right: 509 526
user_defined_type_alter (668)
    on left: 1103, on right: 32
alter_type_action (669)
    on left: 1104 1105 1106 1107, on right: 1103
opt_with_permission_set (670)
    on left: 1108 1109 1110, on right: 1113 1114
opt_with_autoregister (671)
    on left: 1111 1112, on right: 1113 1114
create_library (672)
    on left: 1113, on right: 9
create_assembly (673)
    on left: 1114, on right: 10
drop_library (674)
    on left: 1115, on right: 11
drop_assembly (675)
    on left: 1116, on right: 12
```

</div>

</div>