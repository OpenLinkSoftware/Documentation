<div>

<div>

<div>

<div>

## 11.16. Triggers

</div>

</div>

</div>

A trigger is a procedure body associated with a table and an event. A
trigger can take effect before, after or instead of the event on the
subject table. Several before, after or instead of triggers may exist
for a given event on a given table, which can be fired in a specified
order.

Triggers are useful for enforcing integrity rules, maintaining the
validity of data computed from other data, accumulating history data
etc.

A trigger body has no arguments in the sense a procedure does. A trigger
body implicitly sees the columns of the subject table as read-only
parameters. An update trigger may see both the new and old values of the
row of the subject table. These are differentiated by correlation names
in the REFERENCING clause.

Triggers are capable of cascading; the code of a trigger may cause
another trigger to be activated. This may lead to non-terminating
recursion in some cases. Triggers may be turned off either inside a
compound statement or inside a connection with the SET TRIGGERS OFF
statement.

An update trigger may have a set of sensitive columns whose update will
cause the trigger code to be run. Update of non-sensitive columns will
not invoke the trigger. If no column list is specified any update will
invoke the trigger.

<div>

<div>

<div>

<div>

### 11.16.1. The CREATE TRIGGER statement

</div>

</div>

</div>

Triggers can be defined to act upon a table or column and fire upon:

|        |
|--------|
| UPDATE |
| INSERT |
| DELETE |

at the following times during the operation on a table or column:

|            |
|------------|
| BEFORE     |
| AFTER      |
| INSTEAD OF |

Triggers have a unique name which is qualified by the current catalog
and owner. The trigger name is only really relevant for the purposes of
dropping triggers. Triggers operate on a table or column which must be
adequately qualified.

The trigger body has read-only access to the values of the data
manipulation operation that triggered the trigger. In the case of an
update statement it has access to both old and new values for each
effected column. These values cannot be changed directly. If the trigger
is to influence any data in a table, even from the current operation, it
must be achieved by another SQL statement. The REFERENCING clause allows
specifying a correlation name for new and old values of columns. By
default, the new values are seen under the column names without a
correlation name. If old values of updated columns are needed, the
REFERENCING OLD AS \<alias\> will make \<alias\>.\<column\> refer to the
old value.

Triggers defined to make further operations within the same or other
table may fire further triggers, or even the same trigger again. Care
must be taken to understand the implications of this and when triggers
cane be allowed to continue firing after the current trigger. For
example, an after update trigger that makes a further update to the same
table will fire the same trigger again and may continue looping in this
way endlessly. The `SET TRIGGER` statement can be issued to control
this:

|                                                                                                   |
|---------------------------------------------------------------------------------------------------|
| SET TRIGGERS on; -- (default state) further triggers within this transaction are allowed to fire. |
| SET TRIGGERS off; -- further triggers within this transaction are disabled.                       |

A table may have more than one trigger. Their execution order can be
specified using the ORDER clause. Each trigger gets an order number,
triggers are called starting at the lowest order number in ascending
order.

Syntax:

``` programlisting
CREATE TRIGGER NAME action_time event ON q_table_name
  opt_order opt_old_ref trig_action

action_time
    : BEFORE
    | AFTER

event
    : INSERT
    | UPDATE opt_column_commalist
    | DELETE

opt_order
    | ORDER INTNUM

opt_old_ref
    | REFERENCING old_commalist

trig_action
    : compound_statement

old_commalist
    : old_alias
    | old_commalist ',' old_alias

old_alias
    : OLD AS NAME
    | NEW AS NAME
```

<div>

**Example 11.8. Creating a simple trigger**

<div>

This trigger is a simple example of one that would cause an endless loop
if further triggering were not disabled.

``` programlisting
create trigger update_mydate after
   update on mytable referencing old as O, new as N
{
  set triggers off;
  update mytable
    set
      previousdate = O.mydate,
      mydate=now()
    where id=N.id;
}
;
```

The trigger makes aliases for the values of the column that are part of
the SQL manipulation transaction that will be in progress, hence the
values of the columns can be accessed as "O.column" and "N.column" for
old and new values respectively.

The set statement is scope to the procedure or trigger body where it
occurs, plus procedures called from there , thus when the trigger
finishes no other triggers are effected by it.

</div>

</div>

  

<div>

**Example 11.9. Creating a simple trigger using INSTEAD OF**

<div>

This trigger example will show how INSTEAD OF can be used to intercept
the values of an insert statement and re-write it. In this case the
purpose is to deliberately truncate VARCHAR inserts to prevent an error
if the data type bounds are exceeded:

First we create a test table with a 30 character limitation in one of
the columns:

``` programlisting
SQL>create table test_trunc (
      id integer not null primary key,
      txt varchar (30)
      )
    ;

Done. -- 10 msec.
```

Then we attempt to insert 33 characters into it with the following
results:

``` programlisting
SQL>insert into test_trunc (id, txt)
      values (1, 'aaaaaaaaaabbbbbbbbbbccccccccccxxx');

*** Error 22026: [Virtuoso ODBC Driver][Virtuoso Server]SR319: Max column length (30) of column [txt] exceeded
```

Now we make a trigger to fire instead of insert statements that can
perform some custom error correction, in this case we simply want to
chop-off any extra characters that will cause an insert to fail.

``` programlisting
SQL>create trigger test_trunc_it
      instead of insert on test_trunc
        referencing new as N
    {
      set triggers off; -- we do not want this looping...
      insert into test_trunc (id, txt) values (N.id, left(N.txt, 30));
    }
    ;

Done. -- 10 msec.
```

We perform the same test insert, now without errors:

``` programlisting
SQL>insert into test_trunc (id, txt)
  values (1, 'aaaaaaaaaabbbbbbbbbbccccccccccxxx');

Done. -- 10 msec.
```

And to see what we have in the database, a quick select:

``` programlisting
SQL> select * from test_trunc;
id                txt
INTEGER NOT NULL  VARCHAR
______________________________________________________

1                 aaaaaaaaaabbbbbbbbbbcccccccccc

1 Rows. -- 20 msec.
```

</div>

</div>

  

</div>

</div>
