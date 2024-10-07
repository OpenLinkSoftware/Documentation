<div id="fn_prof_enable" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

prof_enable — Control virtuoso profiling

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_prof_enable" class="funcsynopsis">

|                          |                         |
|--------------------------|-------------------------|
| ` `**`prof_enable`**` (` | in `flag ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_prof_enable" class="refsect1">

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

<div id="params_prof_enable" class="refsect1">

## Parameters

<div id="id99674" class="refsect2">

### flag

An <span class="type">INTEGER </span> . Valid values are 1 or 0.

</div>

</div>

<div id="ret_prof_enable" class="refsect1">

## Return Types

None.

</div>

<div id="errors_prof_enable" class="refsect1">

## Errors

No errors are signalled by `prof_enable `

</div>

<div id="examples_prof_enable" class="refsect1">

## Examples

<div id="ex_prof_enable" class="example">

**Example 24.247. Simple example**

<div class="example-contents">

Enable profiling.

``` screen
SQL> prof_enable(1);
```

</div>

</div>

  

</div>

<div id="seealso_prof_enable" class="refsect1">

## See Also

<a href="ch-server.html#efficientsql" class="link"
title="Efficient Use of SQL - SQL Execution profiling">SQL Execution
profiling.</a>

<a href="fn_prof_sample.html" class="link"
title="prof_sample">prof_sample()</a>

</div>

</div>
