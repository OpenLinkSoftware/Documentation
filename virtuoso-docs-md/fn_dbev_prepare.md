<div id="fn_dbev_prepare" class="section">

<div class="titlepage">

<div>

<div>

## 12.6. SQL Statement Preparation

</div>

</div>

</div>

`DB.DBA.DBEV_PREPARE(`*`inout tree any`*` )`

``` programlisting
DB.DBA.DBEV_PREPARE (inout tree any)
```

If defined, this function is called after parsing any dynamic SQL
statements by any users. The parse tree will be a syntactically correct
SQL parse tree. The user and connection variables are defined. The hook
should not produce a result set and any return values are discarded. The
function runs in the transaction which is current on the connection and
the transaction is not automatically committed, so that the hook does
not modify application transaction boundaries.

The tree may be modified by replacing it with any other correct parse
tree or destructively splicing it. The tree is a regular SQL
heterogeneous array. If the tree is modified incorrectly, it is probable
that the server will crash.

The parse tree manipulation is best written in C as a Virtuoso Server
Extension using the supplied SQL parse tree typedef and constants.

If an error occurs inside this hook the error is simply ignored and the
unmodified parse tree is used. To signal an error to a user it is
possible to change the parse tree into a call to the signal SQL
function.

<div id="id36538" class="example">

**Example 12.7. SQL Prepare Hook**

<div class="example-contents">

``` programlisting
CREATE TABLE REPORT (
  R_AUTHOR VARCHAR,
  R_ID INTEGER IDENTITY,
  R_CLASS INTEGER,
  R_TEXT LONG VARCHAR,
  PRIMARY KEY (R_ID)
);

CREATE TABLE NEED_TO_KNOW (
  NK_CLASS INTEGER,
  NK_USER INTEGER,
  PRIMARY KEY (NK_CLASS, NK_USER)
);

grant select on REPORT to public;

create procedure DB.DBA.DBEV_PREPARE (inout tree any)
{
  declare uid integer;
  uid := (select U_ID from SYS_USERS where U_NAME = user);
  need_to_know (uid, tree);
  dbg_obj_print ('compiled by ', user, ': ', tree);
}
```

This example has a table of variously secret reports, each having a
class or compartment and different users having a need to know about a
certain collection of compartments. The need_to_know table references
U_ID in SYS_USERS and R_CLASS in REPORT. Each select referencing REPORT
is modified by the `need_to_know` VSE in order to add a check for the
need to know.

For example,

``` programlisting
select * from REPORT
```

becomes

``` programlisting
select * from REPORT
  where exists (select 1 from NEED_TO_KNOW
    where NK_CLASS = R_CLASS and NK_USER = <user>)
```

where \<user\> is the id of the user preparing the query.

As a result, all queries referencing the REPORT table, no matter how
they are phrased, will not access rows for which the user does not have
a need to know. Note that the REPORT table can be granted to public,
unauthorized users will just get an empty result. Further, note that the
NEED_TO_KNOW table is not granted to anyone, hence the user does not
even need to know the extent of his need to know let alone that of any
other user. The expansion of the need to know test inserts the table
reference as in a view expansion, where it's privileges are not those of
the user but of the view owner, or in this case the procedure owner,
which is always dba.

</div>

</div>

  

</div>
