<div id="execsqlprocfork" class="section">

<div class="titlepage">

<div>

<div>

## 11.9. Execute Stored Procedures In Background

</div>

</div>

</div>

You can start procedure in background using the \[name of the
procedure\]\[params\]& syntax. This feature forks another ISQL process
and leaves the other on background so there will be two separate clients
running separate client connections:

``` programlisting
SQL>create procedure test()
{
return 'my simple test';
}
;
Done. -- 0 msec.
SQL>test()&
SQL> Connected to OpenLink Virtuoso
Driver: 05.07.3033 OpenLink Virtuoso ODBC Driver
OpenLink Interactive SQL (Virtuoso), version 0.9849b.
Type HELP; for help and EXIT; to exit.

Done. -- 10 msec.
```

See <a href="asyncexecmultithread.html" class="link"
title="11.12. Asynchronous Execution and Multithreading in Virtuoso/PL">Asynchronous
Execution and Multithreading in Virtuoso/PL</a> for background jobs
execution details.

</div>
