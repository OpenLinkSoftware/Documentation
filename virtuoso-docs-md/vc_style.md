<div id="vc_style" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

style — A markup tag for use by 'macro stylesheets'.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_style" class="funcsynopsis">

|                       |                              |
|-----------------------|------------------------------|
| ` <`**`style`**` />(` | `name` (optional) ,          |
|                       | `debug-srcfile` (optional) , |
|                       | `debug-srcline` (optional) , |
|                       | `debug-log` (optional) `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_style" class="refsect1">

## Description

This control marks the enclosed content for special processing in the
'macro stylesheet' whose name is specified by 'style' attribute of
v:page element.

</div>

<div id="vc_attrs_style" class="refsect1">

## Attributes

**name. ** Optional name of the control which could be used in the macro
expansion stylesheet assigned.

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

</div>
