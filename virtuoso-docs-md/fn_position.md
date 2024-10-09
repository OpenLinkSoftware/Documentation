<div>

<div>

</div>

<div>

## Name

position — returns the index of an element within an array or string

</div>

<div>

## Synopsis

<div>

|                       |                                                |
|-----------------------|------------------------------------------------|
| ` `**`position`**` (` | `element ` any ,                               |
|                       | `array ` any ,                                 |
|                       | `start_index ` integer (optional, default 1) , |
|                       | `step ` integer (optional, default 1) `)`;     |

<div>

 

</div>

</div>

</div>

<div>

## Description

position returns the one-based index for the first occurrence of element
within an <span class="type">array</span> or
<span class="type">string</span> , beginning from offset start_index and
iterating with step. If the second argument is a
<span class="type">string</span> , the first argument must be a string
with a single character. If the second argument is an array of
<span class="type">any</span> , then depending of type of it's elements
same type is expected as the first argument.

</div>

<div>

## Parameters

<div>

### *`element `*

<span class="type">any </span> , <span class="type">depends of type of
elements in second argument </span> .

</div>

<div>

### *`array `*

<span class="type">array </span> , <span class="type">vector </span> or
<span class="type">string </span> .

</div>

<div>

### *`start_index `*

<span class="type">integer </span> index beginning from 1; from where to
start search.

</div>

<div>

### *`step `*

<span class="type">integer </span> the step between elements to be
tested; default is 1 (every element)

</div>

</div>

<div>

## Return Values

An <span class="type">integer </span> index in array starting from 1; if
not found returns zero.

</div>

<div>

## Errors

<div>

**Table 24.71. Errors signalled by position**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                                                      | Description |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">SR061 </span> | <span class="errortext">position: expects a vector whose length is divisible by \[step\], not of length \[actual len\]. </span> |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR000 </span> | <span class="errortext">position expects an array or vector, not an arg of type %d. </span>                                     |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.245. Simple examples**

<div>

``` screen
SQL> select position ('b', 'Abacus');
callret
VARCHAR
_______________________________________________________________________________

2

1 Rows. -- 3 msec.
SQL> select position (2, vector ('Primero', null, 2, 3.333));
callret
VARCHAR
_______________________________________________________________________________

3

1 Rows. -- 4 msec.

SQL> select position ('a', 'babaab', 1, 2);
                                ^--- matches 5-th as other 'a' are skipped as step is 2 chars
callret
INTEGER
_______________________________________________________________________________

5

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_vector.html" class="link" title="vector"><code
class="function">vector </code></a>
<a href="fn_aset.html" class="link" title="aset"><code
class="function">aset </code></a>
<a href="fn_aref.html" class="link" title="aref"><code
class="function">aref </code></a>
<a href="fn_ascii.html" class="link" title="ascii"><code
class="function">ascii </code></a>

</div>

</div>
