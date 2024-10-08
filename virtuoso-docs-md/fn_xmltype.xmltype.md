<div>

<div>

</div>

<div>

## Name

XMLType.XMLType

</div>

<div>

## Synopsis

<div>

|                                                |                           |
|------------------------------------------------|---------------------------|
| `constructor method `**`XMLType.XMLType`**` (` | in `src ` any ,           |
|                                                | in `schema_uri ` any ,    |
|                                                | in `validated ` any ,     |
|                                                | in `wellformed ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The method creates an XMLType instance from *`src `* XML entity. If
parameter *`src`* is not an XML entity then it is converted to it via
internal call of `xtree_doc()` or `xml_tree_doc()` . A schema may be
associated with an XML entity by passing its URI as *`schema_uri`* ;
this schema can be used later to validate the structure of the document.

</div>

<div>

## Parameters

<div>

### src

An XML entity or a value that can be converted to an XML entity.

</div>

<div>

### schema_uri

An URI of the schema of the document. The default is NULL to make result
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

**Example 24.543. Simple Use**

<div>

``` screen
create table XMLTYPE_TEST (I integer primary key, XMLVAL long xml)

Done. -- 00000 msec.

insert into XMLTYPE_TEST values (1, XMLType('<emp><empno>221</empno><ename>John</ename></emp>'))

Done. -- 00000 msec.

insert into XMLTYPE_TEST values (2, XMLType('<po><pono>331</pono><poname>PO_1</poname></po>'))

Done. -- 00000 msec.

select e.XMLVAL.extract ('//empno/text()').getNumVal() as EMPNO
  from XMLTYPE_TEST as e
  where e.XMLVAL.existsNode('/emp/empno') = 1
EMPNO
DECIMAL
_______________________________________________________________________________

221

1 Rows. -- 00000 msec.
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
