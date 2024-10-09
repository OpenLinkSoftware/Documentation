<div>

<div>

</div>

<div>

## Name

get_csv_row — This function takes a string_session containing CSV data,
parses a row and returns a vector with field values.

</div>

<div>

## Synopsis

<div>

|                          |                       |
|--------------------------|-----------------------|
| ` `**`get_csv_row`**` (` | in `ses ` any ,       |
|                          | in `delim ` char ,    |
|                          | in `quote ` char `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function takes a string_session containing CSV data, parses a row
and returns a vector with field values.

Calling the function in a loop with same input will parse file line by
line.

The function is also making a basic prediction of field types for
varchar, integer and float values, so the result data may have one of
these. If come other datatype is need to be produced the caller can
convert the string using the BIF like cast sprintf_inverse and so on.

</div>

<div>

## Parameters

<div>

### ses

string_session containing CSV data

</div>

<div>

### delim

Optional argument to handle tab, space delimited etc. formats.

</div>

<div>

### quote

Optional argument to handle tab, space delimited etc. formats.

</div>

</div>

<div>

## Return Types

Returns a vector with field values.

</div>

<div>

## Examples

<div>

**Example 24.123. Simple Use**

<div>

The following example prints on the Virtuoso Server console the CSV
columns names:

``` programlisting
SQL>create procedure my_csv (in file_name varchar)
{
   dbg_obj_print(get_csv_row(file_open('tmp/MyContacts.csv')));
}
;

Done. -- 10 msec.

SQL>select my_csv('tmp/MyContacts.csv');
callret
VARCHAR
______________________

0

1 Rows. -- 10 msec.

-- and on the Virtuoso Server console will be shown:

('First Name;Last Name;Middle Name;Name;Nickname;E-mail Address;Home Street;Home City;Home Postal Code;Home State;Home Country/Region;Home Phone;Home
Fax;Mobile Phone;Personal Web Page;Business Street;Business City;Business Postal Code;Business State;Business Country/Region;Business Web Page;Busines
s Phone;Business Fax;Pager;Company;Job Title;Department;Office Location;Notes' )
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_csv_load_file.html" class="link" title="csv_load_file"><code
class="function">csv_load_file() </code></a>

<a href="fn_csv_load.html" class="link" title="csv_load"><code
class="function">csv_load() </code></a>

<a href="fn_csv_parse.html" class="link" title="csv_parse"><code
class="function">csv_parse() </code></a>

<a href="fn_csv_cols_def.html" class="link" title="csv_cols_def"><code
class="function">csv_cols_def() </code></a>

<a href="fn_csv_table_def.html" class="link" title="csv_table_def"><code
class="function">csv_table_def() </code></a>

</div>

</div>
