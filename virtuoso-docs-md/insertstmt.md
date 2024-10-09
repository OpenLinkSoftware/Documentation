<div>

<div>

<div>

<div>

## 9.17. INSERT Statement

</div>

</div>

</div>

``` programlisting
    insert_statement
        : INSERT insert_mode table priv_opt_column_commalist values_or_query_spec
        ;

    insert_mode
        : INTO
        | REPLACING
        | SOFT

    priv_opt_column_commalist
        : /* empty */
        | '(' column_commalist ')'

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

    column_commalist
        : column
        | column_commalist ',' column
        ;

    query_spec
        : SELECT opt_all_distinct selection table_exp
        ; ... See the SELECT statement next.
```

New rows (or records) are entered into a database using the INSERT
statement.

If you have to enter a NULL you can simply use the keyword NULL, as you
would a normal value. Since NULL is a special keyword you do not need to
enclose it in single quotes.

You can specify the columns that you are inserting values into in the
insert statement. One should always specify the columns that you are
inserting into, in case the order of columns in the database are not as
expected, or you are not inserting values into every column.

If a value is not specified for a column on insert, then the default
value will be used for that column. If no default value has been
specified either by a CREATE or MODIFY TABLE statement then NULL will be
used.

<div>

<div>

<div>

<div>

### 9.17.1. INSERT SOFT

</div>

</div>

</div>

<span class="emphasis">*INSERT SOFT*</span> can be used in place of
<span class="emphasis">*INSERT INTO*</span> if you are unsure whether
the value to be inserted into a primary key column will violate that
constraint. If the row with this primary key already exists, then the
new row is not inserted.

``` programlisting
SQL> create table insert_test(id integer primary key, txt varchar);
Done. -- 90 msec.
SQL> insert into insert_test(id, txt) values(1, 'test');
Done. -- 0 msec.
SQL> insert into insert_test(id, txt) values(1, 'test');

*** Error 23000: [Virtuoso ODBC Driver][Virtuoso Server]SR197:
  Non unique primary key on DB.DBA.insert_test. at line 4 (4) of Top-Level:
  insert into insert_test(id, txt) values(1, 'test')

SQL> insert soft insert_test(id, txt) values(1, 'testsoft');

Done. -- 0 msec.
SQL> select * from insert_test;
id                txt
INTEGER NOT NULL  VARCHAR
_______________________________________________________________________________

1                 test

1 Rows. -- 60 msec.
```

</div>

</div>
