<div id="fn_file_open" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

file_open — returns the contents of a file.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_file_open" class="funcsynopsis">

|                               |                         |
|-------------------------------|-------------------------|
| `varchar `**`file_open`**` (` | in `path ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_file_open" class="refsect1">

## Description

Returns the contents of a file. The path is relative to the working
directory of the database server.

</div>

<div id="params_file_open" class="refsect1">

## Parameters

<div id="id88484" class="refsect2">

### path

Path name of the file to read.

</div>

</div>

<div id="examples_file_open" class="refsect1">

## Examples

<div id="ex_file_open" class="example">

**Example 24.114. Simple Use**

<div class="example-contents">

For loading N3 and Turtle files you can use:

``` screen
SQL>DB.DBA.TTLP_MT (file_open('tmp/file1.n3'), 'base uri', 'graph uri', 255);
```

</div>

</div>

  

</div>

<div id="seealso_file_open" class="refsect1">

## See Also

<a href="fn_file_delete.html" class="link" title="file_delete"><code
class="function">file_delete() </code></a>

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP() </code></a>

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">DB.DBA.TTLP_MT() </code></a>

<a href="fn_ttlp_mt_local_file.html" class="link"
title="DB.DBA.TTLP_MT_LOCAL_FILE"><code
class="function">DB.DBA.TTLP_MT_LOCAL_FILE() </code></a>

</div>

</div>
