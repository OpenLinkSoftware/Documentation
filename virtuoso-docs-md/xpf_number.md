<div id="xpf_number" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

number — Converts its argument to a number.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_number" class="funcsynopsis">

|                           |                 |
|---------------------------|-----------------|
| `number `**`number`**` (` | `obj ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_number" class="refsect1">

## Description

The number function converts its argument to a number as follows:

<div class="itemizedlist">

- A string that consists of decimal number and optional whitespaces is
  converted to the number recorded. Any other string is converted to NaN
  ("not-a-number" value). More precisely, a string that consists of
  optional whitespace followed by an optional plus or minus sign
  followed by a Number followed by whitespace is converted to the IEEE
  754 number that is nearest (according to the IEEE 754 round-to-nearest
  rule) to the mathematical value represented by the string. Note that
  it differs from XPATH 1.0 standard where plus sign is not allowed
  before Number part of the string.

- Boolean true is converted to 1; boolean false is converted to 0.

- A node-set is first converted to a string as if by a call to the
  string function and then converted in the same way as a string
  argument.

- An object of a type other than the four basic types is converted to a
  number in a way that is dependent on that type.

</div>

If the argument is omitted, it defaults to a node-set with the context
node as its only member.

</div>

<div id="xpf_params_number" class="refsect1">

## Parameters

<div id="id128410" class="refsect2">

### obj

Value to be converted to a number.

</div>

</div>

<div id="xpf_ret_number" class="refsect1">

## Return Types

Number

</div>

<div id="xpf_examples_number" class="refsect1">

## Examples

<div id="xpf_ex_number" class="example">

**Example 24.607. **

<div class="example-contents">

``` screen
number(' 3.1415926 ')
```

</div>

</div>

  

</div>

<div id="xpf_seealso_number" class="refsect1">

## See Also

<a href="xpf_string.html" class="link" title="string">string()</a>
<a href="xpf_boolean.html" class="link" title="boolean">boolean()</a>

</div>

</div>
