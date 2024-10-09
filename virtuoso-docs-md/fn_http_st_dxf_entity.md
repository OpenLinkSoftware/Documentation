<div>

<div>

</div>

<div>

## Name

http_st_dxf_entity — writes a DXF (Data Exchange Format) representation
of shape into the given output session.

</div>

<div>

## Synopsis

<div>

|                                 |                      |
|---------------------------------|----------------------|
| ` `**`http_st_dxf_entity`**` (` | in `shape ` any ,    |
|                                 | in `attrs ` vector , |
|                                 | in `sess ` any `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function writes a DXF (Data Exchange Format) representation of
shape into the given output session.

</div>

<div>

## Parameters

<div>

### shape

If shape is null, the function returns without writing anything to the
shape.

</div>

<div>

### attrs

vector of arbitrary DXF properties in form (tag1, value1, tag2,
value2...) where tags are integer codes according to DXF specification;
related values are not validated and are printed to the session as-is.
Current version does not support ARCSTRINGs, CURVEs, nor CURVEPOLYGONs.

</div>

<div>

### sess

Output session.

</div>

</div>

<div>

## Examples

<div>

**Example 24.654. Simple example**

<div>

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
