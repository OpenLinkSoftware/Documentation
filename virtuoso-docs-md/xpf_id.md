<div>

<div>

</div>

<div>

## Name

id — Returns an entities whose ID attributes are in the given list

</div>

<div>

## Synopsis

<div>

|                         |                 |
|-------------------------|-----------------|
| `sequence `**`id`**` (` | `ids ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function gets a list of strings, where every string is a list of IDs
delimited by whitespace characters. For every listed ID, the function
checks if the document that contains the context entity also contains an
entity with such ID; if the entity with the listed ID exists, it is
added into the sequence.

To avoid searches of every ID inside the whole document, the function
uses "ID cache" that is created if "IdCache=ENABLE" DTD configuration
option is specified in the call of function that parses the XML
document. In some cases, it is possible to build such cache on demand if
it is not built by a parser, but it consumes time and in any case it
requires the saved DTD information from the XML parser, so the parser
should be specially configured anyway.

Note that any attribute of types ID, IDREF or IDREFS is a good input
string for the function id(). So while XQuery "pointer operator" is not
available in XPath expression, the id() function is a good replacement
for it.

</div>

<div>

## Parameters

<div>

### ids

The list of strings that consist of IDs

</div>

</div>

<div>

## Return Types

</div>

<div>

## Errors

The function ignores any sort of syntax errors on input.

</div>

<div>

## Examples

<div>

**Example 24.592. List errors in census data**

<div>

List every person who is not a spouse of his own spouse.

``` screen
document ("census.xml")//person[@spouse and not (. = id (id (@spouse)/person/@spouse)]
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_document.html" class="link" title="document">document()</a>

</div>

</div>
