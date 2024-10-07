<div id="fn_dbf_set" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

\_\_dbf_set — Sets vector execution parameters.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn___dbf_set" class="funcsynopsis">

|                        |                            |
|------------------------|----------------------------|
| ` `**`__dbf_set`**` (` | in `flag_name ` varchar ,  |
|                        | out `flag_value ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc___dbf_set" class="refsect1">

## Description

Sets at run time by a dba group user the vector execution parameters.

</div>

<div id="params___dbf_set" class="refsect1">

## Parameters

<div id="id96153" class="refsect2">

### flag_name

Name of the flag.

For Configuring Vectored Execution, should be used the following values:

Note: Only effective with Virtuoso 7.0 and later.

<div class="itemizedlist">

- <span class="emphasis">*dc_batch_sz* </span> : flag for ini parameter
  VectorSize;

- <span class="emphasis">*dc_max_batch_sz* </span> : flag for ini
  parameter MaxVectorSize;

- <span class="emphasis">*enable_dyn_batch_sz* </span> : flag for ini
  parameter AdjustVectorSize;

- <span class="emphasis">*enable_qp* </span> : flag for ini parameter
  ThreadsPerQuery;

- <span class="emphasis">*aq_max_threads* </span> : flag for ini
  parameter AsyncQueueMaxThreads;

</div>

</div>

<div id="id96174" class="refsect2">

### flag_value

Value of the flag.

</div>

</div>

<div id="examples___dbf_set" class="refsect1">

## Examples

<div id="ex___dbf_set" class="example">

**Example 24.212. Simple Use**

<div class="example-contents">

Set the maximum number of outstanding parallel work units to 16:

``` programlisting
SQL> __dbf_set ('enable_qp', 16);
```

</div>

</div>

  

</div>

</div>
