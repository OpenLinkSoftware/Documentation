<div>

<div>

</div>

<div>

## Name

exec_result — Returns a result set row to the calling procedure context

</div>

<div>

## Synopsis

<div>

|                             |                                 |
|-----------------------------|---------------------------------|
| `any `**`exec_result`**` (` | in `res_values_array ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns a result set row to the calling procedure's
context, whether it is the client, exec function or a procedure view).
The row's values are the elements of the supplied res_values_array
vector.

</div>

<div>

## Parameters

<div>

### res_values_array

This parameter can be one of two things:

|                                                                                                                                                                         |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| a vector of strings (like vector('cola', 'colbb')). When used that way it makes columns named 'cola' and 'colb' with type ANY and precision 256                         |
| an array with the same format as the 0th element of the metadata returned by `exec()` and `rexec()` , which contains all the type information and can be used directly. |

</div>

</div>

<div>

## Return Types

The row's values are the elements of the supplied res_values_array
vector. For example: `exec_result (vector (1, 'a'))` will return a row
of two columns: 1 and 'a'. This is similar to the `result()` function,
but it uses an array instead of parameter list

</div>

<div>

## Examples

<div>

**Example 24.103. Result set rows**

<div>

``` screen
create procedure XX1 ()
{
  declare meta, _dt any;
  declare inx integer;
  exec ('select U_ID, U_NAME from SYS_USERS', null, null, null, 0, meta, _dt);
  inx := 0;

  exec_result_names (meta[0]);
  while (inx < length (_dt))
    {
      exec_result (_dt[inx]);
      inx := inx + 1;
    }
};
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_exec.html" class="link" title="exec"><code
class="function">exec() </code></a>

`rexec() `

<a href="fn_exec_result_names.html" class="link"
title="exec_result_names"><code
class="function">exec_result_names() </code></a>

<a href="fn_result_names.html" class="link" title="result_names"><code
class="function">result_names() </code></a>

</div>

</div>
