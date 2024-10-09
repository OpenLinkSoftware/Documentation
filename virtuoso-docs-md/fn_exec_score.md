<div>

<div>

</div>

<div>

## Name

exec_score — Compiles a SQL statement and returns the estimate time cost

</div>

<div>

## Synopsis

<div>

|                         |                             |
|-------------------------|-----------------------------|
| ` `**`exec_score`**` (` | in `str ` varchar ,         |
|                         | out `state ` varchar ,      |
|                         | out `message ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function provides dynamic SQL capabilities in Virtuoso PL. The
first argument is an arbitrary SQL statement, which may contain
parameter placeholders. The function returns as output parameters a SQL
state, error message and returns the estimate time cost in milliseconds.

</div>

<div>

## Parameters

<div>

### *`str `*

A <span class="type">varchar </span> containing arbitrary SQL using ?'s
for parameter markers.

</div>

<div>

### state

An output parameter of type <span class="type">varchar </span> set to
the 5 character SQL state if the exec resulted an error. Not set if an
error is not present.

</div>

<div>

### message

An output parameter of type <span class="type">varchar </span> set to
SQL error message associated with the error. Not set if an error is not
present.

</div>

</div>

<div>

## Return Types

The function returns a float number which is the calculated estimate
time cost for the query execution.

</div>

<div>

## Errors

The function will generate a SQL 22023 error value if a supplied
parameter is not of the type expected.

<div>

|                            |                                                                   |
|:--------------------------:|:------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                         |
|                            | <a href="errors.html" class="link"                                
                              title="23.2. Error Codes Reference">List of SQL 22023 errors.</a>  |

</div>

</div>

<div>

## Examples

<div>

**Example 24.106. Simple Use**

<div>

``` screen
SQL> select exec_score ('select * from T1');
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_exec.html" class="link" title="exec"><code
class="function">exec() </code></a>

<a href="fn_exec_metadata.html" class="link" title="exec_metadata"><code
class="function">exec_metadata() </code></a>

<a href="fn_exec_next.html" class="link" title="exec_next"><code
class="function">exec_next() </code></a>

<a href="fn_exec_close.html" class="link" title="close"><code
class="function">exec_close() </code></a>

</div>

</div>
