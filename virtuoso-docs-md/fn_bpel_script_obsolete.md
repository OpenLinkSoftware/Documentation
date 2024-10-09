<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.script_obsolete — mark a BPEL script as obsoleted

</div>

<div>

## Synopsis

<div>

|                                        |                           |
|----------------------------------------|---------------------------|
| ` `**`BPEL.BPEL.script_obsolete`**` (` | in `script ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### script

<span class="type">varchar </span>

</div>

</div>

<div>

## Return Types

this function has no return value

</div>

<div>

## Description

`BPEL.BPEL.script_obsolete ` Marks the script as obsolete. This means
that existing instances will complete but no new instances can be made.
The effect can be reversed by going to edit mode and recompiling a new
version which then becomes current. Directly after this function there
will be no current version but there may be a version being edited.

</div>

<div>

## Examples

<div>

**Example 24.644. Simple example**

<div>

``` screen
        SQL> BPEL.BPEL.script_obsolete (5);
        Done. -- 10 msec.
      
```

</div>

</div>

  

</div>

</div>
