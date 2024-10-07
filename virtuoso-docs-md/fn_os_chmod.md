<div id="fn_os_chmod" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

os_chmod — changes the file access mode of a file

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_os_chmod" class="funcsynopsis">

|                       |                            |
|-----------------------|----------------------------|
| ` `**`os_chmod`**` (` | in `path ` varchar ,       |
|                       | in `new_mod ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_07" class="refsect1">

## Description

`os_chmod ` set the file mode bits by calling the system function
chmod() with the arguments supplied.

Not all the host OSes support all the file modes. That's why the
function will not throw an SQL error if the function fails.

It will return DB NULL value when the function was called successfully
and the error message as a string if it failed.

In most OSes the mode is a bitmask, so one would usually use the
`file_stat` to get the current mode and `bit_or` /`bit_xor` to make the
new mode.

Typical bit layout (from Linux 'man 2 chmod') is :

|                                                |
|------------------------------------------------|
| bit 0 (mask 1) - execute/search by others      |
| bit 1 (mask 2) - write by others               |
| bit 2 (mask 4) - read by others                |
| bit 3 (mask 8) - execute/search by group       |
| bit 4 (mask 16) - write by group               |
| bit 5 (mask 32) - read by group                |
| bit 6 (mask 64) - execute/search by owner      |
| bit 7 (mask 128) - write by owner              |
| bit 8 (mask 256) - read by owner               |
| bit 9 (mask 512) - sticky bit                  |
| bit 10 (mask 1024) - set group ID on execution |
| bit 12 (mask 2048) - set user ID on execution  |

The DirsAllowed and DirsDenied lists in Parameters section of the
virtuoso configuration file (virtuoso.ini by default) are used to
control disk access.

</div>

<div id="params_03" class="refsect1">

## Parameters

<div id="id98627" class="refsect2">

### path

<span class="type">varchar </span> relative path.

</div>

<div id="id98631" class="refsect2">

### new_mod

<span class="type">integer </span> new mode for the file.

</div>

</div>

<div id="examples_03" class="refsect1">

## Examples

<div id="ex_os_chmod" class="example">

**Example 24.242. Simple example**

<div class="example-contents">

Make the virtuoso INI file readable by the others

``` screen
SQL>select os_chmod (virtuoso_ini_path(), bit_or (cast (file_stat (virtuoso_ini_path(), 2) as integer), 4));
callret
VARCHAR
_______________________________________________________________________________

NULL
```

</div>

</div>

  

</div>

<div id="seealso_07" class="refsect1">

## See Also

<a href="fn_file_delete.html" class="link" title="file_delete"><code
class="function">file_delete </code></a>

<a href="fn_file_stat.html" class="link" title="file_stat"><code
class="function">file_stat </code></a>

<a href="fn_os_chown.html" class="link" title="os_chown"><code
class="function">os_chown </code></a>

<a href="fn_virtuoso_ini_path.html" class="link"
title="virtuoso_ini_path"><code
class="function">virtuoso_ini_path </code></a>

<a href="fn_bit_or.html" class="link" title="bit_or"><code
class="function">bit_or </code></a>

<a href="fn_bit_xor.html" class="link" title="bit_xor"><code
class="function">bit_xor </code></a>

</div>

</div>
