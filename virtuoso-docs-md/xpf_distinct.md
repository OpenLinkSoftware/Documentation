<div id="xpf_distinct" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

distinct — Removes double entities from the input sequence

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_distinct" class="funcsynopsis">

|                               |                        |
|-------------------------------|------------------------|
| `sequence `**`distinct`**` (` | `input ` sequence `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_distinct" class="refsect1">

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

<div id="xpf_params_distinct" class="refsect1">

## Parameters

<div id="id126777" class="refsect2">

### input

The sequence of XML entities

</div>

</div>

<div id="xpf_ret_distinct" class="refsect1">

## Return Types

Sequence

</div>

<div id="xpf_examples_distinct" class="refsect1">

## Examples

<div id="xpf_ex_distinct" class="example">

**Example 24.577. Removing double entities**

<div class="example-contents">

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
