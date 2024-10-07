<div id="fn_isstring" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

isstring — returns true if its argument is of type varchar

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_isstring" class="funcsynopsis">

|                              |                      |
|------------------------------|----------------------|
| `boolean `**`isstring`**` (` | `arg ` anything `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_isstring" class="refsect1">

## Description

isstring returns one if its argument is of type VARCHAR, zero otherwise.

</div>

<div id="params_isstring" class="refsect1">

## Parameters

<div id="id94330" class="refsect2">

### arg

Some variable to be assessed.

</div>

</div>

<div id="examples_isstring" class="refsect1">

## Examples

<div id="ex_isstring" class="example">

**Example 24.190. Simple Use**

<div class="example-contents">

``` screen
SQL>select isstring('Cadena de los patos amarillos')
        -&gt; 1 (Yes it is a string)
```

</div>

</div>

  

</div>

</div>
