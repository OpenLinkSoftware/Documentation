<div id="fn_xslt_format_number" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xslt_format_number — returns formatted string representation of a
numeric value

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xslt_format_number" class="funcsynopsis">

|                                 |                               |
|---------------------------------|-------------------------------|
| ` `**`xslt_format_number`**` (` | `number ` any ,               |
|                                 | `format_string ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_80" class="refsect1">

## Description

xslt_format_number is an function wrapper for the format-number() XSLT
function.

It always uses the default formatting parameters described in the XSLT
standard.

</div>

<div id="params_04_01" class="refsect1">

## Parameters

<div id="id124676" class="refsect2">

### *`number `*

<span class="type">integer </span> , <span class="type">numeric </span>
or <span class="type">string </span> .

</div>

<div id="id124683" class="refsect2">

### *`format_string `*

<span class="type">string </span>

</div>

</div>

<div id="ret_25" class="refsect1">

## Return Values

An <span class="type">string </span> representation of the numeric value
of *`number `* converted according to the format *`format_string `* .

</div>

<div id="examples_21_01" class="refsect1">

## Examples

<div id="ex_fn_xslt_format_number_1" class="example">

**Example 24.534. Simple examples**

<div class="example-contents">

``` screen
xslt_format_number (5351, '#,###'),        5,351
xslt_format_number ('5351', '#.00'),       5351.00
xslt_format_number (53.51, '#.0000'),      53.5100
xslt_format_number (53.51, '0000.0000'),   0053.5100
xslt_format_number (53.51, '0000.####'),   0053.51
xslt_format_number (53.56, '0.0');        53.6
```

</div>

</div>

  

</div>

<div id="seealso_50" class="refsect1">

## See Also

<a href="ch-sqlreference.html#dtcasting" class="link"
title="9.1.2. Casting">casting</a>

</div>

</div>
