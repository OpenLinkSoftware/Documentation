<div id="fn_file_mkdir" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

file_mkdir — Creates a directory in the file system

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_file_mkdir" class="funcsynopsis">

|                         |                       |
|-------------------------|-----------------------|
| ` `**`file_mkdir`**` (` | in `path ` varchar ,  |
|                         | out `error ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_file_mkdir" class="refsect1">

## Description

This function requires dba privileges.

This function creates a file system directory.

</div>

<div id="params_file_mkdir" class="refsect1">

## Parameters

<div id="id88736" class="refsect2">

### path

A string containing path to the directory to be created, absolute or
relative to server working directory.

</div>

<div id="id88739" class="refsect2">

### error

The error message is stored into this variable. If present, errors are
not signalled.

</div>

</div>

<div id="ret_file_mkdir" class="refsect1">

## Return Types

On success returns zero.

</div>

<div id="errors_file_mkdir" class="refsect1">

## Errors

<div id="id88747" class="table">

**Table 24.34. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                               | Description |
|---------------------------------------|---------------------------------------|------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">FA014 </span> | <span class="errortext">Access to %s is denied due to access control in ini file </span> |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">FA015 </span> | <span class="errortext">Access to %s is denied due to access control in ini file </span> |             |

</div>

</div>

  

</div>

<div id="seealso_file_mkdir" class="refsect1">

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
