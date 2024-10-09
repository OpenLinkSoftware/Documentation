<div>

<div>

<div>

<div>

### 17.2.3. Exposing Third Party SQL Stored Procedures as WSDL-Compliant Web Services

</div>

</div>

</div>

Virtuoso can expose any of its available PL resource to the SOAP world,
and subsequently to the WDSL file. This includes data from remote
attached tables and procedures. All you have to do is make sure that the
entry point exists as a stored procedure in the correct namespace with
the appropriate grants, as before.

<div>

|                            |                                                                                                                                                |
|:--------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also                                                                                                                                       |
|                            | The <a href="ch-vdbengine.html#thevdb" class="link"                                                                                            
                              title="8.1. Virtual Database (VDB) Engine">Virtual Database</a> chapter for information regarding use of remote data sources and their tables.  |

</div>

Because remote procedures may not be directly compatible you are
required to write a Virtuoso wrapper function first to handle the remote
procedure. Below is a sample MS SQLServer procedure and an accompanying
Virtuoso wrapper function. The MS SQLServer function returns a result
set based on a simple join query with a filter input. The Virtuoso
procedure calls the remote procedure, iterates through the result set
returned and produces XML output.

MS SQLServer procedure:

``` programlisting
create procedure ms_remote
        @mask varchar(15)
as
  select c.CustomerID, c.CompanyName, o.OrderDate,
      o.ShippedDate,ol.ProductID, ol.Quantity, ol.Discount
    from Northwind..Customers c
      inner join Northwind..Orders o on c.CustomerID = o.CustomerID
      inner join Northwind.."Order Details" ol on o.OrderID = ol.OrderID
    where c.CustomerID like @mask
;
```

Virtuoso wrapper function:

``` programlisting
create procedure WS.SOAP.ms_remote_call (
  in dsn varchar, in uid varchar, in pwd varchar, in mask varchar)
{
  declare m, r, ses any;
  vd_remote_data_source (dsn, '', uid, pwd);
  rexecute (dsn, 'ms_remote ?', null, null, vector (mask), 1000, m, r);
  ses := string_output ();
  http ('<?xml version="1.0" ?>\n<remote>\n', ses);
  if (isarray(m) and isarray (r))
    {
      declare i, l, j, k integer;
      declare md, rs any;
      md := m[0];
      i := 0; l := length (md); k := length (r); j := 0;
      while (j < k)
       {
     http ('<record ', ses);
         i:=0;
         while (i < l)
           {
         dbg_obj_print (md[i][0],r[j][i]);
         http (sprintf (' %s="%s"', trim(md[i][0]), trim(cast (r[j][i] as varchar))), ses);
             i := i + 1;
       }
     http (' />\n', ses);
         j := j + 1;
       }
    }
  http ('</remote>', ses);
  return string_output_string (ses);
};
```

Now, as before, we grant execute rights to the SOAP user:

``` programlisting
grant execute on WS.SOAP.ms_remote_call to SOAP;
```

The third-party procedures can now be accessed via SOAP and are listed
in the WSDL file.

</div>
