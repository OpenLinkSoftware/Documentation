<div id="notresphttp" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.29. What should I do if the Virtuoso Server is not responding to HTTP requests?

</div>

</div>

</div>

Assume the Virtuoso server is not responding to HTTP requests although
SQL connection is working. In order to determine what activity is being
performed that might account for this:

<div class="orderedlist">

1.  Check the status:

    ``` programlisting
    SQL> status('');
    REPORT
    VARCHAR
    _______________________________________________________________________________

    OpenLink Virtuoso VDB Server
    Version 06.02.3129-pthreads for Linux as of Mar 16 2011
    Registered to Uriburner (Personal Edition, unlimited connections)
    Started on: 2011/03/17 10:49 GMT+60

    Database Status:
      File size 0, 37598208 pages, 7313125 free.
      1000000 buffers, 993399 used, 76771 dirty 0 wired down, repl age 25548714 0 w. io 0 w/crsr.
      Disk Usage: 2642884 reads avg 4 msec, 30% r 0% w last  1389 s, 1557572 writes,
        15331 read ahead, batch = 79.  Autocompact 308508 in 219226 out, 28% saved.
    Gate:  71130 2nd in reads, 0 gate write waits, 0 in while read 0 busy scrap.
    Log = virtuoso.trx, 14922248 bytes
    VDB: 0 exec 0 fetch 0 transact 0 error
    1757362 pages have been changed since last backup (in checkpoint state)
    Current backup timestamp: 0x0000-0x00-0x00
    Last backup date: unknown
    Clients: 5 connects, max 2 concurrent
    RPC: 116 calls, -1 pending, 1 max until now, 0 queued, 2 burst reads (1%), 0 second brk=9521074176
    Checkpoint Remap 331113 pages, 0 mapped back. 1180 s atomic time.
        DB master 37598208 total 7313125 free 331113 remap 40593 mapped back
       temp  569856 total 569851 free

    Lock Status: 52 deadlocks of which 0 2r1w, 86078 waits,
       Currently 1 threads running 0 threads waiting 0 threads in vdb.
    Pending:

    25 Rows. -- 1274 msec.
    SQL>
    ```

2.  Connect with the PL debugger and see what is running currently using
    the info threads call:

    ``` programlisting
    $ isql 1111 dba <password> -D
    DEBUG> info threads
    ```

3.  This should return the current code being executed by the Sever.

4.  Run
    <a href="fn_txn_killall.html" class="link" title="txn_killall"><code
    class="function">txn_killall()</code></a> to kill any pending
    transactions which may enable the server to start responding to HTTP
    requests again:

    ``` programlisting

    SQL> txn_killall();

    Done. -- 866 msec.
    ```

</div>

</div>
