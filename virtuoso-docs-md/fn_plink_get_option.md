<div id="fn_plink_get_option" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.plink_get_option — retrieving a partner link option

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_plink_get_option_01" class="funcsynopsis">

|                                         |                        |
|-----------------------------------------|------------------------|
| ` `**`BPEL.BPEL.plink_get_option`**` (` | in `script ` varchar , |
|                                         | in `plink ` varchar ,  |
|                                         | in `opt ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_get_var_04" class="refsect1">

## Parameters

<div id="id130363" class="refsect2">

### script

<span class="type">varchar </span> name of a process that partner link
belongs to

</div>

<div id="id130367" class="refsect2">

### plink

<span class="type">varchar </span> name of the partner link

</div>

<div id="id130371" class="refsect2">

### opt

<span class="type">varchar </span> name of the options to be retrieved

</div>

</div>

<div id="ret_plink_get_option_01" class="refsect1">

## Return Types

The function returns a string or array of strings depending of the
requested option.

</div>

<div id="desc_plink_get_option_01" class="refsect1">

## Description

`BPEL.BPEL.plink_get_option ` This function can be used to retrieve the
options assigned to a particular partner link. These options are used to
configure various Web Service protocols (see Protocol Support section in
BPEL reference chapter). For available options see
<a href="fn_plink_set_option.html" class="link"
title="BPEL.BPEL.plink_set_option"><code
class="function">plink_set_option()</code></a> function.

</div>

<div id="examples_plink_get_option_01" class="refsect1">

## Examples

<div id="ex_plink_get_option_01" class="example">

**Example 24.650. Simple example**

<div class="example-contents">

``` screen
SQL> select BPEL.BPEL.plink_get_option ('WSSecho', 'service', 'wss-in-encrypt');
callret
VARCHAR
_______________________________________________________________________________

NONE
```

</div>

</div>

  

</div>

</div>
