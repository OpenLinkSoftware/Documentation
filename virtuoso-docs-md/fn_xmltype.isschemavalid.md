<div>

<div>

</div>

<div>

## Name

XMLType.isSchemaValid — Validates the given XMLType instance against an
arbitrary XML schema, returns 1 if successful, 0 if errors are detected.

</div>

<div>

## Synopsis

<div>

|                                    |                                     |
|------------------------------------|-------------------------------------|
| ` `**`XMLType.isSchemaValid`**` (` | in `schema_url ` varchar ,          |
|                                    | in `top_element_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function validates the given XMLType instance against the XML schema
located at *`schema_url`* . The name of the current node of the XML
entity should match *`top_element_name`* if it is specified.

The *`schema_url`* is optional for schema based instances: the default
value is the URI of the associated schema of the instance. For
non-schema based instances the *`schema_url`* is required, an error is
signalled otherwise.

The function does not use or modify internal "validated" flag that is
e.g. used by `XMLType.schemaValidate()` . It is true even if the given
*`schema_url`* is equal to the URI of own schema of the instance.

</div>

<div>

## Parameters

<div>

### schema_url

The URI of the schema to apply.

</div>

<div>

### top_element_name

The allowed name of top level element of the instance.

</div>

</div>

<div>

## Return Types

The function returns 1 if the validation is passed, 0 if it is failed.

</div>

<div>

## Examples

<div>

**Example 24.557. Failed schema validation**

<div>

The example creates an XMLType instance that is a document with a single
element node"bad" and tries to validate it against XMLschema
"file://xmlschema/test0001/clean.xsd" that does not match actual content
of the document. The call of `isSchemaValid()` returns zero indicating
failed validation.

``` screen
select XMLType('<bad />', 'file://xmlschema/test0001/clean.xsd').isSchemaValid()
callret
INTEGER
_______________________________________________________________________________

0

1 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmltype.isschemavalidated.html" class="link"
title="XMLType.isSchemaValidated"><code
class="function">XMLType.isSchemaValidated() </code></a>

<a href="fn_xmltype.setschemavalidated.html" class="link"
title="XMLType.setSchemaValidated"><code
class="function">XMLType.setSchemaValidated() </code></a>

<a href="fn_xmltype.schemavalidate.html" class="link"
title="XMLType.schemaValidate"><code
class="function">XMLType.schemaValidate() </code></a>

</div>

</div>
