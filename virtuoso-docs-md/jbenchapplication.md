<div>

<div>

<div>

<div>

### 4.3.4. JBench Application

</div>

</div>

</div>

<div>

1.  Go to the Virtuoso "Start Menu" program group and then follow the
    JDBC Samples--\>Jbench (JDK1.1) or Jbench (JDK1.2) menu path,
    depending on the JVM you have installed. This will execute a DOS
    batch program that initializes the JBench application.

    <div>

    <div>

    **Figure 4.20. JBench**

    <div>

    <div>

    ![JBench](images/sampl019.gif)

    </div>

    </div>

    </div>

      

    </div>

2.  The follow the File--\>Connect menu path to make your initial
    connection. You will need to identify your JDBC Driver (by providing
    appropriate Driver Name values in the JDBC Driver field) and then
    provide a valid JDBC URL for your specific JDBC Driver (Jbench uses
    a valid Virtuoso Driver for JDBC URL that points to the
    demonstration database listening at port 1112 as its default).

    <div>

    <div>

    **Figure 4.21. JBench**

    <div>

    <div>

    ![JBench](images/sampl020.gif)

    </div>

    </div>

    </div>

      

    </div>

3.  Follow the Results--\>Table URL menu path, this is how you identify
    (using a JDBC URL) the location of the "Results" tables into which
    you will be storing your benchmark data. The default URL is the
    current JDBC URL (the one used to establish your initial
    connection), but this can be a totally different database to the one
    being benchmarked.

4.  Follow the Results--\>Create menu path, this is how you actually
    perform the "Results" table creation in the database identified by
    the URL in the previous step.

5.  Follow the TPC-A--\>Load Tables menu path to prepare your database
    for the TPC-A benchmark, select a database schema type that matches
    the database engine that you are benchmarking. If your database is
    not listed ANSI should suffice (as long as this is an ANSI SQL
    compliant database).

    <div>

    <div>

    **Figure 4.22. JBench**

    <div>

    <div>

    ![JBench](images/sampl021.gif)

    </div>

    </div>

    </div>

      

    </div>

6.  Follow the TPC-A--\>Load Procedures menu path to Load the Virtuoso
    TPC-A stored procedures.

7.  Now that all the benchmark data and stored procedures have been
    loaded into your database, follow the TPC-A--\>Run Benchmark menu
    path and then configure your actual benchmark session parameters:

    The benchmark parameters fall into 4 categories, Bench execution
    mode, Run Options, SQL Options, and Execution Options.

    <div>

    <div>

    **Figure 4.23. JBench**

    <div>

    <div>

    ![JBench](images/sampl022.gif)

    </div>

    </div>

    </div>

      

    </div>

    <span class="emphasis">*Bench execution mode:*</span> These setting
    allow you to configure the threads used for the benchmark.

    Decide on a single or multiple threads test.

    No. Threads - this is the number of concurrent threads to be used
    during the benchmark.

    <span class="emphasis">*Run Options:*</span> These setting allow you
    to configure the duration related aspects of this benchmark program.

    No. runs - this controls how many iterations of the benchmarks you
    actually run (the default is 100 benchmark iterations).

    Duration (mins.) - this is the duration in minutes of each benchmark
    run.

    <span class="emphasis">*SQL Options:*</span> These setting allow you
    to configure how your benchmark's SQL instructions are actually
    handled.

    ExecDirect with SQL Text - this means that no form of repetitive SQL
    execution optimization is being applied (SQL statements are prepared
    and executed repetitively)

    Prepare/Execute Bound Params - this means that the Parameter Binding
    SQL execution optimization is being applied (SQL is prepared once
    but executed many times without the overhead of re-preparing
    statements prior to execution)

    Use Stored Procedures - this means that the Stored Procedure SQL
    optimization is being applied (benchmark instructions are stored
    within database being benchmarked)

    Run All - this implies you want to perform all of the above
    benchmarks

    <span class="emphasis">*Execution Options:* </span> These setting
    allow you to configure the tone of your benchmark, for instance it
    could have Transaction scoping and a mix of record retrieval
    queries, or it could simply be input and update intensive with a
    minimal amount of record retrieval queries (the case when the 100
    row query checkbox is unchecked a typical OLTP scenario)

    Use Transactions - make the benchmark use transaction control
    (instructions are scoped to transaction blocks)

    Do 100 row Query - perform a simulation of a 100 record retrieval as
    part of the benchmark activity.

8.  Run your TPC-A benchmark.

9.  Follow the TPC-A--\>Cleanup menu path to clean up your database so
    that you can then run other benchmarks (TPC-C like benchmark).

10. To run the TPC-C benchmark simply follow the appropriate menu path,
    create the benchmark tables & stored procedures, load the benchmark
    data and then run the TPC-C benchmark.

</div>

</div>
