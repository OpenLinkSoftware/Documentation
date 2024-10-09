<div>

<div>

</div>

<div>

## Name

serialize_to_UTF8_xml — Converts argument to its UTF-8 string
representation.

</div>

<div>

## Synopsis

<div>

|                                    |                      |
|------------------------------------|----------------------|
| ` `**`serialize_to_UTF8_xml`**` (` | in `value ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function converts its argument to a narrow string in UTF-8 encoding.
The way conversion is done depends on the type of the argument.

If *`value`* is a wide (national) string or a LONG NVARCHAR then it is
directly converted to UTF-8 string.

If *`value`* is a string or a LONG VARCHAR then it is converted from
current charset of client connection to the UTF-8.

If *`value`* is an XML entity then it is converted to its XML text
representation in UTF-8 encoding. The resulting string is a well-formed
XML document if the given entity is an element entity, otherwise it may
be well-formed generic entity, i.e. it can be parsed by an XML parser
only as a part of some other XML document.

If *`value`* is NULL, the NULL is returned.

Values of other types are first converted to VARCHAR, this intermediate
VARCHAR is converted from current charset of client connection to the
UTF-8 and is returned.

</div>

<div>

## Parameters

<div>

### value

The value of arbitrary type to be converted into its UTF-8 string
representation.

</div>

</div>

<div>

## Return Types

UTF-8 string or NULL.

</div>

<div>

## Examples

<div>

**Example 24.369. UTF-8 encoding of non-ASCII characters**

<div>

A sample document is parsed and the resulting entity is serialized to
UTF-8 string.

``` screen
select serialize_to_UTF8_xml(xtree_doc('<text>0-9 a-z A-Z &#128;-&#255; &#256;-&#511; &#1024;-&#8191;</text>'));
callret
VARCHAR
_______________________________________________________________________________

<text>0-9 a-z A-Z -ÿ  -   - </text>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_charset_recode.html" class="link"
title="charset_recode"><code class="function">charset_recode </code></a>

</div>

</div>
