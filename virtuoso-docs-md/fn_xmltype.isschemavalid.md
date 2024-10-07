<div id="fn_xmltype.isschemavalid" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

XMLType.isSchemaValid — Validates the given XMLType instance against an
arbitrary XML schema, returns 1 if successful, 0 if errors are detected.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmltype.isschemavalid" class="funcsynopsis">

|                                    |                                     |
|------------------------------------|-------------------------------------|
| ` `**`XMLType.isSchemaValid`**` (` | in `schema_url ` varchar ,          |
|                                    | in `top_element_name ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmltype.isschemavalid" class="refsect1">

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

<div id="params_xmltype.isschemavalid" class="refsect1">

## Parameters

<div id="id125713" class="refsect2">

### schema_url

The URI of the schema to apply.

</div>

<div id="id125716" class="refsect2">

### top_element_name

The allowed name of top level element of the instance.

</div>

</div>

<div id="ret_xmltype.isschemavalid" class="refsect1">

## Return Types

The function returns 1 if the validation is passed, 0 if it is failed.

</div>

<div id="examples_xmltype.isschemavalid" class="refsect1">

## Examples

<div id="ex_xmltype.isschemavalid" class="example">

**Example 24.557. Failed schema validation**

<div class="example-contents">

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

<div id="seealso_xmltype.isschemavalid" class="refsect1">

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
