<div>

<div>

</div>

<div>

## Name

cfg_item_count — return number of items in a section in configuration
file

</div>

<div>

## Synopsis

<div>

|                             |                            |
|-----------------------------|----------------------------|
| ` `**`cfg_item_count`**` (` | in `path ` varchar ,       |
|                             | in `section ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Return the number of items that exist in the specified section of the
INI file.

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

</div>

<div>

## Return Values

An <span class="type">integer </span> containing the number of items
that exist in the section.

</div>

<div>

## Examples

<div>

**Example 24.31. Simple examples**

<div>

Find number of items in the \[Parameters\] section of the current
virtuoso.ini file.

``` screen
SQL> select cfg_item_count(virtuoso_ini_path(), 'Parameters');
callret
INTEGER
_______________________________________________________________

19
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
<a href="fn_cfg_item_name.html" class="link" title="cfg_item_name"><code
class="function">cfg_item_name </code></a>
<a href="fn_cfg_item_value.html" class="link"
title="cfg_item_value"><code class="function">cfg_item_value </code></a>
<a href="fn_cfg_write.html" class="link" title="cfg_write"><code
class="function">cfg_write </code></a>

</div>

</div>
