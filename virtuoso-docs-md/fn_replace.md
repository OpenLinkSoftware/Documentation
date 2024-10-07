<div id="fn_replace" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

replace — This replaces every occurrence of the second argument in the
first argument with the third argument.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_replace" class="funcsynopsis">

|                            |                              |
|----------------------------|------------------------------|
| `string `**`replace`**` (` | in `string ` varchar ,       |
|                            | in `what ` varchar ,         |
|                            | in `repl_with ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_13" class="refsect1">

## Description

This replaces every occurrence of the second argument in the first
argument with the third argument. The arguments can be narrow or wide
strings.

<div id="ex__20" class="example">

**Example 24.317. Example:**

<div class="example-contents">

``` programlisting
SQL> select replace ('12345512345', '23', '-----');
  =   1-----4551-----45
```

</div>

</div>

  

</div>

</div>
