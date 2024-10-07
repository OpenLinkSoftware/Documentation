<div id="fn_bpel_script_obsolete" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.script_obsolete — mark a BPEL script as obsoleted

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_script_obsolete_01" class="funcsynopsis">

|                                        |                           |
|----------------------------------------|---------------------------|
| ` `**`BPEL.BPEL.script_obsolete`**` (` | in `script ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_script_obsolete_01" class="refsect1">

## Parameters

<div id="id130091" class="refsect2">

### script

<span class="type">varchar </span>

</div>

</div>

<div id="ret_script_obsolete_01" class="refsect1">

## Return Types

this function has no return value

</div>

<div id="desc_script_obsolete_01" class="refsect1">

## Description

`BPEL.BPEL.script_obsolete ` Marks the script as obsolete. This means
that existing instances will complete but no new instances can be made.
The effect can be reversed by going to edit mode and recompiling a new
version which then becomes current. Directly after this function there
will be no current version but there may be a version being edited.

</div>

<div id="examples_script_obsolete_01" class="refsect1">

## Examples

<div id="ex_script_obsolete_01" class="example">

**Example 24.644. Simple example**

<div class="example-contents">

``` screen
        SQL> BPEL.BPEL.script_obsolete (5);
        Done. -- 10 msec.
      
```

</div>

</div>

  

</div>

</div>
