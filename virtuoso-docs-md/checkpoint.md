<div id="checkpoint" class="section">

<div class="titlepage">

<div>

<div>

## 9.21. CHECKPOINT, SHUTDOWN Statement

</div>

</div>

</div>

``` programlisting
admin_statement
    : SHUTDOWN opt_log
    | CHECKPOINT opt_log
    | BACKUP opt_log
    ;
```

The checkpoint is a point in the history of a database where all the
state is written on disk as a single, consistent image that contains all
the state committed so far and no uncommitted state. A transaction log
starts after a checkpoint and contains the information to allow the
recreation of the effect of transactions committed since the checkpoint.
The checkpoint state and the transaction log together allow recovering
the database up to the last committed transaction.

The CHECKPOINT statement forces a checkpoint to be made. Making the
checkpoint allows starting a new transaction log. If no new log name is
specified the old log is truncated to length 0 and reused for logging
transactions. If the CheckpointAuditTrail option is enabled in
virtuoso.ini a new log will be started even if no new log is specified
in the checkpoint or shutdown statement.

The SHUTDOWN statement performs a CHECKPOINT, and terminates the server
upon completion.

BACKUP is an alternate notation for backup().

<div id="id34075" class="example">

**Example 9.38. Examples:**

<div class="example-contents">

``` programlisting
checkpoint 'new.log';
backup 'bak.log';
shutdown 'new2.log';
```

</div>

</div>

  

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

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                  |
|:--------------------------:|:-----------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also                                                                                                         |
|                            | The <a href="ch-functions.html#backup" class="link">Backup section</a> for more backup and recovery information. |

</div>

<div id="id34085" class="example">

**Example 9.39. Example for control the transaction logging:**

<div class="example-contents">

``` programlisting
create procedure log_test ()
{
  -- disable the transaction logging
  log_enable (0);

  -- action code, for ex.:
  delete from TAG_REL_INX;
  insert into TAG_REL_INX (TR_T1, TR_T2, TR_COUNT) select TR_T1, TR_T2, TR_COUNT from TAG_REL;

  exec('checkpoint');

  -- enable the transaction logging
  log_enable (1);
};
```

</div>

</div>

  

<div id="checkpointparams" class="section">

<div class="titlepage">

<div>

<div>

### 9.21.1. Checkpoint & Page Remapping

</div>

</div>

</div>

In concept, making a checkpoint consists of writing the last committed
state of a page on the read-only pre-checkpoint state. This is in case
the page existed before the previous checkpoint. If the page was created
after the last checkpoint, making the checkpoint consists of just
writing it to disk. Now if the number of pages modified between
checkpoints largely exceeds the amount of RAM, the checkpoint will be a
disk-to-disk copy process which takes a time proportional to the number
of modified pages. This can take a long time. Virtuoso offers a
mechanism called checkpoint remap. This allows making a committed state
persistent, i.e. safe, without copying all the delta collected since the
last checkpoint over the pre-checkpoint state.

The checkpoint remap mechanism means that a page, say number 12 get
remapped to 15 when updated. Suppose now that the page were written to
disk. Now we have the pre-checkpoint page on 12 and the committed post
checkpoint state on 15. If a checkpoint now takes place, instead of
copying 15 over 12, which may involve reading the page, we just write
that 12 is actually on 15. This speeds up the checkpoint but causes one
page to take the space of 2. Now suppose 12 were modified again, now we
would see that the pre checkpoint page is 15 and that the original 12 is
free. The page now gets mapped to 12. The next checkpoint now will mark
that 12 is 12, which was the original condition and 15 is free.

The mechanism is actually more complex but this is the basic idea. By
allowing a page to occupy two pages in some situations we dramatically
cut down on atomic checkpoint time and improve availability.

Now we may argue that this destroys locality since pages that were
created contiguous are no longer that after an update. This is why there
is also a mechanism called unremap. and there is an upper limit to
checkpoint remaps. If every page were updated between checkpoints, they
would alternately be in their original place or in a remote place from
which the next update-checkpoint combination would return them to the
original. Now this is not always the case. Also there is not always
enough space to keep up to three copies of each page. Therefore there is
an unremap mechanism and an upper limit to checkpoint remaps.

The *`MaxCheckpointRemap`* parameter in the
<a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">virtuoso.ini</a> file controls how
many pages may be stored on a page other than their logical page. The
*`UnremapQuota`* parameter in the
<a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">virtuoso.ini</a> file controls how
many previously remapped pages are unremapped each time a checkpoint is
made.

Having an unlimited MaxCheckpointRemap and zero UnremapQuota will cause
a checkpoint to consist exclusively of a flush of dirty buffers. The
downside is that a page can take the space of two for an unlimited
period of time and that original locality is not maintained. Setting the
maximum checkpoint remap to zero in such a situation causes the next
checkpoint to unremap all checkpoint remapped pages, restoring physical
sequence and freeing disk space.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                               |
|:--------------------------:|:----------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                     |
|                            | The TPC C Benchmark chapter for examples of checkpoint remapping in use on test environments. |

</div>

</div>

</div>
