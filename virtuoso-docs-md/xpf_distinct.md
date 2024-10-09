<div>

<div>

</div>

<div>

## Name

distinct — Removes double entities from the input sequence

</div>

<div>

## Synopsis

<div>

|                               |                        |
|-------------------------------|------------------------|
| `sequence `**`distinct`**` (` | `input ` sequence `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function takes a single parameter which is sequence of XML entities
(nodes or values) and returns the sequence that results from removing
from input sequence all but one of a set of elements that are identical
each other. If input sequence is the empty, the empty sequence is
returned.

Note that the `distinct` is not a part of XPATH 1.0 or XQuery 1.0
standard library, it is rather a generalization of standard
`distinct-nodes` and `distinct-values` functions.

</div>

<div>

## Parameters

<div>

### input

The sequence of XML entities

</div>

</div>

<div>

## Return Types

Sequence

</div>

<div>

## Examples

<div>

**Example 24.577. Removing double entities**

<div>

In the following example the file example.xml is

``` screen
<a>
<b/>
<b/>
</a>
```

The result of the query

``` screen
<result>
   {
   distinct(for $r in document("example.xml")//b return $r) 
   }
</result>
```

is only one 'b' element:

``` screen
<result>
<b/>
</result>
```

</div>

</div>

  

</div>

</div>
