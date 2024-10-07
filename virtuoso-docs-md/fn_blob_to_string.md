<div id="fn_blob_to_string" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

blob_to_string — Convert a blob to string

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_blob_to_string" class="funcsynopsis">

|                                    |                     |
|------------------------------------|---------------------|
| `varchar `**`blob_to_string`**` (` | in `blob ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_blob_to_string" class="refsect1">

## Description

Although primarily used for converting <span class="type">blobs </span>
( <span class="type">long varbinary </span> , <span class="type">long
varchar</span> ) to <span class="type">string</span> , `blob_to_string`
may also be used to convert from <span class="type">wide string</span> ,
<span class="type">persistent XML (XPER)</span> and
<span class="type">string_output streams</span> . If the data being
converted is longer than maximum length of a
<span class="type">string</span> , `blob_to_string` will signal an
error.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

<table data-border="0" data-summary="Note: Note">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/note.png" alt="[Note]" /></td>
<td style="text-align: left;">Note</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p>This function is
equivalent to</p>
<pre class="programlisting"><code>cast (x as varchar)</code></pre>
<p>. Using <code class="function">cast </code> is preferred.</p></td>
</tr>
</tbody>
</table>

</div>

</div>

<div id="params_blob_to_string" class="refsect1">

## Parameters

<div id="id81388" class="refsect2">

### *`blob `*

<span class="type">blob handle </span> (long varbinary or long varchar),
<span class="type">string_output </span> or <span class="type">XPER
</span> (persistent XML)

</div>

</div>

<div id="ret_blob_to_string" class="refsect1">

## Return Types

<span class="type">Varchar </span> contents of *`blob `* .

</div>

<div id="errors_blob_to_string" class="refsect1">

## Errors

<div id="id81402" class="table">

**Table 24.6. Errors signalled by `blob_to_string `**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Message                                                                                                              | Description |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR068 </span> | <span class="errortext">XML tree cannot be used as argument of blob_to_string </span>                                      |             |
| <span class="errorcode">22001 </span> | <span class="errorcode">SR069 </span> | <span class="errortext">Attempt to convert a persistent XML document longer than VARCHAR maximum in blob_to_string </span> |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR070 </span> | <span class="errortext">blob_to_string requires a blob as argument </span>                                                 |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">SR071 </span> | <span class="errortext">Blob argument to blob_to_string must be a non-interactive blob </span>                             |             |
| <span class="errorcode">22001 </span> | <span class="errorcode">SR072 </span> | <span class="errortext">Blob too long for the string. </span>                                                              |             |

</div>

</div>

  

</div>

<div id="examples_blob_to_string" class="refsect1">

## Examples

<div id="ex_blob_to_string" class="example">

**Example 24.28. Various conversions**

<div class="example-contents">

``` screen
SQL> use Demo;

Done. -- 20 msec.
SQL> select blob_to_string (Description) from Categories;
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

<div id="seealso_blob_to_string" class="refsect1">

## See Also

<a href="ch-sqlreference.html#dtcasting" class="link"
title="9.1.2. Casting">Casting</a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output </code></a> .

</div>

</div>
