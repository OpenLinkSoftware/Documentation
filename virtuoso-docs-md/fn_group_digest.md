<div id="fn_group_digest" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.GROUP_DIGEST — returns an arbitrary value from the multiset
passed to it.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_group_digest" class="funcsynopsis">

|                                  |                         |
|----------------------------------|-------------------------|
| ` `**`DB.DBA.GROUP_DIGEST`**` (` | in `token ` varchar ,   |
|                                  | in `delim ` varchar ,   |
|                                  | in `maxlen ` integer ,  |
|                                  | in `mode ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_group_digest" class="refsect1">

## Description

DB.DBA.GROUP_DIGEST is aggregate function that performs a string
concatenation across the values of an expression with a group. The order
of the strings is not specified. The separator character used in the
concatenation may be given with the scalar argument delimiter. The
function is an extended version of sql:GROUP_CONCAT(), with two more
arguments: maxlen and mode.

Note: the "sql:" prefix is mandatory when this aggregate is used in
SPARQL queries. In SQL queries the prefix is "DB.DBA".

</div>

<div id="params_group_digest" class="refsect1">

## Parameters

<div id="id102801" class="refsect2">

### token

An item that should be added to a delimited list.

</div>

<div id="id102804" class="refsect2">

### delim

The delimeter character to be used in the concatenation.

</div>

<div id="id102807" class="refsect2">

### maxlen

The maximal allowed length of the result, in characters. Redundant
values will be ignored. If the last value does not fit in the "maxlen"
entirely, then it can be truncated and "..." is placed at the end of the
resulting string.

</div>

<div id="id102810" class="refsect2">

### mode

Bitmask of properties. Right now only bit 1 is used and others are
reserved. If the value of the argument is 1 then duplicate values are
ignored; value 0 will put duplicate values like in case of
sql:GROUP_CONCAT ().

</div>

</div>

<div id="ret_group_digest" class="refsect1">

## Return Types

any

</div>

<div id="examples_group_digest" class="refsect1">

## Examples

<div id="ex_group_digest" class="example">

**Example 24.289. Get all ?assets as a list with delimiters.**

<div class="example-contents">

``` programlisting
SQL>SPARQL
SELECT ?view (sql:GROUP_DIGEST (?path, ' ', 1000, 1)) as ?path_list
    (sql:GROUP_DIGEST (?asset, ' ', 1000, 1)) as ?asset_list
FROM <http://mygraph.com>
WHERE
  {
    ?view <viewPath> ?path ;
      <viewContent> ?asset ;
      <viewType>  'phyview'.
  };
```

</div>

</div>

  

</div>

<div id="seealso_group_digest" class="refsect1">

## See Also

<a href="fn_sample.html" class="link" title="DB.DBA.SAMPLE"><code
class="function">DB.DBA.SAMPLE </code></a>

<a href="fn_group_concat.html" class="link"
title="DB.DBA.GROUP_CONCAT"><code
class="function">DB.DBA.GROUP_CONCAT </code></a>

<a href="fn_group_concat_distinct.html" class="link"
title="DB.DBA.GROUP_CONCAT_DISTINCT"><code
class="function">DB.DBA.GROUP_CONCAT_DISTINCT </code></a>

<a href="samplegroupconcatdigest.html" class="link"
title="1.5.59. What is the difference between the functions SAMPLE, GROUP_CONCAT and GROUP_DIGEST?">Differences
between DB.DBA.SAMPLE, DB.DBA.GROUP_CONCAT and DB.DBA.GROUP_DIGEST
functions usage.</a>

</div>

</div>
