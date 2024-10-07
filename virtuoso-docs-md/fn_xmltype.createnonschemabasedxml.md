<div id="fn_xmltype.createnonschemabasedxml" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

XMLType.createNonSchemaBasedXML — Returns a copy of the given instance
with the schema reference removed.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmltype.createnonschemabasedxml" class="funcsynopsis">

|                                              |      |
|----------------------------------------------|------|
| ` `**`XMLType.createNonSchemaBasedXML`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmltype.createnonschemabasedxml" class="refsect1">

## Description

The function returns a copy of the given instance with the schema
reference removed.

</div>

<div id="ret_xmltype.createnonschemabasedxml" class="refsect1">

## Return Types

The function returns a new instance of XMLType.

</div>

<div id="examples_xmltype.createnonschemabasedxml" class="refsect1">

## Examples

<div id="ex_xmltype.createnonschemabasedxml" class="example">

**Example 24.544. Converting a schema-based instance to non
schema-based**

<div class="example-contents">

The procedure creates a non schema-based copy of a sample schema-based
instance.

``` screen
create procedure schema_removal_test ()
{
  declare orig_instance XMLType;
  declare non_schema_copy XMLType;
  declare PROBE varchar;
  result_names (PROBE);
  orig_instance := XMLType ('<sample-xml/>', 'http://www.example.com/test.xsd');
  result (concat (
    '"orig_instance" is declared as schema-based, URI=',
    orig_instance.getSchemaURL() ) );
  non_schema_copy := orig_instance.createNonSchemaBasedXML();
  result (concat (
    '"non_schema_copy" is non schema-based, URI=',
    cast (non_schema_copy.getSchemaURL() as varchar) ) );
}

schema_removal_test()
PROBE
VARCHAR
_______________________________________________________________________________

"orig_instance" is declared as schema-based, URI=http://www.example.com/test.xsd
"non_schema_copy" is non schema-based, URI=

2 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div id="seealso_xmltype.createnonschemabasedxml" class="refsect1">

## See Also

<a href="fn_xmltype.createschemabasedxml.html" class="link"
title="XMLType.createSchemaBasedXML"><code
class="function">XMLType.createSchemaBasedXML() </code></a>

</div>

</div>
