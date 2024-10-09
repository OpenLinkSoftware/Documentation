<div>

<div>

</div>

<div>

## Name

XMLType.createNonSchemaBasedXML — Returns a copy of the given instance
with the schema reference removed.

</div>

<div>

## Synopsis

<div>

|                                              |      |
|----------------------------------------------|------|
| ` `**`XMLType.createNonSchemaBasedXML`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns a copy of the given instance with the schema
reference removed.

</div>

<div>

## Return Types

The function returns a new instance of XMLType.

</div>

<div>

## Examples

<div>

**Example 24.544. Converting a schema-based instance to non
schema-based**

<div>

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

<div>

## See Also

<a href="fn_xmltype.createschemabasedxml.html" class="link"
title="XMLType.createSchemaBasedXML"><code
class="function">XMLType.createSchemaBasedXML() </code></a>

</div>

</div>
