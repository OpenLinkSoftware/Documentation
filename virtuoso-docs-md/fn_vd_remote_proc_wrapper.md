<div>

<div>

</div>

<div>

## Name

vd_remote_proc_wrapper — Creating a PL wrapper for remote procedure
execution

</div>

<div>

## Synopsis

<div>

|                                            |                                |
|--------------------------------------------|--------------------------------|
| `varchar `**`vd_remote_proc_wrapper`**` (` | in `dsn ` varchar ,            |
|                                            | in `remote_name ` varchar ,    |
|                                            | in `local_name ` varchar ,     |
|                                            | in `metadata ` any ,           |
|                                            | out `status_code ` varchar ,   |
|                                            | out `error_message ` varchar , |
|                                            | in `make_resultset ` integer , |
|                                            | in `description ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This is to create a PL stored procedure to execute a Remote Stored
Procedures. It returns results as a SQL result set as well as an
array(vector) depending of the 'make_resultset' flag.

</div>

<div>

## Parameters

<div>

### dsn

the remote datasource name

</div>

<div>

### remote_name

name of the remote procedure

</div>

<div>

### local_name

name of the PL wrapper to be created locally

</div>

<div>

### metadata

A vector of vectors containing a parameters information each of vectors
need to have following structure:

|                                                                                                      |
|------------------------------------------------------------------------------------------------------|
| type of parameter - 'IN'/'OUT'/'INOUT'                                                               |
| name of parameter - the name of parameter                                                            |
| data type - SQL datatype of parameter as string (for example 'VARCHAR', 'INT' etc.)                  |
| SOAP type - a XSD/custom datatype for SOAP/WSDL actions (if not needed, must be empty string ie. '') |

</div>

<div>

### status_code

returns SQL status code of the PL wrapper generation

</div>

<div>

### error_message

returns the error message if status code is different than 00000

</div>

<div>

### make_resultset

A flag 0/1 default 0. If is true (1) the wrapper will be generated to
return result set. Otherwise will be generated to return an array.

</div>

<div>

### description

The text of a comment to added to the wrapper. It then will be shown as
a method description if the PL wrapper is published as a SOAP method.

</div>

</div>

<div>

## Examples

<div>

**Example 24.438. Creating a PL wrapper which returns resultset**

<div>

The following example will create a PL wrapper to invoke the MS
SqlServer Stored Procedure 'Northwind.dbo.CustOrderHist'

``` programlisting
-- the wrapper creation (fragment of Virtuoso/PL)   
declare state, msg varchar;
vd_remote_proc_wrapper ('Northwind.dbo.CustOrderHist', 'MS.SQL.CustOrderHist', 
'sql_lite', vector (vector ('IN', '_CustomerID', 'VARCHAR', '')), state, msg , 1, 'This is a test');
if (state <> '00000')
  signal (state, msg);

-- PL wrapper source that will be created   
create procedure "MS"."SQL"."CustOrderHist" (IN "_CustomerID" VARCHAR) returns any array array
{ 
--PL Wrapper for remote procedure
--##This is a test
--"DSN:sql_lite PROCEDURE:Northwind.dbo.CustOrderHist"
declare dta, mdta any; 
declare params any; 
params := vector ("_CustomerID"); 
set_user_id ('dba');
rexecute ('sql_lite', '{call "Northwind"."dbo"."CustOrderHist" (?)}', NULL, NULL, params, 0, mdta, dta); 
exec_result_names(mdta[0]);
declare i, l integer;
i := 0; l := length (dta);
 while(i<l) {
   exec_result(dta[i]);
   i:=i+1;
 }
}

-- result from execution
SQL> "MS"."SQL"."CustOrderHist" ('ALFKI');
ProductName                               Total
VARCHAR NOT NULL                          INTEGER
_______________________________________________________________________________

Aniseed Syrup                             6
Chartreuse verte                          21
Escargots de Bourgogne                    40
Flotemysost                               20
Grandma's Boysenberry Spread              16
Lakkalikri                                15
Original Frankfurter grne Soe             2
Raclette Courdavault                      15
Rssle Sauerkraut                          17
Spegesild                                 2
Vegie-spread                              20

11 Rows. -- 18 msec.

      
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_rexecute.html" class="link" title="rexecute">rexecute</a>
<a href="fn_vd_remote_data_source.html" class="link"
title="vd_remote_data_source">vd_remote_data_source</a>

</div>

</div>
