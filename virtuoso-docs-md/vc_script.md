<div>

<div>

</div>

<div>

## Name

script — A (redundant) wrapper for SQL code, can be omitted.

</div>

<div>

## Synopsis

<div>

|                        |                              |
|------------------------|------------------------------|
| ` <`**`script`**` />(` | `language` (optional) ,      |
|                        | `debug-srcfile` (optional) , |
|                        | `debug-srcline` (optional) , |
|                        | `debug-log` (optional) `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

This control can appear only inside event handling controls and it
always contain SQL code to be executed when the event occurs. There is
no difference for VSPX compiler whether SQL code is enclosed in 'script'
control or not. Some WYSIWYG tools can display the enclosed SQL code to
the application developer according to custom attributes of this control
but it does not affect the generated Virtuoso/PL code of the page.

</div>

<div>

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
