<div>

<div>

</div>

<div>

## Name

\_\_dbf_set — Sets vector execution parameters.

</div>

<div>

## Synopsis

<div>

|                        |                            |
|------------------------|----------------------------|
| ` `**`__dbf_set`**` (` | in `flag_name ` varchar ,  |
|                        | out `flag_value ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Sets at run time by a dba group user the vector execution parameters.

</div>

<div>

## Parameters

<div>

### flag_name

Name of the flag.

For Configuring Vectored Execution, should be used the following values:

Note: Only effective with Virtuoso 7.0 and later.

<div>

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

<div>

### flag_value

Value of the flag.

</div>

</div>

<div>

## Examples

<div>

**Example 24.212. Simple Use**

<div>

Set the maximum number of outstanding parallel work units to 16:

``` programlisting
SQL> __dbf_set ('enable_qp', 16);
```

</div>

</div>

  

</div>

</div>
