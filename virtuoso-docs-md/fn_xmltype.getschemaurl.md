<div id="fn_xmltype.getschemaurl" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

XMLType.getSchemaURL — Returns the URL of the XML schema definition for
schema based instances, NULL for non-schema based.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmltype.getschemaurl" class="funcsynopsis">

|                                   |      |
|-----------------------------------|------|
| ` `**`XMLType.getSchemaURL`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmltype.getschemaurl" class="refsect1">

## Description

The function returns the URL of the XML Types associate XML schema. This
applies only to schema based instances. It will return NULL for
non-schema based types.

</div>

<div id="ret_xmltype.getschemaurl" class="refsect1">

## Return Types

The function returns string.

</div>

<div id="examples_xmltype.getschemaurl" class="refsect1">

## Examples

<div id="ex_xmltype.getschemaurl" class="example">

**Example 24.553. Simple test**

<div class="example-contents">

The call of XMLType constructor creates an schema-based instance and
`getSchemaURL()` returns the specified URL

``` screen
select XMLType('<sample />', 'file://xmlschema/test0001/clean.xsd').getSchemaURL()
callret
VARCHAR
_______________________________________________________________________________

file://xmlschema/test0001/clean.xsd

1 Rows. -- 00000 msec.
 
```

</div>

</div>

  

</div>

<div id="seealso_xmltype.getschemaurl" class="refsect1">

## See Also

<a href="fn_xmltype.isschemabased.html" class="link"
title="XMLType.isSchemaBased"><code
class="function">XMLType.isSchemaBased() </code></a>

</div>

</div>
