<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.script_delete — Remove a BPEL process

</div>

<div>

## Synopsis

<div>

|                                      |                                 |
|--------------------------------------|---------------------------------|
| ` `**`BPEL.BPEL.script_delete`**` (` | in `script ` varchar ,          |
|                                      | in `delete_instances ` int `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### script

<span class="type">int </span> the identifier of the BPEL process to be
deleted

</div>

<div>

### delete_instances

<span class="type">int </span> this flag specifies to delete all
instances of the given process

</div>

</div>

<div>

## Return Types

this function has no return value

</div>

<div>

## Description

`BPEL.BPEL.script_delete ` Deletes all versions of the BPEL process and
all related partner links, instances, sources etc. if delete_instances
is false and there exist instances of at least one version of the script
the function signals an error and does nothing

</div>

<div>

## Examples

<div>

**Example 24.643. Simple example**

<div>

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
