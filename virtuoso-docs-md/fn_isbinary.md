<div id="fn_isbinary" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

isbinary — returns true if its argument is of type varbinary

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_isbinary" class="funcsynopsis">

|                              |                      |
|------------------------------|----------------------|
| `boolean `**`isbinary`**` (` | `arg ` anything `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_isbinary" class="refsect1">

## Description

isbinary returns one if its argument is of type VARBINARY, zero
otherwise.

</div>

<div id="params_isbinary" class="refsect1">

## Parameters

<div id="id94166" class="refsect2">

### arg

Some variable to be assessed.

</div>

</div>

<div id="examples_isbinary" class="refsect1">

## Examples

<div id="ex_isbinary" class="example">

**Example 24.188. Simple Use**

<div class="example-contents">

``` programlisting
SQL>select isbinary(0x1213);
-&gt; 1 (Yes it is a VARBINARY)
```

</div>

</div>

  

</div>

</div>
