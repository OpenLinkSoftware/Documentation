<div id="fn_file_dirlist" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

file_dirlist — Returns list with content of file system directory

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_file_dirlist" class="funcsynopsis">

|                           |                       |
|---------------------------|-----------------------|
| ` `**`file_dirlist`**` (` | in `path ` varchar ,  |
|                           | in `what ` integer ,  |
|                           | out `error ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_file_dirlist" class="refsect1">

## Description

This function requires dba privileges.

This returns the list of the contents of a given file system directory.

</div>

<div id="params_file_dirlist" class="refsect1">

## Parameters

<div id="id88645" class="refsect2">

### path

string containing valid path to directory in file system

</div>

<div id="id88648" class="refsect2">

### what

flag designating what to return in the list: 0 - directories, 1 -
regular files, 2 - symbolic links, 3 - all entries

</div>

<div id="id88651" class="refsect2">

### error

A variable for returning error messages. If supplied, errors are not
signalled.

</div>

</div>

<div id="ret_file_dirlist" class="refsect1">

## Return Types

an array of strings containing directory entries.

</div>

<div id="errors_file_dirlist" class="refsect1">

## Errors

<div id="id88659" class="table">

**Table 24.33. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                               | Description |
|---------------------------------------|---------------------------------------|------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">FA016 </span> | <span class="errortext">Access to %s is denied due to access control in ini file </span> |             |
| <span class="errorcode">39000 </span> | <span class="errorcode">FA017 </span> | <span class="errortext">Path string is too long. </span>                                 |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">FA018 </span> | <span class="errortext">Access to %s is denied due to access control in ini file </span> |             |
| <span class="errorcode">39000 </span> | <span class="errorcode">FA019 </span> | <span class="errortext">Path string is too long. </span>                                 |             |

</div>

</div>

  

</div>

<div id="seealso_file_dirlist" class="refsect1">

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
