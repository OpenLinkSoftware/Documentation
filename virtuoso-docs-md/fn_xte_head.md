<div>

<div>

</div>

<div>

## Name

xte_head — Returns the vector corresponding to a head of a XML element

</div>

<div>

## Synopsis

<div>

|                       |                             |
|-----------------------|-----------------------------|
| ` `**`xte_head`**` (` | in `tagname ` varchar ,     |
|                       | in `attr1name ` varchar ,   |
|                       | in `attr1val ` varchar ,    |
|                       | `... ` ,                    |
|                       | in `attrNname ` varchar ,   |
|                       | in `attrNval ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function takes odd number of parameters and creates vector which
corresponds to a head of a XML element. The first parameter is a tag
name of the head. The remaining parameters are optional. Each even
parameter is a name of an attribute, each next odd parameter is a value
of this attribute. If two or more attributes have the same name, the
head would have only the last pair.

</div>

<div>

## Parameters

<div>

### tagname

The tag name of the head

</div>

<div>

### attrIname

The name of the I-th attribute

</div>

<div>

### attrIval

The value of the I-th attribute

</div>

</div>

<div>

## Errors

<div>

**Table 24.120. Errors signalled by `xte_head `**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                | Description |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">XTE01 </span> | <span class="errortext">Function xte_head should have an odd number of parameters </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.487. Simple Use**

<div>

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

<div>

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
