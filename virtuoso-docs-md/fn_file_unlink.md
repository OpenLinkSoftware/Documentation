<div id="fn_file_unlink" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

file_unlink — Delete a file from the file system

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_file_unlink" class="funcsynopsis">

|                          |                         |
|--------------------------|-------------------------|
| ` `**`file_unlink`**` (` | in `path ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_file_unlink" class="refsect1">

## Description

This function requires dba privileges.

This function deletes a file from the file system. sys_unlink is a
synonym of this function.

</div>

<div id="params_file_unlink" class="refsect1">

## Parameters

<div id="id89027" class="refsect2">

### path

Path name of the file to delete.

</div>

</div>

<div id="ret_file_unlink" class="refsect1">

## Return Types

On success returns zero. Otherwise signals an error.

</div>

<div id="errors_set_row_count" class="refsect1">

## Errors

<div id="id89035" class="table">

**Table 24.36. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                                  | Description |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">FA003 </span> | <span class="errortext">Access to %s is denied due to access control in ini file </span>                                    |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">FA004 </span> | <span class="errortext">Access to %s is denied due to access control in ini file </span>                                    |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">SR426 </span> | <span class="errortext">Permission is denied for the file '%s' in sys_unlink() </span>                                      |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">SR427 </span> | <span class="errortext">Path name '%s' too long in sys_unlink() </span>                                                     |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">SR428 </span> | <span class="errortext">A directory component in '%s' does not exist or is a dangling symbolic link in sys_unlink() </span> |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">SR429 </span> | <span class="errortext">A component used as a directory in '%s' is not, in fact, a directory in sys_unlink() </span>        |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">SR430 </span> | <span class="errortext">'%s' refers to a directory in sys_unlink() </span>                                                  |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">SR431 </span> | <span class="errortext">Insufficient kernel memory was available in sys_unlink() </span>                                    |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">SR432 </span> | <span class="errortext">'%s' refers to a file on a read-only filesystem in sys_unlink() </span>                             |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">SR433 </span> | <span class="errortext">Too many symbolic links were encountered in translating '%s' in sys_unlink() </span>                |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">SR434 </span> | <span class="errortext">An I/O error occurred in sys_unlink() </span>                                                       |             |

</div>

</div>

  

</div>

<div id="seealso_file_unlink" class="refsect1">

## See Also

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
