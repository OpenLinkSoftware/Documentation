<div id="fn_log_text" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

log_text — inserts statements into the roll forward log

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_log_text" class="funcsynopsis">

|                       |                      |
|-----------------------|----------------------|
| ` `**`log_text`**` (` | in `text ` varchar , |
|                       | in `arg_1 ` any ,    |
|                       | `... ` `)`;          |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_log_text" class="refsect1">

## Description

The log_text function can be used to insert a SQL statement into the
roll forward log.

The log_text function causes the SQL text given as first argument to be
executed at roll forward time with the following arguments as
parameters, bound from left to right to the parameter markers in the
statement ('?'). There can be a maximum of 8 parameters but these can be
arrays.

</div>

<div id="params_log_text" class="refsect1">

## Parameters

<div id="id96023" class="refsect2">

### text

<span class="type">VARCHAR </span> SQL statement to be added in the
transaction log.

</div>

<div id="id96027" class="refsect2">

### arg1..arg8

Parameters to be passed to logged statement.

</div>

</div>

<div id="examples_log_text" class="refsect1">

## Examples

<div id="ex_log_text_1" class="example">

**Example 24.210. Log a procedure call**

<div class="example-contents">

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

<div id="seealso_log_text" class="refsect1">

## See Also

<a href="fn_log_enable.html" class="link" title="log_enable"><code
class="function">log_enable </code></a>

</div>

</div>
