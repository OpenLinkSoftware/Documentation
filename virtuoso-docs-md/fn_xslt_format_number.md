<div>

<div>

</div>

<div>

## Name

xslt_format_number — returns formatted string representation of a
numeric value

</div>

<div>

## Synopsis

<div>

|                                 |                               |
|---------------------------------|-------------------------------|
| ` `**`xslt_format_number`**` (` | `number ` any ,               |
|                                 | `format_string ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

xslt_format_number is an function wrapper for the format-number() XSLT
function.

It always uses the default formatting parameters described in the XSLT
standard.

</div>

<div>

## Parameters

<div>

### *`number `*

<span class="type">integer </span> , <span class="type">numeric </span>
or <span class="type">string </span> .

</div>

<div>

### *`format_string `*

<span class="type">string </span>

</div>

</div>

<div>

## Return Values

An <span class="type">string </span> representation of the numeric value
of *`number `* converted according to the format *`format_string `* .

</div>

<div>

## Examples

<div>

**Example 24.534. Simple examples**

<div>

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

<div>

## See Also

<a href="ch-sqlreference.html#dtcasting" class="link"
title="9.1.2. Casting">casting</a>

</div>

</div>
