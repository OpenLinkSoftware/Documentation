<div>

<div>

<div>

<div>

### 23.3.2. Signals

</div>

</div>

</div>

<div>

**Table 23.3. Signals**

<div>

| Signal | Name    | Category | Comment                                                                                                      |
|:-------|---------|----------|--------------------------------------------------------------------------------------------------------------|
| 1      | SIGHUP  | NORMAL   | Initiate quick shutdown when shell exits while running virtuoso in foreground mode                           |
| 2      | SIGINT  | NORMAL   | User pressed CTRL-C on Virtuoso running in foreground mode to initiate normal shutdown                       |
| 3      | SIGQUIT | NORMAL   | User pressed CTRL-\\ on Virtuoso running in foreground mode to initiate quick shutdown                       |
| 4      | SIGILL  | FAULT    | Illegal instruction resulting in a program crash                                                             |
| 7      | SIGBUS  | FAULT    | Misaligned mem read/write resulting in a program crash                                                       |
| 8      | SIGFPE  | FAULT    | Divide by 0 or other arithmetical error                                                                      |
| 9      | SIGKILL | SPECIAL  | Terminate Virtuoso without flushing dirty pages etc. This signal should NOT be used under normal operations. |
| 11     | SIGSEGV | FAULT    | Buffer/stack overrun resulting in a program crash                                                            |
| 13     | SIGPIPE | IGNORED  | Other side of a pipe was killed while this side tried to write data to it                                    |
| 15     | SIGTERM | NORMAL   | Initiate quick shutdown                                                                                      |

</div>

</div>

  

Signals that are marked as <span class="emphasis">*NORMAL*</span>
indicate that these signals can be sent by root or the owner of the
virtuoso process to shutdown Virtuoso. The
<span class="emphasis">*SIGINT*</span> and
<span class="emphasis">*SIGQUIT*</span> signals also work when Virtuoso
is running in background mode and can be used in shell scripts.

Signals that are marked as <span class="emphasis">*FAULT*</span>
indicate an abnormal condition which should be checked. If enabled (e.g.
with ulimit -c unlimited), the operating system can write a core dump
allowing post-mortem debugging if the Virtuoso executable was compiled
with debugging symbols.

Signals that are marked as <span class="emphasis">*IGNORED*</span> are
handled inside Virtuoso.

The <span class="emphasis">*SIGTERM*</span> signal is mostly used by
rc.d type shell scripts on Unix/Linux which are called during shutdown,
but can also be used inside shell scripts.

The <span class="emphasis">*SIGKILL*</span> signal should only be used
as a last resort when all other efforts to stop Virtuoso have failed.

<div>

<div>

<div>

<div>

#### Quick shutdown

</div>

</div>

</div>

In quick shutdown mode, Virtuoso will only flush dirty disk buffers,
close transaction log and database files and exit to the operating
system. Since Virtuoso does not perform a checkpoint, the next startup
will take extra time as Virtuoso first needs to perform a rollback and a
checkpoint before it can resume operation. The
<span class="emphasis">*SIGTERM*</span> signal mostly used by rc.d type
scripts on Unix/Linux which are called during shutdown as such instances
it is better to quickly finish operations and delay the checkpoint until
the next boot.

</div>

<div>

<div>

<div>

<div>

#### Normal shutdown

</div>

</div>

</div>

In normal shutdown mode, Virtuoso will do first do a full checkpoint,
then flush dirty disk buffers, close transaction log and database files
before exiting to the operating system. Depending on the size of the
transaction log this can take some time. The
<span class="emphasis">*SIGINT*</span> signal can be used in stop
scripts to cleanly shutdown the database by the dba or by root.

Note that in all cases signals can only be sent by the kernel, the root
user or the uid of the person who started Virtuoso. Anyone else that
wants to shutdown the Virtuoso instance should use the isql program to
connect to Virtuoso and run the 'shutdown' command.

</div>

</div>
