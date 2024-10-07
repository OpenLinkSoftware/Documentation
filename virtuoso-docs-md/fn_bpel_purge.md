<div id="fn_bpel_purge" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

BPEL.BPEL.purge_instance — removes old BPEL process instances

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_purge_01" class="funcsynopsis">

|                                       |                                         |
|---------------------------------------|-----------------------------------------|
| ` `**`BPEL.BPEL.purge_instance`**` (` | in `completed_before ` datetime ,       |
|                                       | in `make_archive ` int (default 1) `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="params_purge_01" class="refsect1">

## Parameters

<div id="id130015" class="refsect2">

### completed_before

<span class="type">datetime </span> all instances completed before this
date and time will be removed

</div>

<div id="id130019" class="refsect2">

### make_archive

<span class="type">int </span> flag to archive or not instances before
removal

</div>

</div>

<div id="ret_purge_01" class="refsect1">

## Return Types

</div>

<div id="desc_purge_01" class="refsect1">

## Description

`BPEL.BPEL.purge_instance ` this will erase all instances completed
before the datetime specified.

</div>

<div id="examples_purge_01" class="refsect1">

## Examples

<div id="ex_purge_01" class="example">

**Example 24.642. Simple example**

<div class="example-contents">

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
