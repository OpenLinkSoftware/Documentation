<div>

<div>

</div>

<div>

## Name

file_stat — get various OS statistics about a file

</div>

<div>

## Synopsis

<div>

|                        |                         |
|------------------------|-------------------------|
| ` `**`file_stat`**` (` | in `path ` varchar ,    |
|                        | in `what ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`file_stat ` returns various information for an OS file by calling stat
() system call and converting the relevant value to a
<span class="type">varchar</span> . The path is relative to the server's
working directory. The what is an integer value selecting what
information to return. If you don't supply second argument to the
function it defaults to mode = 0.

The DirsAllowed and DirsDenied lists in Parameters section of the
virtuoso configuration file (virtuoso.ini by default) are not used to
control disk access.

</div>

<div>

## Parameters

<div>

### path

<span class="type">varchar </span> relative path.

</div>

<div>

### what

<span class="type">integer </span> info to be returned.

|                                                            |
|------------------------------------------------------------|
| 0 - (default) file modification time (st_mtime)            |
| 1 - file size (st_size, bytes)                             |
| 2 - file mode (st_mode, as integer)                        |
| 3 - file modification time for directories only (st_mtime) |
| 4 - file owner (user name corresponding to st_uid)         |
| 5 - file group (group name corresponding to st_gid)        |

</div>

</div>

<div>

## Examples

<div>

**Example 24.116. Simple example**

<div>

Get the size of the virtuoso INI file

``` screen
SQL>select file_stat (virtuoso_ini_path(), 1);
callret
VARCHAR
_______________________________________________________________________________

958
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_file_delete.html" class="link" title="file_delete"><code
class="function">file_delete </code></a>

<a href="fn_os_chmod.html" class="link" title="os_chmod"><code
class="function">os_chmod </code></a>

<a href="fn_os_chown.html" class="link" title="os_chown"><code
class="function">os_chown </code></a>

<a href="fn_virtuoso_ini_path.html" class="link"
title="virtuoso_ini_path"><code
class="function">virtuoso_ini_path </code></a>

</div>

</div>
