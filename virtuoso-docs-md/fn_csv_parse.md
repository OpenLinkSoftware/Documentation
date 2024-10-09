<div>

<div>

</div>

<div>

## Name

csv_parse — Parses a CSV file.

</div>

<div>

## Synopsis

<div>

|                        |                                       |
|------------------------|---------------------------------------|
| ` `**`csv_parse`**` (` | in `string_session_input ` any ,      |
|                        | in `callback_sp_name ` varchar ,      |
|                        | inout `callback_user_data ` varchar , |
|                        | in `from_line ` integer ,             |
|                        | in `to_line ` integer ,               |
|                        | in `opts ` any `)`;                   |

<div>

 

</div>

</div>

</div>

<div>

## Description

Parses string session containing CSV data and then calls stored
procedure by given callback_sp_name parameter. The call back will be
invoked for lines between from_line and to_line argument's values. The
default from/to is 0/null which means from begining to end. The callback
function must take three arguments: the vector which contains parsed csv
row, the line number, inout the callback_user_data.

</div>

<div>

## Parameters

<div>

### string_session_input

String session containing CSV data will be parsed as CSV where it will
insert into the table specified as table_name the lines between
from_line and to_line offsets.

</div>

<div>

### callback_sp_name

The name of the stored procedure.

</div>

<div>

### callback_user_data

The user data.

</div>

<div>

### from_line

Default - 0, This means counted from the begining.

</div>

<div>

### to_line

Default - null, This means counted to the end.

</div>

<div>

### opts

Default - null. The opts paramater is used to specify the delimiter and
quote it should look like this:

``` programlisting
vector ('csv-delimiter', self.delim, 'csv-quote', self.quot)
```

</div>

</div>

<div>

## Examples

<div>

**Example 24.129. Simple Use**

<div>

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

<div>

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
