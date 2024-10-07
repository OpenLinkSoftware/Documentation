<div id="fn_csv_parse" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

csv_parse — Parses a CSV file.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_csv_parse" class="funcsynopsis">

|                        |                                       |
|------------------------|---------------------------------------|
| ` `**`csv_parse`**` (` | in `string_session_input ` any ,      |
|                        | in `callback_sp_name ` varchar ,      |
|                        | inout `callback_user_data ` varchar , |
|                        | in `from_line ` integer ,             |
|                        | in `to_line ` integer ,               |
|                        | in `opts ` any `)`;                   |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_csv_parse" class="refsect1">

## Description

Parses string session containing CSV data and then calls stored
procedure by given callback_sp_name parameter. The call back will be
invoked for lines between from_line and to_line argument's values. The
default from/to is 0/null which means from begining to end. The callback
function must take three arguments: the vector which contains parsed csv
row, the line number, inout the callback_user_data.

</div>

<div id="params_csv_parse" class="refsect1">

## Parameters

<div id="id89835" class="refsect2">

### string_session_input

String session containing CSV data will be parsed as CSV where it will
insert into the table specified as table_name the lines between
from_line and to_line offsets.

</div>

<div id="id89838" class="refsect2">

### callback_sp_name

The name of the stored procedure.

</div>

<div id="id89841" class="refsect2">

### callback_user_data

The user data.

</div>

<div id="id89844" class="refsect2">

### from_line

Default - 0, This means counted from the begining.

</div>

<div id="id89847" class="refsect2">

### to_line

Default - null, This means counted to the end.

</div>

<div id="id89850" class="refsect2">

### opts

Default - null. The opts paramater is used to specify the delimiter and
quote it should look like this:

``` programlisting
vector ('csv-delimiter', self.delim, 'csv-quote', self.quot)
```

</div>

</div>

<div id="examples_csv_parse" class="refsect1">

## Examples

<div id="ex_csv_parse" class="example">

**Example 24.129. Simple Use**

<div class="example-contents">

``` programlisting
create procedure y_csv_cb (inout r any, in inx int, inout cbd any)
{
 if (cbd is null)
   cbd := vector ();
 cbd := vector_concat (cbd, vector (r));
}
;

....
 h := null;
 csv_parse (ss, 'DB.DBA.y_csv_cb', h, 0, 10);
....
```

</div>

</div>

  

</div>

<div id="seealso_csv_parse" class="refsect1">

## See Also

<a href="fn_get_csv_row.html" class="link" title="get_csv_row"><code
class="function">get_csv_row </code></a>

<a href="fn_csv_load_file.html" class="link" title="csv_load_file"><code
class="function">csv_load_file </code></a>

<a href="fn_csv_load.html" class="link" title="csv_load"><code
class="function">csv_load </code></a>

<a href="fn_csv_cols_def.html" class="link" title="csv_cols_def"><code
class="function">csv_cols_def </code></a>

<a href="fn_csv_table_def.html" class="link" title="csv_table_def"><code
class="function">csv_table_def </code></a>

</div>

</div>
