<div id="fn_current_charset" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

current_charset — Get name of current charset.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_current_charset" class="funcsynopsis">

|                              |      |
|------------------------------|------|
| ` `**`current_charset`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_current_charset" class="refsect1">

## Description

This function returns the "preferred" name of the current charset as a
string.

It returns value which is set in the INI file or those which is set with
'SET CHARSET=..' call. This cannot be used to return charset for the
current HTTP connection in the VSP or VSPX context.

</div>

<div id="params_current_charset" class="refsect1">

## Parameters

None.

</div>

<div id="ret_current_charset" class="refsect1">

## Return Types

A <span class="type">string </span> containing the name.

</div>

<div id="errors_current_charset" class="refsect1">

## Errors

None signalled.

</div>

<div id="examples_current_charset" class="refsect1">

## Examples

<div id="ex_current_charset" class="example">

**Example 24.67. Get name of current charset**

<div class="example-contents">

``` screen
SQL> select current_charset();
callret
VARCHAR
_______________________________________________________________________________
ISO-8859-1
```

</div>

</div>

  

</div>

<div id="seealso_current_charset" class="refsect1">

## See Also

<a href="fn_charset_define.html" class="link"
title="charset_define"><code
class="function">charset_define() </code></a> ,
<a href="fn_charset_recode.html" class="link"
title="charset_recode"><code
class="function">charset_recode()</code></a> ,
<a href="fn_charsets_list.html" class="link" title="charsets_list"><code
class="function">charsets_list()</code></a>

</div>

</div>
