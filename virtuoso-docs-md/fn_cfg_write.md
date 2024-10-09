<div>

<div>

</div>

<div>

## Name

cfg_write — Writes the item=value to an INI file

</div>

<div>

## Synopsis

<div>

|                        |                               |
|------------------------|-------------------------------|
| ` `**`cfg_write`**` (` | in `path ` varchar ,          |
|                        | in `section ` varchar ,       |
|                        | in `item_name ` varchar ,     |
|                        | in `item_value ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function requires dba privileges.

This function allows modification of existing entries, or update
updating existing items in an INI file.

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

Name of item that will be assigned the item_value.

</div>

<div>

### item_value

Value to be assigned to the item_name.

</div>

</div>

<div>

## Examples

<div>

**Example 24.36. Simple examples**

<div>

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
<a href="fn_cfg_item_value.html" class="link"
title="cfg_item_value"><code class="function">cfg_item_value </code></a>

</div>

</div>
