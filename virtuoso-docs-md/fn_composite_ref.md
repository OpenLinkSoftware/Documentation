<div id="fn_composite_ref" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

composite_ref — get member of a composite object

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_composite_ref" class="funcsynopsis">

|                                   |                        |
|-----------------------------------|------------------------|
| `integer `**`composite_ref`**` (` | in `c ` any ,          |
|                                   | in `nth ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_composite_ref" class="refsect1">

## Description

`composite_ref ` returns the *`nth `* element of the composite. The
index is 0 based.

</div>

<div id="params_composite_ref" class="refsect1">

## Parameters

<div id="id82552" class="refsect2">

### nth

<span class="type">integer </span>

</div>

</div>

<div id="rettypes_composite_ref" class="refsect1">

## Return types

The type returned is the type of the composite member referred to.

</div>

<div id="err_composite_ref" class="refsect1">

## Errors

<div id="id82561" class="table">

**Table 24.14. Errors signalled by `composite_ref `**

<div class="table-contents">

|                                       |                                       |
|---------------------------------------|---------------------------------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">FT002 </span> |
| <span class="errorcode">22003 </span> | <span class="errorcode">FT003 </span> |

</div>

</div>

  

</div>

<div id="examples_composite_ref" class="refsect1">

## Examples

<div id="ex_composite_ref_1" class="example">

**Example 24.46. Simple example**

<div class="example-contents">

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

<div id="seealso_composite_ref" class="refsect1">

## See Also

The <a href="compositedatatype.html" class="link"
title="20.2.3. The composite Data Type">Composite Data Type</a> for a
definition of the properties of composite objects.

The function
<a href="fn_composite.html" class="link" title="composite"><code
class="function">composite</code></a> .

</div>

</div>
