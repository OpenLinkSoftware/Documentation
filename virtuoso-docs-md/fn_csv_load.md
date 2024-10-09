<div>

<div>

</div>

<div>

## Name

csv_load — Import CSV file from string session.

</div>

<div>

## Synopsis

<div>

|                       |                                  |
|-----------------------|----------------------------------|
| ` `**`csv_load`**` (` | in `string_session_input ` any , |
|                       | in `from_line ` integer ,        |
|                       | in `to_line ` integer ,          |
|                       | in `table_name ` varchar ,       |
|                       | in `trx_log_mode ` integer ,     |
|                       | in `opts ` any `)`;              |

<div>

 

</div>

</div>

</div>

<div>

## Description

Import CSV file from string session.

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

### from_line

Default - 0, This means counted from the begining.

</div>

<div>

### to_line

Default - null, This means counted to the end.

</div>

<div>

### table_name

The table the data to be inserted into.

</div>

<div>

### trx_log_mode

Default - 2. The trx_log_mode is used to do row auto commit and to log
or not the transaction. The default mode is to do not log and do auto
commit.

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

## Errors

If table is not suitable in respect of number of columns or type of
columns error will be signaled.

</div>

<div>

## Examples

<div>

**Example 24.128. Simple Use**

<div>

``` programlisting
SQL>create procedure my_csv_load (in file_name varchar)
{
  declare tb_name varchar;
  declare sess any;
  declare ar any;

  sess := file_open(file_name);

  -- to get the name of the table
  ar := csv_table_def(file_name);
  ar := split_and_decode(ar, 0,'\0\0 ');
  tb_name := trim (ar[2], '"');

  dbg_obj_print(tb_name);

  -- to create the table
  exec(csv_table_def(file_name));

  -- loading the data
  csv_load(sess,0, null, concat('DB.DBA.', tb_name));
}
;

Done. -- 10 msec.

SQL>select my_csv_load('tmp/MyContacts.csv');
callret
VARCHAR
_____________________

0

1 Rows. -- 121 msec.

SQL>select * from DB.DBA.tmp_MyContacts_csv;
First_Name_Last_Name_Middle_Name_Name_Nickname_E_mail_Addre
VARCHAR
_______________________________________________________________________________

First Name;Last Name;Middle Name;Name;Nickname;E-mail Address;Home Street;Home City;Home Postal Code;Home State;Home Country/Region;Home Phone;Home Fa
x;Mobile Phone;Personal Web Page;Business Street;Business City;Business Postal Code;Business State;Business Country/Region;Business Web Page;Business
Phone;Business Fax;Pager;Company;Job Title;Department;Office Location;Notes
;;; Virtuoso Nightly Builds on  oplusaix2 ;;virtuoso-nightly-builds@openlinksw.com;;;;;;;;;;;;;;;;;;;;;;;
......

202 Rows. -- 341 msec.
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

<a href="fn_csv_parse.html" class="link" title="csv_parse"><code
class="function">csv_parse </code></a>

<a href="fn_csv_cols_def.html" class="link" title="csv_cols_def"><code
class="function">csv_cols_def </code></a>

<a href="fn_csv_table_def.html" class="link" title="csv_table_def"><code
class="function">csv_table_def </code></a>

</div>

</div>
