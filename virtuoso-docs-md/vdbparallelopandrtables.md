<div id="vdbparallelopandrtables" class="section">

<div class="titlepage">

<div>

<div>

## 8.14. Parallel Operations and Bulk Data Transfer with Remote Tables

</div>

</div>

</div>

Especially when bulk copying data from a remote database into Virtuoso,
parallel operation is essential for performance.

From version 7.00.3206, automatic query parallelization applies to
selected remote table operations.

If read committed isolation is sufficient for remote table access, the
remote table access is automatically parallelized if there is an integer
key in the remote table that can be used for partitioning.

When the table is attached or when its statistics are updated with
sys_stat_analyze, the remote schema is read and if there is a numeric
first part of primary key, its minimum and maximum values are read.
Samples of rows are read from the table at different ranges between the
minimum and maximum and the values are used for filling in column value
statistics in sys_col_stat.

If a remote table operation has no condition on the first part of
primary key, a range condition is automatically added if the scan of the
remote table is the first in a sequence of nested joins. This is the
case for example when scanning the table inside a group by, order by,
hash join build side or other operation that does not immediately return
rows to the client. The number of parallel ranges is given by
ThreadsPerQuery in the ini file, accessed as enable_qp with sys_stat and
\_\_dbf_set. In a cluster setting, the same DSN is expected to be
defined on all processes. The cluster splitting will scan a range per
each slice of the elastic cluster.

The lowest range does not specify a low bound and the highest does not
specify an upper bound, thus the min and max of the range column do not
have to be exactly up to date.

It may be that the primary key of the remote table does not start with a
numeric column. If this is the case but there still exists a column
usable for splitting a scan, one can create the table in Virtuoso and
declare the splitting column as first in the primary key. One can then
use vd_remote_table to declare the modified table as remote and use
sys_stat_analyze for getting the statistics. After this, parallel scans
with the selected column used for setting ranges can be done.

Use the explain function to verify that a scan is actually parallel. One
expects to see the text of the remote select followed by "split by range
of \<column name\>" below the text of the remote statement.

In a parallel scan each range is scanned over a different connection.
The transaction contexts are independent and the isolation cannot be
higher than read committed. Setting a higher isolation level or
selecting for update disables the parallel scan feature.

The below snippet copies a table from another Virtuoso.

``` programlisting
use R1;
ATTACH TABLE lineitem
        FROM '1208'
        USER 'dba'
    PASSWORD 'dba';
```

This makes a a remote table R1.1208.LINEITEM. This is the lineitem table
from the DSN "1208".

Now make a local table:

``` programlisting
use DB;
CREATE TABLE LINEITEM (
    L_ORDERKEY        INTEGER NOT NULL,
    L_PARTKEY         INTEGER NOT NULL,
    L_SUPPKEY         INTEGER NOT NULL,
    L_LINENUMBER      INTEGER NOT NULL,
    L_QUANTITY        double precision NOT NULL,
    L_EXTENDEDPRICE   double precision NOT NULL,
    L_DISCOUNT        double precision NOT NULL,
    L_TAX             double precision NOT NULL,
    L_RETURNFLAG      CHAR(1) NOT NULL,
    L_LINESTATUS      CHAR(1) NOT NULL,
    L_SHIPDATE        DATE NOT NULL,
    L_COMMITDATE      DATE NOT NULL,
    L_RECEIPTDATE     DATE NOT NULL,
    L_SHIPINSTRUCT    CHAR(25) NOT NULL,
    L_SHIPMODE        CHAR(10) NOT NULL,
    L_COMMENT         VARCHAR(44) NOT NULL,
    PRIMARY KEY       (L_ORDERKEY, L_LINENUMBER) column );
```

Note the column modifier after the primary key. This ensures that the
table is created in the column store mode. When copying large tables
over VDB, this is nearly always done for warehousing, not for OLTP, so
the column store mode is essentially always best. Insert is faster and
the table takes much less space.

To transfer the data from the remote table into the local one:

``` programlisting
log_enable (2);
INSERT INTO lineietm
     SELECT *
       FROM r1..llineiten;
checkpoint;
```

log_enabel (2) turns off logging an transactions and allows auto
committing insert. The explicit checkpoint makes the changes durable.
Killing the database server during the transfer would start without any
of the effects of the transfer since there is no logging. The data
reading and insertion is automatically parallelized.

Most such data transfer operations are in fact network bound since the
local insert rate is well in excess of 100MB/s on a commodity server and
a 1gbE connection may only transfer around 80MB/s.

The database is normally online during the transfer and the progress may
be tracked by periodically counting the target table.

</div>
