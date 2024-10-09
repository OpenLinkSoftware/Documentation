<div>

<div>

</div>

<div>

## Name

xpf_extension_remove — discards an XPath extension function

</div>

<div>

## Synopsis

<div>

|                                       |                                   |
|---------------------------------------|-----------------------------------|
| `void `**`xpf_extension_remove`**` (` | in `fname ` varchar ,             |
|                                       | in `procedure_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Removes a user-defined XPath function.

</div>

<div>

## Parameters

<div>

### fname

The expanded QName of the extension function to be removed

</div>

<div>

### procedure_name

The fully qualified name of the PL procedure which acts as the extension
function.

</div>

</div>

<div>

## Return Types

None (void).

</div>

<div>

## Errors

<div>

**Table 24.136. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                                | Description                                                         |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|
| <span class="errorcode">42001 </span> | <span class="errorcode">XPE03 </span> | <span class="errortext">The \<built-in XPATH\|XQUERY\> function " \<func name\>" cannot be removed</span> | if XPATH or XQUERY function to be un-registered is a core function. |

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xpf_extension.html" class="link" title="xpf_extension"><code
class="function">xpf_extension() </code></a>

</div>

</div>
