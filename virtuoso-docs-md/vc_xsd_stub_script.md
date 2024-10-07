<div id="vc_xsd_stub_script" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xsd-stub-script — This is for internal use only.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="vc_syn_xsd_stub_script" class="funcsynopsis">

|                                 |                              |
|---------------------------------|------------------------------|
| ` <`**`xsd-stub-script`**` />(` | `debug-srcfile` (optional) , |
|                                 | `debug-srcline` (optional) , |
|                                 | `debug-log` (optional) `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="vc_desc_xsd_stub_script" class="refsect1">

## Description

This control should never appear in the VSPX source. It is for internal
use only. Before applying XML schema validation to the page, Virtuoso
replaces non-VSPX tags with this one when they reside inside event
script tag such as v:on-init.

</div>

<div id="vc_attrs_xsd_stub_script" class="refsect1">

## Attributes

**debug-srcfile. ** URI of the source document where the tag comes from.

**debug-srcline. ** Line number in the source document where the tag
comes from.

**debug-log. ** This defines what sort of data are saved to the
debugging log.

</div>

<div id="vc_udt_xsd_stub_script" class="refsect1">

## Declaration of type vspx_xsd_stub_script

``` screen
create type vspx_xsd_stub_script under vspx_control
as ( vc_stub any ) temporary self as ref
```

</div>

</div>
