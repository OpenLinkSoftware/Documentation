<div>

<div>

<div>

<div>

### 2.14.3. Backup and Restore

</div>

</div>

</div>

<span class="emphasis">*Backup*</span>

There are 2 ways to backup Virtuoso Cluster DB:

<div>

1.  Backup every node using
    <a href="fn_backup_online.html" class="link" title="backup_online"><code
    class="function">back_online</code></a> <span class="emphasis">*For
    example, for every cluster in its backup folder execute:*</span>

    ``` programlisting
    SQL> backup_online('dbp',10000000,0,vector('backup'));

    Done. -- 272 msec.
    ```

2.  Make backup of all nodes at once using
    <a href="fn_cl_exec.html" class="link" title="cl_exec">cl_exec()</a>
    . For example, execute:

    ``` programlisting
    SQL> cl_exec ('backup_online (''dbp'', 10000000, 0,  vector (''backup''))');

    Done. -- 573 msec.
    ```

</div>

<span class="emphasis">*Restore from Backup*</span>

After backup is done for every node in its backup folder, in order to
restore, execute from the ..\bin folder the virtuoso-restore.sh:

``` programlisting
# . ./virtuoso-restore.sh all dbp
```

where the second parameter is the restore prefix.

</div>
