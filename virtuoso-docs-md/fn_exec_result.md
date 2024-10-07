<div id="fn_exec_result" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

exec_result — Returns a result set row to the calling procedure context

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_exec_result" class="funcsynopsis">

|                             |                                 |
|-----------------------------|---------------------------------|
| `any `**`exec_result`**` (` | in `res_values_array ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_exec_result" class="refsect1">

## Description

This function returns a result set row to the calling procedure's
context, whether it is the client, exec function or a procedure view).
The row's values are the elements of the supplied res_values_array
vector.

</div>

<div id="params_exec_result" class="refsect1">

## Parameters

<div id="id88000" class="refsect2">

### res_values_array

This parameter can be one of two things:

|                                                                                                                                                                         |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| a vector of strings (like vector('cola', 'colbb')). When used that way it makes columns named 'cola' and 'colb' with type ANY and precision 256                         |
| an array with the same format as the 0th element of the metadata returned by `exec()` and `rexec()` , which contains all the type information and can be used directly. |

</div>

</div>

<div id="ret_exec_result" class="refsect1">

## Return Types

The row's values are the elements of the supplied res_values_array
vector. For example: `exec_result (vector (1, 'a'))` will return a row
of two columns: 1 and 'a'. This is similar to the `result()` function,
but it uses an array instead of parameter list

</div>

<div id="examples_exec_result" class="refsect1">

## Examples

<div id="ex_exec_result_names" class="example">

**Example 24.103. Result set rows**

<div class="example-contents">

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

<div id="seealso_exec_result" class="refsect1">

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
