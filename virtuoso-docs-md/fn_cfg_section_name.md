<div id="fn_cfg_section_name" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

cfg_section_name — returns INI file section name

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_cfg_section_name" class="funcsynopsis">

|                               |                          |
|-------------------------------|--------------------------|
| ` `**`cfg_section_name`**` (` | in `path ` varchar ,     |
|                               | in `index ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_section_name" class="refsect1">

## Description

Returns the name of section specified by the index (begins from zero).
If the index can reference a section, the that section name is returned,
otherwise returns zero on error.

</div>

<div id="params_section_name" class="refsect1">

## Parameters

<div id="id81889" class="refsect2">

### path

Name of the INI file.

</div>

<div id="id81892" class="refsect2">

### index

Zero based index that references a section.

</div>

</div>

<div id="ret_section_name" class="refsect1">

## Return Values

An <span class="type">varchar </span> containing the name of section.

</div>

<div id="examples_section_name" class="refsect1">

## Examples

<div id="ex_cfg_section_name" class="example">

**Example 24.35. Simple examples**

<div class="example-contents">

Get the second section name from the current virtuoso.ini file.

``` screen
SQL> select cfg_section_name(virtuoso_ini_path(), 1);
callret
VARCHAR
_____________________________________________________

Parameters
```

</div>

</div>

  

</div>

<div id="seealso_section_name" class="refsect1">

## See Also

<a href="fn_virtuoso_ini_path.html" class="link"
title="virtuoso_ini_path"><code
class="function">virtuoso_ini_path </code></a>
<a href="fn_cfg_section_count.html" class="link"
title="cfg_section_count"><code
class="function">cfg_section_count </code></a>
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
