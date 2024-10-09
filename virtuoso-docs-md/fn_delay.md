<div>

<div>

</div>

<div>

## Name

delay — sleep for n seconds

</div>

<div>

## Synopsis

<div>

|                    |                              |
|--------------------|------------------------------|
| ` `**`delay`**` (` | in `n_seconds ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This will halt calling procedure execution for specified interval in
seconds.

</div>

<div>

## Parameters

<div>

### n_seconds

<span class="type">INTEGER </span> number of seconds to sleep.

</div>

</div>

<div>

## Return Types

None

</div>

<div>

## Examples

<div>

**Example 24.89. Simple example**

<div>

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
