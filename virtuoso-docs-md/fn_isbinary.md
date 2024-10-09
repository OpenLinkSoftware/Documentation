<div>

<div>

</div>

<div>

## Name

isbinary — returns true if its argument is of type varbinary

</div>

<div>

## Synopsis

<div>

|                              |                      |
|------------------------------|----------------------|
| `boolean `**`isbinary`**` (` | `arg ` anything `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

isbinary returns one if its argument is of type VARBINARY, zero
otherwise.

</div>

<div>

## Parameters

<div>

### arg

Some variable to be assessed.

</div>

</div>

<div>

## Examples

<div>

**Example 24.188. Simple Use**

<div>

``` programlisting
SQL>select isbinary(0x1213);
-&gt; 1 (Yes it is a VARBINARY)
```

</div>

</div>

  

</div>

</div>
