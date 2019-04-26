# Appendix A

# YACC SQL Grammar Reference

    /*
     *
     *  SQL Parser
     *
     *  Copyright (C) 1998-2018 OpenLink Software.
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

# Error Codes Reference

## Virtuoso Error Codes

| Virtuoso Sub-Code | Description                    |
| ----------------- | ------------------------------ |
| [SR](#srxxx)      | SQL Runtime                    |
| [FA](#faxxx)      | File access                    |
| [SQ](#sqxxx)      | SQL Compile                    |
| [CL](#clxxx)      | client-side                    |
| [HT](#htxxx)      | HTTP Server                    |
| [FT](#ftxxx)      | Free-text                      |
| [DC](#dcxxx)      | 2 phase commit                 |
| [VD](#vdxxx)      | VDB                            |
| [DT](#dtxxx)      | date/time routines             |
| [IN](#inxxx)      | Internationalization routines  |
| RE                | Replication                    |
| [TR](#trxxx)      | Transactional replication      |
| [DA](#daxxx)      | WebDAV domain                  |
| [SM](#smxxx)      | SMTP functions, Mail functions |
| [PO](#poxxx)      | POP3 functions                 |
| [NN](#nnxxx)      | NNTP server                    |
| GN                | GNW                            |
| [XS](#xsxxx)      | XSLT                           |
| [CR](#crxxx)      | Crypto API                     |
| [UD](#udxxx)      | User Defined Types             |
| [KB](#kbxxx)      | Kerberos Library               |
| [HO](#hoxxx)      | Hosting                        |

Virtuoso Errors Sub-Codes List

SR000 22023 \<function\_name\> expects a vector, not an arg of type
\<dv\_type\>

SR001 37000 More than one resultset not supported in a procedure called
from exec

SR002 22023 Function \<function\_name\> needs a string output as
argument \<index\>, not an arg of type \<type\_name\> (\<dv\_type\>)

SR003 22023 Function \<function\_name\> needs an XML entity as argument
\<index\>, not an arg of type \<type\_name\> (\<dv\_type\>)

SR004 22023 Function \<function\_name\> needs a binary as argument
\<index\>, not an arg of type \<type\_name\> (\<dv\_type\>)

SR005 22023 Function \<function\_name\> needs a string or NULL as
argument \<index\>, not an arg of type \<type\_name\> (\<dv\_type\>)

SR006 22023 Function \<function\_name\> needs a string or NULL as
argument \<index\>, not an arg of type \<type\_name\> (\<dv\_type\>)

SR007 22023 Function \<function\_name\> needs a string or NULL as
argument \<index\>, not an arg of type \<type\_name\> (\<dv\_type\>)

SR008 22023 Function \<function\_name\> needs an integer as argument
\<index\>, not an arg of type \<type\_name\> (\<dv\_type\>)

SR009 22023 Function \<function\_name\> needs a float as argument
\<index\>, not an arg of type \<type\_name\> (\<dv\_type\>)

SR010 22023 Function \<function\_name\> needs a double as argument
\<index\>, not an arg of type \<type\_name\> (\<dv\_type\>)

SR011 22023 Function \<function\_name\> needs an int or a string as
argument \<index\>, not an arg of type \<type\_name\> (\<dv\_type\>)

SR012 22023 Function \<function\_name\> needs a string or an array as
argument \<index\>, not an arg of type \<type\_name\> (\<dv\_type\>)

SR013 22023 Function \<function\_name\> needs a string or an array as
argument \<index\>, not an arg of type \<type\_name\> (\<dv\_type\>)

SR014 22023 Function \<function\_name\> needs a string as argument
\<index\>, not an arg of type \<type\_name\> (\<dv\_type\>)

SR015 22023 Function length is not applicable to XML tree entity

SR016 22023 Function length needs a string or array as its argument, not
an argument of type \<type\_name\> (\<dv\_type\>)

SR017 22003 aref: Bad array subscript (zero-based) \<index\> for an arg
of type \<type\_name\> and length \<length\>.

SR018 22023 non-generic vector for aref\_set\_0

SR019 22003 Bad subscript for aref\_set\_0

SR020 22003 Bad array subscript \<index\> in aset.

SR021 22003 make\_array called with an invalid count \<count\>

SR022 22023 Type for make\_array must be float, double, long or any

SR023 22023 Function subseq needs a string or object id as its first
argument, not an arg of type \<type\_name\> (\<dv\_type\>)

SR024 22023 Function subseq needs integers or NULLs as its arguments 2
and 3, not an argument of type \<type\_name\> (\<dv\_type\>)

SR025 22011 subseq: Bad string subrange: from=\<from\>, to=\<to\>,
len=\<length\>.

SR026 22011 substr: Bad string subrange: from=\<from\>, to=\<to\>,
len=\<length\>.

SR027 22023 Source string arg (\#1) to replace was not a wide string

SR028 22023 From arg (\#2) to replace was not a wide string

SR029 22023 To arg (\#3) to replace was not a wide string

SR030 22003 Too few arguments for \<function\_name\>

SR031 22023 Invalid format string for sprintf at escape \<index\>

SR032 22026 sprintf escape \<index\> (\<escape\>) exceeds the internal
buffer of 2000

SR033 22026 The length of the data for sprintf argument \<index\> exceed
the maximum of 2000

SR034 22026 The length of the data for sprintf argument \<index\> exceed
the maximum of 2000

SR035 22026 The length of the data for sprintf argument \<index\> exceed
the maximum of 2000

SR036 22025 The URL escaping sprintf escape \<index\> doesn't support
modifiers

SR037 22025 The HTTP escaping sprintf escape \<index\> doesn't support
modifiers

SR038 22023 Invalid format string for sprintf

SR039 22023 The first argument to strstr is not a wide string

SR040 22023 The second argument to strstr is not a wide string

SR041 22023 Argument 1 of locate is not a wide string

SR042 22023 Argument 2 of locate is not a wide string

SR043 22019 the escape should be non-empty string in matches\_like

SR044 22023 Function ascii needs a string or similar thing as its
argument, not an argument of type \<type\_name\> (\<dv\_type\>)

SR045 22023 Function mod needs two integers as its arguments, not an
argument of type \<type\_name\> (\<dv\_type\>)

SR046 22012 Division by zero in mod(\<n1\>,\<n2\>)

SR047 22023 Function sign needs a numeric type as its argument, not an
argument of type \<type\_name\> (\<dv\_type\>)

SR048 22023 Function abs needs a numeric type as its argument, not an
argument of type \<type\_name\> (\<dv\_type\>)

SR049 22023 Data type is not suitable for storage into a global variable
(connection\_set)

SR050 22023 connenction\_vars\_set expects a vector or null as argument
not of type \<type\_name\> (\<dv\_type\>)

SR051 22023 connenction\_vars\_set expects a vector of even length, not
of length \<length\> (of type \<type\_name\> (\<dv\_type\>))

SR052 22023 connenction\_vars\_set expects a string as name of
connection variable not of type \<type\_name\> (\<dv\_type\>)

SR053 22023 Data type is not suitable for storage into a global variable
(connection\_set)

SR054 22023 Function oid\_class\_spec needs an object id as its
argument, not an argument of type \<type\_name\> (\<dv\_type\>)

SR055 22023 Function oid\_class\_spec detected an object id whose length
\<length\> \< 4. oid\[0\]=\<u1\>. oid\[1\]=\<u2\>. oid\[2\]=\<u3\>

SR056 22023 \<function\_name\> expects the type of item searched for
\<type\_name\> (\<dv\_type\>) and the type of the vector searched from
\<type\_name\> (\<dv\_type\>) to match. Veclen=\<length\>

SR057 22023 get\_keyword expects a vector of even length, not of length
\<length\> (of type \<type\_name\> (\<dv\_type\>))

SR058 22023 get\_keyword expects a vector

SR059 22024 get\_keyword\_ucase expects a vector of even length, not of
length \<length\> (of type \<type\_name\> (\<dv\_type\>))

SR060 22003 position: cannot check every 0th element of vector of type
\<type\_name\>

SR061 22023 position: expects a vector whose length is divisible by
\<d\>, not of length \<d2\> (of type \<type\_name\> (\<dv\_type\>))

SR062 22023 Row in a row function is not a valid row string

SR063 22023 row string must begin with container header

SR064 22015 Conversion overflow from numeric

SR065 22023 Can't convert SQL\_DATA\_AT\_EXEC blob to varchar. Parameter
may only be used in insert or update

SR066 22023 Unsupported case in CONVERT

SR067 22023 Collation specified in cast for non-string datatype
\<type\_name\>

SR068 22023 XML tree cannot be used as argument of
blob\_to\_string\[\_output\]

SR069 22001 Attempt to convert a persistent XML document longer than
VARCHAR maximum in blob\_to\_string

SR070 22023 blob\_to\_string\[\_output\] requires a blob or string
argument

SR071 22023 Blob argument to blob\_to\_string\[\_output\] must be a
non-interactive blob

SR072 22001 Blob longer than maximum string length not allowed in
blob\_to\_string

SR073 22023 Function log\_text needs an array as argument \<index\> not
BLOB HANDLE

SR074 25000 replay must be run in a fresh transaction.

SR075 22023 Bad isolation. Must be uncommitted / committed / repeatable
/ serializable

SR076 22023 ISOLATION option needs a string as value (uncommitted /
committed / repeatable / serializable)

SR077 42S22 Bad option for SET

SR078 22005 The cursor parameter is not settable

SR079 22023 Too few arguments to exec\_next(cursor, state, message, row)

SR080 22023 Parameter 4 is not a valid local exec handle

SR081 22023 Parameter 1 is not a valid local exec handle

SR082 22003 Non numeric comparison

SR083 Numeric error (22003 Numeric value out of range | 22012 Division
by zero | 37000 Syntax error | S1000 General error | S1107 Row value out
of range | 22012 Division by 0)

SR084 42S22 The column \<column\_name\> is not defined in the given
table

SR085 22012 Division by 0

SR086 22012 Division by 0

SR087 22003 Non numeric arguments to arithmetic operation

SR088 22012 Division by 0

SR089 22012 Division by 0

SR090 22012 Division by 0

SR091 22003 Non numeric arguments to arithmetic operation modulo

SR092 42000 system call not allowed on this server

SR093 22000 Error in compressing

SR094 22023 string\_output\_gz\_compress needs a string\_output as a
first argument, not an argument of type \<type\> (\<DV\_type\>)

SR095 22023 gz\_uncompress needs a string\_output as a second argument,
not an argument of type \<type\> (\<DV\_type\>)

SR096 21S01 Function crypt needs a string or integer as its second
argument. Not an arg of type \<type\> (\<DV\_type\>)

SR097 2201B regexp error : could not obtain substring (\<offset\> of
\<length\>)

SR098 2201B regexp error after: \<pattern\> (\<error\>)

SR099 22023 BLOB submitted by client as SQL\_DATA\_AT\_EXEC cannot be
converted into anything. It must first be stored into a BLOB column

SR100 22003 The requested subsequence of BLOB is longer than 10Mb, thus
it cannot be stored as a string

SR101 22023 BLOB submitted by client as SQL\_DATA\_AT\_EXEC cannot be
converted into anything. It must first be stored into a BLOB column

SR102 22026 Error in compressing (invalid input)

SR103 Zlib error (22000 Error in compressing | 22003 Error in
compressing (compression level parameter is invalid) | 22005 Error in
compressing (not enough memory) | 22026 Error in compressing (not enough
room in the output buffer))

SR104 22025 Error in decompressing

SR105 42000 Unclassified SQL error

SR106 40009 Out of disk on database

SR107 42000 Read only transaction for modify operation.

SR108 4000X Transaction could not commit after DDL statement. Last DDL
statement rolled back.

SR109 42000 Cannot free global server lock if one does not hold it

SR110 42000 backup () must be the first operation in its transaction if
the transaction is not read only

SR111 40009 Backup transaction failed

SR112 42000 Transaction not in backup mode

SR113 42000 backup\_row needs a \_ROW as argument

SR114 42000 Transaction not in backup mode

SR115 42000 Error writing backup\_flush

SR116 42000 Transaction not in backup mode

SR117 42000 db\_check () must be in read only, non-autocommit
transaction mode. e.g. do it from isql in RO mode.

SR118 40009 Database check transaction failed

SR119 42S11 Key \<key\> has 0 parts. Create index probably failed

SR120 23000 Convert error or not possible to insert a value into a blob
column

SR121 42000 Ruling part too long on \<key\>

SR122 42000 Row too long on \<key\>

SR123 42S12 Bad key id in row\_insert

SR124 42S12 Bad key id in row\_insert

SR125 42S12 key\_insert: This table does not have this key

SR126 22018 Can't convert \<column\_name\> to numeric

SR127 22003 Can't convert \<column\_name\> to numeric

SR128 22003 Numeric value out of range for \<column\_name\>
(\<col\_scale\>, \<col\_prec\>)

SR129 22003 Numeric value out of range

SR130 22005 Bad value for numeric column \<column\_name\>, dtp =
\<dtp\_value\>

SR131 22005 Cannot convert \<string\_value\> to number for column
\<column\_name\>

SR132 22007 Bad value for date / time column

SR133 23000 Null assigned to non-null column

SR134 42000 A data at exec blob must be assigned to a blob column

SR135 42000 Blob too long to store in a non-blob column

SR136 42S02 Bad table name in GRANT / REVOKE \<table\_name\>

SR137 42000 Bad user name in GRANT/REVOKE

SR138 37000 Operation not allowed for PUBLIC

SR139 42000 No group \<group\_name\>

SR140 42000 The group \<group\_name\> is already a secondary group for
the user \<user\_name\>. Delete it first with DELETE USER GROUP.

SR141 42000 No user \<user\_name\>

SR142 37000 Operation not allowed for PUBLIC

SR143 42000 No group \<group\_name\>

SR144 42000 Group \<group\_name\> already assigned as a secondary group
of \<user\_name\>

SR145 42000 Group \<group\_name\> already is a primary group of
\<user\_name\>

SR146 42000 No user \<user\_name\>

SR147 37000 Operation not allowed for PUBLIC

SR148 42000 No group \<group\_name\>

SR149 42000 No group \<group\_name\> granted to \<user\_name\>

SR150 42000 No Group \<group\_name\> granted to \<user\_name\>

SR151 42000 Group \<group\_name\> is a primary group of \<user\_name\>.
Use SET USER GROUP instead

SR152 42000 No user \<user\_name\>

SR153 28000 No user in delete user

SR154 42S02 No table or view in drop table

SR155 42S02 No table in alter table drop column

SR156 42S02 No table in table rename

SR157 42S02 No table alter table add column

SR158 42000 Permission denied. Must be owner of object or member of dba
group.

SR159 42000 Function \<function\_name\> restricted to dba group.

SR160 42000 Incorrect old password in set password

SR161 42000 Unsupported security statement.

SR162 07006 BLOB's not allowed in function refs.

SR163 42000 Ruling part too long.

SR164 42000 Error writing the BLOB onto a procedure view temp space

SR165 07006 Parameter BLOB in sorted result.

SR166 42000 Key too long in ORDER BY or DISTINCT temp table.

SR167 07006 Parameter BLOB in sorted result.

SR168 42000 Data too long in ORDER BY or DISTINCT temp table.

SR169 22023 signal state should be an integer 100 (NO DATA FOUND) or a
string value, not an \<type\_name\>

SR170 42000 Unsupported arithmetic op.

SR171 S1T00 Transaction timed out.

SR172 40001 Transaction deadlocked

SR173 40003 Transaction out of disk.

SR174 40004 Log out of disk.

SR175 23000 Uniqueness violation. Transaction killed.

SR176 4000X Transaction rolled back due to previous SQL error.

SR177 4000X Misc Transaction Error.

SR178 42000 Stack overflow

SR179 07S01 The function \<function\_name\> does not accept a keyword
parameter \<param\_name\>

SR180 07S01 Extra arguments to \<function\_name\>, takes only \<number\>

SR181 HY105 Cannot pass literal as reference parameter.

SR182 HY502 inout or out parameter \<param\_name\> not supplied in
keyword parameter call

SR183 07S01 Required argument \<param\_name\> (no \<index\>) not
supplied to \<function\_name\>

SR184 42000 Built-in function is not allowed as the outermost function
in a procedure view. Define an intermediate PL function to call the bif.

SR185 42001 Undefined procedure \<procedure name\>

SR186 42000 No permission to execute procedure \<procedure\_name\>

SR187 07001 Too few actual parameters for \<procedure\_name\>

SR188 HY105 Cannot pass literal as reference parameter.

SR189 HY008 Async statement killed by SQLCancel.

SR190 24000 Fetch of unopened cursor.

SR191 39000 Unsupported instruction AREF");

SR192 HY105 Like pattern not a string

SR193 HY105 Blob of \<length\> bytes in like

SR194 HY105 LIKE must be between strings.

SR195 HY001 No starting point for ancestor join

SR196 HY001 No place in from\_position clause.

SR197 23000 Non unique primary key on \<table\_name\>

SR198 HY109 Cursor not positioned on delete. \<cursor\_name\>

SR199 HY109 The cursor in positioned DELETE was not on any row.

SR200 42S12 The row being deleted has no valid key.

SR201 42S12 Primary key not found in delete.

SR202 42000 Bad admin op code.

SR203 HY008 Async statement killed by SQLCancel.

SR204 22002 Missing named parameter

SR205 07001 Not enough actual parameters.

SR206 07001 Not enough actual parameters.

SR207 08004 Maximum licensed connections exceeded

SR208 08004 Application access is denied

SR209 S1010 Statement active

SR210 S1010 Async exec busy

SR211 41000 Aborted

SR212 S1010 Statement not prepared.

SR213 S1010 SQLFetch of busy

SR214 40001 Out of server threads. Server temporarily unavailable.
Transaction rolled back.

SR215 42000 Too many triggers on \<table\_name\>

SR216 22003 PL Scrollable cursor with a rowset \> 1

SR217 01001 Optimistic cursor updated since last read"

SR218 HYC00 Cursor not capable of requested SQLSetPos operation

SR219 HY107 Row in SQLSetPos does not exist in the rowset

SR220 S1010 Unopened cursor referenced by SQLSetPos

SR221 S1010 Not a scrollable cursor in SQLSetPos

SR222 22003 PL cursor with a rowset greater then 1

SR223 HY111 Non static bookmark for a static cursor

SR224 HY111 Incompatible bookmark. Must be identical ordering and
primary key columns

SR225 HY111 Static bookmark for a dynamic / keyset cursor

SR226 42000 Misc. cursor error

SR227 3C000 Non unique cursor name

SR228 07001 Too few actual parameters

SR229 42000 Misc. cursor error

SR230 S1010 Statement not executing or not scrollable cursor in
SQLExtendedFetch

SR231 42S02 Cursor does not have table \<table\_name\>

SR232 34000 No cursor \<cursor\_name\>

SR233 22023 Wrong type of argument to \_\_scroll\_cr\_init

SR234 22023 Function \<function\_name\> needs a cursor as argument
\<index\> , not an arg of type \<type\_name\> (\<dv\_type\>)

SR235 24000 Virtuoso/PL Scrollable cursor not opened

SR236 07001 scrollable fetch with different number of output columns

SR237 HY109 Row deleted

SR238 24000 Virtuoso/PL Scrollable cursor not opened

SR239 HY109 Virtuoso/PL Scrollable cursor not positioned on a row

SR240 HY090 Ruling part too long in scrolled current of reference.

SR241 HY109 Row referenced in where current of not present

SR242 42S22 No system status variable \<name\>

SR243 42S02 No table \<table\_name\> in key\_stat

SR244 22023 Allowed stat names are touches, reads, lock\_set,
lock\_waits, deadlocks.

SR245 42S12 Index \<key\_name\> not found in key\_stat.

SR246 23000 Error or type mismatch inserting a blob

SR247 42000 Primary key ruling part too long in update

SR248 42000 Row too long in update

SR249 42000 Ruling part too long on \<key\_name\>.

SR250 24000 Cursor not positioned on update. \<cursor\_name\>

SR251 24000 Cursor not on row in positioned UPDATE

SR252 01001 Row deleted while waiting to update

SR253 42S12 Could not find primary key on update.

SR254 42000 The cursor specified is not a SELECT.

SR255 24000 Cursor before first or after end. No current row.

SR256 HY109 Cursor \<cursor\_name\> does not have place.

SR257 34000 No cursor named \<cursor\_name\>.

SR258 42000 The cursor specified is not a SELECT.

SR259 24000 Cursor \<cursor\_name\> before first or after end. No
current row.

SR260 HY109 Cursor \<cursor\_name\> does not have place \<name\>.

SR261 23000 Non unique primary key.

SR262 24000 Cursor not positioned on positioned reference.
\<cursor\_name\>

SR263 24000 Cursor not on row in positioned UPDATE

SR264 42S12 Could not find primary key on update.

SR265 37000 Table being dropped is referenced in FOREIGN KEY

SR266 S0002 No table in drop table

SR267 37000 Table being dropped is referenced in FOREIGN KEY

SR268 42S02 No table in drop table

SR269 S0002 No trigger in drop trigger. Make sure the name is qualified
with the subject table's qualifier and owner if these are not the
default qualifier and owner

SR270 42000 No procedure in DROP PROCEDURE \<proc\_name\>

SR271 42000 Must be in dba group to drop non-owned procedures

SR272 01006 Privilege has not been granted. Use list\_grants (0) to see
what you can revoke

SR273 42000 No user to delete

SR274 S1001 Column already exists in ALTER TABLE

SR275 42000 Column count too large

SR276 42S02 No table in add column

SR277 42S01 Table already exists in rename table.

SR278 42S02 Bad table in rename table

SR279 22023 parse\_collation : invalid table size \<size\>

SR280 37000 The column is a key or primary key part. Drop the index
first

SR281 37000 The column is referenced in foreign key constraint. Drop the
foreign key first

SR282 42S22 The column to drop is not defined in the given table

SR283 42S02 No table in add column

SR284 22023 Charset definition is not correct

SR285 42000 Function user\_set\_password restricted to dba group

SR286 42000 The user \<user\_name\> does not exist

SR287 42000 The new password for \<user\_name\> cannot be empty

SR288 42S22 No columns in the source table \<table\_name\>

SR289 42S22 No columns in the source table \<table\_name\>

SR290 42S22 The column \<column\_name\> in the source table
\<table\_name\> doesn't have a match in the destination table
\<table\_name\>

SR291 42S11 Primary key modification is prohibited if: Table is a
subtable or has subtables, is attached or has a free text index

SR292 42S22 Bad new pk column list

SR293 22023 function fk\_check\_input\_values expect -1, 0 or 1 as first
parameter

SR294 42S22 Foreign key references invalid column \<column\_name\> in
referenced table \<table\_name\>

SR295 37000 Foreign key references non-unique column \<column\_name\> in
table \<table\_name\>

SR296 37000 To add foreign key REFERENCES should be specified

SR297 42S12 Foreign key does not exist in table \<table\_name\>
referencing table \<table\_name\>

SR298 42S12 Foreign key \<key\_name\> does not exists

SR299 37000 To drop foreign key should be specified NAME or REFERENCES

SR300 42S11 To modify a foreign key first drop the old and then add the
new

SR301 37000 A primary key cannot be added or dropped. It can only be
modified. Use alter table .. modify primary key ...

SR302 37000 To modify a unique constraint first drop the old and then
add the new

SR303 22023 Function check\_col needs string as argument

SR304 S1000 DELETE statement conflicted with COLUMN REFERENCE constraint
\<name\>

SR305 S1000 UPDATE statement conflicted with COLUMN REFERENCE constraint
\<name\>

SR306 S1000 INSERT statement conflicted with FOREIGN KEY constraint
referencing table \<table\_name\>

SR307 S1000 UPDATE statement conflicted with FOREIGN KEY constraint
referencing table \<table\_name\>

SR308 22023 exec() called with an invalid text to execute

SR309 22023 Non-encrypted session

SR310 22023 Invalid certificate info index

SR311 08004 Shutting down the server permitted only to DBA group

SR312 08004 The server is shutting down

SR313 42000 The procedure \<proc\_name\> is part of a module \<module\>.
Drop the module first.

SR314 42000 Trying to drop a module with drop procedure.

SR315 37000 Invalid module name in soap\_sdl.

SR316 37000 No URL specified & soap\_sdl called outside HTTP context.

SR317 37000 Invalid module name in soap\_wsdl.

SR318 37000 No URL specified & soap\_wsdl called outside HTTP context.

SR319 22026 Value too long to insert into VARCHAR column \<col\_name\>.

SR320 42S12 Constraint \<constraint name\> does not exists for table
\<table\>

SR321 37000 A RETURN statement with a return status can only be used in
a stored procedure

SR322 22005 \<option\> is not valid trace\_on option

SR323 22005 \<option\> is not valid trace\_off option

SR324 08U01 Remote server has disconnected making the transaction
uncommittable. Transaction has been rolled back.

SR325 S1T00 Transaction aborted due to a database checkpoint or
database-wide atomic operation. Please retry transaction

SR326 42S02 No table in alter table modify column

SR327 42S02 ALTER TABLE not supported for views. Drop the view and
recreate it instead.

SR328 42S02 ALTER TABLE not supported for views. Drop the view and
recreate it instead.

SR329 42S02 ALTER TABLE not supported for views. Drop the view and
recreate it instead.

SR330 42S02 ALTER TABLE not supported for views. Drop the view and
recreate it instead.

SR331 21000 Scalar subquery returned more than one value.

SR332 42000 The DB.DBA.DBEV\_DSN\_LOGIN should return strings for UID
and PWD.

SR333 42S22 Access denied for foreign key referencing \<col\> in table
\<tbl\>

SR334 22023 The result names description should be an array in
exec\_result

SR335 22023 The result names description should be an array in
exec\_result\_names

SR336 22023 Wrong result description in bif\_result\_string\_names

SR337 40006 Transaction aborted because the server is out of memory

SR338 HY111 Malformed bookmark

SR339 22023 Function \<function\_name\> needs an integer not less than
\<val\> as argument \<inx\>

SR340 22023 Function \<function\_name\> needs an integer not greater
than \<val\> as argument \<inx\>

SR341 22023 Invalid integer value converting \<string\_val\>

SR342 22023 Procedure view's procedure returned value of type
\<type\>(\<dv\_val\>) instead of \<type\>(\<dv\_val\>) for column
\<col\_no\>

SR343 42000 Access to pwd\_magic\_calc not permitted. If you are getting
this message in the Admin interface and you are a DBA, then you need to
enable the function from the INI file in order to use it.

SR344 41000 Malformed RPC

SR345 22023 invalid offset arguments to subseq

SR346 22023 precision (\<prec\>) overflow in \<title\>

SR347 22023 The long varchar, long varbinary and long nvarchar data
types cannot be used in the WHERE, HAVING, or ON clause, except with the
IS NULL predicate for column \<name\>

SR348 22023 Value type (\<type\>) not suitable for use in a hash index

SR349 22023 SKIP parameter \< 0

SR350 22023 TOP parameter \< 0

SR351 22023 SKIP parameter \< 0

SR352 22023 TOP parameter \< 0

SR353 22023 Sorted TOP clause specifies more then %ld rows to sort. Only
%ld are allowed. Either decrease the offset and/or row count or use a
scrollable cursor

SR354 23000 Type mismatch inserting user defined type instance as a blob
for column \<co\>

FA001 42000 Access to \<file\_name\> is denied

FA002 42000 Can't open file \<file\_name\>, error \<err\_no\>

FA003 42000 Access to \<file\_name\> is denied due to access control in
ini file

FA004 42000 Access to \<file\_name\> is denied due to access control in
ini file

FA005 39000 Can't open file \<file\_name\>, error \<error\_no\>

FA006 39000 Can't open file \<file\_name\>, error : \<fs\_error\>

FA007 39000 Seek error in file \<file\_name\>, error \<error\_no\>

FA008 39000 File \<file\_name\> too long

FA009 39000 Read from \<file\_name\> failed (\<error\_no\>)

FA010 42000 Access to \<file\_name\> is denied due to access control in
ini file

FA011 42000 Access to \<file\_name\> is denied due to access control in
ini file

FA012 42000 Can't open file \<file\_name\>, error \<error\_no\>

FA013 39000 Read from \<file\_name\> failed (\<error\_no\>)

FA014 42000 Access to \<file\_name\> is denied due to access control in
ini file

FA015 42000 Access to \<file\_name\> is denied due to access control in
ini file

FA016 42000 Access to \<file\_name\> is denied due to access control in
ini file

FA017 39000 Path string is too long.

FA018 42000 Access to \<file\_name\> is denied due to access control in
ini file

FA019 39000 Path string is too long.

FA020 39000 \<fs\_error\>

FA021 22003 Third argument of string\_to\_file function, should be
nonnegative offset value, -1 or -2

FA022 22023 Function string\_to\_file needs a string or blob or
string\_output as argument 2, not an arg of type \<type\_name\>
(\<dv\_type\>)

FA023 42000 Access to \<file\_name\> is denied due to access control in
ini file

FA024 42000 Access to \<file\_name\> is denied due to access control in
ini file

FA025 39000 Seek error in file \<file\_name\>, error : \<fs\_error\>

FA026 39000 Write to \<file\_name\> failed (\<fs\_error\>)

FA027 39000 Write to \<file\_name\> failed"

FA028 39000 Write to \<file\_name\> failed (\<fs\_error\>)

FA029 39000 Write to \<file\_name\> failed (fs\_error)

FA030 39000 Can't open file \<file\_name\>

FA031 39000 Can't open file \<file\_name\>

FA032 39000 Can't open file \<file\_name\>

FA033 39000 Can't open file \<file\_name\>

FA034 39000 Can't open file \<file\_name\>

FA035 39000 Can't open file \<file\_name\>

FA036 42000 Allow & deny file ACL cannot be modified

FA037 39000 Can't update \<file\_name\>

FA038 42000 Cannot open backup file \<file\_name\>

FA039 40003 Out of disk in query temp space.

FA040 42000 Access to \<file\_name\> is denied due to access control in
ini file

FA041 42000 Debug session is already open, close it first

FA042 39000 Cannot open debug log file \<file\_name\>, error : \<OS
error\>

SQ001 28000 No owner user in \_\_view\_changed for \<text\>

SQ002 42S02 Bad table in drop trigger.

SQ003 42S22 Collation \<collation\_name\> is not defined

SQ004 42S22 Collation defined for a non-string column

SQ005 42000 Column count too large

SQ006 42S22 Table has non unique column names either directly through
inheritance

SQ007 37000 Column count too large

SQ008 42S22 No column \<name\> in \<table\_name\>.

SQ009 07006 Column \<name\> is a BLOB column and blob columns are not
supported as index parts

SQ010 42S22 Column count too large

SQ011 42S22 Column count too large

SQ012 42S12 Cannot inherit table with no keys \<name\>.

SQ013 42S22 Column count too large

SQ014 07006 Not a DDL type name: \<name\>

SQ015 07006 Not a DDL type name: \<name\>

SQ016 42S01 Table \<table\_name\> already exists

SQ017 42S12 No primary key for \<table\_name\>. Specify qualifier and
owner if you are not owner of the table.

SQ018 42S02 No table \<table\_name\>

SQ019 42S12 No key \<name\> in (\<table\_name\>|any table)."

SQ020 23000 Can't drop primary key. Use drop table instead.

SQ021 42S02 bad table or index for build key

SQ022 42S11 Duplicate index name

SQ023 42S02 No table in rename table

SQ024 4000X Transaction could not commit after DDL statement. Last DDL
statement rolled back

SQ025 42S02 Bad table in drop table.

SQ026 42000 The subtable \<table\_name\> must have the same owner as the
supertable \<table\_name\>

SQ027 42S11 Only one PRIMARY KEY clause allowed

SQ028 42S21 Unsupported table constraint.

SQ029 42S12 A table must either have an UNDER or PRIMARY KEY
specification.

SQ030 42S11 A table cannot have both an UNDER and PRIMARY KEY.

SQ031 42000 Unsupported DDL statement.

SQ032 42000 Owner of procedure has been deleted. Cannot recompile
procedure

SQ033 42000 Access denied for column \<name\>.",

SQ034 42S22 Ambiguous column ref \<name\>

SQ035 37000 Bad function reference in expression, only ones in selection
recognized in HAVING / ORDER BY

SQ036 42S22 Bad column/variable ref \<name\>

SQ037 37000 ancestor\_of must be between 2 columns

SQ038 37000 ancestor\_of must be between 2 entity subtables

SQ039 37000 Can't have more than 1 ancestor join per table

SQ040 37000 Can't have more than 1 contains/xcontains per table

SQ041 37000 Can't have more than one xpath\_contains per table

SQ042 42S12 No index for table \<table\_name\>

SQ043 42000 \_ROW requires select permission on the entire table.

SQ044 42S22 Bad column/variable reference \<name\>

SQ045 42000 Bad compare operator.

SQ046 42S22 Bad column predicate.

SQ047 42S02 No table \<table\_name\>

SQ048 42S12 No key \<key\_name\>

SQ049 42S12 No key named \<key\_name\>

SQ050 42S22 \<name\> is not the name of a CURRENT OF.

SQ051 42S02 No table \<table\_name\>

SQ052 21S01 Uneven col and value lists in insert.

SQ053 42S22 No such column \<name\>

SQ054 42000 Bad insert mode.

SQ055 21S01 Odd assignment list for update.

SQ056 42S02 No table \<table\_name\> in update.

SQ057 42S22 No such column \<name\> in update.

SQ058 42S12 No key in key\_insert.

SQ059 42000 No statement \<name\>

SQ060 42000 Must be in dba group to use EQL.

SQ061 42000 Lisp reader error.

SQ062 42S22 No column \<owner\>.\<name\>.

SQ063 42S22 No column \<name\>

SQ064 42000 Illegal use of '\*'.

SQ065 42S22 Col ref ambiguous \<name\>.

SQ066 37000 Natural join only allowed between tables or views. No
derived tables or joins.

SQ067 37000 Explicit join condition not allowed in natural join

SQ068 37000 Empty or USING join condition not allowed with non-natural
join

SQ069 42S02 No table \<table\_name\>

SQ070 42000 Must have select privileges on view \<view\_name\>

SQ071 42000 Cannot mix aggregate functions with non-aggregate functions
or columns not included in GROUP BY.

SQ072 42000 Goto to undeclared label.

SQ073 37000 Statement not supported.

SQ074 37000 \<parser error\>

SQ075 42000 Unclassified SQL compilation error.

SQ076 42000 The procedure owner specified is different than the creator.

SQ077 34000 Bad cursor name \<cursor\_name\>

SQ078 42000 Unclassified SQL compilation error.

SQ079 42000 No permission to execute procedure \<procedure\_name\>.

SQ080 37000 ELSE must be last clause in CASE.

SQ081 37000 ELSE must be last clause in CASE.

SQ082 37000 Reference to non-object variable

SQ083 42000 Can't generate scalar exp \<type\>

SQ084 42000 Subquery predicate not supported.

SQ085 42000 Reference to undefined label.

SQ086 42000 ORDER BY: less than \<number\> cols in select.

SQ087 09000 Forward only cursor called not with FETCH NEXT

SQ088 39000 Statement not supported in a procedure context.

SQ089 S0022 Bad column \<name\> in trigger column list

SQ090 42S02 Bad table \<table\_name\> in trigger \<name\> definition

SQ091 42000 Views not supported as trigger objects

SQ092 42000 Access denied for table \<table\_name\>

SQ093 21S01 Mismatched columns and values in insert.

SQ094 21S01 Too many (\<number\>) values in insert into \<table\_name\>

SQ095 42S22 No column \<name\>

SQ096 42S02 No table \<table\_name\>

SQ097 42000 No insert or insert/delete permission for insert / insert
replacing

SQ098 42S22 No column \<name\>

SQ099 21S01 different number of cols and values in insert.

SQ100 42000 A local table of over maximum columns may not be inserted

SQ101 42S02 No table \<table\_name\>

SQ102 42S22 No column \<name\>

SQ103 42000 Update of \<name\> not allowed.

SQ104 09000 Cursor with a sorted order by, distinct, grouping etc. is
not referenceable in where current of

SQ105 42S02 No table \<table\_name\>

SQ106 42S22 No column \<name\>.

SQ107 42000 Update of \<table\_name\> not allowed.

SQ108 43000 Permission denied for delete.

SQ109 09000 Cursor with a sorted order by, distinct, grouping etc. is
not referenceable in where current of

SQ110 42000 Permission denied for delete.

SQ111 42S02 No table \<table\_name\>

SQ112 42S02 View without table \<view\_name\>

SQ113 37000 Non-view column set in view update

SQ114 37000 View \<name\> is not updatable in insert.

SQ115 37000 Non-updatable column \<name\> in view \<view\_name\>
(expression or constant)

SQ116 37000 View \<name\> is not updatable.

SQ117 42000 No column update privilege for \<name\> in view
\<view\_name\>

SQ118 37000 Non-updatable column \<name\> in view \<view\_name\>
(expression or constant)

SQ119 37000 View \<name\> is not updatable.

SQ120 S0022 Bad CORRESPONDING BY column \<name\>

SQ121 42S02 No table \<table\_name\>

SQ122 42000 Must have select privileges on view \<name\>

SQ123 42S02 foreign key references non-existent table

SQ124 42S02 Foreign key reference to non existent table

SQ125 37000 Different number of referencing and referenced columns in
foreign key declaration from \<table\_name\> to \<table\_name\>

SQ126 42S22 Foreign key references invalid column \<name\> in
referencing table \<table\_name\>

SQ127 42000 The user has been deleted

SQ128 42000 Unsupported table constraint.

SQ129 42S22 No column \<column\_name\> in \<table\_name\>.

SQ130 42000 The count of supplied parameters to Virtuoso/PL FETCH
statement does not match the count of the selected columns.

SQ131 42S22 Column \<column\_name\> from a derived table not found

SQ132 42S01 Table \<table\_name\> already exists

SQ133 37000 Procedure declaration tries to overwrite a module with the
same name

SQ134 42000 Table already has an IDENTIFIED BY option

SQ135 42000 Duplicate label name \<name\>

SQ136 37000 Invalid escape character in LIKE

SQ137 37000 Dots not allowed inside column names

SQ138 37000 Comma expressions not allowed in an IN clause

SQ139 37000 Different number of subquery output columns for a predicate

SQ140 37000 Module declaration tries to overwrite a module with the same
name. Drop the module first.

SQ141 37000 Column is invalid in the select list because it is not
contained in either an aggregate function or the GROUP BY clause.

SQ142 37000 Different number of expected and generated columns in a
select

SQ143 37000 Tables '\<tb1\>' and '\<tb2\>' have the same exposed names.
Use correlation names to distinguish them.

SQ144 21S01 different number of cols and values in insert.

SQ145 21S01 different number of cols and values in insert.

SQ146 21S01 different number of cols and values in insert.

SQ147 37000 Incorrect ORDER BY clause for query expression.

SQ148 37000 TOP not supported in IN, ANY, SOME, ALL, ONE subqueries

SQ149 42S22 The column '\<column name\>' was specified multiple times
for '\<table name\>'

SQ150 37000 Column '\<col\>' is invalid in the select list because it is
not contained in either an aggregate function or the GROUP BY clause.

SQ151 S0022 Invalid alias declaration: insert trigger cannot reference
old values.

SQ152 S0022 Invalid alias declaration: delete trigger cannot reference
new values.

SQ153 37000 Other joins in the joined table of another outer join not
supported.

SQ154 37000 Error in trying to get the return value of a remote
procedure.

SQ155 37000 General internal \[Optimized\] compiler error in
\<file\>:\<line\>. Please report the statement compiled.

SQ156 37000 Internal \[Optimized\] compiler error in \<file\>:\<line\>:
\<message\>. Please report the statement compiled.

SQ157 42S02 The supertable \<table\> in UNDER is not defined.

SQ158 42S12 The supertable \<table\> in UNDER has no primary key.

SQ159 42S21 Column names in each table must be unique. Column name
\<col\> in table \<table\> conflicts with a column of the supertable
\<table\>.

SQ160 42000 No Select permission on the table \<table\>

SQ161 42000 No select permission on the table \<table\>

SQ162 42000 No insert or insert/delete permission for insert / insert
replacing

SQ164 42000 Update of \<table\> not allowed.

SQ165 37000 Empty namespace name is not valid in create xml view
\<view\>

SQ166 42000 Reference to undefined label.

SQ167 22023 The long varchar, long varbinary and long nvarchar data
types cannot be used in the WHERE, HAVING, or ON clause, except with the
IS NULL predicate for column \<name\>

SQ168 22023 The long varchar, long varbinary and long nvarchar data
types cannot be used in the WHERE, HAVING, or ON clause, except with the
IS NULL predicate for column \<name\>

SQ169 37000 Invalid fetch direction in FETCH

SQ170 37000 Key \<key\> is inherited from table \<table\>. Drop the
index from it.

SQ171 42000 an SQL \<module|stored procedure|user defined type\> with
name \<name\> already exists

SQ172 37000 Invalid external name in CREATE PROCEDURE

SQ173 42000 Maximum number of keys (\<num\>) already created

CL001 IM001 Function not supported : \<function\_name\>

CL002 HY010 Unprepared statement in SQLExtendedFetch

CL003 HY106 Bad fetch type for forward only cursor

CL004 HY107 Specified keyset size must be \>= the rowset size

CL005 HY106 Bookmarks not enabled or no bookmark retrieved

CL006 HY111 Bad bookmark for SQLExtendedFetch

CL007 S1010 SQLSetPos only allowed after SQLExtendedFetch

CL008 HY092 SQLSetPos irow out of range

CL009 HY109 Only SQL\_POSITION SQLSetPos option supported for forward
cursors

CL010 01S02 Option value changed

CL011 01S02 Option value changed

CL012 01S02 Option value changed

CL013 01S02 Option value changed

CL014 01S02 Option value changed

CL015 IM001 Driver does not support this function

CL016 01S02 Option value changed

CL017 IM001 Driver does not support this function

CL018 01S02 Option value changed

CL019 01S02 Option Value Changed

CL020 HY091 Invalid descriptor field identifier

CL021 HY091 Invalid descriptor type

CL022 HY091 Invalid descriptor type

CL023 HY091 Invalid descriptor type

CL024 HY091 Not supported

CL025 HY091 Invalid descriptor type

CL026 IM001 Driver doesn't support this function

CL027 HYC00 Optional feature not supported

CL028 S1010 Statement not prepared.

CL029 07005 Statement does not have output cols.

CL030 07009 Bookmarks not enabled for statement

CL031 S1002 Column index too large.

CL032 S1C00 Information not available.

CL033 S2801 Connect failed to \<dsn\> = \<host\_port\>

CL034 28000 Bad login

CL035 2C000 Charset \<name\> not available. Server default \<name2\>
will be used.

CL036 01S02 Switching to the server default charset \<name\>.

CL037 S1010 Statement not prepared.

CL038 07005 Statement does not have output cols.

CL039 07009 Bookmarks not enabled for statement

CL040 S1002 Column index too large.

CL041 HY010 Can't mix SQLFetch and SQLExtendedFetch.

CL042 HY010 Statement not prepared.

CL043 08S01 Connection lost to server

CL044 07009 Bad parameter index in SQLDescribeParam

CL045 08S01 Lost connection to server

CL046 40001 could not enlist transaction

CL047 25000 could not enlist resource manager in transaction

CL048 S1009 Information not available.

CL049 HY010 Can't mix SQLFetch and SQLExtendedFetch.

CL050 S1010 Bad call to SQLParamData

CL051 S1010 No param was asked for.

CL052 S1010 Bad place to call SQLPutData

CL053 S1010 No data was asked for.

CL054 S1010 Invalid buffer length (even) in passing character data to
binary column in SQLPutData

CL055 S1010 Invalid buffer length (even) in passing character data to
binary column in SQLPutData

CL056 07009 Bookmarks not enable for statement

CL057 S1010 Statement not fetched in SQLGetData.

CL058 07009 Column out of range in SQLGetData

CL059 01004 Data truncated.

CL060 07006 Non string data received with SQLGetData.

CL061 S1010 Can't set scroll on open cursor

CL062 S1090 Invalid string or buffer length

CL063 S1010 Async call in progress

CL064 08S01 Lost connection to server

CL065 08S01 Lost connection to server

CL066 S1T00 Virtuoso Communications Link Failure (timeout)

CL067 08S01 Lost connection to server

CL068 01000 Non last proc w/array params returned

CL069 22002 Invalid (odd) length in conversion from SQL\_C\_CHAR to
SQL\_BINARY

CL070 S1010 Invalid buffer length (even) in passing character data to
binary column in SQLPutData

CL071 01004 Data truncated.

CL072 01004 Data truncated.

CL073 01004 Data truncated.

CL074 01004 Data truncated

CL075 01004 Data truncated

CL076 01004 Data truncated.

CL077 01004 Data truncated.

CL078 01004 Data truncated.

CL079 01004 Data truncated.

CL080 01004 Data truncated.

CL081 01S07 Numeric truncated by client

CL082 01S01 Error in row in SQLSetPos

CL083 IM001 Unable to handle array parameters on a scrollable cursor

CL084 IM001 Unable to handle DATA\_AT\_EXEC params in SQLSetPos

CL085 HY020 Attempt to concatenate NULL value

CL086 28000 Password to be sent in cleartext with no encryption

CL087 01004 String data, right truncation

CL088 01004 String data, right truncation

CL089 42000 Not connected to the data source

CL090 01004 Data truncated

08C02 CLDPN luster operation cancelled because of peer disconnect
HOST:CLUSTER\_PORT

This is an inter-cluster communication error which requires the DBA to
restart the node corresponding to the HOST:CLUSTERPORT.

HT001 22023 An interactive blob can't be passed as argument to
ses\_write

HT002 22023 ses\_write requires string or blob as argument 1

HT003 08003 cannot write to session

HT004 42001 No DB.DBA.\_\_HTTP\_XSLT defined

HT005 22023 No VSP parameter for /INLINEFILE

HT006 37000 http output function outside of http context and no stream
specified: \<function\_name\>

HT007 22023 An interactive blob can't be passed as argument to http

HT008 22023 http requires string or blob as argument 1

HT009 37000 XML output function allowed only inside HTTP request

HT010 42000 This function is only allowed processing a HTTP request

HT011 42000 XML output function allowed only inside HTTP request

HT012 42000 XML output function allowed only inside HTTP request

HT013 42000 http\_path() function allowed only inside HTTP request

HT014 22023 Host name is too long

HT015 2E000 Cannot resolve host in http\_get

HT016 08001 Cannot connect in http\_get

HT017 08006 Error in reading from HTTP server

HT018 22023 URI too long in http\_get \<uri\>

HT019 22023 Proxy must contain port number

HT020 2E000 Cannot resolve host in http\_get \<uri\>

HT021 08001 Cannot connect in http\_get \<uri\>

HT022 08007 Error in writing to the target HTTP server

HT023 08006 Error in reading from target HTTP server

HT024 42000 http\_proxy only allowed inside HTTP request

HT025 42000 HTTP proxy function disabled.

HT026 08006 Error in mid read in http\_get \<uri\>

HT027 08006 Error in mid read in http\_get \<uri\>

HT028 22023 no http protocol identifier in http\_get URI \<uri\>

HT029 08006 Misc. error in connection in http\_get \<uri\>

HT030 08006 Error in mid read in http\_get \<uri\>

HT031 22023 The HTTP output is not an STRING session in
http\_output\_flush

HT032 42000 ses\_read\_line with no argument defaults it direct to the
raw client connection. Allowed only inside HTTP request

HT033 08003 cannot read from session

HT034 42000 The http\_flush not effective outside an VSP context

HT035 42000 The http\_flush already done

HT036 42000 The http\_auth not effective outside an VSP context

HT037 42000 The http\_client\_ip not effective outside an VSP context

HT038 08003 Server address not known

HT039 42000 Not allowed to call the http\_xslt in an non VSP context

HT040 42000 http\_map\_get function outside of http context

HT041 39001 set\_user\_id function cannot be called twice in the same
context.

HT042 22023 Not valid user id \<name\>

HT043 37000 bif\_ses\_write not called inside HTTP context

HT044 22023 The physical path must points to the dav domain.

HT045 22023 The port number of host and listen host must be the same.

HT046 22023 The listen host should be equal to SSLPort

HT047 37000 Max nesting level (20) reached when processing \<url\>

HT048 37000 Unterminated include tag at offset \<ofs\> in \<name\>

HT049 37000 An include tag at offset \<ofs\> with no name or VSP end tag
before an include tag in \<name\>

HT050 22023 Path contains ..

HT051 42000 Invalid SOAP URL

HT052 42000 Persistent XML not allowed as an argument to soap\_server

HT053 42000 Function http\_body\_read not allowed outside http\_context

HT054 08006 Error reading the content in http\_body\_read

HT055 22023 The authentication function required in the authentication
hook

HT056 42000 Searching for POST stream parameters not allowed outside
HTTP context

HT057 22023 The STRING session is longer than 10Mb. Use substring to
access it in parts.

HT058 22023 Missing leading slash in path parameter

HT059 42000 Proxy access denied to \[host\]

HT060 22023 The port number of SSL host and SSL listen host must be the
same.

FT001 22026 Length limit of composite exceeded.

FT002 S0002 bad table for vt\_words\_next\_d\_id

FT003 22003 composite index out of range \<n1\> for length \<n2\>

FT004 24000 cursor in vt\_words\_next\_d\_id is not open or not on row

FT005 42000 vtb\_match only allowed after vt\_batch\_strings

FT006 22023 Unknown encoding name \<name\>

FT007 22023 vt\_batch\_d\_id requires a composite or a number as id

FT008 22023 composite document id over 32 characters long.

FT009 22023 vt\_batch\_d\_id id's not in ascending order

FT010 22023 vt\_batch\_d\_id id's cannot be 0, -1 or -2

FT011 22023 Bad XML entity tree in vt\_batch\_feed

FT012 22023 Bad XML entity tree in vt\_batch\_feed

FT013 22023 Bad XML entity tree in vt\_batch\_feed

FT014 42000 The vt\_batch can't be used in vt\_batch\_feed after
vt\_batch\_strings has been called.

FT015 22023 The vt\_batch\_feed can't index XML tree entity argument,
only textual data and XPERs are allowed

FT016 22023 vt\_batch\_strings needs a string\_output as a second
argument, not an argument of type \<type\_name\> (\<dv\_type\>)

FT017 22003 word\_string\_insert max length too high

FT018 42S02 The table is not freetext indexed

FT019 22023 The new mode should be ON or OFF, not \<mode\>

FT020 42S22 No column

FT021 42S02 No table \<table\_name\> in create text index

FT022 42S01 Only one text index allowed per table

FT023 37000 Use NOT INSERT flag, because function hooks does not
generated before text index creation.

FT024 22023 the column \<name\> is not an integer

FT025 42000 id = id

FT026 42000 Misc. error upon update log creation. The free text index
cannot be created.

FT027 22008 Invalid XML supplied for an validating free text index of
\<table\_name\>

FT028 22008 Invalid XML supplied for an validating free text index of
\<table\_name\>

FT029 22008 Invalid XML supplied for an validating free text index of
\<table\_name\>

FT030 22008 Invalid XML supplied for an validating free text index of
\<table\_name\>

FT031 37000 Setting initial state of the freetext index for
\<table\_name\> failed. The data is intact, but the freetext index is
unusable. In order to recover from this state the table \<name2\> should
be dropped. This will clear all these created so far. Then the freetext
index creation should be retried after removing the cause of the error
which is : SQL State \[\<sql\_state\>\] Explanation : \<sql\_message\>

FT032 42S02 The table \<table\_name\> is not full-text indexed

FT033 Cannot create a scheduled event : \<error message\>

FT034 42S02 Text index not defined for \<table\_name\>

FT035 42S02 Text index should be enabled for the table \<table\_name\>

FT036 42S22 The id column \<name\> does not exist in table
\<table\_name\> definition

FT03742S22The data column \<name\> does not exist in table
\<table\_name\> definition x

FT038 22015 wildcard has over 1000 matches

FT039 22023 composite expected for composite\_ref

FT040 09000 No cursor for vt\_words\_next\_d\_id

FT041 22023 negative offset not allowed in composite\_ref

FT220 22023 function \<function\_name\> expects a word batch as argument
\<inx\>

FT370 22023 Wildcard word needs at least 3 leading characters

DC001 22023 Bad option for SET 2PC

DC002 37100 MTS support is not enabled

VD001 22023 Value of vdb\_timeout must be an integer

VD002 HY001 Not enough temp space to pass decimal parameter

VD003 HZ000 Cannot pass dtp \<dv\_type\> as param \<inx\> to remote
execute \<text\>

VD004 HZ000 Unknown result set column C type \<c\_type\_code\>

VD005 37000 Too few arguments for rexecute (dsn, text, state, message,
params, max, desc, result\[, handle)

VD006 37000 More then the maximum parameters supplied for rexecute

VD007 22023 Supplied DSN \<dsn\> is not valid

VD008 22023 The handle passed to rclose is not valid

VD009 22023 The handle passed to rnext is not valid

VD010 22023 The handle passed to rmoreresults is not valid

VD011 22023 Supplied DSN \<dsn\> is not valid

VD012 HZ000 Bad DSN in catalog call

VD013 HZ000 Bad DSN in catalog call

VD014 HZ000 Cannot remove DSN from ini

VD015 42000 Unknown windows version. The ODBCINST functionality disabled

VD016 42000 This feature runs only on Windows NT/Windows 2000. The
ODBCINST functionality disabled

VD017 HZ000 Cannot get installed drivers

VD018 22002 Init string cannot be empty

VD019 22011 Init string should finish with ;

VD020 22026 DSN name is too long

VD021 22023 DSN=\<DSN\_NAME\> parameter should be specified in init
string

VD022 42000 Cannot add DSN

VD023 42000 Cannot write the DSN setting to INI

VD024 01S08 Cannot write the File DSN

VD025 HZ000 Array parameters not supported by \<dsn\>. Retry statement

VD026 42000 Inconsistent vdb subquery compilation

VD027 HY090 Remote statement text over 19K

VD028 HY090 Remote statement text over 19K

VD029 42S02 Cannot generate remote ref to col w/ no table \<name\>

VD030 37000 The \_ROW virtual column cannot be referenced for remote
tables.

VD031 37000 Cannot reprint node \<inx\> for remote text

VD032 remote prepare : \<sql\_error\>

VD033 42000 No insert or insert/delete permission for insert / insert
replacing

VD034 42S22 No column \<name\>

VD035 42S02 No table \<name\>

VD036 42S22 No column \<name\>

VD037 42000 Update of \<name\> not allowed.

VD038 S0002 No remote procedure \<name\>

VD039 42S02 No table \<table\_name\>

VD040 42S02 Ref to wrong table in remote current of

VD041 42S22 No column \<name\>

VD042 42000 Update of \<name\> not allowed.

VD043 42S02 Ref to wrong table in remote current of

VD044 43000 Permission denied for delete.

VD045 42S02 Table in positioned delete is not the table of the cursor

VD046 S1000 Remote DSN \<dsn\> not defined

VD047 40001 Transaction killed during VDB call

VD048 40001 Transaction killed during VDB operation

VD049 HZ000 No remote DSN \<dsn\>

VD050 HZ000 No remote DSN \<dsn\>

VD051 HZ000 No remote DSN \<dsn\>

VD052 Remote DSN \<dsn\> : \<err\_message\>

VD053 HY090 Blob larger than \<len\> bytes is too long for VDB
buffering.

VD054 HY090 Blob larger than \<len\> bytes is too long for VDB
buffering.

VD055 22003 Can't convert remote numeric \<numeric\_string\> to local
numeric

VD056 HY001 Not enough temp space to pass decimal param

VD057 22023 Blob parameters not allowed at this point

VD058 22023 Cannot pass dtp \<dt\_type\> as param \<inx\> to remote
query \<text\>.

VD059 07001 Too many parameters in the call to the remote procedure
\<name\>

VD060 22023 Blobs can't be passed as non-input parameter \<inx\> to
remote procedure \<name\>

VD061 HY105 The parameter \<inx\> of the remote procedure \<name\> is an
output parameter

VD062 HZ000 Cannot attach tables from the same server

VD063 42S01 Table already exists in ATTACH

VD064 42S02 no remote table/view or ambiguous remote table/view
\<table\_name\> in DSN \<dsn\>

VD065 42S22 \<name\> is not a remote view \<table\_name\> column

VD066 42S12 No unique key

VD067 HZ000 Driver not capable for SQLTables

VD068 HZ000 Driver not capable for SQLTables

VD069 HZ000 Driver not capable for SQLTables

VD070 42S01 Table \<name\> exists as local table, cannot unlink
similarly named remote table

VD071 HY090 Blob larger than \<len\> bytes is too long for VDB
buffering.

VD072 HY090 Blob of \<len\> bytes is too long for VDB buffering.

VD073 HZ000 Bad DSN in sql\_columns

VD074 HZ000 Bad DSN in sql\_tables

VD075 HZ000 Bad DSN in sql\_primary\_keys

VD076 HZ000 Bad DSN in sql\_statistics

VD077 HZ000 Bad DSN in sql\_procedures

VD078 42000 Invalid type of the parameter \<num\> to rexec. Should be
'INOUT' or 'OUT'

VD079 42000 Invalid datatype of the parameter \<num\> to rexec.

VD080 42000 Missing input value of the inout parameter \<num\> to rexec.

VD081 42000 Output parameters require the use of settable resultset
variable in rexec.

VD082 42000 Output parameters don't allow use of an rexec cursor.

VD083 42000 Output parameters Output parameters require the use of
settable parameters variable in rexec.

VD084 42000 DDL operation not allowed on a remote table
'\<table\_name\>'

VD085 42000 Can't (commit | rollback) dsn \<dsn\_name\> because it is
(not in manual commit | not transaction capable)

VD086 22023 The statement in RSTMTEXEC should return resultset

VD087 42000 No permission to rexecute on DSN \<dsn\>

DT001 22007 Function \<name\> needs a datetime, date or time as argument
\<inx\>, not an arg of type \<type\_name\> (\<dv\_type\>)

DT002 22023 Bad unit in datediff: \<unit\>

DT003 22015 Interval not supported in \<function\>: \<interval\>

DT004 22015 Bad interval in timestampdiff: \<interval\>.

DT005 22015 Bad interval in extract.

DT006 22007 Cannot convert \<literal\> to datetime

DT007 22002 Nulls not allowed as parameters to stringdate

DT008 25000 now/get\_timestamp: No current txn for timestamp

DT009 22002 Nulls not allowed as parameters to stringtime

DT010 22007 Can't convert \<literal\> to time

DT011 22007 Can't convert \<literal\> to time

IN001 2C000 The UTF-8 is not a redefinable charset

IN002 2C000 charset\_define : Charset table not a wide string

IN003 2C000 crahset\_define : 0 not allowed as a charset definition

IN004 2C000 charset \<name\> already defined. Drop it first

IN005 2C000 Alias \<inx\> not of type STRING

IN006 22023 Collation \<name\> not defined

IN007 2C000 Charset \<name\> not defined

IN008 2C000 Charset \<name\> not defined

IN009 22005 Bad value for wide string column \<name\>, dtp =
\<dv\_type\>.

IN010 22021 Untranslatable character in an output context that doesn't
allow escapes.

IN011 22005 Bad value for wide string column \<name\>, type =
\<dv\_type\_title\>.

IN012 2C000 Narrow source charset specified, but the supplied string is
wide

IN013 2C000 Wide source charset specified, but the supplied string not
wide

IN014 22005 Invalid data supplied in NVARCHAR -\> VARBINARY conversion

IN015 22005 Invalid data supplied in VARBINARY -\> NVARCHAR conversion

TR001 37000 The publication \<name\> doesn't exist

TR002 37000 Replication not enabled on this server

TR003 37000 The publication \<name\> doesn't exist

TR004 37000 The subscription \<name\> from \<server\> doesn't exist

TR005 37000 publication and subscription servers have identical names.

TR006 37000 Publishing server must be declared with REPL\_SERVER before
subscribing

TR007 37000 The subscription \<name\> already exist

TR008 22023 User name and password should be supplied when subscribe to
new publisher

TR009 37000 The WebDAV collection \<name\> already exist

TR010 37000 The table \<name\> already exist

TR011 22023 The item type \<type\> not applicable

TR012 37000 Can't schedule local publication

TR014 22023 You should specify valid user name and password for
replication synchronization

TR015 37000 Replication account \<acct\> from \<server\> doesn't exist

TR016 37000 The publication \<name\> does not exist

TR017 37000 The publication \<name\> doesn't exists.

TR018 37000 The WebDAV collection \<name\> doesn't exists.

TR019 37000 The DAV collection \<name\> must added before checkpoint.

TR020 22023 Function DAV\_COL\_I needs string or array as path

TR021 22023 The first parameter is not valid path string

TR022 37000 Non-existing collection

TR023 22023 Function DAV\_COL\_U needs strings as paths

TR024 22023 The second parameter is not valid path string

TR025 22023 The first parameter is not valid path string

TR026 37000 Non-existing collection

TR027 37000 Non-existing parent collection

TR028 22023 Function DAV\_COL\_D needs string as path

TR029 22023 The first parameter is not valid path string

TR030 37000 Non-existing collection

TR031 22023 Function DAV\_RES\_I needs string or array as path

TR032 22023 The first parameter is not valid path string

TR033 37000 Non-existing collection

TR034 22023 Function DAV\_RES\_D needs string as path

TR035 22023 The first parameter is not valid path string

TR036 37000 Non-existing resource

TR037 37000 The publication account \<name\> does't exist

TR038 37000 The dav publication \<name\> already exist

TR039 37000 The WebDAV collection \<name\> doesn't exist

TR040 37000 The table \<name\> doesn't exist

TR041 37000 The procedure name doesn't exist

TR042 37000 The procedures calls to \<name\> can not be replicated to
more than one publication

TR043 22023 The item type \<type\> not applicable

TR044 37000 The table \<name\> doesn't exist

TR045 37000 The replication server \<server\> doesn't exist

TR046 37000 The target table \<target\_table\> already exist

TR047 37000 The publication \<acct\> doesn't exist

TR048 22023 The grantee is invalid user name : \<grantee\>

TR049 37000 The publication \<acct\> doesn't exist

TR050 22023 The grantee is invalid user name : \<grantee\>

TR051 37000 The grantee \<grantee\> doesn't exist

TR052 22023 The path string is mandatory for DB.DBA.MKCOL

TR053 37000 Publication server \<server\> doesn't exist

TR054 37000 Table \<tbl\> doesn't exist

TR055 37000 The WebDAV collection \<name\> already exist

TR057 42000 The new name must be the same as in the ServerName (from INI
file)

TR058 42000 General error, publication records can't be updated

TR059 42000 The current name of server cannot be altered.

TR060 42000 The name of new server used from another publishing server.

TR061 42000 The publication on "\[new\_name\]" exists with the same name
a on "\[old\_name\]". The rename operation cannot be performed

TR065 22023 Replication account can not be empty

TR066 22023 Replication account can not be empty

TR067 37000 No replication account \<server\> \<account\>

TR068 37000 No such account

TR069 37000 Server must have a DBName entry in its ini file for
replication

TR070 42000 Replication server not enabled in repl\_log\_text

TR071 42000 Replication account or trail missing for account name
\<name\> in logging replication.

TR072 08001 Replication connect to \<server\> failed.

DA001 37000 Includes can be owned only by admin & cannot be writable for
others

DA002 37000 Max nesting level (20) reached when processing \<path\>

DA003 37000 Unterminated include tag at offset \<offset\> in \<path\>

DA004 37000 An include tag at offset \<inx\> with no name or VSP end tag
before an include tag in \<path\>

DA005 22023 Unsupported type of metadata

DA006 22023 Unsupported type of metadata

DA007 22023 Function ISPUBL needs string or array as argument.

DA008 08006 Cannot read from client

DA009 42000 Function dav\_user\_set\_password restricted to dba group

DA010 42000 The user \[name\] does not exist

DA011 42000 The new password for \[name\] cannot be empty

SM001 08006 \<SMTP server response\>

SM002 2E000 Cannot resolve host in smtp\_send

SM003 08001 Cannot connect in smtp\_send

SM004 22023 Default mail server and/or destination server should be
specified

SM005 08006 Misc. error while connecting in smtp\_send

SM006 22023 Sender can not be empty

PO001 2E000 Cannot resolve host in pop3\_get

PO002 08001 Cannot connect in pop3\_get

PO003 08006 \<POP3 server error response\>

PO004 08006 Misc. error in connection in pop3\_get

NN001 22023 Large ID in nntp\_id\_get

NN002 2E000 Invalid address for News Server at \<addr\>

NN003 08001 Unable to Contact News Server at \<addr\>

NN004 08006 \<NNTP server error message\>

NN005 08006 Misc. error in connection in nntp\_get

NN006 22023 the command is not recognized

NN007 08006 Misc. error in connection in nntp\_auth\_get

NN008 22023 the command is not recognized

NN009 08006 Misc. error in connection in nntp\_id\_get

NN010 22023 The command is not recognized

NN011 2E000 Invalid address for the News Server at \<addr\>

NN012 08001 Unable Post to the News Server at \<addr\>

NN013 08007 Misc. error in connection in nntp\_post

NN014 08007 \<NNTP server error message\>

NN015 2E000 Invalid address for the News Server at \<addr\>

NN016 08001 Unable Post to the News Server at \<addr\>

NN017 08007 Misc. error in connection in nntp\_auth\_post

NN018 08007 \<NNTP server error message\>

XS001 37000 Bad match XPATH expression

XS002 XS370 Only xsl:attribute elements allowed inside xsl:attribute-set
name=\<name\>

XS003 XS370 Only xsl:attribute elements allowed inside xsl:attribute-set
name=\<name\>

XS004 XS370 Only xsl:attribute elements and no value allowed inside
xsl:attribute-set name=\<name\>

XS005 XS370 Max nesting (\<num\>) of XSLT attribute-sets exceeded

XS006 XS370 xsl:text with disable-output-escaping=on content is not a
string

XS007 XS370 Element in set to be sorted must be an XML node

XS008 XS370 XSLT select in apply-templates must return a node set

XS009 XS370 Not an entity in select in apply-templates

XS010 XS370 XSLT template \<name\> not found.

XS011 XS370 select in for-each must return a node set

XS012 XS370 Element in for-each is not an entity

XS013 XS370 Bad ns prefix in q name \<name\>

XS014 XS370 Qualified name too long

XS015 XS370 Attribute value for \<name\> is not a string

XS016 XS370 processing instruction body for \<name\> is not a string

XS017 XS370 comment body is not a string

XS018 XS370 child element of xsl:choose must be a xsl:when or an
xsl:otherwise

XS019 XS370 Unsupported numbering level \<level\>

XS020 XS370 Bad xsl node \<node-name\>

XS021 22023 The xslt parameters must be an even length generic array

XS022 22023 XSLT parameters must have strings for even numbered elements

XS023 XS370 Required XSLT attribute \<attr-name\> missing in \<name\>

XS024 XS370 Required XSLT attribute \<attr-name\> missing in \<name\>

XS025 XS370 top element is not stylesheet

XS026 XS370 top element is not stylesheet

XS027 XS370 no top element is stylesheet

XS028 XS379 cyclic reference in: \<name\> included from: \<name\>

XS029 XS370 "yes" or "no" required for "output" tag attribute
\<attr-name\> in \<name\>

XS030 22023 Bad style sheet in xslt\_sheet

XS031 XS379 cyclic reference in: \<url1\> imported from: \<uri2\>

XS032 XS379 Standalone required but no SYSTEM or PUBLIC doctype

XS033 22023 An XSLT sheet must be a memory based XML tree

XS034 22023 Undefined style sheet \<name\>

XS035 XS370 Number format \<format\> redefined with different attributes

XS036 XS370 Number format \<format\> not defined

XS037 22023 Unquoted special character in format-number()

XS038 22023 Unquoted special character in format-number()

XS039 22023 Too many percent/permille characters in format-number()
pattern

XS040 22023 Too many percent/permille characters in format-number()
pattern

XS041 22023 Unexpected '0' in format-number() pattern

XS042 22023 Multiple decimal separators in format-number() pattern

XS043 22023 Malformed format-number() pattern

CR001 42000 Cannot allocate temp space. SSL Error : \<err\>

CR002 42000 Cannot read certificates. SSL Error : \<err\>

CR003 42000 No CA certificates. SSL Error : \<err\>

CR004 42000 Cannot read PKCS7 attached signature. SSL Error : \<err\>

CR005 42000 Cannot allocate output storage. SSL Error : \<err\>

CR006 42000 No CA certificates

CR007 42000 Error reading the signer certificate. SSL Error : \<err\>

CR008 42000 Error reading the signer private key. SSL Error : \<err\>

CR009 42000 Cannot generate PKCS7 signature. SSL Error : \<err\>

CR010 42000 Cannot allocate output storage. SSL Error : \<err\>

CR011 42000 Cannot allocate temp space. SSL Error : \<err\>

CR012 42000 Cannot read certificates. SSL Error : \<err\>

IB002 42000 Read of page \[PAGE NUM\] failed

Internal error of backup process. Possible reason - corrupted database
file.

IB001 42000 Could not compress page \[PAGE NUM\]

Internal error of backup process. Possible reason - corrupted database
file.

IB003 42000 Could not store backup context

Possible reason - user has no permissions to perform online backup.

IB004 42000 Could not read backup context

Possible reason - user has no permissions to perform online backup.

IB008 42000 Could not clear online backup context

Possible reason - user has no permissions to perform online backup.

IB008 42000 Could not clear online backup context

Possible reason - user has no permissions to perform online backup.

IB005 42000 Backup file \[FILE NAME\] writing error

Backup file can not be written. Possible reason - disk is full.

IB006 42000 Number of backup pages is less than 100

Minimal allowed maximal number of pages contained in one backup file is
100. Increase second argument of online\_backup.

IB007 42000 Could not create backup file \[FILE NAME\]

Backup file could not be created in the virtuoso directory. Check file
permissions.

IB009 42000 Timeout exceeded

online\_backup procedure was aborted due to timeout.

IB010 42000 Timeout cannot be negative

Negative timeout parameter in online\_backup procedure is not valid.

UD001 22023 User defined type specified for an element

UD002 42S22 Class \<class\> is TEMPORARY. It can't be used as a column
type

UD003 22023 aset has no effect on values returned by member observers

UD004 22023 Invalid proc\_name array supplied

UD005 22023 Non-existent user defined type \<type\>

UD006 22023 No such method in user defined type \<type\>

UD007 22023 Method \<mtd\> in user defined type \<type\> not defined

UD008 22023 Method \<mtd\> needs an user defined type instance as
argument 1, not an arg of type \<type\> (\<tdp\>)

UD009 37000 Field \<fld\> declared of different language than the class
\<type\>

UD010 37000 Field \<fld\> declared of different language than the class
\<type\>

UD011 37000 Duplicate external name option

UD012 37000 Duplicate external language option

UD013 37000 Duplicate external language option

UD014 37000 EXTERNAL VARIABLE NAME can be used only with STATIC methods

UD015 37000 Method \<mtd\> declared of different language than the class
\<type\>

UD016 37000 Class \<type\> already declared

UD017 37000 Class \<type\> declared of different language from it's
forward declaration

UD018 37000 Class \<type\> declared of different language from it's
superclass \<class\>

UD019 37000 Can't make a (TEMPORARY | PERSISTENT) subclass \<class\> of
a (TEMPORARY | PERSISTENT) class \<class\>

UD020 42S01 Type \<type\> already exists

UD021 42000 No user defined class \<type\>

UD022 42000 Type \<type\> is used in one or more compiled queries. Drop
them first.

UD023 42000 Duplicate member name \<fld\> in type \<type\>

UD024 42000 Duplicate method \<method\> in type \<type\>

UD025 22023 Function \<function\_name\> needs an user defined type name
as argument \<arg\_no\>

UD026 22023 Invalid instance in user defined type observer

UD027 22023 Invalid instance in user defined type mutator

UD028 22023 Invalid instance in user defined type method call

UD029 22023 \<type\> is not an instance of \<type\> in user defined type
method call

UD030 22023 \<type\> instance supplied to a static method call \<mtd\>
of \<type\>

UD031 22023 No instance supplied to a non-static method call \<mtd\> of
\<type\>

UD032 42000 Method '\<mtd\>' of type '\<type\>' not defined

UD033 22023 Non-valid object instance supplied to member
observer/mutator for class \<class\>

UD034 42000 The object (type \<type\>) is not an instance of \<type\>

UD035 42000 invalid instance offset \<ofs\>

UD036 42000 invalid vtable offset \<offset\>

UD037 22023 The object supplied is not an instance of \<type\>

UD038 22023 The object (type \<type\>) is not an instance of \<type\>

UD039 42000 invalid vtable offset \<ofs\>

UD040 37000 User defined type \<type\> not found in member observer (...
AS ...) call

UD041 37000 No user defined type \<type\>

UD042 37000 No method \<mtd\> in the user defined type \<type\>

UD043 37000 Ambiguous method \<method\> in the user defined type
\<type\>

UD044 37000 Non-existent method \<method\> in dynamic method call

UD045 37000 No method \<method\> in the user defined type \<type\>

UD046 37000 Ambiguous method \<method\> in the user defined type
\<type\>

UD047 37000 Not an proper constructor call

UD048 37000 No constructor in the user defined type \<type\>

UD049 37000 Ambiguous constructor call for the user defined type
\<type\>

UD050 37000 No class

UD051 37000 Method definition allowed only for SQL user defined types

UD053 37000 No method of that name declared

UD054 37000 Invalid class for the method definition

UD055 22023 Can't write to an user defined type column

UD056 22023 No field \<fld\> in the user defined type \<type\>

UD057 22023 No field \<fld\> in the user defined type \<type\>

UD058 22023 No user defined type \<type\>

UD059 22023 Failed to make instance of the user defined type \<type\>

UD060 22023 XML attributes not supported with user defined types

UD061 22023 No member \<fld\> in the user defined type \<type\>

UD062 42000 Method with bad owner, owner = \<owner\>

UD063 22023 Type \<type\> is obsolete.

UD064 37000 Type \<type\> is DISTINCT. ALTER TYPE ADD ATTRIBUTE for
distinct types is not supported

UD065 37000 Field with name \<name\> is already defined(inherited) for
type \<type\>

UD066 42S22 Field with name \<name\> defined for type \<type\>, which is
an derived type of \<type\>

UD067 42S22 The definition of type \<type\> not found in
SYS\_USER\_TYPES

UD068 37000 Type \<type\> is DISTINCT. ALTER TYPE DROP ATTRIBUTE for
distinct types is not supported

UD069 37000 No field with name \<name\> for type \<type\>

UD070 37000 User defined type \<type\> is not instantiable

UD071 37000 Method \<name\> already defined in type \<type\>

UD072 37000 User defined type \<type\> is not instantiable

UD073 37000 No method \<name\> found in type \<type\>

UD074 42S22 No user defined type \<type\>

UD075 42S22 \<type\> is declared TEMPORARY. ALTER TYPE not supported for
TEMPORARY classes

UD076 42S22 \<type\> is not instantiable

UD077 42S22 \<type\> is an external hosted user defined type. ALTER TYPE
not supported for non-SQL user defined types.

UD078 42000 ALTER TYPE action not implemented

UD079 42000 Internal error: No user defined type to alter

UD080 42000 User defined type \<type\> is a super type at least of
\<type\>. Drop it and any other such types first.

UD081 42S22 Field with name \<name\> defined for type \<type\>, which is
an derived type of \<type\>

UD082 42S22 The definition of type \<name\> not found in
SYS\_USER\_TYPES

UD083 37000 Type \<name\> is DISTINCT. ALTER TYPE DROP ATTRIBUTE for
distinct types is not supported

UD084 37000 No field with name \<name\> for type \<type\>

UD085 37000 User defined type \<name\> is not instantiable

UD086 37000 Method \<name\> already defined in type \<name\>

UD087 37000 User defined type \<name\> is not instantiable

UD088 37000 No method \<name\> found in type \<name\>

UD089 42S22 No user defined type \<name\>

UD090 42S22 \<name\> is declared TEMPORARY. ALTER TYPE not supported for
TEMPORARY classes

UD091 42S22 \<name\> is not instantiable

UD092 42S22 \<name\> is an external hosted user defined type. ALTER TYPE
not supported for non-SQL user defined types.

UD093 42000 ALTER TYPE action not implemented

UD094 42000 Internal error: No user defined type to alter

UD095 42000 user defined type \<type\> owner specified is different than
the creator.

UD096 42000 No permission to use type \<type\> as a superclass for
\<type\>

UD097 42000 No permission to instantiate user defined type \<type\>

UD098 42000 No permission to access members of user defined type
\<type\>

UD099 42000 No permission to change members of user defined type
\<type\>

UD100 42000 No permission to call methods of user defined type \<type\>

UD101 42000 No permission to define methods of class \<type\>

UD102 42000 Cannot compile the temp method for external procedure

KB001 42000 while initializing Kerberos 5 library

KB002 42000 while getting default credential cache (ccache)

KB003 42000 when parsing name \<name\>

KB004 42000 when unparsing name

KB005 42000 when initializing cache

KB006 42000 wrong password

KB007 42000 while storing credentials

KB008 42000 while initializing Kerberos 5 library

KB009 42000 while getting \<name\> credential cache (ccache)

KB010 42000 while getting default credential cache (ccache)

KB011 42000 while getting remove credential cache (ccache)

HO001 22023 Invalid params type \<tag\> (\<name\>)

## Data Type Errors

Each function that accepts parameters will check that each parameter is
of the correct data type. A function will generate a SQL 22023 error
value if a supplied parameter is not of the type expected.

# Signals and Exit codes

This section presents the most important exit codes and signals for
Virtuoso on Unix/Linux.

## Exit codes

| Exit Code |
| :-------- |
| \-1       |
| 0         |
| 1         |
| \>1       |
| \>128     |

Exit codes

## Signals

| Signal |
| :----- |
| 1      |
| 2      |
| 3      |
| 4      |
| 7      |
| 8      |
| 9      |
| 11     |
| 13     |
| 15     |

Signals

Signals that are marked as *NORMAL* indicate that these signals can be
sent by root or the owner of the virtuoso process to shutdown Virtuoso.
The *SIGINT* and *SIGQUIT* signals also work when Virtuoso is running in
background mode and can be used in shell scripts.

Signals that are marked as *FAULT* indicate an abnormal condition which
should be checked. If enabled (e.g. with ulimit -c unlimited), the
operating system can write a core dump allowing post-mortem debugging if
the Virtuoso executable was compiled with debugging symbols.

Signals that are marked as *IGNORED* are handled inside Virtuoso.

The *SIGTERM* signal is mostly used by rc.d type shell scripts on
Unix/Linux which are called during shutdown, but can also be used inside
shell scripts.

The *SIGKILL* signal should only be used as a last resort when all other
efforts to stop Virtuoso have failed.

### Quick shutdown

In quick shutdown mode, Virtuoso will only flush dirty disk buffers,
close transaction log and database files and exit to the operating
system. Since Virtuoso does not perform a checkpoint, the next startup
will take extra time as Virtuoso first needs to perform a rollback and a
checkpoint before it can resume operation. The *SIGTERM* signal mostly
used by rc.d type scripts on Unix/Linux which are called during shutdown
as such instances it is better to quickly finish operations and delay
the checkpoint until the next boot.

### Normal shutdown

In normal shutdown mode, Virtuoso will do first do a full checkpoint,
then flush dirty disk buffers, close transaction log and database files
before exiting to the operating system. Depending on the size of the
transaction log this can take some time. The *SIGINT* signal can be used
in stop scripts to cleanly shutdown the database by the dba or by root.

Note that in all cases signals can only be sent by the kernel, the root
user or the uid of the person who started Virtuoso. Anyone else that
wants to shutdown the Virtuoso instance should use the isql program to
connect to Virtuoso and run the 'shutdown' command.

# Release Notes

## New Features

  - *SOAP 1.1 Implementation* - this new release includes a wide range
    of new SOAP features, bringing it up to date with the most recent
    developments of this rapidly evolving technology :

  -   - Flexibility in configuring SOAP access points using a WEB based
        user interface allowing exposure of selected stored procedures
        as SOAP services. These procedures may be local or linked from
        any 3rd party databases. The effective privileges for running
        SOAP exposed procedures can also be set at the access point
        level.
    
      - Improved SOAP to Virtuoso/PL Language Binding allowing the
        receiving and returning of arbitrarily complex arrays and
        structures, using XML Schema to describe the mapping of Virtuoso
        internal types to precisely match specification expressed in XML
        Schema.
    
      - Automated generation of WSDL descriptions of SOAP access points
        - Simple procedure parameter lists map automatically to SOAP
        types described in XML Schema. For complex types, procedures can
        be annotated with explicit references to XML Schema types. Thus
        the developer has complete control over the presentation of web
        services.
    
      - Import of WSDL descriptions of outside web services. Virtuoso
        automatically generates Virtuoso/PL wrappers based on an outside
        WSDL file, making all its services transparently callable as
        stored procedures from Virtuoso/PL.
    
      - Virtuoso's SOAP client and server implementations pass the SOAP
        Interop tests levels 1, 2 and most of 3.
    
      - Virtuoso Service Module for XML (VSMX) is a mechanism provided
        by Virtuoso for testing SOAP messages by automatically
        generating a test page - a VSMX file - that has the extension
        .vsmx. The VSMX file is generated at the same time as the WSDL
        file is generated, giving instant access to your SOAP messages
        to test they perform as expected. Web Service developers would
        use VSMX to forego the test bed creation step in light of
        automatic test page generation. Project managers can easily keep
        track of their developers progress by checking the test page
        periodically.

  - *XSLT 1.1 Implementation* - support for the XSLT 1.1 Draft
    Specification has been added.

  - *Exposure of Stored Procedures as Web Services* - Stored procedures
    can be exposed as SOAP services very simply from Virtuoso, whether
    the procedures are native Virtuoso or on remote data sources. This
    powerful ability means that any database servers already existing
    within an organization can easily become a component in an eBusiness
    solution using Virtuoso.

  - *XML Schema* - contains a built-in XML Schema 2001 validator. This
    is accessible from Virtuoso/PL as a function and is used for SOAP
    and XQuery where appropriate.

  - *XML Templates* - Virtuoso XML templates allow execution of SQL/XML
    queries over HTTP to obtain an XML document in response and/or
    perform some operation in the database using updategrams. The XML
    Template file can be stored either on the file system, WebDAV
    repository or stored on another HTTP server being referenced by a
    URL parameter.

  - *XQuery* - Virtuoso provides support for the XQuery 1.0 XML Query
    Language specification. This specification is currently in the
    working draft stage at the W3C XML Query Working Group working in
    collaboration with the W3C XSL Working Group.

  - *Web DAV* - support for redirection of resources, using the Web DAV
    Redirect Reference Resource Protocol draft 02 specification.

  - *Remote Stored Procedures* - Stored Procedures located in remote
    databases can now be linked into the Virtuoso Server in the same
    manner as you would link in tables or views. This enables remote
    stored procedures to be readily and easily exposed as WEB Services.

  - *OLE DB Provider* - native OLE DB Provider is now available allowing
    direct connection from ADO and .Net applications.

  - *JDBC Driver* - enhanced JDBC support with full compliance with JDBC
    J2EE standard.

  - *Free Text* - The full text indexing capability has been extended,
    giving the developer flexibility in choosing complex, multi-part
    document id's for application specific sorting of hits, efficient
    storage of secondary, non-free text data in the free text index for
    best retrieval performance, options for restarting searches at a
    specific hit, ascending and descending orders of document id's and
    more.

  - *Free Text Triggers* - The free text triggers system allows
    persisting free text queries into a table, so that when a free text
    index is updated, the incoming data gets automatically matched
    against these persisted criteria, generating hits as the index is
    updated. This allows very high performance filtering of fast
    changing text data, e.g. news feeds without having to run periodic
    query batches and is ideal for creating personalized information
    feeds.

  - *LDAP* - support for the Lightweight Directory Access Protocol
    (LDAP) protocol for accessing online directory services.

  - *Enhanced Flexibility of Database and VDB security* - New SQL hooks
    allow the developer to customize password checking at the time of
    accepting SQL connections into the server. Another hook allows an
    application to dynamically determine the login/password to use when
    connecting to a remote database. These hooks make it possible for
    example to consult an LDAP directory for user information when
    validating logins.

  - *File DSN support* - with the ability to describe a database
    connection in a simple disk file, Virtuoso becomes more portable,
    and no longer dependent on per-machine DSNs. If you use file DSNs
    you can move your database file and your connection information to
    any computer that has the appropriate drivers installed.

  - *Scrollable cursor support in the stored Procedure Language (PL)* -
    Virtuoso PL now allows you direct access to all ODBC standard
    features of scrollable cursors through PL routines. ODBC calls are
    still supported but you have a choice of which level to write your
    code.

## Bugs Fixed

  - *Bug 3889* Change label of tab "XML Services/Queues".

  - *Bug 3891* Admin UI Home Page Update for 3.0.

  - *Bug 3892* Server Startup Information (Branding Info).

  - *Bug 3893* When v:data-set @nrows = 1 the 'next' and 'prev' buttons
    do.

  - *Bug 3895* Segmentation fault after running dbpump from Yacutia.

  - *Bug 3907* Explain HO-S-4 and HO-S-5 login.

  - *Bug 3918* Validators can't work inside Data-Set.

  - *Bug 3919* There is no way to format columns data in editing
    controls.

  - *Bug 3920* v:button @style=url or @style=image not working properly.

  - *Bug 3921* Logical validators error in Data-Set.

  - *Bug 3923* xslt\_format\_number doesn't work properly with value 0.

  - *Bug 3924* "Cancel" failed after Edit mode in Data-Set.

  - *Bug 3925* v:column is not more needed in v:data-set.

  - *Bug 3926* v:update-field obsoleted.

  - *Bug 3931* Initializing JAVA Hosting Tutorials hangs server.

  - *Bug 3932* Position Holding in Tutorial Frames.

  - *Bug 3936* Virtuoso Unix Installer script.

  - *Bug 3943* Data-Set don't work properly inside 'if-login' template.

  - *Bug 3950* PDF Version of Documentation is not match HTML.

  - *Bug 3956* Tutorial Reorganization.

  - *Bug 3969* Install.sh text changes.

  - *Bug 3972* Configs, Makefile and installer are not "unpublished
    propriety.

  - *Bug 3973* Virtuoso crashes.

  - *Bug 3984* Dynamic Generation of Runtime Tutorial Heading.

  - *Bug 3998* bad xpath\_eval with //.

  - *Bug 3999* Group by clause works wrong.

  - *Bug 4000* end\_result() has wrong side effect when procedure called
    from procedure view.

  - *Bug 4003* Some catalogs missing in drop down in SOAP expose.

  - *Bug 4004* Move Reload button in SOAP expose.

  - *Bug 4005* Rename Grant and revoke buttons in SOAP expose.

  - *Bug 4006* SQL Error 22023 SR016 in SOAP endpoint hierarchical list.

  - *Bug 4013* Install.sh conclusion text needs changing.

  - *Bug 4017* Installer is broken - uid and password update.

  - *Bug 4021* Lack of pre\_render\_ method for most of controls.

  - *Bug 4025* Service Tray Service Manger About contains a typing
    mistake.

  - *Bug 4026* UDDI; typo in Contact details tab "Address".

  - *Bug 4030* DB - TABLE CREATION : Data entered by user is lost.

  - *Bug 4034* Absence of the strong KEY column for the UDDI.DESCRIPTION
    t.

  - *Bug 4044* style="url" for "Delete" v:button in data-set caused
    error.

  - *Bug 4049* V:URL unsuitable.

  - *Bug 4054* WSDL import uncatched error.

  - *Bug 4062* Virgin XP installation of Mono Based Server fails to
    start.

  - *Bug 4063* Installer does not set CLASSPATH to point to Virtuoso
    JDBC.

  - *Bug 4066* Virtuoso Java Based Server fails to start.

  - *Bug 4067* Linux installer does not present best default Server for
    install.

  - *Bug 4076* System Tray Icon doe not get removed.

  - *Bug 4078* gacutil is missing for RT framework.

  - *Bug 4079* VSCM toggles the wrong DB.

  - *Bug 4084* Server Crash - ASP.NET hosting.

  - *Bug 4090* Retrieve in tables list.

  - *Bug 4095* Browse button in column name for v:text inspector does
    not work.

  - *Bug 4096* v:login + page-decor + buttons failed.

  - *Bug 4099* Problem with ORDER BY.

  - *Bug 4100* Problems with using xpath\_contains and xquery\_eval in
    SQL statement.

  - *Bug 4102* Kill foreground process misses php java mono servers.

  - *Bug 4106* SQL-XML unhandled error.

  - *Bug 4109* DB hang when running backup with clear backup context
    checker.

  - *Bug 4110* SQL-XML Error message upon unsuccessful execution of
    query.

  - *Bug 4111* SQL-XML Error attempting to reset the form.

  - *Bug 4114* Virtuoso service starts even though no valid license
    found.

  - *Bug 4115* Installer doesn't alert user of non-started instance.

  - *Bug 4118* case expression incorrectly works in select statement.

  - *Bug 4125* eNews fails to display scrolling items.

  - *Bug 4126* Driver does not display SQLSTATE error messages.

  - *Bug 4129* Views do not show up via SQLTables call.

  - *Bug 4130* entity reference \&nbsp; breaks XSLT processor.

  - *Bug 4159* Can't insert date/datetime values as string literals.

  - *Bug 4169* Page with list of saved SQL-\>XML queries missing.

  - *Bug 4170* Successful/unsuccessful messages in SQL-\>XML.

  - *Bug 4171* SQL-XML misplaced option.

  - *Bug 4173* Missing owner/group params in SQL-XML page.

  - *Bug 4174* Missing default root element name in SQL-XML execution.

  - *Bug 4175* SQL-XML execution Apply XSLT?.

  - *Bug 4177* Button names in Profiling.

  - *Bug 4181* Can not "manage" the default "db30" instance.

  - *Bug 4188* Open Demo.openlinksw.com in New Window.

  - *Bug 4196* Min And Max attributes for v:validator.

  - *Bug 4197* v:validator with test="sql".

  - *Bug 4207* Visit the online tutorials links are inconsistent.

  - *Bug 4217* Declare continue handler for block don't work.

  - *Bug 4222* ho-s-7 (DataGrid Demo) problems.

  - *Bug 4234* Tutorial and offline documentation creation failure in
    demo.

  - *Bug 4245* .NET client can't work properly with ODBC driver.

# Product Support

## OpenLink Discussion Forums

If your browser does not parse the Network News Transport Protocol
(NNTP) URL's used in the hyperlinks below, then simply point your news
client to one of the following news servers: *news.openlinksw.com* or
*news.openlinksw.co.uk* .

### OpenLink Virtuoso

| Newsgroup Description |
| :-------------------- |
| OpenLink Virtuoso     |

Virtuoso Newsgroups

### OpenLink Data Access (Lite Edition)

Dedicated to Database Connectivity issues that relate to OpenLink Data
Access Drivers (PC based) that depend on:

| Newsgroup Description                                                              |
| :--------------------------------------------------------------------------------- |
| *Oracle SQL\*Net* for remote Oracle Database Engine Connectivity.                  |
| *Sybase Open Client* for remote Sybase Database Engine Connectivity.               |
| *Progress Client Networking* for remote Progress Database Engine Connectivity.     |
| *Informix I-Net or I-Connect* for remote Informix Database Engine Connectivity.    |
| *Microsoft NETLIB* for remote MS SQL Server Database Engine Connectivity           |
| *IBM DB2 Client Networking* for remote DB2 Database Engine Connectivity            |
| *CA-Ingres Net* for remote CA-Ingres & CA-OpenIngres Database Engine Connectivity. |
| *3rd Party ODBC Drivers* for remote Database Engine Connectivity.                  |

OpenLink Data Access Newsgroups

### OpenLink Data Access (Multi Tier Edition)

Dedicated to Database Connectivity issues that relate to OpenLink Data
Access Drivers that depend on

| Newsgroup Description                                                                                                         |
| :---------------------------------------------------------------------------------------------------------------------------- |
| *OpenLink's Database Independent Communications Layer* for remote Oracle Database Engine Connectivity.                        |
| *OpenLink's Database Independent Communications Layer* for remote Sybase Database Engine Connectivity.                        |
| *OpenLink's Database Independent Communications Layer* for remote Informix Database Engine Connectivity.                      |
| *OpenLink's Database Independent Communications Layer* for remote Progress Database Engine Connectivity.                      |
| *OpenLink's Database Independent Communications Layer* for remote CA-Ingres Database Engine Connectivity.                     |
| *OpenLink's Database Independent Communications Layer* for remote MS SQL Server Database Engine Connectivity.                 |
| *OpenLink's Database Independent Communications Layer* for remote DB2 Database Engine Connectivity.                           |
| *OpenLink's Database Independent Communications Layer* for remote Unify 2000 Database Engine Connectivity.                    |
| *OpenLink's Database Independent Communications Layer* for remote PostgreSQL Database Engine Connectivity.                    |
| *OpenLink's Database Independent Communications Layer* for remote Solid Database Engine Connectivity.                         |
| *OpenLink's Database Independent Communications Layer* for remote Kubl Database Engine Connectivity.                          |
| *OpenLink's Database Independent Communications Layer* for remote Velocis Database Engine Connectivity.                       |
| *OpenLink's Database Independent Communications Layer* for remote ODBC Data Source Connectivity using 3rd Party ODBC Drivers. |

OpenLink Data Access Newsgroups

# Virtuoso System Tables

## Core System Tables

``` 
    create table SYS_COLS (
        TABLE           varchar,
        COLUMN          varchar,
        COL_ID          integer,
        COL_DTP         integer,
        primary key (COL_ID))

    create index SYS_COLS_BY_NAME on SYS_COLS (TABLE, COLUMN)

    create table SYS_KEYS (
        KEY_TABLE       varchar,
        KEY_NAME        varchar,
        KEY_ID          integer,
        KEY_N_SIGNIFICANT   integer,
        KEY_CLUSTER_ON_ID   integer,
        KEY_IS_MAIN     integer,
        KEY_IS_OBJECT_ID    integer,
        KEY_IS_UNIQUE       integer,
        KEY_MIGRATE_TO      integer,
        primary key (KEY_TABLE, KEY_NAME))

    create index SYS_KEYS_BY_ID on SYS_KEYS (KEY_ID)

    create table SYS_KEY_PARTS (
        KP_KEY_ID       integer,
        KP_NTH          integer,
        KP_COL          integer
        primary key (KP_KEY_ID, KP_NTH))

    create table SYS_KEY_SUBKEY (
        SUPER           integer,
        SUB         integer,
        primary key (SUPER, SUB))
```

The SYS\_COLS table defines all tables and columns. Each column appears
once in this table. No entries are made for inherited columns. The
SYS\_KEYS table defines all indices. A row in this table corresponds to
each key in the database, either originally defined or inherited.

KEY\_IS\_MAIN is non-zero if this is the primary key of its table. The
KEY\_MIGRATE\_TO is the key ID of a new version of this key if this key
is obsolete (e.g. the primary key of a table from before an ALTER
TABLE). The KEY\_N\_SIGNIFICANT indicates how many leading key parts are
used in ordering keys.

The KEY\_ID references the KP\_KEY\_ID in the SYS\_KEY\_PARTS table.
This table embodies the actual layout of keys and rows. The KP\_NTH is a
number positioning the KP\_COL to the appropriate place in the row. The
KP\_COL references the COL\_ID in SYS\_COLS. The KP\_NTH is not
necessarily a series of consecutive integers but the order matches the
order of columns on the row.

The SYS\_KEY\_SUBKEY table has a row for each pair of keys where one is
the immediate subkey of the other. Note that when a table is altered,
the obsolete layout is marked as a subtable of the new layout of the
primary key. Thus a select on the new primary key will also get the
obsolete rows.

The following SQL procedure exemplifies how the SYS\_COLS, SYS\_KEYS and
SYS\_KEY\_PARTS tables combine. Given a table name it produces the set
of columns and the set of indices and their parts.

``` 
    create procedure dt (in tn varchar)
    {
        declare index_name, col, dtp varchar;
        declare t, nth integer;

        dtp := '-';

        result_names (col, t);    --- first result set

        declare cr cursor for select COLUMN, COL_DTP
          from SYS_COLS where TABLE = tn;

        whenever not found goto done;
        open cr;
        while (1=1) {
            fetch cr into col, t;
            result (col, t);
        }
    done:
        result_names (index_name, nth, col);     -- 2nd result set
        end_result ();

        declare icr cursor for select KEY_NAME, KP_NTH, COLUMN
          from SYS_KEYS, SYS_KEY_PARTS, SYS_COLS
          where KEY_TABLE = tn and KP_KEY_ID = KEY_ID
          and KP_NTH < KEY_N_SIGNIFICANT and  COL_ID = KP_COL;

        whenever not found goto k_done;
        open icr;
        while (1=1) {
            fetch icr into index_name, nth, col;
            result (index_name, nth, col);
        }
    k_done:
        return 0;
    }
```

## System Tables

DB objects related to the User and Role objects are created as follows.
The terms group and role are used interchangeably.

    create table
      SYS_USERS (
        U_ID        integer unique,   -- unique id identifying the security object
        U_NAME      char (128),   -- unique name identifying the security object
        U_IS_ROLE       integer     default 0, -- if true it's a group
        U_FULL_NAME     char (128), -- for information only, name of that user or group
        U_E_MAIL        char (128)  default '', -- e-mail for contact
        U_PASSWORD      char (128),     -- encrypted password
        U_GROUP         integer,    /* the primary group references SYS_USERS (U_ID), */
        U_LOGIN_TIME    datetime,       -- last login time, can be set in login hooks,
            -- otherwise is set when login in webDAV repository
        U_ACCOUNT_DISABLED integer  default 1, -- if true the account is not functional
        U_DAV_ENABLE    integer     default 0, -- true if DAV login allowed
        U_SQL_ENABLE    integer     default 1, -- true if  SQL/(ODBC/JDBC/OLE/DB etc)  login allowed.
        U_DATA      varchar,    /* reserved */
        U_METHODS       integer,        /* reserved */
        U_DEF_PERMS     char (10)   default '110100000R', -- see PERMISSIONS option value
        U_HOME      varchar (128),  -- see HOME option value
        U_PASSWORD_HOOK     varchar,    -- see PASSWORD_MODE option value
        U_PASSWORD_HOOK_DATA varchar,   -- see PASSWORD_MODE_DATA option value
        U_GET_PASSWORD  varchar,    -- see GET_PASSWORD option data
        U_DEF_QUAL      varchar,        -- default qualifier for SQL/ODBC login
        U_OPTS      long varchar,   -- extensibility options for user&group objects
        primary key (U_NAME)
     )

    create table
    SYS_ROLE_GRANTS (
       GI_SUPER     integer references SYS_USERS (U_ID), -- user object id
         GI_SUB     integer references SYS_USERS (U_ID), -- granted role object id
         GI_DIRECT      integer default 1,      -- false if indirect, i.e.
             -- true by inheritance, not direct grant.
         GI_GRANT       integer,                -- who has granted this role
         GI_ADMIN       integer default 0,           -- true if granted with admin option
         primary key (GI_SUPER, GI_SUB, GI_DIRECT));

For Backwards compatibility the system tables SYS\_DAV\_USER,
SYS\_DAV\_GROUP, SYS\_DAV\_USER\_GROUP and SYS\_USER\_GROUP are
re-defined as views:

    -- WebDAV Users
    create view WS.WS.SYS_DAV_USER (U_ID, U_NAME, U_FULL_NAME, U_E_MAIL, U_PWD,
        U_GROUP, U_LOGIN_TIME, U_ACCOUNT_DISABLED, U_METHODS, U_DEF_PERMS, U_HOME)
      as select U_ID, U_NAME, U_FULL_NAME, U_E_MAIL, U_PASSWORD as U_PWD,
        U_GROUP, U_LOGIN_TIME, U_ACCOUNT_DISABLED, U_METHODS, U_DEF_PERMS, U_HOME
        from DB.DBA.SYS_USERS where U_IS_ROLE = 0 and U_DAV_ENABLE = 1;
    
    -- WebDAV Groups
    create view WS.WS.SYS_DAV_GROUP (G_ID, G_NAME)
        as select U_ID as G_ID, U_NAME as G_NAME
            from DB.DBA.SYS_USERS where U_IS_ROLE = 1 and U_DAV_ENABLE = 1;
    
    -- The granted groups to the WebDAV user
    create view WS.WS.SYS_DAV_USER_GROUP (UG_UID, UG_GID) as select GI_SUPER, GI_SUB from DB.DBA.SYS_ROLE_GRANTS
           where GI_DIRECT = 1;
    
    create view SYS_USER_GROUP (UG_UID, UG_GID) as select GI_SUPER, GI_SUB
       from SYS_ROLE_GRANTS where GI_DIRECT = 1;

``` 
    create table SYS_GRANTS  (
        G_USER      varchar,
        G_OP        integer,
        G_OBJECT    varchar,
        G_COL       varchar,
        primary key (G_USER, G_OP, G_OBJECT, G_COL));
```

These tables are visible only to dba members. The procedure list\_grants
shows a summary of granted privileges:

    SQL> list_grants (0);

These tables should not be modified by applications. Only the SQL
statements GRANT, REVOKE, CREATE USER, DELETE USER, SET USER GROUP and
SET PASSWORD should be used to maintain user and security information.
Security information is cached in RAM during the execution of a Virtuoso
process and these statements ensure that the cache stays consistent with
the tables.

## Row Level Security Table

    create table SYS_RLS_POLICY (
      RLSP_TABLE varchar, - the FQN of the table
      RLSP_OP varchar, - the operation (one per row : I/U/D/S)
      RLSP_FUNC varchar, - the FQN of the stored procedure to be called
      PRIMARY KEY (RLSP_TABLE, RLSP_OP))

That system table is used for persisting the definitions

## SYS\_CHARSETS

    CREATE TABLE SYS_CHARSETS (
        CS_NAME varchar,            -- The "preferred" charset name
        CS_TABLE long nvarchar,     -- the mapping table of length 255 Wide chars
        CS_ALIASES long varchar     -- serialized vector of aliases
    );

## Collations System Table

The SYS\_COLLATIONS system table holds the data for all the defined
collations. It has the following structure:

    CREATE TABLE SYS_COLLATIONS (
        COLL_NAME VARCHAR,
        COLL_TABLE LONG VARBINARY,
        COLL_IS_WIDE INTEGER);

COLL\_NAME is the fully qualified name of the collation (it's
identifier)

COLL\_TABLE holds the collation table (256 bytes or 65536 wide chars)

COLL\_IS\_WIDE show the collation's type (0 for CHAR and 1 for NCHAR).
Note that a 8bit collation cannot be used by a NCHAR data and vice
versa.

Collation can be deleted by deleting its row from SYS\_COLLATIONS.

> **Note**
> 
> The collation will still be available until the server is restarted,
> as it's definition is cached into memory.

## UDDI Schema

    ---=====================
    --- Business Entity Table
    ---=====================
    create table UDDI..BUSINESS_ENTITY (
        BE_BUSINESS_KEY     varchar,
        BE_AUTHORIZED_NAME  varchar,
        BE_OPERATOR     varchar,
        BE_NAME         varchar not null,
        BE_CREATED      datetime,
        BE_CHANGED      timestamp,
        BE_OWNER        integer,
     PRIMARY KEY (BE_BUSINESS_KEY)
    )
    ;

    ---=======================
    --- Business service Table
    ---=======================
    create table UDDI..BUSINESS_SERVICE (
        BS_BUSINESS_KEY     varchar,        -- references business entity (optional)
        BS_SERVICE_KEY      varchar not null,       -- Unique Key
        BS_NAME         varchar not null,   -- Name
        BS_CREATED      datetime,
        BS_CHANGED      timestamp,
        BS_OWNER        integer,
    PRIMARY KEY (BS_SERVICE_KEY)
    )
    ;

    ---========================
    --- Binding Templates Table
    ---========================
    create table UDDI..BINDING_TEMPLATE (
        BT_BINDING_KEY      varchar,
        BT_SERVICE_KEY      varchar,
        BT_ACCESS_POINT     varchar,
        BT_HOSTING_REDIRECTOR   varchar,
        BT_URL_TYPE     varchar,
        BT_CREATED      datetime,
        BT_CHANGED      timestamp,
        BT_OWNER        integer,
        PRIMARY KEY (BT_BINDING_KEY)
    )
    ;

    ---======================
    --- tModel Table
    ---======================
    create table UDDI..TMODEL (
        TM_TMODEL_KEY       varchar,
        TM_AUTHORIZED_NAME      varchar,
        TM_OPERATOR             varchar,
        TM_NAME                 varchar,
        TM_CREATED      datetime,
        TM_CHANGED      timestamp,
        TM_OWNER        integer,
        primary key (TM_TMODEL_KEY)
    )
    ;

    ---====================
    --- Descriptions Table
    ---====================
    create table UDDI..DESCRIPTION (
        UD_DESC         varchar,      -- Description Text
        UD_LANG         varchar,
        UD_PARENT_ID        varchar,      -- Parent ID (references tmodel,
                                        -- businessService etc.)
        UD_TYPE         varchar       -- ParentType (name of parent table)
    )
    create index DESC_PARENT on DESCRIPTION (UD_TYPE, UD_PARENT_ID)
    ;

    --=====================================================================================
    -- Discovery URL table: contains structure - holds a URL addressable discovery documents
    --=====================================================================================
    create table UDDI..DISCOVERY_URL (
        DU_PARENT_ID        varchar not null,   -- parent ID
        DU_PARENT_TYPE      varchar not null,   -- name of parent element
        DU_URL          varchar,        -- URI
        DU_USE_TYPE     varchar         -- UseType element
    )
    create index DISCOVERY_URLS_PARENT on DISCOVERY_URL (DU_PARENT_TYPE, DU_PARENT_ID)
    ;

    --===================
    -- Address line table
    --===================
    create table UDDI..ADDRESS_LINE (
        AL_PARENT_ID        varchar not null,       -- Parent key
        AL_PARENT_TYPE      varchar not null,   -- name of parent element
        AL_USE_TYPE     varchar,        -- UseType element
        AL_SORT_CODE        varchar,        -- SortCode element
        AL_LINE         varchar         -- The Line content
    )
    create index ADDR_LINE_PARENT on ADDRESS_LINE (AL_PARENT_TYPE, AL_PARENT_ID)
    ;

    ---================
    --- Contacts Table
    ---===============
    create table UDDI..CONTACTS (
            CO_CONTACT_KEY      varchar,
        CO_BUSINESS_ID      varchar not null,   -- references business entity table by business key
        CO_USE_TYPE     varchar,        -- UseType element
        CO_PERSONAL_NAME    varchar not NULL,   -- name
        PRIMARY KEY (CO_CONTACT_KEY)
    )
    create index IN_BUSINESS on CONTACTS (CO_BUSINESS_ID)
    ;

    --============
    -- email table
    --============
    create table UDDI..EMAIL (
        EM_CONTACT_KEY     varchar not null,
        EM_ADDR            varchar,
        EM_USE_TYPE        varchar
    )
    create index IN_EMPARENT on EMAIL (EM_CONTACT_KEY)
    ;

    --============
    -- phone table
    --============
    create table UDDI..PHONE (
        PH_CONTACT_KEY     varchar not null,
        PH_PHONE           varchar,
        PH_USE_TYPE        varchar
    )
    create index IN_PHPARENT on PHONE (PH_CONTACT_KEY)
    ;

    ---=====================
    --- Identifier Bag Table
    ---=====================
    create table UDDI..IDENTIFIER_BAG (
        IB_PARENT_ID        varchar not null,
        IB_PARENT_TYPE      varchar not null,
        IB_TMODEL_KEY_ID    varchar,
        IB_KEY_NAME     varchar,
        IB_KEY_VALUE        varchar
    )
    create index IB_PARENT on IDENTIFIER_BAG (IB_PARENT_ID,IB_PARENT_TYPE)
    ;

    ---===================
    --- Category Bag Table
    ---===================
    create table UDDI..CATEGORY_BAG (
        CB_PARENT_ID        varchar not null,
        CB_PARENT_TYPE      varchar not null,
        CB_TMODEL_KEY_ID        varchar,
        CB_KEY_NAME         varchar,
        CB_KEY_VALUE        varchar
    )
    create index CB_PARENT on CATEGORY_BAG (CB_PARENT_ID, CB_PARENT_TYPE)
    ;

    ---===================
    --- Overview Doc Table
    ---===================
    create table UDDI..OVERVIEW_DOC (
        OV_KEY              varchar,
        OV_PARENT_ID            varchar not null,
        OV_PARENT_TYPE          varchar not null,
        OV_URL              varchar,
        PRIMARY KEY (OV_KEY)
    )
    create unique index PARENT_OVERVIEW_DOC on OVERVIEW_DOC (OV_PARENT_ID, OV_PARENT_TYPE)
    ;

    ---===============================
    --- TModel Instance Details Table
    ---===============================
    create table UDDI..INSTANCE_DETAIL  (
        ID_KEY          varchar not null,
        ID_BINDING_KEY      varchar,        -- references btemplate(bindingkey)
        ID_TMODEL_KEY       varchar,        -- references tmodel(tmodelkey)
        ID_PARMS        varchar,
        primary key (ID_KEY)
    )
    create index IN_IDPARENT on INSTANCE_DETAIL (ID_BINDING_KEY, ID_TMODEL_KEY)
    ;

## Web Robot System Tables

**Target sites table.**

    create table WS.WS.VFS_SITE (
      VS_DESCR   varchar,   -- Human readable description
      VS_HOST    varchar,   -- target hostname (eq. www.foo.com)
      VS_URL     varchar,   -- target path (eq. /cgi-bin/ or /)
      VS_INX     char(5),   -- not used
      VS_OWN     integer,   -- ID of the local WebDAV owner
      VS_ROOT    varchar,   -- target WebDAV collection
      VS_NEWER   datetime,  -- Update the link if newer than
      VS_DEL     char(3),   -- Delete local copy if delete on remote detected flag
      VS_FOLLOW  varchar,   -- follow list (list of masks to allow following the links)
      VS_NFOLLOW varchar,   -- the do not follow list
      VS_SRC     char(3),   -- do get of the images - flag
      VS_OPTIONS varchar,   -- username/password credentials for
                            --  authorization on target site
      VS_METHOD  varchar,   -- use HTTP or HTTP/WebDAV to retrieve the target site
      VS_OTHER   char(10),  -- go to other sites flag
      primary key (VS_HOST, VS_ROOT)
    )
    ;

**The queues table.**

    create table WS.WS.VFS_QUEUE (
      VQ_HOST    varchar,  -- target host
      VQ_TS      datetime, -- when added to the queue
      VQ_URL     varchar,  -- path on target
      VQ_ROOT    varchar,  -- the WebDAV local collection
      VQ_STAT    char (15),-- status of the entry
      VQ_OTHER   varchar,  -- flag for other site generated link
      primary key (VQ_HOST, VQ_URL, VQ_ROOT)
    )
    ;

**The retrieved URLs table.**

    create table WS.WS.VFS_URL (
      VU_HOST     varchar,  -- target host
      VU_URL      varchar,  -- path on target
      VU_ROOT     varchar,  -- the local WebDAV collection containing
                            -- content of the retrieved link
      VU_CHKSUM   varchar,  -- checksum
      VU_ETAG     varchar,  -- Etag from target
      VU_CPTIME   datetime, -- when is copied
      VU_OTHER    varchar,  -- is the link retrieved from foreign site
      primary key (VU_HOST, VU_URL, VU_ROOT)
    )
    ;

## Web Server & DAV System Tables

All Web Server and DAV related tables and procedures are held in the WS
catalogue. This reference section illustrates their structure.

### Collections (folders)

    create table WS.WS.SYS_DAV_COL (
      COL_ID    integer,  -- unique collection id
      COL_NAME  char(256),-- collection name
      COL_OWNER     integer,  -- collection owner id (FK SYS_DAV_USER (U_ID))
      COL_GROUP     integer,  -- collection owner group id (FK SYS_DAV_GROUP (G_ID))
      COL_PARENT    integer,  -- parent collection id (FK SYS_DAV_COL (COL_ID))
      COL_CR_TIME   datetime, -- creation time
      COL_MOD_TIME  datetime, -- modification time
      COL_PERMS     char(9),  -- collection access permissions (like UNIX ugo style)
      primary key (COL_NAME, COL_PARENT)
    )
    ;

### Groups

### Locks

    create table WS.WS.SYS_DAV_LOCK (
      LOCK_TYPE     char (1),     -- type of the lock (R (read) or W (write))
      LOCK_SCOPE    char (1),     -- lock scope (X (exclusive) or S (shared))
      LOCK_TOKEN    char(256),    -- unique lock token
      LOCK_PARENT_TYPE  char (1), -- lock parent type (R (resource), C (collection))
      LOCK_PARENT_ID  integer,    -- lock parent (resource/collection)
                                  -- id (FK SYS_DAV_COL (COL_ID) or SYS_DAV_RES (RES_ID))
      LOCK_TIME     datetime,     -- lock creation time
      LOCK_TIMEOUT  integer,      -- lock time-out
      LOCK_OWNER    integer,      -- lock owner id (FK SYS_DAV_USER (U_ID))
      LOCK_OWNER_INFO varchar,    -- lock owner info (if WebDAV client sent
                                  -- additional info eq. e-mail etc.)
      primary key (LOCK_PARENT_TYPE, LOCK_PARENT_ID)
    )
    ;

### Properties

    create table WS.WS.SYS_DAV_PROP (
      PROP_ID      integer,   -- unique property id
      PROP_NAME    char(256), -- property name
      PROP_TYPE    char (1),  -- property parent type (R (resource), C (collection))
      PROP_PARENT_ID integer, -- parent resource/collection id (FK SYS_DAV_COL (COL_ID)
                              -- or SYS_DAV_RES (RES_ID))
      PROP_VALUE   varchar,   -- value of the property (plain text or serialized XML entity)
      primary key (PROP_NAME, PROP_TYPE, PROP_PARENT_ID)
    )
    ;

### Resources (documents)

    create table WS.WS.SYS_DAV_RES (
      RES_ID        integer,    -- unique resource id
      RES_NAME  char(256),-- resource name
      RES_OWNER     integer,    -- resource owner id (FK SYS_DAV_USER (U_ID))
      RES_GROUP     integer,    -- resource owner group id (FK SYS_DAV_GROUP (G_ID))
      RES_COL   integer,    -- parent collection id (FK SYS_DAV_COL (COL_ID))
      RES_CONTENT   long varchar IDENTIFIED BY RES_FULL_PATH,
                -- resource content
      RES_TYPE  varchar,    -- resource MIME type (eq. text/plain etc.)
      RES_CR_TIME   datetime,   -- creation time
      RES_MOD_TIME  datetime,   -- modification time
      RES_PERMS     char (9),   -- resource access permissions (like UNIX ugo style)
      RES_FULL_PATH     varchar,    -- resource full path (eq. /DAV/docs/name.txt)
      primary key (RES_COL, RES_NAME)
    )
    ;

### Resource Types (MIME types)

    create table WS.WS.SYS_DAV_RES_TYPES (
      T_EXT     varchar,    -- extension
      T_TYPE        varchar,    -- associated MIME type
      T_DESCRIPTION varchar,    -- optional description
      primary key (T_EXT)
    )
    ;

> **Note**
> 
> The Resource Types table is also used by the HTTP server for
> determining the appropriate 'Content-Type' header for any deliverable,
> either from WebDAV or the file system.

### HTTP Virtual Directory Mappings

    create table DB.DBA.HTTP_PATH (
      HP_HOST             varchar not null, -- mapping Host in HTTP header note: *ini*
      HP_LISTEN_HOST      varchar not null, -- IP address & port for
                                            -- mapping listening session
      HP_LPATH            varchar not null, -- logical path
      HP_PPATH            varchar not null, -- physical path
      HP_STORE_AS_DAV     integer not null, -- flag for webDAV storage
      HP_DIR_BROWSEABLE   integer not null, -- directory listing allowed
      HP_DEFAULT          varchar,  -- default page
      HP_SECURITY         varchar,  -- which method allowed all/https/digest (NULL/SSL/DIGEST)
      HP_REALM            varchar,  -- authentication realm
      HP_AUTH_FUNC        varchar,  -- which function authenticate this directory
      HP_POSTPROCESS_FUNC varchar,  -- function call after request
      HP_RUN_VSP_AS       varchar,  -- uid for VSPs REFERENCES SYS_USERS (U_NAME)
                                    --   ON DELETE SET NULL
      HP_RUN_SOAP_AS      varchar,  -- uid for SOAP REFERENCES SYS_USERS (U_NAME)
                                    --   ON DELETE SET NULL
      HP_PERSIST_SES_VARS integer,  -- have a persistent session variables
      HP_SOAP_OPTIONS     varchar,  -- SOAP options
      HP_AUTH_OPTIONS     varchar,  -- options for authentication hook function
      primary key (HP_LISTEN_HOST, HP_HOST, HP_LPATH)
    )
    ;

### HTTP Access Control List

    create table HTTP_ACL (
    HA_LIST     varchar not null,       -- ACL name
    HA_ORDER    integer not null,       -- Position  in the list
    HA_OBJECT   integer not NULL default -1,    -- Object ID (applicable to news groups also)
    HA_CLIENT_IP    varchar not NULL,       -- *PATTERN*
    HA_FLAG     integer not NULL default 1, -- Allow/Deny flag, 0 - allow, 1 - deny
    HA_RW       integer default 0,      -- Read/Write flag, 0 - read,  1 - post
    HA_DEST_IP  varchar default '*',        -- Destination IP/Host (applicable to the proxy also)
    PRIMARY KEY (HA_LIST, HA_ORDER, HA_CLIENT_IP, HA_FLAG)
    );

## Mail Table Description

    - - Message queue
    create table MAIL_MESSAGE_QUEUE (
        MQ_ID       varchar,    - - FK MAIL_MESSAGE (MM_ID)
        MQ_RECIEVER     varchar,    - - foreign mail exchanger
        primary key (MQ_ID))
    ;
    
    create index MAIL_MSG_Q_REC on MAIL_MESSAGE_QUEUE (MQ_RECIEVER)
    ;
    
    -- Mail Table
    create table DB.DBA.MAIL_MESSAGE (
        MM_ID       integer,        -- Unique id of message (per user)
        MM_OWN  varchar (128),  -- Local WebDAV account (recipient, mail box owner) name,
                        FK references WS.WS.SYS_DAV_USER (U_NAME)
        MM_FLD  varchar (128), -- Message Folder (initial 'Inbox')
        MM_FROM varchar (512),      -- From: RFC822 header field
        MM_TO       varchar (512),      -- To: RFC822 header field
        MM_CC       varchar (512),      -- Cc: RFC822 header field
        MM_BCC  varchar (512),  -- Bcc: RFC822 header field
        MM_SUBJ varchar (512),  -- Subject of the message
        MM_REC_DATE varchar (50),   -- Date of arrival
        MM_SND_TIME varchar (50),   -- Date of posting
        MM_IS_READED    integer,        -- Read flag (0/1 not read, 1 - read)
        MM_BODY long varchar,   -- Message content (including message header)
        primary key (MM_OWN, MM_FLD, MM_ID)
    )
    ;

> **Note**
> 
> MM\_FROM, MM\_TO, MM\_CC, MM\_BCC, MM\_SUBJ, MM\_SND\_TIME exists only
> if there exists corresponding RFC822 headers in mail message

    -- Temporary message MIME parts table (for message composition)
    create table DB.DBA.MAIL_PARTS (
        MP_ID   integer,        -- Unique id per user (order of parts)
        MP_PART     long varbinary, -- Message MIME part body
        MP_ATTRS    long varbinary, -- Message MIME part attributes
        MP_OWN  varchar (128),  -- WebDAV user name - FK REFERENCES WS.WS.SYS_DAV_USER (U_NAME)
        primary key (MP_OWN, MP_ID)
    )
    ;
    
    - - Local mail users
    (this table will be needed only in case of different DB, DAV and MAIL users)
    create table MAIL_USERS (
        MU_NAME varchar,
        MU_PWD  varchar,
        primary key (MU_NAME))
    ;
    
    - - Allowed relay domains
    (only in case of allowed relaying)
    create table MAIL_RELAY (
        MR_ALLOWED  varchar;
        primary key (MR_ALLOWED))
    ;

## NNTP Server Tables

The server uses the following tables:

    create table NEWS_MESSAGES (
      NM_ID         varchar (128) not null, -- Message-ID (unique)
      NM_REF        varchar (128),          -- References
      NM_GROUP      varchar (128) not null, -- Newsgroups ID
      NM_NUM_GROUP  integer not null,       -- ID unique for group
      NM_READED     integer,                -- How many times this message is read
      NM_OWN        varchar (128),          -- Local sender (if sender is non
                                               local should be null)
      NM_REC_DATE   datetime,               -- Receiving date
      NM_STAT       integer,                -- Post from the local user
      NM_HEAD       long varchar,           -- Message header
      NM_BODY       long varchar,           -- Message content
      primary key (NM_ID))

    create table NEWS_GROUPS (
      NG_GROUP      integer identity,  -- Newsgroups ID
      NG_NAME       varchar (128) NOT NULL, -- Local name
      NG_DESC       varchar (128), -- Comment
      NG_SERVER     varchar (128), -- Server
      NG_SERV_PORT  integer,       -- Server port
      NG_OUT_GROUP  varchar (128), -- Out name
      NG_POST       integer,       -- Flag 0/1 posting allowed
      NG_UP_TIME    datetime,      -- Last Update
      NG_CREAT      datetime,      -- When group is created (attached)
      NG_UP_INT     integer,       -- Update interval (min)
      NG_CLEAR_INT  integer,       -- Drop interval for messages
      NG_LIFE_READ  integer,       -- Flag 0/1 read messages exist longer
      NG_STAT       integer,       -- Flag 0/3 Result from last update.
                  0 - Unsuccessful
                  1 - Successful
                  3 - Successful  but does not get all available messages.
    
      NG_AUTO       integer,       -- Flag 0/1 Auto download.
      NG_PASS       integer,       -- Download messages for one pass.
      NG_UP_MESS    integer,       -- Messages from last update.
      NG_NUM        integer,       -- Estimated number of articles in group
      NG_FIRST      integer,       -- First article number in the group
      NG_LAST       integer,       -- Last article number in the group
    
      primary key (NG_GROUP))

    create table NEWS_ACL (
      NA_GROUP  integer not NULL, -- News Group number, referencing
                                     NEWS_GROUPS (NG_GROUP)
      NA_IP     varchar not NULL, -- Client IP (the mask is %)
      NA_A_D    integer not NULL, -- flag  0 - allow, 1 - deny (action)
      NA_RW     integer not NULL, -- flag  0 - read,  1 - post (reading
                                  or posting action is allowed/disallowed)
      PRIMARY KEY (NA_GROUP, NA_IP, NA_A_D, NA_RW));

## WS Reliable Messaging

### Receiver-Side Schema Objects

Incoming messages table used to keep successfully received messages. An
application on receiver side can access it in order to process the
messages.

    CREATE TABLE SYS_WSRM_IN_MESSAGE_LOG (
      IML_INDENTIFIER varchar,             -- references SYS_WSRM_IN_SEQUENCES.WIS_IDENTIFIER
      IML_MESSAGE_ID int NOT NULL,         -- unique per sequence
      IML_EXPIRE_DATE datetime,            -- when expires
      IML_RECEIVE_DATE timestamp NOT NULL ,
      IML_MESSAGE long varchar NOT NULL,   -- the message itself
      IML_STATE int,
      primary key (IML_INDENTIFIER, IML_MESSAGE_ID)
    )
    ;

Incoming sequences table; used to keep the successfully established
message sequence and policy to be applied to it.

    CREATE TABLE SYS_WSRM_IN_SEQUENCES
        (
      WIS_IDENTIFIER varchar, -- sequence identifier
      WIS_VERSION varchar,
      WIS_DELIVERY_ASSURANCE varchar,
      WIS_SEQUENCE_EXPIRATION datetime,
      WIS_INACTIVITY_TIMEOUT integer,
      WIS_RETRANSMISSION_INTERVAL integer,
      WIS_ACKNOWLEDGEMENT_INTERVAL integer,
      primary key (WIS_IDENTIFIER)
    )
    ;

### Sender's Schema Objects

Outgoing messages log table is used to keep the outgoing messages, to
track their state. It also keeps parameter to the soap request in order
to re-send if are not already accepted.

    CREATE TABLE SYS_WSRM_OUT_MESSAGE_LOG (
      OML_INDENTIFIER varchar,          -- references SYS_WSRM_OUT_SEQUENCES.WOS_IDENTIFIER
      OML_MESSAGE_ID int NOT NULL,      -- unique per sequence
      OML_EXPIRE_DATE datetime,         -- when expires
      OML_SEND_DATE timestamp NOT NULL, -- when is sent
      OML_MESSAGE long varchar NOT NULL,-- soap call parameters
      OML_STATE int,
      primary key (OML_INDENTIFIER, OML_MESSAGE_ID)
    )
    ;

Outgoing sequences table is used to keep parameters for outgoing message
sequences. It's used to persist their state.

    CREATE TABLE SYS_WSRM_OUT_SEQUENCES (
      WOS_IDENTIFIER varchar,           -- sequence identifier
      WOS_VERSION varchar,
      WOS_DELIVERY_ASSURANCE varchar,
      WOS_SEQUENCE_EXPIRATION datetime,
      WOS_INACTIVITY_TIMEOUT integer,
      WOS_RETRANSMISSION_INTERVAL integer,
      WOS_ACKNOWLEDGEMENT_INTERVAL integer,
      primary key (WOS_IDENTIFIER)
    )
    ;

## WS Trust

    create table WST_SERVER_ISSUER_TOKENS
    (
      WSK_TOKEN_TYPE    varchar,
      WSK_REQUEST_TYPE  varchar,
      WSK_APPLIES_TO    varchar,
      WSK_FROM      varchar,
      WSK_SERVICE_NAME  varchar,
      WSK_PORT_TYPE     varchar,
      WSK_TOKEN     varchar,
      PRIMARY KEY (WSK_TOKEN_TYPE, WSK_FROM, WSK_TOKEN)
    )
    ;

## SyncML Schema Objects

### SyncML Devices

    create table SYNC_DEVICES (
      DEV_ID integer identity,
      DEV_USER_ID integer,   -- references WS.WS.SYS_DAV_USER(U_ID)
      DEV_URI varchar,
      DEV_MAN varchar,       -- manufacturer
      DEV_MOD varchar,       -- model
      DEV_OEM varchar,       -- OEM
      DEV_FWV varchar,       -- firmware version
      DEV_SWV varchar,       -- software version
      DEV_HWV varchar,       -- hardware version
      DEV_DEVID varchar,     -- device id ; must be unique
      DEV_DEVTYP varchar,    -- device type
      DEV_UTC integer,       -- requires datetime in UTC
      DEV_SUPP_LOB integer,  -- supports large objects
      DEV_SUPP_NOC integer,  -- supports "number of changes"
      primary key (DEV_URI)  -- constraint foobar unique(DEV_USER_ID, DEV_URI)
    )
    ;

### SyncML Maps

    create table SYNC_MAPS (
      MAP_DEV_ID integer, -- references SYNC_DEVICES(DEV_ID)
      MAP_COL_ID int,     -- references WS.WS.SYS_DAV_COL (COL_ID)
      MAP_LUID varchar,   -- local id (from client's view)
      MAP_GUID varchar,   -- references WS.WS.SYS_DAV_RES (RES_ID)
      primary key (MAP_DEV_ID, MAP_LUID, MAP_GUID)
    )
    ;

### SyncML Sync Anchors

    create table SYNC_ANCHORS (
      A_COL_ID integer,   -- references WS.WS.SYS_DAV_COL(COL_ID)
      A_DEV_ID integer,   -- references SYNC_DEVICES(DEV_ID)
      A_LAST_LOCAL datetime,    -- last local anchor
      A_LAST_REMOTE varchar,    -- last remote anchor
      A_NEXT_LOCAL datetime,    -- last local anchor
      A_NEXT_REMOTE varchar,    -- last remote anchor
      primary key (A_COL_ID, A_DEV_ID)
    )
    ;

### SyncML Sync Log

    create table SYNC_RPLOG (
      RLOG_RES_ID int,  -- references WS.WS.SYS_DAV_RES (RES_ID)
      RLOG_RES_COL int, -- references WS.WS.SYS_DAV_COL (COL_ID)
      DMLTYPE varchar,  -- IUD - insert/update/delete
      SNAPTIME datetime,    -- timestamp
      primary key (RLOG_RES_ID)
    )
    ;

### SyncML Device's Sessions

    create table SYNC_SESSION
        (
        S_ID varchar,   -- session ID (unique per device)
        S_DEV varchar,  -- device URI
        S_DEV_ID int,   -- references SYNC_DEVICES(DEV_ID)
        S_UID int,  -- user ID SYS_USERS.U_ID
        S_LAST_MSG int, -- last massage no
        S_LAST_CMD int, -- last command no
        S_DATA long varbinary,  -- internal use
        S_TS timestamp,     -- last used
        S_AUTH int default 0,   -- authenticated for this session
        S_NONCE varchar default '', -- nonce value
        S_INIT int default 1,       -- init state flag
        primary key (S_ID, S_DEV)
        )
    ;

## INFORMATION\_SCHEMA views

The INFORMATION\_SCHEMA views are described in the SQL200n standard.
These views are defined in every qualifier and describe the objects in
that qualifier.

### TABLES

``` 
    INFORMATION_SCHEMA.TABLES
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        TABLE_TYPE                      VARCHAR(128),
        V_KEY_TABLE                     VARCHAR,
        V_KEY_NAME                      VARCHAR,
        V_KEY_ID                        INTEGER,
        V_KEY_N_SIGNIFICANT             SMALLINT,
        V_KEY_CLUSTER_ON_ID             SMALLINT,
        V_KEY_IS_MAIN                   SMALLINT,
        V_KEY_IS_OBJECT_ID              SMALLINT,
        V_KEY_IS_UNIQUE                 SMALLINT,
        V_KEY_MIGRATE_TO                INTEGER,
        V_KEY_SUPER_ID                  INTEGER,
        V_KEY_DECL_PARTS                SMALLINT,
        V_KEY_STORAGE                   VARCHAR,
        V_KEY_OPTIONS                   ANY
    
```

### COLUMNS

``` 
    INFORMATION_SCHEMA.COLUMNS
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        COLUMN_NAME                     VARCHAR(128),
        ORDINAL_POSITION                INTEGER,
        COLUMN_DEF                      VARCHAR,
        NULLABLE                        VARCHAR (3),
        DATA_TYPE                       VARCHAR(128),
        CHARACTER_MAXIMUM_LENGTH        INTEGER,
        CHARACTER_OCTET_LENGTH          INTEGER,
        NUMERIC_PRECISION               SMALLINT,
        NUMERIC_PRECISION_RADIX         SMALLINT,
        NUMERIC_SCALE                   SMALLINT,
        DOMAIN_CATALOG                  VARCHAR(128),
        DOMAIN_SCHEMA                   VARCHAR(128),
        DOMAIN_NAME                     VARCHAR(128),
        IS_IDENTITY                     VARCHAR(3),
        IDENTITY_GENERATION             VARCHAR(10),
        IDENTITY_START                  VARCHAR,
        IDENTITY_INCREMENT              VARCHAR,
        V_TABLE                         VARCHAR,
        V_COLUMN                        VARCHAR,
        V_COL_ID                        INTEGER,
        V_COL_DTP                       SMALLINT,
        V_COL_PREC                      INTEGER,
        V_COL_SCALE                     SMALLINT,
        V_COL_DEFAULT                   VARCHAR,
        V_COL_CHECK                     VARCHAR,
        V_COL_NULLABLE                  SMALLINT,
        V_COL_NTH                       SMALLINT,
        V_COL_OPTIONS                   ANY,
        V_KP_NTH                        SMALLINT
        
```

### SCHEMATA

``` 
    INFORMATION_SCHEMA.SCHEMATA
        CATALOG_NAME                    VARCHAR(128),
        SCHEMA_NAME                     VARCHAR(128),
        SCHEMA_OWNER                    VARCHAR(128)
        
```

### CHECK\_CONSTRAINTS

``` 
    INFORMATION_SCHEMA.CHECK_CONSTRAINTS
        CONSTRAINT_CATALOG              VARCHAR(128),
        CONSTRAINT_SCHEMA               VARCHAR(128),
        CONSTRAINT_NAME                 VARCHAR(128),
        CHECK_CLAUSE                    VARCHAR,
        V_C_TABLE                       VARCHAR(128),
        V_C_ID                          INTEGER,
        V_C_TEXT                        VARCHAR(4000),
        V_C_MODE                        LONG VARCHAR
        
```

### CHECK\_CONSTRAINTS

``` 
    INFORMATION_SCHEMA.CHECK_CONSTRAINTS
        CONSTRAINT_CATALOG              VARCHAR(128),
        CONSTRAINT_SCHEMA               VARCHAR(128),
        CONSTRAINT_NAME                 VARCHAR(128),
        CHECK_CLAUSE                    VARCHAR,
        V_C_TABLE                       VARCHAR(128),
        V_C_ID                          INTEGER,
        V_C_TEXT                        VARCHAR(4000),
        V_C_MODE                        LONG VARCHAR
        
```

### COLUMN\_DOMAIN\_USAGE

``` 
    INFORMATION_SCHEMA.COLUMN_DOMAIN_USAGE
        DOMAIN_CATALOG                  VARCHAR(128),
        DOMAIN_SCHEMA                   VARCHAR(128),
        DOMAIN_NAME                     VARCHAR(128),
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        COLUMN_NAME                     VARCHAR(128)
        
```

### COLUMN\_PRIVILEGES

``` 
    INFORMATION_SCHEMA.COLUMN_PRIVILEGES
        GRANTOR                         VARCHAR(128),
        GRANTEE                         VARCHAR(128),
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        COLUMN_NAME                     VARCHAR(128),
        PRIVILEGE_TYPE                  VARCHAR(10),
        IS_GRANTABLE                    VARCHAR (3),
        V_G_USER                        INTEGER,
        V_G_OP                          INTEGER,
        V_G_OBJECT                      VARCHAR (386),
        V_G_COL                         VARCHAR (386),
        V_G_GRANTOR                     VARCHAR (128),
        V_G_ADMIN_OPT                   VARCHAR (128)
        
```

### KEY\_COLUMN\_USAGE

``` 
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
        CONSTRAINT_CATALOG              VARCHAR(128),
        CONSTRAINT_SCHEMA               VARCHAR(128),
        CONSTRAINT_NAME                 VARCHAR(128),
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        COLUMN_NAME                     VARCHAR(128),
        ORDINAL_POSITION                SMALLINT,
        V_KEY_IS_MAIN                   SMALLINT,
        V_KEY_IS_UNIQUE                 SMALLINT
        
```

### ROUTINES

``` 
    INFORMATION_SCHEMA.ROUTINES
        SPECIFIC_CATALOG                VARCHAR(128),
        SPECIFIC_SCHEMA                 VARCHAR(128),
        SPECIFIC_NAME                   VARCHAR(128),
        ROUTINE_CATALOG                 VARCHAR(128),
        ROUTINE_SCHEMA                  VARCHAR(128),
        ROUTINE_NAME                    VARCHAR(128),
        MODULE_CATALOG                  VARCHAR(128),
        MODULE_SCHEMA                   VARCHAR(128),
        MODULE_NAME                     VARCHAR(128),
        UDT_CATALOG                     VARCHAR(128),
        UDT_SCHEMA                      VARCHAR(128),
        UDT_NAME                        VARCHAR(128),
        DATA_TYPE                       VARCHAR(128),
        CHARACTER_MAXIMUM_LENGTH        INTEGER,
        CHARACTER_OCTET_LENGTH          INTEGER,
        COLLATION_CATALOG               VARCHAR(128),
        COLLATION_SCHEMA                VARCHAR(128),
        COLLATION_NAME                  VARCHAR(128),
        CHARACTER_SET_CATALOG           VARCHAR(128),
        CHARACTER_SET_SCHEMA            VARCHAR(128),
        CHARACTER_SET_NAME              VARCHAR(128),
        NUMERIC_PRECISION               SMALLINT,
        NUMERIC_PRECISION_RADIX         SMALLINT,
        NUMERIC_SCALE                   SMALLINT,
        DATETIME_PRECISION              SMALLINT,
        INTERVAL_TYPE                   VARCHAR(128),
        INTERVAL_PRECISION              SMALLINT,
        TYPE_UDT_CATALOG                VARCHAR(128),
        TYPE_UDT_SCHEMA                 VARCHAR(128),
        TYPE_UDT_NAME                   VARCHAR(128),
        SCOPE_CATALOG                   VARCHAR(128),
        SCOPE_SCHEMA                    VARCHAR(128),
        SCOPE_NAME                      VARCHAR(128),
        MAXIMUM_CARDINALITY             INTEGER,
        DTD_IDENTIFIER                  VARCHAR(128),
        ROUTINE_BODY                    VARCHAR(30),
        ROUTINE_DEFINTION               VARCHAR,
        EXTERNAL_NAME                   VARCHAR(128),
        EXTERNAL_LANGUAGE               VARCHAR(30),
        PARAMETER_STYLE                 VARCHAR(30),
        IS_DETERMINISTIC                VARCHAR(10),
        SQL_DATA_ACCESS                 VARCHAR(30),
        IS_NULL_CALL                    VARCHAR(10),
        SQL_PATH                        VARCHAR(128),
        SCHEMA_LEVEL_ROUTINE            VARCHAR(10),
        MAX_DYNAMIC_RESULT_SETS         SMALLINT,
        IS_USER_DEFINED_CAST            VARCHAR(10),
        IS_IMPLICITLY_INVOCABLE         VARCHAR(10),
        CREATED                         DATETIME,
        LAST_ALTERED                    DATETIME
        
```

### PARAMETERS

``` 
    INFORMATION_SCHEMA.PARAMETERS
        SPECIFIC_CATALOG                VARCHAR(128),
        SPECIFIC_SCHEMA                 VARCHAR(128),
        SPECIFIC_NAME                   VARCHAR(128),
        ORDINAL_POSITION                INTEGER,
        PARAMETER_MODE                  VARCHAR(10),
        IS_RESULT                       VARCHAR(10),
        AS_LOCATOR                      VARCHAR(10),
        PARAMETER_NAME                  VARCHAR(128),
        DATA_TYPE                       VARCHAR(128),
        CHARACTER_MAXIMUM_LENGTH        INTEGER,
        CHARACTER_OCTET_LENGTH          INTEGER,
        COLLATION_CATALOG               VARCHAR(128),
        COLLATION_SCHEMA                VARCHAR(128),
        COLLATION_NAME                  VARCHAR(128),
        CHARACTER_SET_CATALOG           VARCHAR(128),
        CHARACTER_SET_SCHEMA            VARCHAR(128),
        CHARACTER_SET_NAME              VARCHAR(128),
        NUMERIC_PRECISION               SMALLINT,
        NUMERIC_PRECISION_RADIX         SMALLINT,
        NUMERIC_SCALE                   SMALLINT,
        DATETIME_PRECISION              SMALLINT,
        INTERVAL_TYPE                   VARCHAR(128),
        INTERVAL_PRECISION              SMALLINT,
        USER_DEFINED_TYPE_CATALOG       VARCHAR(128),
        USER_DEFINED_TYPE_SCHEMA        VARCHAR(128),
        USER_DEFINED_TYPE_NAME          VARCHAR(128),
        SCOPE_CATALOG                   VARCHAR(128),
        SCOPE_SCHEMA                    VARCHAR(128),
        SCOPE_NAME                      VARCHAR(128)
        
```

### REFERENTIAL\_CONSTRAINTS

``` 
    INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
        CONSTRAINT_CATALOG              VARCHAR(128),
        CONSTRAINT_SCHEMA               VARCHAR(128),
        CONSTRAINT_NAME                 VARCHAR(128),
        UNIQUE_CONSTRAINT_CATALOG       VARCHAR(128),
        UNIQUE_CONSTRAINT_SCHEMA        VARCHAR(128),
        UNIQUE_CONSTRAINT_NAME          VARCHAR(128),
        MATCH_OPTION                    VARCHAR(7),
        UPDATE_RULE                     VARCHAR(9),
        DELETE_RULE                     VARCHAR(9),
        V_FK_TABLE                      VARCHAR(128)
        
```

### TABLE\_CONSTRAINTS

``` 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        CONSTRAINT_CATALOG              VARCHAR(128),
        CONSTRAINT_SCHEMA               VARCHAR(128),
        CONSTRAINT_NAME                 VARCHAR(128),
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        CONSTRAINT_TYPE                 VARCHAR(11),
        IS_DEFERRABLE                   VARCHAR(2),
        INITIALLY_DEFERRED              VARCHAR(2)
        
```

### TABLE\_PRIVILEGES

``` 
    INFORMATION_SCHEMA.TABLE_PRIVILEGES
        GRANTOR                         VARCHAR(128),
        GRANTEE                         VARCHAR(128),
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        PRIVILEGE_TYPE                  VARCHAR(10),
        IS_GRANTABLE                    VARCHAR (3),
        V_G_USER                        INTEGER,
        V_G_OP                          INTEGER,
        V_G_OBJECT                      VARCHAR (386),
        V_G_GRANTOR                     VARCHAR (386)
        
```

### VIEWS

``` 
    INFORMATION_SCHEMA.VIEWS
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        VIEW_DEFINITION                 VARCHAR,
        CHECK_OPTION                    VARCHAR(7),
        IS_UPDATABLE                    VARCHAR(3)
        
```

# Basic Syntax of Regular Expressions

The two special symbols: `'^'` and `'$'` indicate the *start* and the
*end* of a string respectively, like so:

^The

: matches any string that starts with The;

of despair$

: matches a string that ends in the substring of despair;

^abc$

: a string that starts and ends with abc -- that could only be abc
itself\!

notice

: a string that has the text notice in it.

Without either of the above special character you are allowing the
pattern to occur anywhere inside the string.

The symbols `'*'` , `'+'` , and `'?'` denote the number of times a
character or a sequence of characters may occur. What they mean is: zero
or more, one or more, and zero or one. Here are some examples:

ab\*

: matches a string that has an

a

followed by zero or more

b

's (a, ab, abbb, etc.);

ab+

: same, but there is at least one

b

(ab, abbb, etc.);

ab?

: there might be a

b

or not;

a?b+$

: a possible

a

followed by one or more

b

's ending a string.

You can also use *bounds* , which come inside braces and indicate ranges
in the number of occurrences:

ab{2}

: matches a string that has an

a

followed by exactly two

b

's (abb);

ab{2,}

: there are at least two

b

's (abb, abbbb, etc.);

ab{3,5}

: from three to five

b

's (abbb, abbbb, or abbbbb).

Note, that you must always specify the first number of a range (i.e,
`{0,2}` , not `{,2}` ). Also, as you may have noticed, the symbols '\*',
'+', and '?' have the same effect as using the bounds `{0,}` , `{1,}` ,
and `{0,1}` , respectively.

Now, to quantify a sequence of characters, put them inside parentheses:

a(bc)\*

: matches a string that has an

a

followed by zero or more copies of the sequence bc;

a(bc){1,5}

: one through five copies of bc.

There's also the '|' symbol, which works as an OR operator:

hi|hello

: matches a string that has either hi or hello in it;

(b|cd)ef

: a string that has either bef or cdef;

(a|b)\*c

: a string that has a sequence of alternating

a

's and

b

's ending in a

c

;

A period ('.') stands for any single character:

a.\[0-9\]

: matches a string that has an

a

followed by one character and a digit;

^.{3}$

: a string with exactly 3 characters.

*Bracket expressions* specify which characters are allowed in a single
position of a string:

\[ab\]

: matches a string that has either an

a

or a

b

(that's the same as

a|b

);

\[a-d\]

: a string that has lowercase letters 'a' through 'd' (that's equal to

a|b|c|d

and even

\[abcd\]

);

^\[a-zA-Z\]

: a string that starts with a letter;

\[0-9\]%

: a string that has a single digit before a percent sign;

,\[a-zA-Z0-9\]$

: a string that ends in a comma followed by an alphanumeric character.

You can also list the characters that do NOT want -- just use a '^' as
the first symbol in a bracketed expression (i.e., `%[^a-zA-Z]%` matches
a string with a character that is not a letter between two percent
signs).

Do not forget that bracket expressions are an exception to that
rule--inside them, all special characters, including the backslash
('\\'), lose their special powers (i.e., `[*\+?{}.]` matches exactly any
of the characters inside the brackets). To include a literal '\]' in the
list, make it the first character (following a possible '^'). To include
a literal '-', make it the first or last character, or the second
endpoint of a range.

# Server & client versions compatibility

The RPC protocol has changed between 2.7 and 3.0 versions. Thus, not all
clients can connect to all servers. For best results, the version should
be identical on both ends of ODBC and JDBC connections. However, the
following table shows which combinations should generally be successful.

|               |     |     |     |     |     |     |     |     |
| ------------- | --- | --- | --- | --- | --- | --- | --- | --- |
| Driver/Server | 4.0 | 3.5 | 3.2 | 3.1 | 3.0 | 2.7 | 2.5 | 2.1 |
| 4.0           | Y   | Y   | Y   | Y   | Y   | N   | N   | N   |
| 3.5           | Y   | Y   | Y   | Y   | Y   | N   | N   | N   |
| 3.2           | Y   | Y   | Y   | Y   | Y   | N   | N   | N   |
| 3.1           | Y   | Y   | Y   | Y   | Y   | N   | N   | N   |
| 3.0           | Y   | Y   | Y   | Y   | Y   | N   | N   | N   |
| 2.7           | N   | N   | N   | N   | N   | Y   | Y   | Y   |
| 2.5           | N   | N   | N   | N   | N   | Y   | Y   | Y   |
| 2.1           | N   | N   | N   | N   | N   | Y   | Y   | Y   |
