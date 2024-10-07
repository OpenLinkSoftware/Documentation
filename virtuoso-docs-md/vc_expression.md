<div id="vc_expression" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

expression — An SQL statement that generates a rowset for v:data-source.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_expression" class="funcsynopsis">

|                            |                              |
|----------------------------|------------------------------|
| ` <`**`expression`**` />(` | `language` (optional) ,      |
|                            | `debug-srcfile` (optional) , |
|                            | `debug-srcline` (optional) , |
|                            | `debug-log` (optional) `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_expression" class="refsect1">

## Description

A container for SQL statement generating a rowset or table name (see
data-source).

</div>

<div id="vc_attrs_expression" class="refsect1">

## Attributes

**language =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** Denotes the type of language, currently only SQL expressions are
supported, see 'expression-type' attribute of the data-source control.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

</div>
