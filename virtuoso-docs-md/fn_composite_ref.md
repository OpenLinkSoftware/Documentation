<div>

<div>

</div>

<div>

## Name

composite_ref — get member of a composite object

</div>

<div>

## Synopsis

<div>

|                                   |                        |
|-----------------------------------|------------------------|
| `integer `**`composite_ref`**` (` | in `c ` any ,          |
|                                   | in `nth ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`composite_ref ` returns the *`nth `* element of the composite. The
index is 0 based.

</div>

<div>

## Parameters

<div>

### nth

<span class="type">integer </span>

</div>

</div>

<div>

## Return types

The type returned is the type of the composite member referred to.

</div>

<div>

## Errors

<div>

**Table 24.13. Errors signalled by `composite_ref `**

<div>

|                                       |                                       |
|---------------------------------------|---------------------------------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">FT002 </span> |
| <span class="errorcode">22003 </span> | <span class="errorcode">FT003 </span> |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.46. Simple example**

<div>

Get first member of a composite consisting of <span class="type">VARCHAR
</span> values.

``` screen
SQL> select composite_ref (composite ('Miles','Herbie','Wayne','Ron','Tony'), 0);
callret
VARCHAR
_______________________________________________________________________________

Miles

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

The <a href="compositedatatype.html" class="link"
title="20.2.3. The composite Data Type">Composite Data Type</a> for a
definition of the properties of composite objects.

The function
<a href="fn_composite.html" class="link" title="composite"><code
class="function">composite</code></a> .

</div>

</div>
