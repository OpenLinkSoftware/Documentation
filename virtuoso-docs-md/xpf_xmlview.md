<div>

<div>

</div>

<div>

## Name

xmlview — Returns the xml document corresponding to given XML view

</div>

<div>

## Synopsis

<div>

|                      |                              |
|----------------------|------------------------------|
| ` `**`xmlview`**` (` | in `view_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

## Parameters

<div>

### view_name

The name of xml view

</div>

</div>

<div>

## Errors

<div>

**Table 24.153. Errors signalled by `xmlview `**

<div>

| SQLState                              | Error Code                       | Error Text                                                                           | Description |
|---------------------------------------|----------------------------------|--------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">37000 </span> | <span class="errorcode"> </span> | <span class="errortext">Unknown view name is passed as argument of xmlview() </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.637. **

<div>

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
