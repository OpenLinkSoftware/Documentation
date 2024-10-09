<div>

<div>

</div>

<div>

## Name

csv_table_def — Guess table definition from CSV file.

</div>

<div>

## Synopsis

<div>

|                            |                              |
|----------------------------|------------------------------|
| ` `**`csv_table_def`**` (` | in `file_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function will return table definition appropriate for CSV file
specified by file_name.

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

**Example 24.131. Simple Use**

<div>

``` programlisting
SQL>select csv_table_def('tmp/MyContacts.csv');
callret
VARCHAR
_______________________________________________________________________________

CREATE TABLE "tmp_MyContacts_csv" (
        "First_Name_Last_Name_Middle_Name_Name_Nickname_E_mail_Address_Home_Street_Home_City_Home_Postal_Code_Home_State_Home_Country_Region_Home_Phon
e_Home_Fax_Mobile_Phone_Personal_Web_Page_Business_Street_Business_City_Business_Postal_Code_Business_State_Business_Country_Region_Business_Web_Page_
Business_Phone_Business_Fax_Pager_Company_Job_Title_Department_Office_Location_Notes" VARCHAR)

1 Rows. -- 10 msec.
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

<a href="fn_csv_cols_def.html" class="link" title="csv_cols_def"><code
class="function">csv_cols_def </code></a>

</div>

</div>
