<div id="fn_make_array" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

make_array — returns a new array

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_make_array" class="funcsynopsis">

|                              |                            |
|------------------------------|----------------------------|
| `array `**`make_array`**` (` | in `length ` integer ,     |
|                              | in `content ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_make_array" class="refsect1">

## Description

This returns an array of length elements with the content element type.
The initial content of the array is undefined.

</div>

<div id="params_make_array" class="refsect1">

## Parameters

<div id="id96267" class="refsect2">

### length

Number of elements to be allocated in the resultant array.

</div>

<div id="id96270" class="refsect2">

### content

String that specifies the data type of the array to make. Valid strings
are 'float', 'double', 'long' or 'any'. These correspond respectively to
the C types long (32 bit signed), float (IEEE 32-bit), double (IEEE
64-bit) and untyped. The untyped array may hold a heterogeneous
collection of any Virtuoso data types, including other arrays. The
initial content of the array is undefined.

</div>

</div>

<div id="ret_make_array" class="refsect1">

## Return Values

An array of specified length and data type

</div>

<div id="errors_make_array" class="refsect1">

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

<div id="id96280" class="table">

**Table 24.54. Errors signalled by make_array()**

<div class="table-contents">

|                                       |                                       |                                                                                        |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------|
| sqlstate                              | error code                            | error text                                                                             |
| <span class="errorcode">22003 </span> | <span class="errorcode">SR021 </span> | <span class="errortext">make_array called with an invalid count \<num\> </span>        |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR022 </span> | <span class="errortext">Type for make_array must be float, double, long or any </span> |

</div>

</div>

  

</div>

</div>
