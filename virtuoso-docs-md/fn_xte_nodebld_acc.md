<div id="fn_xte_nodebld_acc" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xte_nodebld_acc — Adds to the first arguments all remaining arguments

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xte_nodebld_acc" class="funcsynopsis">

|                              |                     |
|------------------------------|---------------------|
| ` `**`xte_nodebld_acc`**` (` | in `acc ` any ,     |
|                              | in `arg1 ` any ,    |
|                              | `... ` ,            |
|                              | in `argN ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xte_nodebld_acc" class="refsect1">

## Description

The xte_nodebld_acc() function successively adds the remaining arguments
to the first one. If the last items of the first argument and some
following arguments are strings, they are concatenated. All successive
strings are concatenated. The value of the first item is the number of
the non-empty items in the returned vector. The length of the returned
vector is the sum of the length of the first argument and number of the
remaining arguments.

</div>

<div id="xte_nodebld_acc" class="refsect1">

## Parameters

<div id="id121723" class="refsect2">

### acc

A vector initiated by xte_nodebld_init() function and filled by
xte_nodebld_acc() functions

</div>

<div id="id121726" class="refsect2">

### argI

A string or a vector returned by xte_node_from_nodebld or xte_node
functions

</div>

</div>

<div id="errors_xte_nodebld_acc" class="refsect1">

## Errors

<div id="id121731" class="table">

**Table 24.124. Errors signalled by `xte_nodebld_acc `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                       | Description |
|---------------------------------------|---------------------------------------|------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">SR345 </span> | <span class="errortext">Too few arguments for xte_nodebld_acc </span>                                            |             |
| <span class="errorcode">22003 </span> | <span class="errorcode">SR346 </span> | <span class="errortext">The first argument of xte_nodebld_acc is not made by xte_nodebld_init() function </span> |             |

</div>

</div>

  

</div>

<div id="xte_nodebld_acc_01" class="refsect1">

## Examples

<div id="ex_xte_nodebld_acc" class="example">

**Example 24.490. Simple Use**

<div class="example-contents">

``` screen
create procedure test_nodebld()
              {
                declare acc any;
                xte_nodebld_init (acc);
                xte_nodebld_acc (acc,'string1', string2');
                xte_nodebld_acc(acc, 'string3',xte_node(xte_head ('supplier', 'CompanyName','Seller')));
        . . .
          }
     
```

The length of the vector acc as the result of the two xte_nodebld_acc()
calls below is equal to 4, but only three items are not empty:

'3' (number of not empty elements of the vector including this item)

'string1string2string3' (the result of concatenation)

vector corresponding the following XML element: \<supplier
CompanyName="Seller"\> \</supplier\>

</div>

</div>

  

</div>

<div id="seealso_xte_nodebld_acc" class="refsect1">

## See Also

<a href="fn_xte_head.html" class="link" title="xte_head">xte_head()</a>

<a href="fn_xte_node.html" class="link" title="xte_node">xte_node()</a>

<a href="fn_xte_node_from_nodebld.html" class="link"
title="xte_node_from_nodebld">xte_node_from_nodebld()</a>

<a href="fn_xte_nodebld_final.html" class="link"
title="xte_nodebld_final">xte_nodebld_final()</a>

<a href="fn_xte_nodebld_init.html" class="link"
title="xte_nodebld_init">xte_nodebld_init()</a>

</div>

</div>
