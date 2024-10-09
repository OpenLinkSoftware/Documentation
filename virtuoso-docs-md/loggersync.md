<div>

<div>

<div>

<div>

### 13.6.2. Synchronization

</div>

</div>

</div>

``` programlisting
create procedure log_sync ()
{
  for select SERVER, ACCOUNT from SYS_REPL_ACCOUNTS do
    {
      if (SERVER <> repl_this_server ())
    {
      declare err, msg varchar;
      err := '00000';
      exec ('repl_sync (?, ?, ?, ?)', err, msg, vector (SERVER, ACCOUNT, 'dba', 'dba'), 0);
    }
    }
}
```

This procedure will go through all subscriptions and request sync for
each. Note that the repl_sync function is called inside exec to catch
any possible exceptions, as servers may not be available etc. For the
sake of simplicity this supplies the literal default dba login 'dba',
'dba' as authentication.

The replication sample schedules a call to this function to be made
every minute as a background job. if all replication servers are on line
and in sync or syncing the function will return without delay or effect.
Otherwise it will keep trying until it gets a connection.

</div>
