<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.purge_instance — removes old BPEL process instances

</div>

<div>

## Synopsis

<div>

|                                       |                                         |
|---------------------------------------|-----------------------------------------|
| ` `**`BPEL.BPEL.purge_instance`**` (` | in `completed_before ` datetime ,       |
|                                       | in `make_archive ` int (default 1) `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### completed_before

<span class="type">datetime </span> all instances completed before this
date and time will be removed

</div>

<div>

### make_archive

<span class="type">int </span> flag to archive or not instances before
removal

</div>

</div>

<div>

## Return Types

</div>

<div>

## Description

`BPEL.BPEL.purge_instance ` this will erase all instances completed
before the datetime specified.

</div>

<div>

## Examples

<div>

**Example 24.642. Simple example**

<div>

The following wil lremove all process instances completed before 10 of
January 2004.

``` screen
      SQL> BPEL.BPEL.purge_instance (stringdate ('2004-01-10'));
          Done. -- 10 msec.
      
```

</div>

</div>

  

</div>

</div>
