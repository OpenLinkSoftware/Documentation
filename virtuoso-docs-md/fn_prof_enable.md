<div>

<div>

</div>

<div>

## Name

prof_enable — Control virtuoso profiling

</div>

<div>

## Synopsis

<div>

|                          |                         |
|--------------------------|-------------------------|
| ` `**`prof_enable`**` (` | in `flag ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

`prof_enable ` is used to enable or disable profiling of execution
times, SQL statements and web requests. Passing flag value 1, enables
profiling, causing times of statement executions, which begin and end
while profiling is on, to be accumulated.

When called with a flag of 0, the accumulation is stopped and results
gathered so far are written into file named virtprof.out in the server's
working directory. For a description of the file, see section about
<a href="ch-server.html#efficientsql" class="link"
title="Efficient Use of SQL - SQL Execution profiling">SQL Execution
Profiling</a> in <a href="ch-server.html#ptune" class="link"
title="6.1.7. Performance Tuning">Performance tuning</a> part of
Virtuoso documentation.

</div>

<div>

## Parameters

<div>

### flag

An <span class="type">INTEGER </span> . Valid values are 1 or 0.

</div>

</div>

<div>

## Return Types

None.

</div>

<div>

## Errors

No errors are signalled by `prof_enable `

</div>

<div>

## Examples

<div>

**Example 24.247. Simple example**

<div>

Enable profiling.

``` screen
SQL> prof_enable(1);
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="ch-server.html#efficientsql" class="link"
title="Efficient Use of SQL - SQL Execution profiling">SQL Execution
profiling.</a>

<a href="fn_prof_sample.html" class="link"
title="prof_sample">prof_sample()</a>

</div>

</div>
