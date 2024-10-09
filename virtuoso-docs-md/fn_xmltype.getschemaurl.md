<div>

<div>

</div>

<div>

## Name

XMLType.getSchemaURL — Returns the URL of the XML schema definition for
schema based instances, NULL for non-schema based.

</div>

<div>

## Synopsis

<div>

|                                   |      |
|-----------------------------------|------|
| ` `**`XMLType.getSchemaURL`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns the URL of the XML Types associate XML schema. This
applies only to schema based instances. It will return NULL for
non-schema based types.

</div>

<div>

## Return Types

The function returns string.

</div>

<div>

## Examples

<div>

**Example 24.553. Simple test**

<div>

The call of XMLType constructor creates an schema-based instance and
`getSchemaURL()` returns the specified URL

``` screen
select XMLType('<sample />', 'file://xmlschema/test0001/clean.xsd').getSchemaURL()
callret
VARCHAR
_______________________________________________________________________________

file://xmlschema/test0001/clean.xsd

1 Rows. -- 00000 msec.
 
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmltype.isschemabased.html" class="link"
title="XMLType.isSchemaBased"><code
class="function">XMLType.isSchemaBased() </code></a>

</div>

</div>
