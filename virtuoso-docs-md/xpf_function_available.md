<div id="xpf_function_available" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

function-available — Returns true if XPATH extension function with the
requested name is defined in the XPATH Processor, otherwise returns
false.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_function_available" class="funcsynopsis">

|                                        |                        |
|----------------------------------------|------------------------|
| `boolean `**`function-available`**` (` | `funname ` string `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_function_available" class="refsect1">

## Description

The function returns true if XPATH Processor can execute XPATH extension
function with the name specified by *`funname`* argument. If such
function is not defined, function-available returns false.

</div>

<div id="xpf_params_function_available" class="refsect1">

## Parameters

<div id="id127537" class="refsect2">

### funname

The name of XPATH extension function

</div>

</div>

<div id="xpf_ret_function_available" class="refsect1">

## Return Types

Boolean

</div>

<div id="xpf_examples_function_available" class="refsect1">

## Examples

<div id="xpf_ex_function_available" class="example">

**Example 24.590. **

<div class="example-contents">

This expression should return false.

``` screen
function-available('http://example.com/Virtuoso/nosuchfunction')
```

</div>

</div>

  

</div>

<div id="xpf_seealso_function_available" class="refsect1">

## See Also

<a href="fn_xpf_extension.html" class="link"
title="xpf_extension">xpf_extension()</a>

</div>

</div>
