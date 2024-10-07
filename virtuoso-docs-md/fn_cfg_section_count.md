<div id="fn_cfg_section_count" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

cfg_section_count — get number of sections in an INI file

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_cfg_section_count" class="funcsynopsis">

|                                |                         |
|--------------------------------|-------------------------|
| ` `**`cfg_section_count`**` (` | in `path ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_section_count" class="refsect1">

## Description

Returns the number of sections in an INI file.

</div>

<div id="params_section_count" class="refsect1">

## Parameters

<div id="id81840" class="refsect2">

### path

Name of the INI file.

</div>

</div>

<div id="ret_section_count" class="refsect1">

## Return Values

An <span class="type">integer </span> containing the number of sections
in the INI file.

</div>

<div id="examples_section_count" class="refsect1">

## Examples

<div id="ex_cfg_section_count" class="example">

**Example 24.34. Simple examples**

<div class="example-contents">

Find out how many sections are in the current virtuoso.ini file.

``` screen
SQL> select cfg_section_count(virtuoso_ini_path());
callret
INTEGER
____________________________________________________

7
```

</div>

</div>

  

</div>

<div id="seealso_section_count" class="refsect1">

## See Also

<a href="fn_virtuoso_ini_path.html" class="link"
title="virtuoso_ini_path"><code
class="function">virtuoso_ini_path </code></a>
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
