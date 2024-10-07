<div id="fn_createxml" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

createXML

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_createxml" class="funcsynopsis">

|                               |                           |
|-------------------------------|---------------------------|
| `XMLType `**`createXML`**` (` | in `src ` any ,           |
|                               | in `schema_uri ` any ,    |
|                               | in `validated ` any ,     |
|                               | in `wellformed ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_createxml" class="refsect1">

## Description

This function creates an XMLType instance. It works absolutely
identically to the <a href="fn_xmltype.xmltype.html" class="link"
title="XMLType.XMLType"><code class="function">XMLType()</code></a>
constructor and is provided solely for compatibility.

</div>

<div id="params_createxml" class="refsect1">

## Parameters

<div id="id83220" class="refsect2">

### src

An XML entity or a value that can be converted to an XML entity.

</div>

<div id="id83223" class="refsect2">

### schema_uri

An URI of the schema of the document. The default is NULL to make result
non-schema based.

</div>

<div id="id83226" class="refsect2">

### validated

An integer flag that indicates if the document is already validated
against the schema of the document (this is to avoid redundant
validations). The default is 0.

</div>

<div id="id83229" class="refsect2">

### wellformed

This parameter is unused and is listed solely for compatibility.

</div>

</div>

<div id="ret_createxml" class="refsect1">

## Return Types

The function returns a new instance of XMLType.

</div>

<div id="examples_createxml" class="refsect1">

## Examples

<div id="ex_createxml" class="example">

**Example 24.56. Sample example**

<div class="example-contents">

``` screen
create table XMLTYPE_TEST (I integer primary key, XMLVAL long xml)

Done. -- 00000 msec.

insert into XMLTYPE_TEST values (1, createXML('<emp><empno>221</empno><ename>John</ename></emp>'))

Done. -- 00000 msec.

insert into XMLTYPE_TEST values (2, createXML('<po><pono>331</pono><poname>PO_1</poname></po>'))

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

<div id="seealso_createxml" class="refsect1">

## See Also

<a href="fn_xmltype.xmltype.html" class="link"
title="XMLType.XMLType"><code class="function">XMLType() </code></a>

<a href="fn_xtree_doc.html" class="link" title="xtree_doc"><code
class="function">xtree_doc() </code></a>

<a href="fn_xper_doc.html" class="link" title="xper_doc"><code
class="function">xper_doc() </code></a>

</div>

</div>