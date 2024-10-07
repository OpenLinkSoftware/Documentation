<div id="fn_cfg_item_name" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

cfg_item_name — get nth item name from ini file

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_cfg_item_name" class="funcsynopsis">

|                            |                               |
|----------------------------|-------------------------------|
| ` `**`cfg_item_name`**` (` | in `path ` varchar ,          |
|                            | in `section ` varchar ,       |
|                            | in `item_index ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_cfg_item_name" class="refsect1">

## Description

Returns the name of the item specified by item_index (begins from zero).
If the index and section name do not point to a valid item, then zero is
returned, otherwise on success the function returns the item name.

</div>

<div id="params_cfg_item_name" class="refsect1">

## Parameters

<div id="id81726" class="refsect2">

### path

Name of the INI file.

</div>

<div id="id81729" class="refsect2">

### section

Name of the section in the INI file.

</div>

<div id="id81732" class="refsect2">

### item_index

Zero based index to the item within the section to be listed.

</div>

</div>

<div id="ret_cfg_item_name" class="refsect1">

## Return Values

A <span class="type">varchar </span> containing the name of item
referenced by *`section `* and *`item_index `* .

</div>

<div id="examples_cfg_item_name" class="refsect1">

## Examples

<div id="ex_cfg_item_name_1" class="example">

**Example 24.32. Simple examples**

<div class="example-contents">

Display the first keyname in the \[Parameters\] section of the current
virtuoso.ini file.

``` screen
SQL> select cfg_item_name(virtuoso_ini_path(), 'Parameters',0);
callret
VARCHAR
________________________________________________

ServerPort
```

</div>

</div>

  

</div>

<div id="seealso_cfg_item_name" class="refsect1">

## See Also

<a href="fn_virtuoso_ini_path.html" class="link"
title="virtuoso_ini_path"><code
class="function">virtuoso_ini_path </code></a>
<a href="fn_cfg_section_count.html" class="link"
title="cfg_section_count"><code
class="function">cfg_section_count </code></a>
<a href="fn_cfg_section_name.html" class="link"
title="cfg_section_name"><code
class="function">cfg_section_name </code></a>
<a href="fn_cfg_item_count.html" class="link"
title="cfg_item_count"><code class="function">cfg_item_count </code></a>
<a href="fn_cfg_item_value.html" class="link"
title="cfg_item_value"><code class="function">cfg_item_value </code></a>
<a href="fn_cfg_write.html" class="link" title="cfg_write"><code
class="function">cfg_write </code></a>

</div>

</div>
