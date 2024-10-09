<div>

<div>

</div>

<div>

## Name

XMLType.setSchemaValidated — Changes the internal "is validated" flag of
the given XMLType instance.

</div>

<div>

## Synopsis

<div>

|                                         |                                   |
|-----------------------------------------|-----------------------------------|
| ` `**`XMLType.setSchemaValidated`**` (` | in `flag ` integer default 1 `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Every XMLType instance has a special internal "is validated" flag; The
first successful call of the member function `XMLType.schemaValidate()`
will set this flag to 1 indicating that next such calls are redundant
and should do nothing. If a given XMLType instance is made by a
procedure that guarantees the match of the result to an expected schema
then one can set this flag without running actual validation. It is also
possible to reset this flag to 0 in order to force the next call of
`XMLType.schemaValidate()` to perform a validation.

</div>

<div>

## Parameters

<div>

### flag

An integer that becomes a new value of the flag.

</div>

</div>

<div>

## Return Types

The function returns a new value of the flag.

</div>

<div>

## Examples

<div>

**Example 24.560. Default use**

<div>

This call prevents the value of myXMLinstance from being validated in
the future.

``` screen
myXMLinstance.setSchemaValidated();
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmltype.isschemavalidated.html" class="link"
title="XMLType.isSchemaValidated"><code
class="function">XMLType.isSchemaValidated </code></a>

<a href="fn_xmltype.schemavalidate.html" class="link"
title="XMLType.schemaValidate"><code
class="function">XMLType.schemaValidate </code></a>

</div>

</div>
