<div id="fn_bpel_instance_delete" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.instance_delete — delete a BPEL process instance

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_instance_delete_01" class="funcsynopsis">

|                                        |                   |
|----------------------------------------|-------------------|
| ` `**`BPEL.BPEL.instance_delete`**` (` | in `id ` int `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_instance_delete_01" class="refsect1">

## Parameters

<div id="id129980" class="refsect2">

### id

<span class="type">int </span> instance identifier

</div>

</div>

<div id="ret_instance_delete_01" class="refsect1">

## Return Types

this function has no return value

</div>

<div id="desc_instance_delete_01" class="refsect1">

## Description

`BPEL.BPEL.instance_delete ` Deletes the instance, regardless of
completion state or such. If there are waits for the instance the waits
are flagged as deleted, not physically deleted. This will cause the
reply message to be received instead of going to the unexpected messages
queue.

</div>

<div id="examples_instance_delete_01" class="refsect1">

## Examples

<div id="ex_instance_delete_01" class="example">

**Example 24.641. Simple example**

<div class="example-contents">

The following will delete process instance with ID equal to 5

``` screen
      SQL> BPEL.BPEL.instance_delete (5);
          Done. -- 10 msec.
      
```

</div>

</div>

  

</div>

</div>
