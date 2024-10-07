<div id="fn_xte_nodebld_final" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xte_nodebld_final — Corrects input vector

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xte_nodebld_final" class="funcsynopsis">

|                                |                     |
|--------------------------------|---------------------|
| ` `**`xte_nodebld_final`**` (` | inout `arg ` any ,  |
|                                | in `head ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xte_nodebld_final" class="refsect1">

## Description

By default this function reduces all last empty items from the first
argument and returns it, but supplied a second argument it also replaces
the first item of the first argument by the second argument, but does
not commit the return.

</div>

<div id="xte_nodebld_final" class="refsect1">

## Parameters

<div id="id121800" class="refsect2">

### arg

The vector created by the xte_nodebld_init() and filled by
xte_nodebld_acc() function

</div>

<div id="id121803" class="refsect2">

### head

A vector returned by xte_head() function

</div>

</div>

<div id="errors_xte_nodebld_final" class="refsect1">

## Errors

<div id="id121808" class="table">

**Table 24.125. Errors signalled by `xte_nodebld_final `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                              | Description |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">SR347 </span> | <span class="errortext">Too few arguments for xte_nodebld_final </span>                                                 |             |
| <span class="errorcode">22003 </span> | <span class="errorcode">SR348 </span> | <span class="errortext">The first argument of xte_node_nodebld_final is not made by xte_nodebld_init() function </span> |             |

</div>

</div>

  

</div>

<div id="xte_nodebld_final_01" class="refsect1">

## Examples

<div id="ex_xte_nodebld_final" class="example">

**Example 24.491. xte_nodebld_final() with a single argument**

<div class="example-contents">

Before the xte_nodebld_final() call the length of the vector acc is
equal to 16, after the call the length is 3. The vector acc does not
correspond to a xml document - there is no a root tag. The result of the
xte_nodebld_final() may be used as argument for xte_node_from_nodebld()
to get a vector corresponding to complete xml document.

``` screen
create procedure test1_nodebld()
              {
                declare acc any;
                xte_nodebld_init (acc);
                xte_nodebld_acc (acc,'string1', string2');
        xte_nodebld_acc(acc, 'string3',xte_node(xte_head ('supplier', 'CompanyName','Seller')));
            acc:=xte_nodebld_final(acc);
                    . . .
          }
```

</div>

</div>

  

<div id="ex_xte_nodebld_final_01" class="example">

**Example 24.492. xte_nodebld_final() with two arguments.**

<div class="example-contents">

The vector acc below is corresponding to the following XML element:

\<product\>string1string2string3

\<supplier CompanyName="Seller"\>\</supplier\>

\</product\>

``` screen
create procedure test2_nodebld()
              {
                declare acc any;
                declare "Res" any;
                declare "ResLen" integer;
                result_names ("ResLen", "Res");
                xte_nodebld_init (acc);
                xte_nodebld_acc (acc,'string1', 'string2');
                xte_nodebld_acc(acc, 'string3',xte_node(xte_head ('supplier', 'CompanyName','Seller')));
            xte_nodebld_final(acc, xte_head('product'));
        result (length(acc), xml_tree_doc (acc));
          }
test_nodebld()
ResLen      Res
INTEGER     VARCHAR
_______________________________________________________________________________

3           <product>string1string2string3<supplier CompanyName="Seller" /></product>
```

</div>

</div>

  

</div>

<div id="seealso_xte_nodebld_final" class="refsect1">

## See Also

<a href="fn_xte_head.html" class="link" title="xte_head">xte_head()</a>

<a href="fn_xte_node.html" class="link" title="xte_node">xte_node()</a>

<a href="fn_xte_node_from_nodebld.html" class="link"
title="xte_node_from_nodebld">xte_node_from_nodebld()</a>

<a href="fn_xte_nodebld_acc.html" class="link"
title="xte_nodebld_acc">xte_nodebld_acc()</a>

<a href="fn_xte_nodebld_init.html" class="link"
title="xte_nodebld_init">xte_nodebld_init()</a>

</div>

</div>
