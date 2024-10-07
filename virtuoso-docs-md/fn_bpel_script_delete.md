<div id="fn_bpel_script_delete" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.script_delete — Remove a BPEL process

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_script_delete_01" class="funcsynopsis">

|                                      |                                 |
|--------------------------------------|---------------------------------|
| ` `**`BPEL.BPEL.script_delete`**` (` | in `script ` varchar ,          |
|                                      | in `delete_instances ` int `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_script_delete_01" class="refsect1">

## Parameters

<div id="id130054" class="refsect2">

### script

<span class="type">int </span> the identifier of the BPEL process to be
deleted

</div>

<div id="id130058" class="refsect2">

### delete_instances

<span class="type">int </span> this flag specifies to delete all
instances of the given process

</div>

</div>

<div id="ret_script_delete_01" class="refsect1">

## Return Types

this function has no return value

</div>

<div id="desc_script_delete_01" class="refsect1">

## Description

`BPEL.BPEL.script_delete ` Deletes all versions of the BPEL process and
all related partner links, instances, sources etc. if delete_instances
is false and there exist instances of at least one version of the script
the function signals an error and does nothing

</div>

<div id="examples_script_delete_01" class="refsect1">

## Examples

<div id="ex_script_delete_01" class="example">

**Example 24.643. Simple example**

<div class="example-contents">

The following will delete script with ID equal of 3 and all it's
instances

``` screen
      SQL> BPEL.BPEL.script_delete (5, 1);
          Done. -- 10 msec.
      
```

</div>

</div>

  

</div>

</div>
