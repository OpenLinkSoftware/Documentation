<div id="fn_vt_is_noise" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

vt_is_noise — determines whether input is a noise word

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vt_is_noise_01" class="funcsynopsis">

|                          |                             |
|--------------------------|-----------------------------|
| ` `**`vt_is_noise`**` (` | in `word ` varchar ,        |
|                          | in `encoding ` varchar ,    |
|                          | in `language ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vt_is_noise_01" class="refsect1">

## Description

Determines whether input is a noise word.

</div>

<div id="params_vt_is_noise_01" class="refsect1">

## Parameters

<div id="id119172" class="refsect2">

### word

Narrow string of the word to be checked

</div>

<div id="id119175" class="refsect2">

### encoding

valid encoding string

</div>

<div id="id119178" class="refsect2">

### language

valid language string

</div>

</div>

<div id="ret_vt_is_noise_01" class="refsect1">

## Return Values

1 or 0. This function will return 1 if the encoded word in the specified
language is considered a noise word, or 0 if not.

</div>

<div id="examples_vt_is_noise_01" class="refsect1">

## Examples

<div id="ex_vt_is_noise_01" class="example">

**Example 24.449. Determining if a word is a Noise Word**

<div class="example-contents">

``` programlisting
select vt_is_noise ('a', 'UTF-8', 'X-ANY');
      
```

will return 1

``` programlisting
select vt_is_noise ('effective', 'UTF-8', 'X-ANY');
      
```

will return 0

</div>

</div>

  

</div>

</div>
