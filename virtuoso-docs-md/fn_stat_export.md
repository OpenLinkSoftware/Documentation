<div id="fn_stat_export" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

stat_export — Produces a statistics summary.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_stat_export" class="funcsynopsis">

|                          |      |
|--------------------------|------|
| ` `**`stat_export`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_stat_export" class="refsect1">

## Description

This function produces a statistics summary that can be read back into
another database with the
<a href="fn_stat_import.html" class="link" title="stat_import"><code
class="function">stat_import() </code></a> function

</div>

<div id="params_stat_export" class="refsect1">

## Parameters

</div>

<div id="examples_stat_export" class="refsect1">

## Examples

<div id="ex_stat_export" class="example">

**Example 24.214. Simple Use**

<div class="example-contents">

``` programlisting
-- produce statistics for a given database:
SQL> string_to_file('stat.dv', serialize(stat_export()), -2);
```

</div>

</div>

  

</div>

<div id="seealso_stat_export" class="refsect1">

## See Also

<a href="fn_stat_import.html" class="link" title="stat_import"><code
class="function">stat_import() </code></a>

</div>

</div>
