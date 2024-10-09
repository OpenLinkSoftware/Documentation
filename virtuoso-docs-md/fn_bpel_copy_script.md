<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.copy_script — Makes a copy of an existing script

</div>

<div>

## Synopsis

<div>

|                                    |                       |
|------------------------------------|-----------------------|
| ` `**`BPEL.BPEL.copy_script`**` (` | in `scp_id ` int `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### scp_id

<span class="type">int </span> the ID of the BPEL script to be copied

</div>

</div>

<div>

## Return Types

returns a unique integer identifier for the script copy

</div>

<div>

## Description

`BPEL.BPEL.copy_script ` makes a copy of an existing script and put it
in edit mode.

</div>

<div>

## Examples

<div>

**Example 24.639. Simple example**

<div>

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
