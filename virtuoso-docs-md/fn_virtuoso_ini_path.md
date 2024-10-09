<div>

<div>

</div>

<div>

## Name

virtuoso_ini_path — Return full name of configuration INI file

</div>

<div>

## Synopsis

<div>

|                                |      |
|--------------------------------|------|
| ` `**`virtuoso_ini_path`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns the complete path to the configuration INI file.
It is typically used by the cfg\_ functions that modify or read the
contents of the INI file.

</div>

<div>

## Examples

<div>

**Example 24.444. Simple examples**

<div>

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

<div>

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
