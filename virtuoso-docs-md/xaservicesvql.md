<div>

<div>

<div>

<div>

### 22.3.2. VQL functions

</div>

</div>

</div>

VQL functions are used to receive access to hdbc for further work with
the Virtuoso server. Only HDBCs received by the VQL functions are
operated in the context of the distributed transactions.

``` programlisting
                int vql_get_connection (HDBC * hdbc, int type);
            
```

returns result of setting hdbc to current hdbc connection. "type"
argument indicates which hdbc is to select, currently only VQL_CTX_TYPE
is supported, other values are reserved.

``` programlisting
            int vql_get_env (HENV * env);
            
```

returns result of setting current ODBC environment.

Header: vql_client.h

Library: libvirtxa.a

</div>
