<div>

<div>

</div>

<div>

## Name

st_ewkt_read — Parses the given text as a EWKT and returns the parsed
shape.

</div>

<div>

## Synopsis

<div>

|                           |                          |
|---------------------------|--------------------------|
| ` `**`st_ewkt_read`**` (` | in `ewkt_text ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Parses the given text as a EWKT and returns the parsed shape.

</div>

<div>

## Parameters

<div>

### ewkt_text

A given text to be parsed as EWKT.

</div>

</div>

<div>

## Return Types

This function returns shape.

</div>

<div>

## Examples

<div>

**Example 24.656. Simple Use**

<div>

``` screen
select st_translate (
         st_ewkt_read ('POLYGON((1 3,2 4,1 5,0 4,1 3),
                                (1 3.5,1.5 4,1 4.5,0.5 4,1 3.5))'),
                       0.1, 0.2);
Query result:
geometry
 POLYGON((1.100000 3.200000,2.100000 4.200000,1.100000 5.200000,0.100000 4.200000,1.100000 3.200000),
         (1.100000 3.700000,1.600000 4.200000,1.100000 4.700000,0.600000 4.200000,1.100000 3.700000))
No. of rows in result: 1
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_http_st_ewkt.html" class="link" title="http_st_ewkt"><code
class="function">http_st_ewkt() </code></a>

</div>

</div>
