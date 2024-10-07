<div id="fn_xte_node" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xte_node — Returns the vector corresponding to a XML element

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xte_node" class="funcsynopsis">

|                       |                     |
|-----------------------|---------------------|
| ` `**`xte_node`**` (` | in `head ` any ,    |
|                       | in `arg1 ` any ,    |
|                       | `... ` ,            |
|                       | in `argN ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xte_node" class="refsect1">

## Description

This function returns the vector which corresponds to a XML element. The
first parameter is a head of the element. The remaining parameters are
optional. Each optional parameter either is a XML element or a string.
Two or more successive strings are concatenated.

</div>

<div id="xte_node" class="refsect1">

## Parameters

<div id="id121579" class="refsect2">

### argI

A XML element or a string

</div>

</div>

<div id="errors_xte_node" class="refsect1">

## Errors

<div id="id121584" class="table">

**Table 24.122. Errors signalled by `xte_node `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                           | Description |
|---------------------------------------|---------------------------------------|--------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">42000 </span> | <span class="errorcode">XTE02 </span> | <span class="errortext">Function xte_node should have at least one parameter </span> |             |

</div>

</div>

  

</div>

<div id="xte_node_01" class="refsect1">

## Examples

<div id="ex_xte_node" class="example">

**Example 24.488. Simple Use**

<div class="example-contents">

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

<div id="seealso_xte_node" class="refsect1">

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
