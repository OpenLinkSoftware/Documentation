<div>

<div>

</div>

<div>

## Name

current_charset — Get name of current charset.

</div>

<div>

## Synopsis

<div>

|                              |      |
|------------------------------|------|
| ` `**`current_charset`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns the "preferred" name of the current charset as a
string.

It returns value which is set in the INI file or those which is set with
'SET CHARSET=..' call. This cannot be used to return charset for the
current HTTP connection in the VSP or VSPX context.

</div>

<div>

## Parameters

None.

</div>

<div>

## Return Types

A <span class="type">string </span> containing the name.

</div>

<div>

## Errors

None signalled.

</div>

<div>

## Examples

<div>

**Example 24.67. Get name of current charset**

<div>

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

<div>

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
