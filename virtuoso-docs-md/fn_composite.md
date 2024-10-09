<div>

<div>

</div>

<div>

## Name

composite — create a composite object

</div>

<div>

## Synopsis

<div>

|                                     |               |
|-------------------------------------|---------------|
| `composite obj `**`composite`**` (` | in `x ` any , |
|                                     | `... ` `)`;   |

<div>

 

</div>

</div>

</div>

<div>

## Description

Create a composite object

Returns a composite object containing the serialization of each
argument. The total serialized length of the arguments may not exceed
255.

</div>

<div>

## Parameters

<div>

### *`x `* ...

The function takes a variable number of parameters of any type.

</div>

</div>

<div>

## Return Values

A <span class="type">composite </span> object

</div>

<div>

## Errors

<div>

**Table 24.12. Errors signalled by composite**

<div>

| SQLState                              | Error Code                            | Error Text                                                          | Description                                      |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------|--------------------------------------------------|
| <span class="errorcode">22026 </span> | <span class="errorcode">FT001 </span> | <span class="errortext">Length limit of composite exceeded. </span> | The sum of length of the components exceeds 255. |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.45. Simple example**

<div>

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

<div>

## See Also

<a href="fn_composite_ref.html" class="link" title="composite_ref"><code
class="function">composite_ref</code></a>` ` . The chapter
<a href="compositedatatype.html" class="link"
title="20.2.3. The composite Data Type">Composite Data Type</a> for a
definition of properties of composite objects.

</div>

</div>
