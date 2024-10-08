<div>

<div>

</div>

<div>

## Name

replay — starts the roll forward of the given log

</div>

<div>

## Synopsis

<div>

|                     |                             |
|---------------------|-----------------------------|
| ` `**`replay`**` (` | in `log_file ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This starts a roll forward of the given log. The log may have been
produced by normal transaction logging, backup or crash dump. Logs may
not be transferred between databases and thus cannot be rolled forward
anywhere except on the database that generated them.

This function is for example useful after restoring a backup. It should
be called for each archived transaction log produced since the backup,
including and starting with the one that was current when the backup was
made.

The operation blocks until the roll forward is complete. Other clients
are not affected.

</div>

<div>

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

<div>

**Table 24.75. Errors signalled by**

<div>

| sqlstate                              | error code                            | error text                                                                                         |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------|
| <span class="errorcode">25000 </span> | <span class="errorcode">SR074 </span> | <span class="errortext">replay must be run in a fresh transaction. </span>                         |
| <span class="errorcode">42000 </span> | <span class="errorcode">FA002 </span> | <span class="errortext">Can't open file \<fname\>, error \<OS errno\> (\<OS description\>) </span> |

</div>

</div>

  

</div>

<div>

## Parameters

<div>

### log_file

Full pathname of file containing the transactions to be replayed. The
file must be produced by
<a href="fn_backup.html" class="link" title="backup">backup</a> .

</div>

</div>

<div>

## Return Values

Zero, if no error is signalled.

</div>

<div>

## Examples

<div>

**Example 24.318. Replaying A Log File**

<div>

``` programlisting
checkpoint 'new.log';
backup 'bak.log';
shutdown 'new2.log';
```

The above sequence of commands makes a checkpoint and starts logging
subsequent transactions into new.log. The backup statement makes
bak.log, which represents the state prior to starting new.log. The
shutdown statement makes a new checkpoint and marks new2.log as the log
file to be used for logging transactions after the database restarts.
The database server exits at the completion of the SHUTDOWN statement.

``` programlisting
replay ('bak.log');
replay ('new.log');
```

These statements executed on an empty database will recreate the state
in effect after the last transaction to commit before the SHUTDOWN
statement of the previous example.

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_backup.html" class="link" title="backup">backup</a>

</div>

</div>
