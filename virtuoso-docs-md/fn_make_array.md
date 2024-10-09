<div>

<div>

</div>

<div>

## Name

make_array — returns a new array

</div>

<div>

## Synopsis

<div>

|                              |                            |
|------------------------------|----------------------------|
| `array `**`make_array`**` (` | in `length ` integer ,     |
|                              | in `content ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This returns an array of length elements with the content element type.
The initial content of the array is undefined.

</div>

<div>

## Parameters

<div>

### length

Number of elements to be allocated in the resultant array.

</div>

<div>

### content

String that specifies the data type of the array to make. Valid strings
are 'float', 'double', 'long' or 'any'. These correspond respectively to
the C types long (32 bit signed), float (IEEE 32-bit), double (IEEE
64-bit) and untyped. The untyped array may hold a heterogeneous
collection of any Virtuoso data types, including other arrays. The
initial content of the array is undefined.

</div>

</div>

<div>

## Return Values

An array of specified length and data type

</div>

<div>

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

<div>

**Table 24.53. Errors signalled by make_array()**

<div>

| sqlstate                              | error code                            | error text                                                                             |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">SR021 </span> | <span class="errortext">make_array called with an invalid count \<num\> </span>        |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR022 </span> | <span class="errortext">Type for make_array must be float, double, long or any </span> |

</div>

</div>

  

</div>

</div>
