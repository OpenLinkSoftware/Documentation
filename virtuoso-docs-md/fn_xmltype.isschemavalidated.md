<div>

<div>

</div>

<div>

## Name

XMLType.isSchemaValidated — Returns 1 or 0 indicating if the XML entity
has been validated against the associated schema.

</div>

<div>

## Synopsis

<div>

|                                        |      |
|----------------------------------------|------|
| ` `**`XMLType.isSchemaValidated`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns the value of a special internal "is validated" flag
of the given XMLType instance.

</div>

<div>

## Return Types

An integer value 1 or 0.

</div>

<div>

## Examples

<div>

**Example 24.558. Sample use**

<div>

These two calls demonstrate how the "is validated" flag can be set
without making an actual validation in the call of XMLType constructor:

``` screen
-- Line 75: select XMLType('<bad />', 'file://xmlschema/test0001/clean.xsd').isSchemaValidated()
callret
INTEGER
_______________________________________________________________________________

0

1 Rows. -- 00000 msec.

-- Line 77: select XMLType('<bad />', 'file://xmlschema/test0001/clean.xsd'), 1).isSchemaValidated()
callret
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmltype.setschemavalidated.html" class="link"
title="XMLType.setSchemaValidated"><code
class="function">XMLType.setSchemaValidated </code></a>

<a href="fn_xmltype.schemavalidate.html" class="link"
title="XMLType.schemaValidate"><code
class="function">XMLType.schemaValidate </code></a>

</div>

</div>
