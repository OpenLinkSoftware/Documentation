<div id="fn_csv_load" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

csv_load — Import CSV file from string session.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_csv_load" class="funcsynopsis">

|                       |                                  |
|-----------------------|----------------------------------|
| ` `**`csv_load`**` (` | in `string_session_input ` any , |
|                       | in `from_line ` integer ,        |
|                       | in `to_line ` integer ,          |
|                       | in `table_name ` varchar ,       |
|                       | in `trx_log_mode ` integer ,     |
|                       | in `opts ` any `)`;              |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_csv_load" class="refsect1">

## Description

Import CSV file from string session.

</div>

<div id="params_csv_load" class="refsect1">

## Parameters

<div id="id89762" class="refsect2">

### string_session_input

String session containing CSV data will be parsed as CSV where it will
insert into the table specified as table_name the lines between
from_line and to_line offsets.

</div>

<div id="id89765" class="refsect2">

### from_line

Default - 0, This means counted from the begining.

</div>

<div id="id89768" class="refsect2">

### to_line

Default - null, This means counted to the end.

</div>

<div id="id89771" class="refsect2">

### table_name

The table the data to be inserted into.

</div>

<div id="id89774" class="refsect2">

### trx_log_mode

Default - 2. The trx_log_mode is used to do row auto commit and to log
or not the transaction. The default mode is to do not log and do auto
commit.

</div>

<div id="id89777" class="refsect2">

### opts

Default - null. The opts paramater is used to specify the delimiter and
quote it should look like this:

``` programlisting
vector ('csv-delimiter', self.delim, 'csv-quote', self.quot)
```

</div>

</div>

<div id="errors_csv_load" class="refsect1">

## Errors

If table is not suitable in respect of number of columns or type of
columns error will be signaled.

</div>

<div id="examples_csv_load" class="refsect1">

## Examples

<div id="ex_csv_load" class="example">

**Example 24.128. Simple Use**

<div class="example-contents">

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

<div id="seealso_csv_load" class="refsect1">

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
