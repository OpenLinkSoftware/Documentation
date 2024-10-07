<div id="fn_composite" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

composite — create a composite object

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_composite" class="funcsynopsis">

|                                     |               |
|-------------------------------------|---------------|
| `composite obj `**`composite`**` (` | in `x ` any , |
|                                     | `... ` `)`;   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_composite" class="refsect1">

## Description

Create a composite object

Returns a composite object containing the serialization of each
argument. The total serialized length of the arguments may not exceed
255.

</div>

<div id="params_composite" class="refsect1">

## Parameters

<div id="id82488" class="refsect2">

### *`x `* ...

The function takes a variable number of parameters of any type.

</div>

</div>

<div id="ret_composite" class="refsect1">

## Return Values

A <span class="type">composite </span> object

</div>

<div id="errors_composite" class="refsect1">

## Errors

<div id="id82498" class="table">

**Table 24.13. Errors signalled by composite**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                          | Description                                      |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------|--------------------------------------------------|
| <span class="errorcode">22026 </span> | <span class="errorcode">FT001 </span> | <span class="errortext">Length limit of composite exceeded. </span> | The sum of length of the components exceeds 255. |

</div>

</div>

  

</div>

<div id="examples_composite" class="refsect1">

## Examples

<div id="ex_composite" class="example">

**Example 24.45. Simple example**

<div class="example-contents">

Get second component of a composite of two integers. See reference page
for <a href="fn_composite_ref.html" class="link"
title="composite_ref">composite_ref</a> .

``` screen
SQL> select composite_ref (composite (10,20), 1);
callret
VARCHAR
_______________________________________________________________________________

20

1 Rows. -- 6 msec.
```

</div>

</div>

  

</div>

<div id="seealso_composite" class="refsect1">

## See Also

<a href="fn_composite_ref.html" class="link" title="composite_ref"><code
class="function">composite_ref</code></a>` ` . The chapter
<a href="compositedatatype.html" class="link"
title="20.2.3. The composite Data Type">Composite Data Type</a> for a
definition of properties of composite objects.

</div>

</div>
