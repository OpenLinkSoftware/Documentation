<div id="fn_xte_head" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xte_head — Returns the vector corresponding to a head of a XML element

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xte_head" class="funcsynopsis">

|                       |                             |
|-----------------------|-----------------------------|
| ` `**`xte_head`**` (` | in `tagname ` varchar ,     |
|                       | in `attr1name ` varchar ,   |
|                       | in `attr1val ` varchar ,    |
|                       | `... ` ,                    |
|                       | in `attrNname ` varchar ,   |
|                       | in `attrNval ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xte_head" class="refsect1">

## Description

This function takes odd number of parameters and creates vector which
corresponds to a head of a XML element. The first parameter is a tag
name of the head. The remaining parameters are optional. Each even
parameter is a name of an attribute, each next odd parameter is a value
of this attribute. If two or more attributes have the same name, the
head would have only the last pair.

</div>

<div id="xte_head" class="refsect1">

## Parameters

<div id="id121504" class="refsect2">

### tagname

The tag name of the head

</div>

<div id="id121507" class="refsect2">

### attrIname

The name of the I-th attribute

</div>

<div id="id121510" class="refsect2">

### attrIval

The value of the I-th attribute

</div>

</div>

<div id="errors_xte_head" class="refsect1">

## Errors

<div id="id121515" class="table">

**Table 24.121. Errors signalled by `xte_head `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                | Description |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">XTE01 </span> | <span class="errortext">Function xte_head should have an odd number of parameters </span> |             |

</div>

</div>

  

</div>

<div id="xte_head_01" class="refsect1">

## Examples

<div id="ex_xte_head" class="example">

**Example 24.487. Simple Use**

<div class="example-contents">

The xte_head() call below takes three strings

``` screen
xte_head ('supplier', 'CompanyName', 'Seller' )
```

and produces the result vector which corresponds the following head of a
XML element:

\<supplier CompanyName="Seller"\>

</div>

</div>

  

</div>

<div id="seealso_xte_head" class="refsect1">

## See Also

<a href="fn_xte_node.html" class="link" title="xte_node">xte_node()</a>

<a href="fn_xte_node_from_nodebld.html" class="link"
title="xte_node_from_nodebld">xte_node_from_nodebld()</a>

<a href="fn_xte_nodebld_acc.html" class="link"
title="xte_nodebld_acc">xte_nodebld_acc()</a>

<a href="fn_xte_nodebld_final.html" class="link"
title="xte_nodebld_final">xte_nodebld_final()</a>

<a href="fn_xte_nodebld_init.html" class="link"
title="xte_nodebld_init">xte_nodebld_init()</a>

</div>

</div>
