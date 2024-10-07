<div id="fn_exec_result_names" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

exec_result_names — Supplies column details for procedure result set
output.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_exec_result_names" class="funcsynopsis">

|                                |                                |
|--------------------------------|--------------------------------|
| ` `**`exec_result_names`**` (` | in `res_names_array ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_exec_result_names" class="refsect1">

## Description

This function allows you to define the column details for result sets
returned by procedures, in particular for use with the `exec() `
function. This function is similar to `result_names() ` .

</div>

<div id="params_exec_result_names" class="refsect1">

## Parameters

<div id="id88052" class="refsect2">

### res_names_array

This parameter can be one of two things:

|                                                                                                                                                                         |
|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| a vector of strings (like vector('cola', 'colbb')). When used that way it makes columns named 'cola' and 'colb' with type ANY and precision 256                         |
| an array with the same format as the 0th element of the metadata returned by `exec()` and `rexec()` , which contains all the type information and can be used directly. |

</div>

</div>

<div id="ret_exec_result_names" class="refsect1">

## Return Types

None.

</div>

<div id="examples_exec_result_names" class="refsect1">

## Examples

<div id="ex_exec_result_names_01" class="example">

**Example 24.104. Result set column names**

<div class="example-contents">

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

<div id="seealso_exec_result_names" class="refsect1">

## See Also

<a href="fn_exec.html" class="link" title="exec"><code
class="function">exec() </code></a>

`rexec() `

<a href="fn_exec_result.html" class="link" title="exec_result"><code
class="function">exec_result() </code></a>

</div>

</div>
