<div id="fn_http_st_dxf_entity" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_st_dxf_entity — writes a DXF (Data Exchange Format) representation
of shape into the given output session.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_st_dxf_entity" class="funcsynopsis">

|                                 |                      |
|---------------------------------|----------------------|
| ` `**`http_st_dxf_entity`**` (` | in `shape ` any ,    |
|                                 | in `attrs ` vector , |
|                                 | in `sess ` any `)`;  |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_st_dxf_entity" class="refsect1">

## Description

This function writes a DXF (Data Exchange Format) representation of
shape into the given output session.

</div>

<div id="params_http_st_dxf_entity" class="refsect1">

## Parameters

<div id="id130582" class="refsect2">

### shape

If shape is null, the function returns without writing anything to the
shape.

</div>

<div id="id130585" class="refsect2">

### attrs

vector of arbitrary DXF properties in form (tag1, value1, tag2,
value2...) where tags are integer codes according to DXF specification;
related values are not validated and are printed to the session as-is.
Current version does not support ARCSTRINGs, CURVEs, nor CURVEPOLYGONs.

</div>

<div id="id130588" class="refsect2">

### sess

Output session.

</div>

</div>

<div id="examples_http_st_dxf_entity" class="refsect1">

## Examples

<div id="ex_http_st_dxf_entity" class="example">

**Example 24.654. Simple example**

<div class="example-contents">

``` screen
create procedure Example_http_st_dxf_entity ()
{
  declare ses, ctx any;
  ses := string_output ();

  for (select a1, deserialize (Example_GEOM) as geom from Demo.Demo."Example_Countries") do
    http_st_dxf_entity (geom, vector (62, 0)), ses);
  string_to_file ('examples/Example_http_st_dxf_entity.dxf', ses, -2);
}
;
```

</div>

</div>

  

</div>

</div>
