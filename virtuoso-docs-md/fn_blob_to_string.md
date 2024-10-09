<div>

<div>

</div>

<div>

## Name

blob_to_string — Convert a blob to string

</div>

<div>

## Synopsis

<div>

|                                    |                     |
|------------------------------------|---------------------|
| `varchar `**`blob_to_string`**` (` | in `blob ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

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

<div>

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

<div>

## Parameters

<div>

### *`blob `*

<span class="type">blob handle </span> (long varbinary or long varchar),
<span class="type">string_output </span> or <span class="type">XPER
</span> (persistent XML)

</div>

</div>

<div>

## Return Types

<span class="type">Varchar </span> contents of *`blob `* .

</div>

<div>

## Errors

<div>

**Table 24.6. Errors signalled by `blob_to_string `**

<div>

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

<div>

## Examples

<div>

**Example 24.28. Various conversions**

<div>

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

<div>

## See Also

<a href="ch-sqlreference.html#dtcasting" class="link"
title="9.1.2. Casting">Casting</a> ,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output </code></a> .

</div>

</div>
