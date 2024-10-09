<div>

<div>

</div>

<div>

## Name

lvector , fvector , dvector — return an array of either long, float or
double

</div>

<div>

## Synopsis

<div>

|                           |               |
|---------------------------|---------------|
| `array `**`lvector`**` (` | `elt1 ` ,     |
|                           | `.... ` ,     |
|                           | `elt-n ` `)`; |

<div>

 

</div>

</div>

<div>

|                           |               |
|---------------------------|---------------|
| `array `**`fvector`**` (` | `elt1 ` ,     |
|                           | `.... ` ,     |
|                           | `elt-n ` `)`; |

<div>

 

</div>

</div>

<div>

|                           |               |
|---------------------------|---------------|
| `array `**`dvector`**` (` | `elt1 ` ,     |
|                           | `.... ` ,     |
|                           | `elt-n ` `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

These functions are like vector but return an array of either long,
float or double whereas vector returns a generic, untyped array.

<div>

**Example 24.96. Examples:**

<div>

``` programlisting
aref (lvector (1, 2), 1) = 1    is true.
```

</div>

</div>

  

</div>

</div>
