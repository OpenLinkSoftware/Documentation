<div id="insertreplacing" class="section">

<div class="titlepage">

<div>

<div>

### 9.17.2. INSERT REPLACING

</div>

</div>

</div>

<span class="emphasis">*INSERT REPLACING*</span> can be used in place of
<span class="emphasis">*INSERT INTO*</span> if you are unsure whether
the value to be inserted into a primary key column will violate that
constraint. If the row with this primary key already exists, then the
new row will be inserted replacing the old values.

``` programlisting
SQL> create table insert_test(id integer primary key, txt varchar);
Done. -- 90 msec.
SQL> insert into insert_test(id, txt) values(1, 'test');
Done. -- 0 msec.
SQL> insert into insert_test(id, txt) values(1, 'test');

*** Error 23000: [Virtuoso ODBC Driver][Virtuoso Server]SR197:
  Non unique primary key on DB.DBA.insert_test. at line 4 (4) of Top-Level:
  insert into insert_test(id, txt) values(1, 'test')

SQL> insert replacing insert_test(id, txt) values(1, 'testreplacing');

Done. -- 0 msec.
SQL> select * from insert_test;
id                txt
INTEGER NOT NULL  VARCHAR
_______________________________________________________________________________

1                 testreplacing

1 Rows. -- 0 msec.
```

</div>
