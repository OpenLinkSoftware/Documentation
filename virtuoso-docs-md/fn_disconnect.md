<div>

<div>

<div>

<div>

## 12.4. Database Disconnections

</div>

</div>

</div>

`DB.DBA.DBEV_DISCONNECT()`

If defined, this procedure is called after a connection has been found
to be disconnected, either as a result of the client process
disconnecting, the client process terminating or the server deciding to
disconnect, see <a href="fn_disconnect_user.html" class="link"
title="disconnect_user">disconnect_user()</a> . This will also be called
if the DBEV_CONNECT hook signals an error, leading to the connection
being closed during the connect sequence.

All activity on behalf of the disconnecting client is terminated by the
time this function is called. This function runs in its own transaction.
Result sets are prohibited, return values discarded and errors are
logged in the error log file but not otherwise processed. The
transaction is committed regardless of errors. The user and
connection_id and any connection variables are defined during this hook.

<div>

**Example 12.5. Disconnect Interception**

<div>

``` programlisting
create procedure DB.DBA.DBEV_DISCONNECT ()
{
  declare ctime datetime;
  dbg_obj_print (user, ' disconnected');
  ctime := connection_get ('login_time');
  update security_log set sl_logged_out = now () where
    sl_user = user and sl_logged_in = ctime;
  if (row_count () = 0)
    signal ('ELOGO', 'Logout by user with no login record.  This occurs when DBEV_CONNECT denied permission');
}
```

This function updates the row created by the connect hook to set the
logout time.

</div>

</div>

  

</div>
