<div>

<div>

</div>

<div>

## Name

XMLType.schemaValidate — Validates the schema based XMLType instance
against its schema and signals an error in case of failed validation.

</div>

<div>

## Synopsis

<div>

|                                     |      |
|-------------------------------------|------|
| ` `**`XMLType.schemaValidate`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The member function signals an error if called for a non-schema based
instance. If an instance is schema-based but the validation has already
been done, the call has no effect. Otherwise, a schema-based instance is
validated against its schema. If the validation fails, an error is
signalled. If the validation is successful then a special internal
"validated"flag is set.

</div>

<div>

## Return Types

The function returns a string that contains a validation log if an
instance has not been validated before, otherwise it returns null or
signals an error.

</div>

<div>

## Examples

<div>

**Example 24.559. Failed schema validation**

<div>

The example creates an XMLType instance that is a document with a single
element node"bad" and declared schema
"file://xmlschema/test0001/clean.xsd" that does not match actual content
of the document. The call of `schemaValidate()` signals an error.

``` screen
select XMLType('<bad />', 'file://xmlschema/test0001/clean.xsd').schemaValidate();

*** Error 42000: [Virtuoso Driver][Virtuoso Server]Top-level element name <q> is unknown
at line 76 of load 'XmlType.sql':
select XMLType('<bad />', 'file://xmlschema/test0001/clean.xsd').schemaValidate() 
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

<a href="fn_xmltype.isschemavalid.html" class="link"
title="XMLType.isSchemaValid"><code
class="function">XMLType.isSchemaValid() </code></a>

</div>

</div>
