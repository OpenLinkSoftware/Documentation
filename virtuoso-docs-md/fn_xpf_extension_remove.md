<div id="fn_xpf_extension_remove" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xpf_extension_remove — discards an XPath extension function

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xpf_extension_remove" class="funcsynopsis">

|                                       |                                   |
|---------------------------------------|-----------------------------------|
| `void `**`xpf_extension_remove`**` (` | in `fname ` varchar ,             |
|                                       | in `procedure_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xpf_extension_remove" class="refsect1">

## Description

Removes a user-defined XPath function.

</div>

<div id="params_xpf_extension_remove" class="refsect1">

## Parameters

<div id="id124479" class="refsect2">

### fname

The expanded QName of the extension function to be removed

</div>

<div id="id124482" class="refsect2">

### procedure_name

The fully qualified name of the PL procedure which acts as the extension
function.

</div>

</div>

<div id="ret_xpf_extension_remove" class="refsect1">

## Return Types

None (void).

</div>

<div id="errors_xpf_extension_remove" class="refsect1">

## Errors

<div id="id124490" class="table">

**Table 24.137. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                | Description                                                         |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------|
| <span class="errorcode">42001 </span> | <span class="errorcode">XPE03 </span> | <span class="errortext">The \<built-in XPATH\|XQUERY\> function " \<func name\>" cannot be removed</span> | if XPATH or XQUERY function to be un-registered is a core function. |

</div>

</div>

  

</div>

<div id="seealso_xpf_extension_remove" class="refsect1">

## See Also

<a href="fn_xpf_extension.html" class="link" title="xpf_extension"><code
class="function">xpf_extension() </code></a>

</div>

</div>
