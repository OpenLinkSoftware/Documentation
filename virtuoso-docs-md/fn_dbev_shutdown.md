<div>

<div>

<div>

<div>

## 12.5. Database Shutdown

</div>

</div>

</div>

`DB.DBA.DBEV_SHUTDOWN()`

If defined, this function is called when shutting down the server,
following disconnection of all clients and making a checkpoint. When a
disconnect occurs as a result of server shutdown the DBEV_DISCONNECT
hook is not called and this function is expected to perform any logout
processing. The rationale is that all disconnect hooks would be called
at the same time, creating likely deadlocks, resource contention and
there could be no guarantee of time consumed by them or of even whether
they would terminate at all.

The shutdown will do a checkpoint before calling this hook. This
checkpoint will terminate all transactions with a deadlock state. If
transactions contain automatic retries, etc..., we cannot guarantee that
all activity would have terminated when this hook starts. However, the
hook function can try

``` programlisting
txn_killall (6);
rollback work;
```

to signal an error on all other transactions to prompt them to
terminate. Again, this is not a sure-fire termination since this could
be handled by procedures.

When this hook returns the server commits the transaction in which this
was running and exits regardless of any lingering activity. There is no
hard time limit for this function. Killing the process during this
function has no specific ill effect, besides losing uncommitted work by
said function.

Result sets are prohibited, return values are discarded, errors are
logged but not otherwise processed.

<div>

**Example 12.6. The Shutdown Hook**

<div>

``` programlisting
create procedure DB.DBA.DBEV_SHUTDOWN ()
{
  dbg_obj_print (' server shut down.');
  update security_log set sl_logged_out = now () where sl_logged_out is null;
}
```

This just marks all open connections to be disconnected at the current
time.

</div>

</div>

  

</div>
