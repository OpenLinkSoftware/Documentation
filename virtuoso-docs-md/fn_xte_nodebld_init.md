<div>

<div>

</div>

<div>

## Name

xte_nodebld_init — Creates the empty vector

</div>

<div>

## Synopsis

<div>

|                               |                       |
|-------------------------------|-----------------------|
| ` `**`xte_nodebld_init`**` (` | inout `arg ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function creates the empty vector and assign it to the argument.

</div>

<div>

## Parameters

<div>

### arg

Variable of any type

</div>

</div>

<div>

## Errors

<div>

**Table 24.125. Errors signalled by `xte_nodebld_init `**

<div>

| SQLState                              | Error Code                            | Error Text                                                             | Description |
|---------------------------------------|---------------------------------------|------------------------------------------------------------------------|-------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">SR344 </span> | <span class="errortext">Too few arguments for xte_nodebld_init </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.493. Simple Use**

<div>

After calling xte_nodebld_init() the vector acc of type any is empty and
may be used by xte_nodebld_acc function

``` screen
  xte_nodebld_init(acc);
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xte_head.html" class="link" title="xte_head">xte_head()</a>

<a href="fn_xte_node.html" class="link" title="xte_node">xte_node()</a>

<a href="fn_xte_node_from_nodebld.html" class="link"
title="xte_node_from_nodebld">xte_node_from_nodebld()</a>

<a href="fn_xte_nodebld_acc.html" class="link"
title="xte_nodebld_acc">xte_nodebld_acc()</a>

<a href="fn_xte_nodebld_final.html" class="link"
title="xte_nodebld_final">xte_nodebld_final()</a>

</div>

</div>
