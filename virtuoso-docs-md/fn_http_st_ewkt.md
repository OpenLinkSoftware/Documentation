<div id="fn_http_st_ewkt" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

http_st_ewkt — Writes a EWKT representation of a shape to the given
session.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_http_st_ewkt" class="funcsynopsis">

|                           |                        |
|---------------------------|------------------------|
| ` `**`http_st_ewkt`**` (` | in `shape ` any ,      |
|                           | inout `sess ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_http_st_ewkt" class="refsect1">

## Description

Writes a EWKT representation of a shape to the given session, a fast
replacement for http (st_astext (shape), ses).

</div>

<div id="params_http_st_ewkt" class="refsect1">

## Parameters

<div id="id130617" class="refsect2">

### shape

A given shape.

</div>

<div id="id130620" class="refsect2">

### sess

Session.

</div>

</div>

<div id="ret_http_st_ewkt" class="refsect1">

## Return Types

Returns any.

</div>

<div id="examples_http_st_ewkt" class="refsect1">

## Examples

<div id="ex_http_st_ewkt" class="example">

**Example 24.655. Simple example**

<div class="example-contents">

``` screen
create procedure Example_http_st_ewkt ()
{
  declare g, ses, ctx, g_ewkt any;
  ses := string_output ();

  g := st_ewkt_read ('POLYGON
                       (
                         (1 3,2 4,1 5,0 4,1 3),
                         (1 3.5,1.5 4,1 4.5,0.5 4,1 3.5)
                       )
                     ');
  ses := string_output ();
  http_st_ewkt (g, ses);
}
;
```

</div>

</div>

  

</div>

<div id="seealso_http_st_ewkt" class="refsect1">

## See Also

<a href="fn_http.html" class="link" title="http"><code
class="function">http() </code></a>

<a href="fn_st_ewkt_read.html" class="link" title="st_ewkt_read"><code
class="function">st_ewkt_read() </code></a>

<a href="fn_http_st_dxf_entity.html" class="link"
title="http_st_dxf_entity"><code
class="function">http_st_dxf_entity() </code></a>

</div>

</div>
