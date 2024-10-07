<div id="fn_prof_sample" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

prof_sample — Adds a profiling sample to a profile being accumulated.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_prof_sample" class="funcsynopsis">

|                          |                            |
|--------------------------|----------------------------|
| ` `**`prof_sample`**` (` | in `desc ` varchar ,       |
|                          | in `time_spent ` integer , |
|                          | in `flag ` integer `)`;    |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_prof_sample" class="refsect1">

## Description

`prof_sample ` is used to adds a profiling sample to a profile being
accumulated.

The first argument is the name of the sampled section, the times called
and cumulative times will be totaled under this heading. The second
argument is the time in milliseconds. The third argument is a flag
indicating whether the section was successfully executed. 0 indicates
success, 1 indicates execute of the statement, 2 indicates fetch on a
statement's resultset, 4 indicates error. For more description of
profiling capabilities see the section about
<a href="ch-server.html#efficientsql" class="link"
title="Efficient Use of SQL - SQL Execution profiling">SQL Execution
Profiling</a> in <a href="ch-server.html#ptune" class="link"
title="6.1.7. Performance Tuning">Performance tuning</a> part of
Virtuoso documentation.

</div>

<div id="params_prof_enable_01" class="refsect1">

## Parameters

<div id="id99724" class="refsect2">

### desc

A <span class="type">VARCHAR </span> . Name of the sampled section.

</div>

<div id="id99728" class="refsect2">

### time_spent

An <span class="type">INTEGER </span> . Time in milliseconds.

</div>

<div id="id99732" class="refsect2">

### flag

An <span class="type">INTEGER </span> . flag indicating whether the
section was successfully executed. 0 - success, 1 - execute of
statement, 2 - fetch on a statement's resultset, 4 - error.

</div>

</div>

<div id="ret_prof_sample" class="refsect1">

## Return Types

None.

<div id="ex_prof_sample" class="example">

**Example 24.248. Example**

<div class="example-contents">

``` programlisting
create procedure do_prof_sample()
{
  declare stime integer;
  for(declare i integer;i < 5;i := i + 1){
    stime := msec_time();
    for(select * from Demo.demo.Customers) do sprintf('1');
    for(select * from Demo.demo.Employees) do sprintf('1');
    for(select * from Demo.demo.Order_Details) do sprintf('1');
    prof_sample('3 selects execute',msec_time() - stime,1);

  };

};

prof_enable(1);
select do_prof_sample();
prof_enable(0);
```

This will produce virtprof.out file of the sort:

``` programlisting
Query Profile (msec)
Real 168, client wait 313, avg conc 1.863095 n_execs 6 avg exec  52

100 % under 1 s
0 % under 2 s
0 % under 5 s
0 % under 10 s
0 % under 30 s

2 stmts compiled 1 msec, 0 % prepared reused.

 %  total n-times n-errors
50 % 157      1        0     select do_prof_sample
49 % 156      5        0     3 selects execute
```

</div>

</div>

  

</div>

<div id="seealso_prof_enable_01" class="refsect1">

## See Also

<a href="ch-server.html#efficientsql" class="link"
title="Efficient Use of SQL - SQL Execution profiling">SQL Execution
profiling.</a>

<a href="fn_prof_enable.html" class="link"
title="prof_enable">prof_enable()</a>

</div>

</div>
