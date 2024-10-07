<div id="fn_bpel_copy_script" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.copy_script — Makes a copy of an existing script

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_copy_script_01" class="funcsynopsis">

|                                    |                       |
|------------------------------------|-----------------------|
| ` `**`BPEL.BPEL.copy_script`**` (` | in `scp_id ` int `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_copy_script_01" class="refsect1">

## Parameters

<div id="id129914" class="refsect2">

### scp_id

<span class="type">int </span> the ID of the BPEL script to be copied

</div>

</div>

<div id="ret_copy_script_01" class="refsect1">

## Return Types

returns a unique integer identifier for the script copy

</div>

<div id="desc_copy_script_01" class="refsect1">

## Description

`BPEL.BPEL.copy_script ` makes a copy of an existing script and put it
in edit mode.

</div>

<div id="examples_copy_script_01" class="refsect1">

## Examples

<div id="ex_copy_script_01" class="example">

**Example 24.639. Simple example**

<div class="example-contents">

This will copy a script with identifier equal to 1, the copy have Id
equal to 2

``` screen
        SQL> select BPEL.BPEL.copy_script (1);
        unnamed
        INTEGER
        _______________________________________________________________________________

        2

        1 Rows. -- 1672 msec.
      
```

</div>

</div>

  

</div>

</div>
