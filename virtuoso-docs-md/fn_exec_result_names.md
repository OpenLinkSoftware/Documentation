<div>

<div>

</div>

<div>

## Name

exec_result_names — Supplies column details for procedure result set
output.

</div>

<div>

## Synopsis

<div>

|                                |                                |
|--------------------------------|--------------------------------|
| ` `**`exec_result_names`**` (` | in `res_names_array ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function allows you to define the column details for result sets
returned by procedures, in particular for use with the `exec() `
function. This function is similar to `result_names() ` .

</div>

<div>

## Parameters

<div>

### res_names_array

This parameter can be one of two things:

|                                                                                                                                                                         |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| a vector of strings (like vector('cola', 'colbb')). When used that way it makes columns named 'cola' and 'colb' with type ANY and precision 256                         |
| an array with the same format as the 0th element of the metadata returned by `exec()` and `rexec()` , which contains all the type information and can be used directly. |

</div>

</div>

<div>

## Return Types

None.

</div>

<div>

## Examples

<div>

**Example 24.104. Result set column names**

<div>

The procedure below uses the metadata from exec() to generate result set
column names.

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

<a href="fn_exec_result.html" class="link" title="exec_result"><code
class="function">exec_result() </code></a>

</div>

</div>
