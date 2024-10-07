<div id="fn_delay" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

delay — sleep for n seconds

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_delay" class="funcsynopsis">

|                    |                              |
|--------------------|------------------------------|
| ` `**`delay`**` (` | in `n_seconds ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_delay" class="refsect1">

## Description

This will halt calling procedure execution for specified interval in
seconds.

</div>

<div id="params_delay" class="refsect1">

## Parameters

<div id="id86141" class="refsect2">

### n_seconds

<span class="type">INTEGER </span> number of seconds to sleep.

</div>

</div>

<div id="ret_delay" class="refsect1">

## Return Types

None

</div>

<div id="examples_delay" class="refsect1">

## Examples

<div id="ex_delay" class="example">

**Example 24.89. Simple example**

<div class="example-contents">

``` screen
create procedure
waitsome (in _interval integer)
{
  delay (_interval);
}

SQL> waitsome (10);

Done. -- 10004 msec.
```

</div>

</div>

  

</div>

</div>
