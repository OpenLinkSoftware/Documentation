<div id="clusterstcnftrsh" class="section">

<div class="titlepage">

<div>

<div>

### 2.14.6. Troubleshooting Tips

</div>

</div>

</div>

If an operation seems to hang, see the output of:

``` programlisting
status ()
```

Check for the presence of the following conditions:

<div class="itemizedlist">

- The cluster line shows 0% CPU, no message traffic and an unchanging
  number of buffers wired, this is probably a bug. To reset, restart the
  cluster or the offending process if found. Restart is done by
  executing:

  ``` programlisting
  raw_exit ();
  ```

  over an SQL connection to the process in question.

- The cluster line shows many threads waiting compared to total threads.
  If CPU is 0 and this does not change there could be a transaction that
  holds locks indefinitely. To clear, execute:

  ``` programlisting
  txn_killall (1);
  ```

  Do this at a node that has local threads waiting. This is seen in the
  Lock Status paragraph of status ('') when connected to the node in
  question.

- The cluster line shows a changing number in the pfs field. The system
  is swapping and slowed down.

- If the status () itself hangs, try another process of the cluster. See
  that there is no temporary atomic activity like a long checkpoint. If
  the situation persists there is a bug. The checkpoint can be seen by
  the presence of the

  <span class="emphasis">*checkpinmt_in_progress*</span>

  file in each server's working directory.

- To check the integrity of database files, do:

  ``` programlisting
  cl_exec ('backup ''/dev/null''');
  ```

  If this returns, the databases are OK. If one is found to be corrupt
  the corresponding server exits.

</div>

</div>
