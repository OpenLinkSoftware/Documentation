<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.instance_delete — delete a BPEL process instance

</div>

<div>

## Synopsis

<div>

|                                        |                   |
|----------------------------------------|-------------------|
| ` `**`BPEL.BPEL.instance_delete`**` (` | in `id ` int `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### id

<span class="type">int </span> instance identifier

</div>

</div>

<div>

## Return Types

this function has no return value

</div>

<div>

## Description

`BPEL.BPEL.instance_delete ` Deletes the instance, regardless of
completion state or such. If there are waits for the instance the waits
are flagged as deleted, not physically deleted. This will cause the
reply message to be received instead of going to the unexpected messages
queue.

</div>

<div>

## Examples

<div>

**Example 24.641. Simple example**

<div>

The following will delete process instance with ID equal to 5

``` screen
      SQL> BPEL.BPEL.instance_delete (5);
          Done. -- 10 msec.
      
```

</div>

</div>

  

</div>

</div>
