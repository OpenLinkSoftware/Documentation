<div id="fn_result_names" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

result_names

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_result_names" class="funcsynopsis">

|                           |                  |
|---------------------------|------------------|
| ` `**`result_names`**` (` | in `var_1 ` ,    |
|                           | `... ` ,         |
|                           | in `var_n ` `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_result_names" class="refsect1">

## Description

The `result_names() ` predefines variables to be used in a result set to
follow. The variables must be previously declared, from which the column
data types are ascertained. This assigns the meta data but does not send
any results. The `result()` function sends its parameters as a single
row of results. These parameters should be compatible with those in the
previous `result_names()` . The `end_results()` function can be used to
separate multiple result sets. The `result_names()` can then be used to
alter the structure of the next result set.

The `result_names()` call can be omitted if the application already
knows what columns and their types are to be returned.

</div>

<div id="params_result_names" class="refsect1">

## Parameters

<div id="id108574" class="refsect2">

### var_1, ..., var_n

The column variables previously declared or otherwise.

</div>

</div>

<div id="seealso_result_names" class="refsect1">

## See Also

<a href="fn_result.html" class="link" title="result"><code
class="function">result() </code></a>

<a href="fn_end_result.html" class="link" title="end_result"><code
class="function">end_result() </code></a>

</div>

</div>
