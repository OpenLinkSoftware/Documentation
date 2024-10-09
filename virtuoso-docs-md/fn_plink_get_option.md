<div>

<div>

</div>

<div>

## Name

BPEL.BPEL.plink_get_option — retrieving a partner link option

</div>

<div>

## Synopsis

<div>

|                                         |                        |
|-----------------------------------------|------------------------|
| ` `**`BPEL.BPEL.plink_get_option`**` (` | in `script ` varchar , |
|                                         | in `plink ` varchar ,  |
|                                         | in `opt ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Parameters

<div>

### script

<span class="type">varchar </span> name of a process that partner link
belongs to

</div>

<div>

### plink

<span class="type">varchar </span> name of the partner link

</div>

<div>

### opt

<span class="type">varchar </span> name of the options to be retrieved

</div>

</div>

<div>

## Return Types

The function returns a string or array of strings depending of the
requested option.

</div>

<div>

## Description

`BPEL.BPEL.plink_get_option ` This function can be used to retrieve the
options assigned to a particular partner link. These options are used to
configure various Web Service protocols (see Protocol Support section in
BPEL reference chapter). For available options see
<a href="fn_plink_set_option.html" class="link"
title="BPEL.BPEL.plink_set_option"><code
class="function">plink_set_option()</code></a> function.

</div>

<div>

## Examples

<div>

**Example 24.650. Simple example**

<div>

``` screen
SQL> select BPEL.BPEL.plink_get_option ('WSSecho', 'service', 'wss-in-encrypt');
callret
VARCHAR
_______________________________________________________________________________

NONE
```

</div>

</div>

  

</div>

</div>
