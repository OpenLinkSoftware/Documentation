<div id="fn_xmltype.isschemabased" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

XMLType.isSchemaBased — Returns 1 if the given XMLType instance is
schema-based, otherwise returns 0.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmltype.isschemabased" class="funcsynopsis">

|                                    |      |
|------------------------------------|------|
| ` `**`XMLType.isSchemaBased`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmltype.isschemabased" class="refsect1">

## Description

Returns 1 if the given XMLType instance is schema-based, i.e. if it has
a URI of an XML schema that can be used for schema validation via
`XMLType.schemaValidate()` .

</div>

<div id="ret_xmltype.isschemabased" class="refsect1">

## Return Types

The function returns 1 or 0.

</div>

<div id="examples_xmltype.isschemabased" class="refsect1">

## Examples

<div id="ex_xmltype.isschemabased" class="example">

**Example 24.556. Simple tests**

<div class="example-contents">

The following three calls display the behaviour of the
`isSchemaBased() ` . Note that it does no actual checks whether the
document is valid against the declared schema or even the validity of
schema URI itself.

``` screen
select XMLType('<clean />').isSchemaBased()
callret
INTEGER
_______________________________________________________________________________

0

1 Rows. -- 00000 msec.

select XMLType('<clean />', 'file://xmlschema/test0001/clean.xsd').isSchemaBased()
callret
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 00000 msec.

select XMLType('<clean />', 'http://no.such.schema.exists').isSchemaBased()
callret
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 00000 msec.
 
```

</div>

</div>

  

</div>

<div id="seealso_xmltype.isschemabased" class="refsect1">

## See Also

<a href="fn_xmltype.getschemaurl.html" class="link"
title="XMLType.getSchemaURL"><code
class="function">XMLType.getSchemaURL() </code></a>

</div>

</div>
