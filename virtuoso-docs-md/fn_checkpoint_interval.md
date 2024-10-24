<div>

<div>

</div>

<div>

## Name

checkpoint_interval — Configure database checkpointing

</div>

<div>

## Synopsis

<div>

|                                         |                            |
|-----------------------------------------|----------------------------|
| `integer `**`checkpoint_interval`**` (` | in `minutes ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function changes the database checkpointing interval to the given
value in minutes. It may also be used to disable checkpointing in two
ways: By setting checkpoint interval to 0, the checkpoint will only be
performed after roll forward upon database startup. A setting of -1 will
disable all checkpointing. Main use for this function is to ensure a
clean online backup of the database slices. Copying of the database may
take long and checkpointing would modify those files in mid-copy, thus
rendering the resulting copy unusable. In case the system should, for
some reason or another, become unstable, it is sometimes better to
disable checkpointing after a database restart to resume backing up from
where it was left prior to a system crash. Disabling all checkpointing
by giving checkpoint_interval the value of -1 will do just that.

The interval setting will be saved in the server configuration file as
value of CheckpointInterval in section \[Parameters\], thus it will
persist over consecutive server shutdown/restart cycles. A long
checkpoint_interval setting will produce longer transaction logs, which
in turn prolongs the time it takes for the database to perform a roll
forward upon restart in case it was shut down without making a
checkpoint.

</div>

<div>

## Parameters

<div>

### minutes

<span class="type">integer </span> number of minutes between
checkpoints.

</div>

</div>

<div>

## Return Types

Previous value of CheckpointInterval in the configuration file as an
integer.

</div>

<div>

## Errors

<a href="datatypeerror.html" class="link"
title="23.2.2. Data Type Errors">Parameter data type checking errors</a>

</div>

<div>

## Examples

<div>

**Example 24.41. Simple examples**

<div>

Disable checkpoints:

``` screen
SQL> checkpoint_interval(-1);

Done. -- 25 msec.
```

Re-enable checkpoints (every 2 hrs):

``` screen
SQL> checkpoint_interval(120);
callret
VARCHAR
______________________________________________________

-1

Done. -- 4 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_backup.html" class="link" title="backup"><code
class="function">backup </code></a>

<a href="ch-server.html#configsrvstupfiles" class="link"
title="Configuring Server Startup Files">CheckpointInterval setting in
Configuring Server Startup Files section</a>

</div>

</div>
