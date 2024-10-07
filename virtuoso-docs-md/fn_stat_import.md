<div id="fn_stat_import" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

stat_import — Imports database statistics

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_stat_import" class="funcsynopsis">

|                          |                            |
|--------------------------|----------------------------|
| ` `**`stat_import`**` (` | in `st_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_stat_import" class="refsect1">

## Description

This function imports produced database statistics.

</div>

<div id="params_stat_import" class="refsect1">

## Parameters

<div id="id96202" class="refsect2">

### st_name

Name of the statistics file.

</div>

</div>

<div id="examples_stat_import" class="refsect1">

## Examples

<div id="ex_stat_import" class="example">

**Example 24.213. Simple Use**

<div class="example-contents">

``` programlisting
-- produce statistics for a given database:
SQL> string_to_file('stat.dv', serialize(stat_export()), -2);

-- import the produced statistics:
SQL> stat_import (deserialize (file_to_string ('stat.dv')));
```

</div>

</div>

  

</div>

<div id="seealso_stat_import" class="refsect1">

## See Also

<a href="fn_stat_export.html" class="link" title="stat_export"><code
class="function">stat_export() </code></a>

</div>

</div>
