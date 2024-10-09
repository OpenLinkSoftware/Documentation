<div>

<div>

<div>

<div>

## 12.2. Database Connections

</div>

</div>

</div>

`DB.DBA.DBEV_CONNECT()`

If defined, this hook is called for each successful ODBC or JDBC
connection. The hook is only called after password and license checks
have passed. The hook is called before the server acknowledges a
successful connect and is therefore guaranteed to run before any other
action by the connected client.

The function runs in its own transaction, which is automatically
committed following successful return. Result sets may not be generated
and return values are discarded. The connection_id () and user are
defined in the function. SQL states signalled inside this hook will be
sent to the client and will cause the connection to be closed server
side.

<div>

**Example 12.2. Simple Connection Logging**

<div>

``` programlisting
create table security_log (
  sl_user varchar,
  sl_logged_in datetime,
  sl_logged_out datetime,
  primary key (sl_user, sl_logged_in)
);
```

``` programlisting
create procedure DB.DBA.DBEV_CONNECT ()
{
  dbg_obj_print (user, ' connected');
  if (user = 'NOGO')
    signal ('EAUTH', '  External Authorization Failed');
  insert into security_log (sl_user, sl_logged_in) values (user, curdatetime ());
  connection_set ('login_time', curdatetime ());
}
```

This function will print a message to the server's standard output,
check if the username of the logged in user is NOGO and disconnect the
user if so, This will thereafter insert a row into the security_log
table and set the connection variable 'login_time' to be the current
time. This information will be used at disconnect time to identify which
entry to mark closed.

</div>

</div>

  

`DB.DBA.DBEV_DSN_LOGIN (inout dsn varchar, inout user_id varchar, inout pwd varchar, ) `

If defined this function is executed just before Virtuoso makes
connections to remote data sources. It can change all of it's inout
parameters depending on it's logic.

<div>

**Example 12.3. Remote Connection Hook**

<div>

This examples contains a sample DBEV_DSN_LOGIN hook that will be called
just before the Virtual Database connection to a datasource is made. The
following parameters can be used in this function as demonstrated in
this example:

|                                                                                     |
|-------------------------------------------------------------------------------------|
| <span class="emphasis">*dsn*</span> : the dsn to connect to                         |
| <span class="emphasis">*user_id*</span> : the user id used in connecting to the DSN |
| <span class="emphasis">*pwd*</span> : the password used in connecting to the DSN    |

``` programlisting
create procedure "DB"."DBA"."DBEV_DSN_LOGIN"
(in dsn varchar,
 inout user_id varchar,
 inout pwd varchar)
{
  if (user_id = 'U1' and pwd = 'U1')
    {
      -- map U1 to U2
      dbg_obj_print ('mapping U1 to U2');
      user_id := 'U2';
      pwd := 'U2';
    }
   dbg_obj_print (dsn, user_id, pwd);
};
```

</div>

</div>

  

</div>
