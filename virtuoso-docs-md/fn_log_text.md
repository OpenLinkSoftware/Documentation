<div>

<div>

</div>

<div>

## Name

log_text — inserts statements into the roll forward log

</div>

<div>

## Synopsis

<div>

|                       |                      |
|-----------------------|----------------------|
| ` `**`log_text`**` (` | in `text ` varchar , |
|                       | in `arg_1 ` any ,    |
|                       | `... ` `)`;          |

<div>

 

</div>

</div>

</div>

<div>

## Description

The log_text function can be used to insert a SQL statement into the
roll forward log.

The log_text function causes the SQL text given as first argument to be
executed at roll forward time with the following arguments as
parameters, bound from left to right to the parameter markers in the
statement ('?'). There can be a maximum of 8 parameters but these can be
arrays.

</div>

<div>

## Parameters

<div>

### text

<span class="type">VARCHAR </span> SQL statement to be added in the
transaction log.

</div>

<div>

### arg1..arg8

Parameters to be passed to logged statement.

</div>

</div>

<div>

## Examples

<div>

**Example 24.210. Log a procedure call**

<div>

Log a procedure call instead of its effects.

``` screen
create procedure xx ()
{
  log_text ('xx (?)', arg);
  log_enable (0);
  ... action code
  log_enable (1);
}
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_log_enable.html" class="link" title="log_enable"><code
class="function">log_enable </code></a>

</div>

</div>
