<div id="fn_result" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

result — Sends one row of results to the calling client.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_result" class="funcsynopsis">

|                     |                      |
|---------------------|----------------------|
| ` `**`result`**` (` | in `col_1 ` any ,    |
|                     | `.. ` ,              |
|                     | in `col_n ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_result" class="refsect1">

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

<div id="params_result" class="refsect1">

## Parameters

<div id="id108527" class="refsect2">

### col_1, ..., col_n

The data to be sent to the client.

</div>

</div>

<div id="examples_result" class="refsect1">

## Examples

<div id="ex_result" class="example">

**Example 24.358. **

<div class="example-contents">

This example demonstrates outputting multiple result sets from a stored
procedure. This procedure can be entered using ISQL but ISQL does not
support multiple result sets. To view the output you can use the the
sample application odbc test or another application that supports
multiple result sets. The RES procedure below returns two result sets --
the first has two rows and the second has four rows. The result_names
function gives each result column a type and title. This can be omitted
if the application knows which columns to expect. The result function
sends the actual result row. The end_result function indicates that a
new result set will begin. These functions can be used inside loops or
subprocedures, thus allowing with one call to yield a variable number of
result sets.

``` programlisting
CREATE PROCEDURE RES (IN I INTEGER)
{
  DECLARE STR, STR2 VARCHAR;

  RESULT_NAMES (I, STR);
  RESULT (I, 'FIRST');
  RESULT (I + 1, 'SECOND');
  RESULT_NAMES (I, STR, STR2);

  END_RESULT ();

  RESULT (I, 'FIRST');
  RESULT (I + 1, 'SECOND');
  RESULT (I + 2, 'THIRD', 'FF');
  RESULT (I + 3, 'FOURTH', 'FF');

  RETURN 1;
}
```

</div>

</div>

  

</div>

<div id="seealso_result" class="refsect1">

## See Also

<a href="fn_result_names.html" class="link" title="result_names"><code
class="function">result_names() </code></a>

<a href="fn_end_result.html" class="link" title="end_result"><code
class="function">end_result() </code></a>

</div>

</div>
