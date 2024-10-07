<div id="fn_file_mkpath" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

file_mkpath — Make a directory chain

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_file_mkpath" class="funcsynopsis">

|                          |                              |
|--------------------------|------------------------------|
| ` `**`file_mkpath`**` (` | in `path ` varchar ,         |
|                          | inout `istest ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_file_mkpath" class="refsect1">

## Description

This function requires dba privileges.

This is to create a directory chain i.e. 'a/b/c/d', where one or more
elements in the path may not exist.

</div>

<div id="params_file_mkpath" class="refsect1">

## Parameters

<div id="id88806" class="refsect2">

### path

string containing file system path to be crated as directory chain

</div>

<div id="id88809" class="refsect2">

### istest

Variable for returning the error message. If specified, errors are not
signalled.

</div>

</div>

<div id="ret_file_mkpath" class="refsect1">

## Return Types

On success returns zero.

</div>

<div id="errors_file_mkpath" class="refsect1">

## Errors

<div id="id88817" class="table">

**Table 24.35. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                 | Description |
|---------------------------------------|---------------------------------------|--------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">FA014 </span> | <span class="errortext">Access to %s is denied due to access control in ini file </span>   |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">FA015 </span> | <span class="errortext">Access to %s is denied due to access control in ini file </span>   |             |
| <span class="errorcode">42000 </span> | <span class="errorcode">FA116 </span> | <span class="errortext">Abnormally long path is passed as argument to sys_mkpath() </span> |             |

</div>

</div>

  

</div>

<div id="seealso_file_mkpath" class="refsect1">

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
