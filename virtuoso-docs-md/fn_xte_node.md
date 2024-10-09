<div>

<div>

</div>

<div>

## Name

xte_node — Returns the vector corresponding to a XML element

</div>

<div>

## Synopsis

<div>

|                       |                     |
|-----------------------|---------------------|
| ` `**`xte_node`**` (` | in `head ` any ,    |
|                       | in `arg1 ` any ,    |
|                       | `... ` ,            |
|                       | in `argN ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns the vector which corresponds to a XML element. The
first parameter is a head of the element. The remaining parameters are
optional. Each optional parameter either is a XML element or a string.
Two or more successive strings are concatenated.

</div>

<div>

## Parameters

<div>

### argI

A XML element or a string

</div>

</div>

<div>

## Errors

<div>

**Table 24.121. Errors signalled by `xte_node `**

<div>

| SQLState                              | Error Code                            | Error Text                                                                           | Description |
|---------------------------------------|---------------------------------------|--------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">XTE02 </span> | <span class="errortext">Function xte_node should have at least one parameter </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.488. Simple Use**

<div>

The xte_node() call

``` screen
xte_node(xte_head ('supplier', 'CompanyName', 'Seller'), 'this string will be ', 'concatenated with it')
```

produces a vector corresponding the following XML element:

\<supplier CompanyName="Seller"\>this string will be concatenated with
it \</supplier\>

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xte_head.html" class="link" title="xte_head">xte_head</a>

<a href="fn_xte_node_from_nodebld.html" class="link"
title="xte_node_from_nodebld">xte_node_from_nodebld</a>

<a href="fn_xte_nodebld_acc.html" class="link"
title="xte_nodebld_acc">xte_nodebld_acc</a>

<a href="fn_xte_nodebld_final.html" class="link"
title="xte_nodebld_final">xte_nodebld_final</a>

<a href="fn_xte_nodebld_init.html" class="link"
title="xte_nodebld_init">xte_nodebld_init</a>

</div>

</div>
