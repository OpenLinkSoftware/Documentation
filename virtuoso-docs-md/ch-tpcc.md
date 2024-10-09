<div>

<div>

<div>

<div>

# Chapter 21. TPC C Benchmark Kit

</div>

<div>

<div>

**Abstract**

The Virtuoso TPC C Kit is a database benchmark written in C and SQL
stored procedures using the CLI or ODBC API. It is modeled after the
industry standard Transaction Processing Performance Council (TPC) C
benchmark and can be used as a component in an official benchmark but
does not in itself constitute a complete test driver.

<div>

|                            |                                                                                                                                              |
|:--------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                                                    |
|                            | A complete description of the benchmark and its metric can be found at <a href="http://www.tpc.org/" class="ulink" target="_top">the TPC Web 
                              Site</a> . This document assumes the reader is familiar with the general content of the benchmark.                                            |

</div>

The C and SQL source of the benchmark is contained in the sample
directory of the Virtuoso tree. The tpcc executable is built by running
make after choosing the target (see makefile).

</div>

</div>

</div>

</div>

<div>

**Table of Contents**

<span class="section">21.1. [Building the Test
Database](ch-tpcc.html#tpcctestdb)</span>

<span class="section">21.2. [Using the Test
Program](tpccusingtestprg.html)</span>

<span class="section">21.3. [Tuning Parameters and Number of
Users](tpcctuningparams4users.html)</span>

<span class="section">21.4. [Omissions, Exceptions from the
Definition](omissionsexcp.html)</span>

<span class="section">21.5. [Sample
Configuration](sampleconf.html)</span>

<span class="section">21.6. [Other Factors](otherfactors.html)</span>

<span class="section">21.7. [TPC C Procedures](tpccprocs.html)</span>

<span class="section">21.7.1.
[Introduction](tpccprocs.html#intro)</span>

<span class="section">21.7.2. [New Order](neworder.html)</span>

<span class="section">21.7.3. [Payment](payment.html)</span>

<span class="section">21.7.4. [Delivery](delivery.html)</span>

<span class="section">21.7.5. [Order Status](status.html)</span>

<span class="section">21.7.6. [Stock Level](stocklevel.html)</span>

<span class="section">21.8. [DDL Statements](ddlstmt.html)</span>

<span class="section">21.9. [Stored Procedures](storedprocs.html)</span>

</div>

<div>

<div>

<div>

<div>

## 21.1. Building the Test Database

</div>

</div>

</div>

To build a 1 warehouse test database (approximately 100 MB), go through
the following procedure:

Start the database server.

Assuming the server is listening at the default port of 1111 on the
local host execute:

``` screen
isql 1111 dba dba tpccddk.sql
tpcc 1111 dba dba I 1
```

to create a 1 warehouse database. This may take some time. As long as
the file gets longer everything is OK. You may follow the progress with
interactive SQL.

Once the tpcc program exits you can load the stored procedures used by
the benchmark. Assuming the server is listening at the default port of
1111 and that the dba password is the default \`dba', type:

``` screen
../isql 1111 dba dba tpcc.sql
```

This will exit when the procedures are loaded, typically a few seconds.

To complete the initialization make a checkpoint to freeze the initial
database state:

``` screen
./isql 1111
SQL> checkpoint;
Done.
SQL> exit;
```

The database is now ready for use.

</div>

</div>
