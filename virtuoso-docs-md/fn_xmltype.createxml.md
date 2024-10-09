<div>

<div>

</div>

<div>

## Name

XMLType.createXML — Creates an XML Type instance.

</div>

<div>

## Synopsis

<div>

|                                             |                            |
|---------------------------------------------|----------------------------|
| `static method `**`XMLType.createXML`**` (` | in `src ` any ,            |
|                                             | in `schema_uri ` varchar , |
|                                             | in `validated ` integer ,  |
|                                             | in `wellformed ` any `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

The static method creates an XMLType instance from the *`src `* XML
entity. If the parameter *`src`* is not an XML entity then it is
converted to it via an internal call of `xtree_doc()` or
`xml_tree_doc()` . A schema may be associated with an XML entity by
passing its URI as *`schema_uri`* ; this schema can be used later to
validate the structure of the document.

</div>

<div>

## Parameters

<div>

### src

An XML entity or a value that can be converted to an XML entity.

</div>

<div>

### schema_uri

A URI of the schema of the document. The default is NULL to make result
non-schema based.

</div>

<div>

### validated

An integer flag that indicates if the document is already validated
against the schema of the document (this is to avoid redundant
validations). The default is 0.

</div>

<div>

### wellformed

This parameter is unused and is listed solely for compatibility.

</div>

</div>

<div>

## Return Types

The method returns a new instance of XMLType.

</div>

<div>

## Examples

<div>

**Example 24.546. Creating instances of XMLType**

<div>

The procedure creates two instances (a schema-based and a non
schema-based) and demonstrates that these instances are filled with
proper data.

``` screen
create procedure createxml_test ()
{
  declare test1 XMLType;
  declare test2 XMLType;
  declare PROBE varchar;
  result_names (PROBE);
  test1 := createXML ('<test attr="value1"/>');
  test2 := createXML ('<test attr="value2"/>', 'http://www.example.com/test.xsd');
  result (concat (
    '"test1" is created as non schema-based, URI=',
    cast (test1.getSchemaURL() as varchar) ) );
  result (concat (
    'Sample data from "test1": value of test/@attr is ',
    test1.extract ('test/@attr') ) );
  result (concat (
    '"test2" is created as schema-based, URI=',
    test2.getSchemaURL() ) );
  result (concat (
    'Sample data from "test2": value of test/@attr is ',
    test2.extract ('test/@attr') ) );
}

createxml_test ()
PROBE
VARCHAR
_______________________________________________________________________________

"test1" is created as non schema-based, URI=
Sample data from "test1": value of test/@attr is value1
"test2" is created as schema-based, URI=http://www.example.com/test.xsd
Sample data from "test2": value of test/@attr is value2

4 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xtree_doc.html" class="link" title="xtree_doc"><code
class="function">xtree_doc() </code></a>

<a href="fn_xper_doc.html" class="link" title="xper_doc"><code
class="function">xper_doc() </code></a>

</div>

</div>
