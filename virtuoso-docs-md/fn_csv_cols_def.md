<div>

<div>

</div>

<div>

## Name

csv_cols_def — Guess columns and column types from CSV file.

</div>

<div>

## Synopsis

<div>

|                           |                              |
|---------------------------|------------------------------|
| ` `**`csv_cols_def`**` (` | in `file_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function will try to guess the columns by given CSV file. It would
work if CSV file begins with a header row.

</div>

<div>

## Parameters

<div>

### file_name

The name of the CSV file.

</div>

</div>

<div>

## Examples

<div>

**Example 24.130. Simple Use**

<div>

``` programlisting
SQL>create procedure my_csv_get_columns (in file_name varchar)
{
   dbg_obj_print(csv_cols_def(file_name));
}
;

Done. -- 10 msec.

SQL>select my_csv_get_columns('tmp/MyContacts.csv');
callret
VARCHAR
______________________

0

1 Rows. -- 10 msec.
-- and on the Virtuoso Server console will be shown:

(('First_Name_Last_Name_Middle_Name_Name_Nickname_E_mail_Address_Home_Street_Home_City_Home_Postal_Code_Home_State_Home_Country_Region_Home_Phone_Home
_Fax_Mobile_Phone_Personal_Web_Page_Business_Street_Business_City_Business_Postal_Code_Business_State_Business_Country_Region_Business_Web_Page_Busine
ss_Phone_Business_Fax_Pager_Company_Job_Title_Department_Office_Location_Notes' 'VARCHAR' ) )
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

<a href="fn_csv_parse.html" class="link" title="csv_parse"><code
class="function">csv_parse </code></a>

<a href="fn_csv_table_def.html" class="link" title="csv_table_def"><code
class="function">csv_table_def </code></a>

</div>

</div>
