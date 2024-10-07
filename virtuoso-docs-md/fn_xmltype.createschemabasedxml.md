<div id="fn_xmltype.createschemabasedxml" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

XMLType.createSchemaBasedXML — Returns a copy of the given instance with
new schema reference.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmltype.createschemabasedxml" class="funcsynopsis">

|                                           |                               |
|-------------------------------------------|-------------------------------|
| ` `**`XMLType.createSchemaBasedXML`**` (` | in `schema_url ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmltype.createschemabasedxml" class="refsect1">

## Description

The function creates a new instance of XMLType by copying the given one
and assigning a new schema URL to it. Parameter `schema_url` specifies a
new URL; if it is omitted then a non-schema based instance is created
like the <a href="fn_xmltype.createnonschemabasedxml.html" class="link"
title="XMLType.createNonSchemaBasedXML"><code
class="function">XMLType.createNonSchemaBasedXML()</code></a> function.

The returned copy has an internal "validated" flag set to 0, even if the
new URL is equal to the URL of the original instance.

</div>

<div id="params_xmltype.createschemabasedxml" class="refsect1">

## Parameters

<div id="id125259" class="refsect2">

### schema_url

The location of a schema of a new instance.

</div>

</div>

<div id="ret_xmltype.createschemabasedxml" class="refsect1">

## Return Types

The member function returns a new instance of XMLType.

</div>

<div id="examples_xmltype.createschemabasedxml" class="refsect1">

## Examples

<div id="ex_xmltype.createschemabasedxml" class="example">

**Example 24.545. Converting a non schema-based instance to schema-based
one**

<div class="example-contents">

The procedure creates a schema-based copy of a sample non schema-based
instance.

``` screen
create procedure schema_assignment_test ()
{
  declare orig_instance XMLType;
  declare schema_based_copy XMLType;
  declare PROBE varchar;
  result_names (PROBE);
  orig_instance := XMLType ('<sample-xml/>');
  result (concat (
    '"orig_instance" is declared as non schema-based, URI=',
    cast (orig_instance.getSchemaURL() as varchar) ) );
  schema_based_copy := orig_instance.createSchemaBasedXML (
    'http://www.example.com/test.xsd' );
  result (concat (
    '"schema_based_copy" is schema-based, URI=',
    schema_based_copy.getSchemaURL() ) );
}

schema_assignment_test()
PROBE
VARCHAR
_______________________________________________________________________________

"orig_instance" is declared as non schema-based, URI=
"schema_based_copy" is schema-based, URI=http://www.example.com/test.xsd

2 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div id="seealso_xmltype.createschemabasedxml" class="refsect1">

## See Also

<a href="fn_xmltype.createnonschemabasedxml.html" class="link"
title="XMLType.createNonSchemaBasedXML"><code
class="function">XMLType.createNonSchemaBasedXML() </code></a>

</div>

</div>
