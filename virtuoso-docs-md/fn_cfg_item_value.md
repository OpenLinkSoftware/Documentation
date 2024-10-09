<div>

<div>

</div>

<div>

## Name

cfg_item_value — returns the value of an item from the ini file

</div>

<div>

## Synopsis

<div>

|                             |                              |
|-----------------------------|------------------------------|
| ` `**`cfg_item_value`**` (` | in `path ` varchar ,         |
|                             | in `section ` varchar ,      |
|                             | in `item_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Return the value of an item identified by *`item_name`* and *`section`*
parameters from the specified INI file.

</div>

<div>

## Parameters

<div>

### path

Name of the INI file.

</div>

<div>

### section

Name of the section in the INI file.

</div>

<div>

### item_name

Name of the item in the section.

</div>

</div>

<div>

## Return Values

A <span class="type">varchar </span> containing the item value. Return
zero if section or item_name is invalid.

</div>

<div>

## Examples

<div>

**Example 24.33. Simple examples**

<div>

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

<div>

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
