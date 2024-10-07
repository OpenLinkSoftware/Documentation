<div id="fn_sql_transact" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

sql_transact — get list of available DSNs

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_sql_transact" class="funcsynopsis">

|                           |                             |
|---------------------------|-----------------------------|
| ` `**`sql_transact`**` (` | in `dsn_name ` varchar ,    |
|                           | in `rollback ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_sql_transact" class="refsect1">

## Description

This procedure can be used to control the commit/rollback behavior of a
particular remote data source during a Virtuoso transaction such as in a
stored procedure.

Under normal circumstances Virtuoso will correctly commit or rollback
all associated work as expected, however it may be desirable intervene.
When issued without the second parameter a commit will be forced upon
the current transactions of the dsn_name above the call to
`sql_transact` regardless of overall outcome. When rollback = 1 is set
then a rollback will be forced likewise, hence this will not rollback
work on the remote dsn_name prior to `sql_transact ` .

</div>

<div id="params_sql_transact" class="refsect1">

## Parameters

<div id="id111915" class="refsect2">

### dsn_name

The name of the data source being used on the remote.

</div>

<div id="id111918" class="refsect2">

### rollback

Activate the desired behavior. Set to 1 for rollback, ignore to commit.

</div>

</div>

<div id="ret_sql_transact" class="refsect1">

## Return Types

None.

</div>

<div id="examples_sql_transact" class="refsect1">

## Examples

<div id="ex_sql_transact" class="example">

**Example 24.401. Control remote rollback/commit behavior**

<div class="example-contents">

This code fragment can be used to demonstrate the effects of directly
controlling the rollback/commit behavior of remote data sources
connected to Virtuoso.

``` programlisting
create procedure TEST_ROLLBACK ()
{
  commit work;
  insert into mydsn..rb_test values (1);
  sql_transact('mydsn');
  insert into mydsn..rb_test values (2);
  rollback work;
};

create procedure TEST_ROLLBACK ()
{
  commit work;
  insert into mydsn..rb_test values (1);
  sql_transact('mydsn', 1);
  insert into mydsn..rb_test values (2);
  commit work;
};

delete from mydsn..rb_test;

commit work;
TEST_COMMIT();
select MIN (ID) from mydsn..rb_test;

-- returns 1

delete from mydsn..rb_test;

commit work;
TEST_ROLLBACK();
select MIN (ID) from mydsn..rb_test;

-- returns 2
```

</div>

</div>

  

</div>

<div id="seealso_sql_transact" class="refsect1">

## See Also

<a href="fn_sql_columns.html" class="link" title="sql_columns"><code
class="function">sql_columns </code></a><a href="fn_sql_primary_keys.html" class="link"
title="sql_primary_keys"><code
class="function">sql_primary_keys </code></a> ,
<a href="fn_sql_gettypeinfo.html" class="link"
title="sql_gettypeinfo"><code
class="function">sql_gettypeinfo</code></a> ,
<a href="fn_sql_statistics.html" class="link"
title="sql_statistics"><code class="function">sql_statistics</code></a>
, <a href="fn_sql_tables.html" class="link" title="sql_tables"><code
class="function">sql_tables</code></a> .

</div>

</div>
