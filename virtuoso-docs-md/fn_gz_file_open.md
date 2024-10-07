<div id="fn_gz_file_open" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

gz_file_open — returns the contents of a gzipped file

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_gz_file_open" class="funcsynopsis">

|                                  |                         |
|----------------------------------|-------------------------|
| `varchar `**`gz_file_open`**` (` | in `path ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_gz_file_open" class="refsect1">

## Description

Returns the contents of a file. The path is relative to the working
directory of the database server.

</div>

<div id="params_gz_file_open" class="refsect1">

## Parameters

<div id="id89421" class="refsect2">

### path

Path name of the file to read.

</div>

</div>

<div id="examples_gz_file_open" class="refsect1">

## Examples

<div id="ex_gz_file_open" class="example">

**Example 24.122. Simple Use**

<div class="example-contents">

For loading gzipped N3 and Turtle files you can use:

``` screen
SQL>DB.DBA.TTLP_MT (gz_file_open('path/myfile.n3.gz'), 'base uri', 'graph uri', 255);
```

Note that the last parameter means the parser uses relaxed parsing
rules, the default value of 0 means strict syntax rules.

</div>

</div>

  

</div>

<div id="seealso_gz_file_open" class="refsect1">

## See Also

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP() </code></a>

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">DB.DBA.TTLP_MT() </code></a>

<a href="fn_ttlp_mt_local_file.html" class="link"
title="DB.DBA.TTLP_MT_LOCAL_FILE"><code
class="function">DB.DBA.TTLP_MT_LOCAL_FILE() </code></a>

</div>

</div>
