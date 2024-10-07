<div id="fn_cfg_write" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

cfg_write — Writes the item=value to an INI file

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_cfg_write" class="funcsynopsis">

|                        |                               |
|------------------------|-------------------------------|
| ` `**`cfg_write`**` (` | in `path ` varchar ,          |
|                        | in `section ` varchar ,       |
|                        | in `item_name ` varchar ,     |
|                        | in `item_value ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_cfg_write" class="refsect1">

## Description

This function requires dba privileges.

This function allows modification of existing entries, or update
updating existing items in an INI file.

</div>

<div id="params_cfg_write" class="refsect1">

## Parameters

<div id="id81946" class="refsect2">

### path

Name of the INI file.

</div>

<div id="id81949" class="refsect2">

### section

Name of the section in the INI file.

</div>

<div id="id81952" class="refsect2">

### item_name

Name of item that will be assigned the item_value.

</div>

<div id="id81955" class="refsect2">

### item_value

Value to be assigned to the item_name.

</div>

</div>

<div id="examples_cfg_write" class="refsect1">

## Examples

<div id="ex_cfg_write" class="example">

**Example 24.36. Simple examples**

<div class="example-contents">

Write ServerPort=2222 under the \[Parameters\] section of the current
virtuoso.ini file.

``` screen
SQL> cfg_write(virtuoso_ini_path(), 'Parameters','ServerPort','2222');

-- Verification
SQL> select cfg_item_value(virtuoso_ini_path(), 'Parameters','ServerPort');
callret
VARCHAR
___________________________________________________________________________

2222
```

</div>

</div>

  

</div>

<div id="seealso_cfg_write" class="refsect1">

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
<a href="fn_cfg_item_value.html" class="link"
title="cfg_item_value"><code class="function">cfg_item_value </code></a>

</div>

</div>
