<div>

<div>

</div>

<div>

## Name

xte_node_from_nodebld — Returns the vector corresponding to a XML
element

</div>

<div>

## Synopsis

<div>

|                                    |                           |
|------------------------------------|---------------------------|
| ` `**`xte_node_from_nodebld`**` (` | in `head ` any ,          |
|                                    | inout `element ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function replaces the first item of the second argument by the
first argument and returns a vector corresponding to an XML element.

</div>

<div>

## Parameters

<div>

### head

This argument is a vector returned by xte_head() function

</div>

<div>

### element

This argument is a vector created by xte_nodebld \_int() function and
then filled by xte_nodebld_acc and xte_nodebld_final() functions

</div>

</div>

<div>

## Errors

<div>

**Table 24.122. Errors signalled by `xte_node_from_nodebld `**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                                              | Description |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">SR349 </span> | <span class="errortext">Too few arguments for xte_node_from_nodebld </span>                                             |             |
| <span class="errorcode">22003 </span> | <span class="errorcode">SR350 </span> | <span class="errortext">The second argument of xte_node_from_nodebld is not made by xte_nodebld_init() function </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.489. Simple Use**

<div>

The vector res below is corresponding to the following XML element:

\<product\>\<supplier CompanyName="Seller"\>\</supplier\>\</product\>

``` screen
create procedure test_nodebld()
              {
                declare acc any;
        declare res any;
                xte_nodebld_init (acc);
                xte_nodebld_acc(acc,xte_node(xte_head ('supplier', 'CompanyName','Seller')));
        acc:=xte_nodebld_final(acc);
                res:=xte_node_from_nodebld(xte_head('product'), acc);
        result (length(res), xml_tree_doc (res));
          };
test_nodebld()
ResLen      Res
INTEGER     VARCHAR
_______________________________________________________________________________

2           <product><supplier CompanyName="Seller" /></product>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xte_head.html" class="link" title="xte_head">xte_head()</a>

<a href="fn_xte_node.html" class="link" title="xte_node">xte_node()</a>

<a href="fn_xte_nodebld_acc.html" class="link"
title="xte_nodebld_acc">xte_nodebld_acc()</a>

<a href="fn_xte_nodebld_final.html" class="link"
title="xte_nodebld_final">xte_nodebld_final()</a>

<a href="fn_xte_nodebld_init.html" class="link"
title="xte_nodebld_init">xte_nodebld_init()</a>

</div>

</div>
