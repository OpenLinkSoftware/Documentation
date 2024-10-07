<div id="fn_key_estimate" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

key_estimate — Get an estimate of row count for a given set of leading
index key parts

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_key_estimate" class="funcsynopsis">

|                           |                            |
|---------------------------|----------------------------|
| ` `**`key_estimate`**` (` | in `table_name ` varchar , |
|                           | in `index_name ` varchar , |
|                           | in `k1 ` any ,             |
|                           | `... ` `)`;                |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_key_estimate" class="refsect1">

## Description

Given a table and an index, this function takes a random sample of the
index, with the first key part equal to the third argument, the second
equal to the fourth argument and so on. If only the table and index are
given, the returned value is the approximate count of the entire index.

Normal cast rules are applied to convert the arguments to the types of
the corresponding key parts. If the cast fails, -1 is returned.

The estimates are typically within 10% of the real count. If there have
been random deletions or inserts leading to uneven page filling or if
index entries are of greatly varying \$ length, the estimates may be
less precise.

</div>

<div id="params_key_estimate" class="refsect1">

## Parameters

<div id="id112137" class="refsect2">

### table_name

The name of the table as appears in SYS_KEYS, case sensitive.

</div>

<div id="id112140" class="refsect2">

### index_name

The name of the index as appears in sys_keys, case sensitive.

</div>

<div id="id112143" class="refsect2">

### k1

The value of the first key part. Any number of arguments, up to the
number of key parts in the index in question may follow.

</div>

</div>

<div id="ret_key_estimate" class="refsect1">

## Return

Key_estimate returns the approximate count of entries in the index with
the specified values in the leading key parts. -1 if cannot be
determined.

</div>

<div id="examples_key_estimate" class="refsect1">

## Example

<div id="ex_key_estimate" class="example">

**Example 24.404. Returns the approximate count of entries in index STR1
where the first key part is the string '123'.**

<div class="example-contents">

``` programlisting
select key_estimate ('DB.DBA.T1', 'STR1', '123');
      
```

</div>

</div>

  

</div>

</div>
