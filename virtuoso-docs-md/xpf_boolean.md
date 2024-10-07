<div id="xpf_boolean" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

boolean — Converts its argument to boolean

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_boolean" class="funcsynopsis">

|                             |                 |
|-----------------------------|-----------------|
| `boolean `**`boolean`**` (` | `obj ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_boolean" class="refsect1">

## Description

The function converts its argument to a boolean as follows:

<div class="itemizedlist">

- A number is true if and only if it is neither zero nor NaN.

- A node-set is true if and only if it is non-empty.

- A string is true if and only if its length is non-zero.

- An object of a type other than the four basic types is converted to a
  boolean in a way that is dependent on that type.

</div>

</div>

<div id="xpf_params_boolean" class="refsect1">

## Parameters

<div id="id126153" class="refsect2">

### obj

The object to be converted into boolean.

</div>

</div>

<div id="xpf_ret_boolean" class="refsect1">

## Return Types

Boolean

</div>

<div id="xpf_examples_boolean" class="refsect1">

## Examples

<div id="xpf_ex_boolean" class="example">

**Example 24.566. **

<div class="example-contents">

The following expressions are true:

``` screen
boolean('aaa') = true()
boolean('false') = true()
boolean(false()) = false()
boolean(.) = true()
boolean('0') = true()
boolean(0) = false()
```

</div>

</div>

  

</div>

<div id="xpf_seealso_boolean" class="refsect1">

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>
<a href="xpf_number.html" class="link" title="number">number()</a>

</div>

</div>
