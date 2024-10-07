<div id="xpf_xmlview" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xmlview — Returns the xml document corresponding to given XML view

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_xmlview" class="funcsynopsis">

|                      |                              |
|----------------------|------------------------------|
| ` `**`xmlview`**` (` | in `view_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_xmlview" class="refsect1">

## Description

The function returns the output produced by an XML view as it was a
content of some XML document accessed via document() XPath function. The
result of the function call may be used as input of some path expression
that select interesting parts of the full output of the XML view. The
XQuery engine will translate the XPath expression into SQL statement in
order to avoid redundant data access and to build whole XML tree.

This function may be used only in the header of FOR operator of XQuery.
To specify the list of values of a variable, a path expression may be
used that starts with the call of xmlview() function.

</div>

<div id="xpf_param_xmlview" class="refsect1">

## Parameters

<div id="id129814" class="refsect2">

### view_name

The name of xml view

</div>

</div>

<div id="xpf_err_xmlview" class="refsect1">

## Errors

<div id="id129819" class="table">

**Table 24.154. Errors signalled by `xmlview `**

<div class="table-contents">

| SQLState                              | Error Code                       | Error Text                                                                           | Description |
|---------------------------------------|----------------------------------|--------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">37000 </span> | <span class="errorcode"> </span> | <span class="errortext">Unknown view name is passed as argument of xmlview() </span> |             |

</div>

</div>

  

</div>

<div id="xpf_example_xmlview" class="refsect1">

## Examples

<div id="xpf_ex_xmlview" class="example">

**Example 24.637. **

<div class="example-contents">

The XQUERY expressions below are queries to the following XML view:

``` screen
      create xml view "cat" as
      {
        "Demo"."demo"."Categories" c as "category" ("CategoryID", "Description" as "description")
        {
              "Demo"."demo"."Products" p as "product"  ("ProductName")
              on (p."CategoryID" = c."CategoryID")
        }
      };
      
```

The first query returns all products with the attribute ProductName
starting with "L". The second query returns categories with attribute
CategoryID less than 10.

``` screen
for $r in xmlview("cat")//product[@ProductName like "L%"] return $r
for $r in xmlview("cat")/category[@CategoryID<"10"] return $r
      
```

</div>

</div>

  

</div>

</div>
