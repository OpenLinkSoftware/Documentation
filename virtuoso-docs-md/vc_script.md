<div id="vc_script" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

script — A (redundant) wrapper for SQL code, can be omitted.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_script" class="funcsynopsis">

|                        |                              |
|------------------------|------------------------------|
| ` <`**`script`**` />(` | `language` (optional) ,      |
|                        | `debug-srcfile` (optional) , |
|                        | `debug-srcline` (optional) , |
|                        | `debug-log` (optional) `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_script" class="refsect1">

## Description

This control can appear only inside event handling controls and it
always contain SQL code to be executed when the event occurs. There is
no difference for VSPX compiler whether SQL code is enclosed in 'script'
control or not. Some WYSIWYG tools can display the enclosed SQL code to
the application developer according to custom attributes of this control
but it does not affect the generated Virtuoso/PL code of the page.

</div>

<div id="vc_attrs_script" class="refsect1">

## Attributes

**language =
<a href="vc_type_sqlname.html" class="link" title="SqlName">SqlName</a>
. ** Denotes the type of language, currently only Virtuoso/PL
expressions are supported.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

</div>
