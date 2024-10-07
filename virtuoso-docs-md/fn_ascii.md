<div id="fn_ascii" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

ascii — Get ASCII value of a character

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ascii" class="funcsynopsis">

|                           |                 |
|---------------------------|-----------------|
| `integer `**`ascii`**` (` | `arg ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ascii" class="refsect1">

## Description

`ascii ` returns the ASCII value of the first character of a string. If
an empty string is given, then zero is returned.

</div>

<div id="params_ascii" class="refsect1">

## Parameters

<div id="id80444" class="refsect2">

### *`arg `*

A <span class="type">string </span>

</div>

</div>

<div id="ret_ascii" class="refsect1">

## Return Values

The <span class="type">integer </span> ASCII value of the first
character of the input string is returned. If the input string is empty,
then zero is returned

</div>

<div id="errors_ascii" class="refsect1">

## Errors

<div id="id80455" class="table">

**Table 24.3. Errors signalled by ascii**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                      | Description |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">SR044 </span> | <span class="errortext">Function ascii needs a string as an argument, not an argument of type %d (= %s) </span> |             |

</div>

</div>

  

</div>

<div id="examples_ascii" class="refsect1">

## Examples

<div id="ex_ascii_1" class="example">

**Example 24.14. Simple example**

<div class="example-contents">

``` screen
SQL> select ascii('Zardoz');
callret
INTEGER
_______________________________________________________________________________

90

1 Rows. -- 14 msec.
```

</div>

</div>

  

</div>

<div id="seealso_ascii" class="refsect1">

## See Also

<a href="fn_aref.html" class="link" title="aref"><code
class="function">aref </code></a> ,
<a href="fn_chr.html" class="link" title="chr"><code
class="function">chr</code></a>

</div>

</div>
