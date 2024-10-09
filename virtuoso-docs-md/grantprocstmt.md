<div>

<div>

<div>

<div>

### 11.7.2. Grant Execute Statement

</div>

</div>

</div>

``` programlisting
GRANT EXECUTE ON procedure_name TO "{USER | ROLE}" ;
```

The identifier quote character (double quotes) is important usage
information since it indicates that the USER or ROLE has a literal
identifier. Just as a reference (e.g., URL or URI) has the identifier
quote characters "\<" and "\>" .

The grantee should have SQL rights in order execution of procedure to be
granted to this user. The rights can be set from Conductor-\>System
Admin-\>User Accounts-\>Account-\>Edit-\>User Type:

<div>

<div>

**Figure 11.1. User Type**

<div>

<div>

![User Type](images/ui/usrt.png)

</div>

</div>

</div>

  

</div>

<span class="emphasis">*Example*</span>

``` programlisting
SQL>create procedure DB.DBA.SimplePrint (in txt varchar)
{
 return sprintf('Output is %s', txt);
}
;

Done. -- 0 msec.

SQL>grant execute on DB.DBA.SimplePrint to "demo";

Done. -- 0 msec.

SQL>use demo;

Done. -- 0 msec.

SQL>select DB.DBA.SimplePrint('Virtuoso');

callret
VARCHAR
_______________________________________________________________________________

Output is Virtuoso

1 Rows. -- 0 msec.
```

</div>
