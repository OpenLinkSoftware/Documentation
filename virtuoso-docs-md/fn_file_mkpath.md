<div>

<div>

</div>

<div>

## Name

file_mkpath — Make a directory chain

</div>

<div>

## Synopsis

<div>

|                          |                              |
|--------------------------|------------------------------|
| ` `**`file_mkpath`**` (` | in `path ` varchar ,         |
|                          | inout `istest ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function requires dba privileges.

This is to create a directory chain i.e. 'a/b/c/d', where one or more
elements in the path may not exist.

</div>

<div>

## Parameters

<div>

### path

string containing file system path to be crated as directory chain

</div>

<div>

### istest

Variable for returning the error message. If specified, errors are not
signalled.

</div>

</div>

<div>

## Return Types

On success returns zero.

</div>

<div>

## Errors

<div>

**Table 24.34. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                 | Description |
|---------------------------------------|---------------------------------------|--------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">FA014 </span> | <span class="errortext">Access to %s is denied due to access control in ini file </span>   |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">FA015 </span> | <span class="errortext">Access to %s is denied due to access control in ini file </span>   |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">FA116 </span> | <span class="errortext">Abnormally long path is passed as argument to sys_mkpath() </span> |             |

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_file_delete.html" class="link" title="file_delete"><code
class="function">file_unlink() </code></a>
<a href="fn_file_delete.html" class="link" title="file_delete"><code
class="function">file_delete() </code></a>
<a href="fn_file_mkdir.html" class="link" title="file_mkdir"><code
class="function">file_mkdir() </code></a>
<a href="fn_file_mkpath.html" class="link" title="file_mkpath"><code
class="function">file_mkpath() </code></a>
<a href="fn_file_stat.html" class="link" title="file_stat"><code
class="function">file_stat() </code></a>

</div>

</div>
