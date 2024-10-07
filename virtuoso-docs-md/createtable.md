<div id="createtable" class="section">

<div class="titlepage">

<div>

<div>

## 9.8. CREATE TABLE Statement

</div>

</div>

</div>

<div id="syntax" class="section">

<div class="titlepage">

<div>

<div>

### 9.8.1. Syntax

</div>

</div>

</div>

``` programlisting
    base_table_def: CREATE TABLE new_table_name '(' base_table_element_commalist ')'
                  | CREATE TABLE new_table_name as query_exp opt_with_data

base_table_element_commalist: base_table_element
                           | base_table_element_commalist ',' base_table_element

base_table_element: column_def
                  | table_constraint_def

column_def: column column_data_type column_def_opt_list

opt_referential_triggered_action: /* empty */
                                | referential_rule
                                | referential_rule referential_rule

referential_rule: ON UPDATE referential_action
                | delete_referential_rule

delete_referential_rule: ON DELETE_L referential_action

opt_on_delete_referential_rule: /* empty */
                              | delete_referential_rule

referential_action: CASCADE
                  | SET NULLX
                  | SET DEFAULT

references: REFERENCES q_table_name opt_column_commalist opt_referential_triggered_action

column_def_opt_list: /* empty */
                   | column_def_opt_list column_def_opt

identity_opt: START_L WITH signed_literal
            | INCREMENT_L BY INTNUM

identity_opt_list: identity_opt
                 | identity_opt_list ',' identity_opt

column_def_opt: NOT NULLX
              | NULLX
              | IDENTITY
              | IDENTITY '(' identity_opt_list ')'
              | PRIMARY KEY
              | DEFAULT signed_literal
              | COLLATE q_table_name
              | references
              | IDENTIFIED BY column
              | CHECK '(' search_condition ')'
          | WITH SCHEMA column_xml_schema_def
              | UNIQUE

table_constraint_def: UNDER q_table_name
                    | opt_constraint_name PRIMARY KEY '(' index_column_commalist ')' opt_index_option_list
                    | opt_constraint_name FOREIGN KEY '(' column_commalist ')' references
                    | opt_constraint_name CHECK '(' search_condition ')'
                    | opt_constraint_name UNIQUE '(' column_commalist ')'

opt_constraint_name: /* empty */
                   | CONSTRAINT identifier

column_commalist: column
                | column_commalist ',' column

index_column_commalist: column opt_asc_desc
                      | index_column_commalist ',' column opt_asc_desc

index_option: CLUSTERED
            | UNIQUE
            | OBJECT_ID

index_option_list: index_option
                 | index_option_list index_option

opt_index_option_list: /* empty */
                     | index_option_list

column_xml_schema_def
    : '(' STRING ',' STRING ')'
    | '(' STRING ',' STRING ',' STRING ')'

opt_with_data
: /* empty */
| WITH DATA
| WITHOUT DATA
```

The CREATE TABLE statement creates a new table. The table is identified
by a new_table_name, which consists of an optional qualifier, an
optional owner and the name. If the qualifier is not supplied then it
defaults to the current qualifier, and likewise if the table owner is
not specified then this will default to the login name of the user
issuing the statement.

Following the new_table_name is a list of table elements that are either
column definitions or table constraints. A column must have a unique
name within the table and possible super tables. The only necessary
attribute of a column is a data type.

The UNDER q_table_name constraint specifies an optional supertable. The
table being created will inherit all columns, indices, constraints from
the supertable, specifically including the primary key. Hence the under
and primary key constraints cannot be specified together. If the table
being created will be owned by a non-dba user, the supertable must be
owned by the same user.

The AS query_exp opt_with_data causes the table to be created based on
the compile time types of columns of the SELECT expression query_exp. If
WITH DATA is specified then the resultset returned by the query_exp is
fed into the new table. Otherwise (if WITHOUT DATA or not specified)
only the table is created.

</div>

</div>
