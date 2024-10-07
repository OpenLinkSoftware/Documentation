<div id="fn_cfg_item_value" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

cfg_item_value — returns the value of an item from the ini file

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_cfg_item_value" class="funcsynopsis">

|                             |                              |
|-----------------------------|------------------------------|
| ` `**`cfg_item_value`**` (` | in `path ` varchar ,         |
|                             | in `section ` varchar ,      |
|                             | in `item_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_item_value" class="refsect1">

## Description

Return the value of an item identified by *`item_name`* and *`section`*
parameters from the specified INI file.

</div>

<div id="params_item_value" class="refsect1">

## Parameters

<div id="id81787" class="refsect2">

### path

Name of the INI file.

</div>

<div id="id81790" class="refsect2">

### section

Name of the section in the INI file.

</div>

<div id="id81793" class="refsect2">

### item_name

Name of the item in the section.

</div>

</div>

<div id="ret_item_value" class="refsect1">

## Return Values

A <span class="type">varchar </span> containing the item value. Return
zero if section or item_name is invalid.

</div>

<div id="examples_item_value" class="refsect1">

## Examples

<div id="ex_cfg_item_value" class="example">

**Example 24.33. Simple examples**

<div class="example-contents">

Read the value of the ServerPort item from the \[Parameters\] section of
the current virtuoso.ini file.

``` screen
SQL> select cfg_item_value(virtuoso_ini_path(), 'Parameters','ServerPort');
callret
VARCHAR
__________________________________________________________________________

1112
```

</div>

</div>

  

</div>

<div id="seealso_item_value" class="refsect1">

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
<a href="fn_cfg_item_name.html" class="link" title="cfg_item_name"><code
class="function">cfg_item_name </code></a>
<a href="fn_cfg_write.html" class="link" title="cfg_write"><code
class="function">cfg_write </code></a>

</div>

</div>
