<div id="fn_server_root" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

server_root — Returns server working directory.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_server_root" class="funcsynopsis">

|                          |      |
|--------------------------|------|
| ` `**`server_root`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_62" class="refsect1">

## Description

This function returns the complete physical path to server working
directory.

</div>

<div id="examples_21" class="refsect1">

## Examples

<div id="ex_server_root" class="example">

**Example 24.445. Simple examples**

<div class="example-contents">

Show in the result the server working directory and INI file name:

``` programlisting
SQL> select server_root(), virtuoso_ini_path ();
callret                                   callret
VARCHAR                                   VARCHAR
_______________________________________

C:\Program Files\OpenLink\Virtuoso 5.0\   C:\Program Files\OpenLink\Virtuoso 5.0\demo\demo.ini

1 Rows. -- 20 msec.
```

</div>

</div>

  

</div>

<div id="seealso_34" class="refsect1">

## See Also

<a href="fn_cfg_section_count.html" class="link"
title="cfg_section_count"><code
class="function">cfg_section_count </code></a>
<a href="fn_cfg_section_name.html" class="link"
title="cfg_section_name"><code
class="function">cfg_section_name </code></a>
<a href="fn_cfg_item_count.html" class="link"
title="cfg_item_count"><code class="function">cfg_item_count </code></a>
<a href="fn_cfg_item_name.html" class="link" title="cfg_item_name"><code
class="function">cfg_item_name </code></a>
<a href="fn_cfg_item_value.html" class="link"
title="cfg_item_value"><code class="function">cfg_item_value </code></a>
<a href="fn_cfg_write.html" class="link" title="cfg_write"><code
class="function">cfg_write </code></a>

</div>

</div>
