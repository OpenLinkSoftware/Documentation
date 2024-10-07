<div id="fn_xte_nodebld_init" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xte_nodebld_init — Creates the empty vector

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xte_nodebld_init" class="funcsynopsis">

|                               |                       |
|-------------------------------|-----------------------|
| ` `**`xte_nodebld_init`**` (` | inout `arg ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xte_nodebld_init" class="refsect1">

## Description

This function creates the empty vector and assign it to the argument.

</div>

<div id="xte_nodebld_init" class="refsect1">

## Parameters

<div id="id121879" class="refsect2">

### arg

Variable of any type

</div>

</div>

<div id="errors_xte_nodebld_init" class="refsect1">

## Errors

<div id="id121884" class="table">

**Table 24.126. Errors signalled by `xte_nodebld_init `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                             | Description |
|---------------------------------------|---------------------------------------|------------------------------------------------------------------------|-------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">SR344 </span> | <span class="errortext">Too few arguments for xte_nodebld_init </span> |             |

</div>

</div>

  

</div>

<div id="xte_nodebld_init_01" class="refsect1">

## Examples

<div id="ex_xte_nodebld_init" class="example">

**Example 24.493. Simple Use**

<div class="example-contents">

After calling xte_nodebld_init() the vector acc of type any is empty and
may be used by xte_nodebld_acc function

``` screen
  xte_nodebld_init(acc);
```

</div>

</div>

  

</div>

<div id="seealso_xte_nodebld_init" class="refsect1">

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
