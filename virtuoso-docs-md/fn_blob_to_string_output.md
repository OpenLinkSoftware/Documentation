<div id="fn_blob_to_string_output" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

blob_to_string_output — Convert a blob to string session

</div>

<div class="refsynopsisdiv">

## Synopsis

<div class="funcsynopsis">

|                                           |                     |
|-------------------------------------------|---------------------|
| `varchar `**`blob_to_string_output`**` (` | in `blob ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_blob_to_string_output" class="refsect1">

## Description

Although primarily used for converting <span class="type">blobs </span>
( <span class="type">long varbinary </span> , <span class="type">long
varchar</span> ) to <span class="type">string output object</span> ,
`blob_to_string_output` may also be used to convert from
<span class="type">wide string</span> , <span class="type">persistent
XML (XPER)</span> and <span class="type">string_output streams </span> .

</div>

<div id="params_blob_to_string_output" class="refsect1">

## Parameters

<div id="id81491" class="refsect2">

### *`blob `*

<span class="type">blob handle </span> (long varbinary or long varchar),
<span class="type">string_output </span> or <span class="type">XPER
</span> (persistent XML)

</div>

</div>

<div id="ret_blob_to_string_output" class="refsect1">

## Return types

<span class="type">string output object </span> contents of *`blob `* .

</div>

<div id="errors_blob_to_string_output" class="refsect1">

## Errors

<div id="id81505" class="table">

**Table 24.7. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                            | Description |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR068 </span> | <span class="errortext">XML tree cannot be used as argument of blob_to_string_output </span>          |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR070 </span> | <span class="errortext">blob_to_string_output requires a blob or string argument </span>              |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR071 </span> | <span class="errortext">Blob argument to blob_to_string_output must be a non-interactive blob </span> |             |

</div>

</div>

  

</div>

<div id="examples_blob_to_string_output" class="refsect1">

## Examples

<div id="ex_blob_to_string_output" class="example">

**Example 24.29. Various conversions**

<div class="example-contents">

``` screen
SQL> use Demo;

Done. -- 20 msec.
SQL> select string_output_string (blob_to_string_output ("Description")) from "Categories";
callret
VARCHAR
_______________________________________________________________________________

Soft drinks, coffees, teas, beers, and ales
Sweet and savory sauces, relishes, spreads, and seasonings
Desserts, candies, and sweet breads
Cheeses
Breads, crackers, pasta, and cereal
Prepared meats
Dried fruit and bean curd
Seaweed and fish

8 Rows. -- 37 msec.
SQL>
```

</div>

</div>

  

</div>

<div id="seealso_blob_to_string_output" class="refsect1">

## See Also

<a href="fn_blob_to_string.html" class="link"
title="blob_to_string"><code class="function">blob_to_string </code></a>

</div>

</div>
