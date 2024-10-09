<div>

<div>

</div>

<div>

## Name

server_root — Returns server working directory.

</div>

<div>

## Synopsis

<div>

|                          |      |
|--------------------------|------|
| ` `**`server_root`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns the complete physical path to server working
directory.

</div>

<div>

## Examples

<div>

**Example 24.445. Simple examples**

<div>

Show in the result the server working directory and INI file name:

``` programlisting
SQL> select server_root(), virtuoso_ini_path ();
callret                                   callret
VARCHAR                                   VARCHAR
_______________________________________

C:\Program Files\OpenLink\Virtuoso 5.0\   C:\Program Files\OpenLink\Virtuoso 5.0\demo\demo.ini

1 Rows. -- 20 msec.
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
