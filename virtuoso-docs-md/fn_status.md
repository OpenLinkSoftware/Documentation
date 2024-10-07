<div id="fn_status" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

status — Returns statistics for a running server as a result set

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_status" class="funcsynopsis">

|                     |                           |
|---------------------|---------------------------|
| ` `**`status`**` (` | in `option ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_status" class="refsect1">

## Description

Depending of input parameter displays a statistics for running server.

Note that counters reported by status will be reset after server
startup.

</div>

<div id="params_status" class="refsect1">

## Parameters

<div id="id112091" class="refsect2">

### option

This option controls the level of detail of the output returned from
this procedure. Possible options are:

|                                                                                                                   |
|-------------------------------------------------------------------------------------------------------------------|
| not supplied - general statistics report including : Database, Lock, Client, Replication status will be returned. |
| 'c' - the report will contain also additional status report on running statements                                 |
| 'k' - to include index usage report                                                                               |
| 'r' - to include transactional replication status report                                                          |
| 'h' - to include hash indexes usage report                                                                        |

</div>

</div>

<div id="ret_status" class="refsect1">

## Return Types

Status returns a result set with one varchar column, one row per line of
text in the status report.

</div>

<div id="examples_status" class="refsect1">

## Example

<div id="ex_status" class="example">

**Example 24.403. Retrieving Server Status**

<div class="example-contents">

``` programlisting
SQL> status('rhck');

VARCHAR
_______________________________________________________________________________

OpenLink Virtuoso Server
Version 03.00.23NN-pthreads for Linux as of Nov 27 2002
<License information>

Database Status:
  File size 55705600, 6800 pages, 1345 free.
  2000 buffers, 180 used, 2 dirty 0 wired down, repl age 0 .
  Disk Usage: 188 reads avg 0 msec, 0% read last  80 s, 25 writes,
    7 read ahead, batch = 9.
Gate:  0 2nd in reads, 0 gate write waits, 0 in while read 0 busy scrap.
Log = demo.trx, 1597 bytes
5454 pages have been changed since last backup (in checkpoint state)
Current backup timestamp: 0x0000-0x00-0x00
Last backup date: unknown
Clients: 4 connects, max 11 concurrent, 25 licensed
RPC: 55 calls, -2 pending, 2 max until now, 0 queued
Checkpoint Remap 74 pages, 0 mapped back. 0 s atomic time.
    DB master 6800 total 1345 free 74 remap 0 mapped back
   temp  200 total 197 free

Lock Status: 0 deadlocks of which 0 2r1w, 0 waits,
   Currently 1 threads running 0 threads waiting 0 threads in vdb.
Pending:

Client 1111:5:  1944 bytes in, 29516 bytes out, 1 stmts.
Transaction status: PENDING, 1 threads.
Locks:

Running Statements:
 Time (msec) Text

Replication Status: Server  rep1.
   anonymous            anonymous                     0 OFF.
   rep1                 rep1                          0 OFF.

Index Usage:
Table         Index            Touches   Reads %Miss   Locks   Waits   %W n-dead
WS.WS.SYS_DAV_RES_TYPES SYS_DAV_RES_TYPES       254       1    0%     132       0   0% 0
VAD.DBA.VAD_REGISTRY VAD_REGISTRY              1       1   50%       1       0   0% 0
VAD.DBA.VAD_HELP   VAD_HELP                 20       1    4%      20       0   0% 0

Hash indexes

47 Rows. -- 9 msec.
```

</div>

</div>

  

</div>

</div>
