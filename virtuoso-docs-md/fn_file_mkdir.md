<div>

<div>

</div>

<div>

## Name

file_mkdir — Creates a directory in the file system

</div>

<div>

## Synopsis

<div>

|                         |                       |
|-------------------------|-----------------------|
| ` `**`file_mkdir`**` (` | in `path ` varchar ,  |
|                         | out `error ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function requires dba privileges.

This function creates a file system directory.

</div>

<div>

## Parameters

<div>

### path

A string containing path to the directory to be created, absolute or
relative to server working directory.

</div>

<div>

### error

The error message is stored into this variable. If present, errors are
not signalled.

</div>

</div>

<div>

## Return Types

On success returns zero.

</div>

<div>

## Errors

<div>

**Table 24.33. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                                               | Description |
|---------------------------------------|---------------------------------------|------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">FA014 </span> | <span class="errortext">Access to %s is denied due to access control in ini file </span> |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">FA015 </span> | <span class="errortext">Access to %s is denied due to access control in ini file </span> |             |

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_file_delete.html" class="link" title="file_delete"><code
class="function">file_delete() </code></a>
<a href="fn_file_unlink.html" class="link" title="file_unlink"><code
class="function">file_unlink() </code></a>
<a href="fn_file_mkpath.html" class="link" title="file_mkpath"><code
class="function">file_mkpath() </code></a>
<a href="fn_file_stat.html" class="link" title="file_stat"><code
class="function">file_stat() </code></a>

</div>

</div>
