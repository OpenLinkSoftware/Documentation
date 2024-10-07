<div id="fn_position" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

position — returns the index of an element within an array or string

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_position" class="funcsynopsis">

|                       |                                                |
|-----------------------|------------------------------------------------|
| ` `**`position`**` (` | `element ` any ,                               |
|                       | `array ` any ,                                 |
|                       | `start_index ` integer (optional, default 1) , |
|                       | `step ` integer (optional, default 1) `)`;     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_position" class="refsect1">

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

<div id="params_position" class="refsect1">

## Parameters

<div id="id99535" class="refsect2">

### *`element `*

<span class="type">any </span> , <span class="type">depends of type of
elements in second argument </span> .

</div>

<div id="id99541" class="refsect2">

### *`array `*

<span class="type">array </span> , <span class="type">vector </span> or
<span class="type">string </span> .

</div>

<div id="id99548" class="refsect2">

### *`start_index `*

<span class="type">integer </span> index beginning from 1; from where to
start search.

</div>

<div id="id99553" class="refsect2">

### *`step `*

<span class="type">integer </span> the step between elements to be
tested; default is 1 (every element)

</div>

</div>

<div id="ret_position" class="refsect1">

## Return Values

An <span class="type">integer </span> index in array starting from 1; if
not found returns zero.

</div>

<div id="errors_position" class="refsect1">

## Errors

<div id="id99564" class="table">

**Table 24.72. Errors signalled by position**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                                      | Description |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">SR061 </span> | <span class="errortext">position: expects a vector whose length is divisible by \[step\], not of length \[actual len\]. </span> |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR000 </span> | <span class="errortext">position expects an array or vector, not an arg of type %d. </span>                                     |             |

</div>

</div>

  

</div>

<div id="examples_position" class="refsect1">

## Examples

<div id="ex_position_1" class="example">

**Example 24.245. Simple examples**

<div class="example-contents">

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

<div id="seealso_position" class="refsect1">

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
