<div id="fn_virtuoso_ini_path" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

virtuoso_ini_path — Return full name of configuration INI file

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_virtuoso_ini_path" class="funcsynopsis">

|                                |      |
|--------------------------------|------|
| ` `**`virtuoso_ini_path`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_61" class="refsect1">

## Description

This function returns the complete path to the configuration INI file.
It is typically used by the cfg\_ functions that modify or read the
contents of the INI file.

</div>

<div id="examples_20" class="refsect1">

## Examples

<div id="ex_virtuoso_ini_path" class="example">

**Example 24.444. Simple examples**

<div class="example-contents">

``` screen
SQL> select virtuoso_ini_path();
callret
VARCHAR
____________________________________________________

D:\Program Files\OpenLink\Virtuoso 2.5\demo\demo.ini

1 Rows. -- 60 msec.
```

</div>

</div>

  

</div>

<div id="seealso_33" class="refsect1">

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
