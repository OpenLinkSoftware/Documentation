<div id="mt_odbcsam" class="section">

<div class="titlepage">

<div>

<div>

## 15.2. Windows 95/98/NT/2000 Based ODBC Sample Applications

</div>

</div>

</div>

<div id="mt_cppdemo" class="section">

<div class="titlepage">

<div>

<div>

### 15.2.1. C++ Demo

</div>

</div>

</div>

<div class="orderedlist">

1.  Go to the OpenLink Data Access Drivers "Start Menu" item, then click
    on the "C++ Demo 32 Bit" menu item.

    <div class="figure-float">

    <div id="mt_image40" class="figure">

    **Figure 15.1. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image40.gif)

    </div>

    </div>

    </div>

      

    </div>

2.  Follow the Environment-\>Open Connection menu path. Selecting the
    "Open Connection" menu item results in the ODBC Driver Manager
    presenting you with a list of ODBC DSNs on your machine as depicted
    by the screen capture below:

    <div class="figure-float">

    <div id="mt_image41" class="figure">

    **Figure 15.2. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image41.gif)

    </div>

    </div>

    </div>

      

    </div>

3.  Select the ODBC DSN that you wish to connect to, (in this case
    "Informix 7 on Local" has been chosen. This will connect you to the
    Informix 7 database.)

4.  You are then presented with a Login Dialog by the OpenLink Driver
    for ODBC, enter a valid user name and password into the appropriate
    fields.

    <div class="figure-float">

    <div id="mt_image42" class="figure">

    **Figure 15.3. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image42.gif)

    </div>

    </div>

    </div>

      

    </div>

5.  At this point you will be connected to the chosen datasource, you
    can now use the SQL--\>Execute SQL menu path to open up the
    Interactive SQL input dialog. Enter a valid SQL statement (see
    example in screen shot) and then click on the "OK" button.

    <div class="figure-float">

    <div id="mt_image43" class="figure">

    **Figure 15.4. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image43.gif)

    </div>

    </div>

    </div>

      

    </div>

6.  You will be presented with the results of your query.

    <div class="figure-float">

    <div id="mt_image44" class="figure">

    **Figure 15.5. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image44.gif)

    </div>

    </div>

    </div>

      

    </div>

7.  You exit this demo by following the Environment--\>Close Connection
    menu path.

</div>

</div>

<div id="mt_odbcbench" class="section">

<div class="titlepage">

<div>

<div>

### 15.2.2. ODBC Bench Test 32

</div>

</div>

</div>

<div class="orderedlist">

1.  Go to the OpenLink Data Access Drivers "Start Menu" item, then click
    on the "ODBC Bench Test 32 Bit" menu item. You will be presented
    with the "Bench Test" interface.

    <div class="figure-float">

    <div id="mt_image45" class="figure">

    **Figure 15.6. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image45.gif)

    </div>

    </div>

    </div>

      

    </div>

2.  Follow the File-\>Connect menu path which initializes the ODBC
    Driver Manager, which in turn presents you with a list of ODBC DSNs
    installed on your machine. Select the DSN that you want to
    benchmark, remember that by benchmarking a DSN you are benchmarking
    the ODBC Driver that serves the DSN in question and the backend
    database engine that serves the ODBC Driver. Choose the name of the
    datasource you want to benchmark.

    <div class="figure-float">

    <div id="mt_image41_01" class="figure">

    **Figure 15.7. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image41.gif)

    </div>

    </div>

    </div>

      

    </div>

3.  You will then be presented with a Login Dialog by the OpenLink
    Generic Driver for ODBC, enter a valid user name and password into
    the appropriate fields.

    <div class="figure-float">

    <div id="mt_image42_01" class="figure">

    **Figure 15.8. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image42.gif)

    </div>

    </div>

    </div>

      

    </div>

4.  Now follow the Bench--\>Load Tables menu path and you will be
    presented with a dialog that enables you to configure key elements
    of your benchmark. Click the "Execute" button to commence the
    process of setting up your database for the benchmark tests. Please
    make sure you select the appropriate schema for the DBMS that you
    are connecting to so that the benchmark tables are created properly.

    <div class="figure-float">

    <div id="mt_image46" class="figure">

    **Figure 15.9. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image46.gif)

    </div>

    </div>

    </div>

      

    </div>

5.  As the process of loading data occurs, all the way up to completion,
    the benchmark program will provide status information into the
    benchmark output pane as shown below:

    <div class="figure-float">

    <div id="mt_image47" class="figure">

    **Figure 15.10. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image47.gif)

    </div>

    </div>

    </div>

      

    </div>

6.  Now that all the benchmark data has been loaded into your database,
    follow the Bench--\>Run Benchmark menu path and then configure your
    actual benchmark session parameters:

    These benchmark parameters fall into 3 categories, Timing Options,
    SQL Options, and Execution Options.

    <div class="figure-float">

    <div id="mt_image48" class="figure">

    **Figure 15.11. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image48.gif)

    </div>

    </div>

    </div>

      

    </div>

</div>

<div id="id1358" class="section">

<div class="titlepage">

<div>

<div>

#### 

</div>

</div>

</div>

<div id="mt_timeopt" class="section">

<div class="titlepage">

<div>

<div>

##### Timing Options:

</div>

</div>

</div>

These setting allow you to configure the duration related aspects of
this benchmark program

**Minutes. ** this is the duration of each benchmark run

**Runs. ** this controls how many iterations of the benchmarks you
actually run (the default is one benchmark iteration with a duration of
5 minutes)

</div>

<div id="mt_sqlopt" class="section">

<div class="titlepage">

<div>

<div>

##### SQL Options:

</div>

</div>

</div>

These settings allow you to configure how your benchmark's SQL
instructions are actually handled.

**ExecDirect with SQL Text. ** this means that no form of repetitive SQL
execution optimization is being applied (SQL statements are prepared and
executed repetitively)

**Prepare/Execute Bound Params. ** this means that the Parameter Binding
SQL execution optimization is being applied (SQL is prepared once but
executed many times without the overhead of re-preparing statements
prior to execution)

**Use Stored Procedures. ** this means that the Stored Procedure SQL
optimization is being applied (benchmark instructions are stored within
database being benchmarked)

</div>

<div id="mt_exeopt" class="section">

<div class="titlepage">

<div>

<div>

##### Execution Options:

</div>

</div>

</div>

These settings allow you to configure the tone of your benchmark, for
instance it could have Transaction scoping and a mix of record retrieval
queries, or it could simply be input and update intensive with a minimal
amount of record retrieval queries (the case when the 100 row query
checkbox is unchecked a typical OLTP scenario)

**Asynchronous. ** execute the benchmark instructions asynchronously

**Use Transactions. ** make the benchmark use transaction control
(instructions are scoped to transaction blocks)

**Do 100 row Query. ** perform a simulation of a 100 record retrieval as
part of the benchmark activity.

</div>

</div>

<div id="id1359" class="section">

<div class="titlepage">

<div>

<div>

#### 

</div>

</div>

</div>

<div class="orderedlist">

1.  Click on the "Run All" button if you would like all the different
    benchmark type combinations to be performed.

2.  When benchmark run complete benchmark data is written to the
    benchmark program's output pane.

    <div class="figure-float">

    <div id="mt_image49" class="figure">

    **Figure 15.12. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image49.gif)

    </div>

    </div>

    </div>

      

    </div>

    The key pieces of benchmark data that you need to look out for are:

    **Total Transactions. ** total number of transactions completed
    during the benchmark run

    **Transactions Per Second. ** number of transaction completed per
    second for the benchmark run

    Information from this benchmark is automatically written to an Excel
    format CSV (the file c:\odbcbnch.csv) which makes it easy for you to
    graph and pivot data collated from several benchmark runs. A later
    version of this demo will actually write the benchmark data into an
    ODBC DSN that you provide thereby offering even more flexibility and
    accessibility to benchmark data.

</div>

</div>

</div>

<div id="mt_odbcsaml" class="section">

<div class="titlepage">

<div>

<div>

### 15.2.3. Linux & UNIX Based ODBC Sample Applications

</div>

</div>

</div>

<div id="mt_odbctestl" class="section">

<div class="titlepage">

<div>

<div>

#### ODBCTEST

</div>

</div>

</div>

This is a simple 'C' based and ODBC compliant Interactive SQL processor.

<div class="orderedlist">

1.  Run the script openlink.sh to set up your environment:

    ``` programlisting
    openlink.sh
    ```

2.  Start ODBCTEST by executing the following command:

    ``` programlisting
    odbctest
    ```

    Or pass a DSN connect string, for example:

    ``` programlisting
    odbctest DSN=marketing;UID=name;PWD=pwd;
    ```

3.  At the SQL command prompt enter "?" for a list of ODBC DSNs on your
    machine or enter a valid ODBC Connect String e.g.

    If you have a DSN named "Marketing" you would enter: DSN=Marketing

</div>

</div>

<div id="mt_odbcbesaml" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC Benchmark Application

</div>

</div>

</div>

The TPC-A, TPC-C, and TPC-D benchmarks are currently under development,
please monitor our Web site (http://www.openlinksw.com) for updates on
these applications.

</div>

</div>

<div id="mt_macosxsamples" class="section">

<div class="titlepage">

<div>

<div>

### 15.2.4. Mac OS X

</div>

</div>

</div>

<div id="mt_odbctestmac" class="section">

<div class="titlepage">

<div>

<div>

#### ODBCTEST:

</div>

</div>

</div>

This is a simple 'C' based and ODBC compliant Interactive SQL processor.

<div class="orderedlist">

1.  Open a Terminal session, and start ODBCTEST by executing the
    following command:

    ``` programlisting
    /Library/iodbc/bin/odbctest
    ```

2.  At the SQL command prompt enter "?" for a list of ODBC DSNs on your
    machine or enter a valid ODBC Connect String. If you have a DSN
    named "Marketing" you would enter:

    ``` programlisting
    DSN=Marketing;UID=username;PWD=password
    ```

    Note: If there is no password, you must include a semicolon at the
    end:

    ``` programlisting
    DSN=Marketing;UID=sa;PWD=;
    ```

3.  Any valid SQL or ODBC command may be executed through this
    interface. The following example shows a connection to Microsoft
    SQLServer 2000, making a simple query against the sample Northwind
    database:

    ``` programlisting
    [localhost:~] openlink% /Library/iodbc/bin/odbctest
    iODBC Demonstration program
    This program shows an interactive SQL processor
    Enter ODBC connect string (? shows list, or DSN=...): DSN=user_tthib_sql2k
    SQL>select au_lname, au_fname, state from authors where au_id < '333-33-3333'
    au_lname                                |au_fname            |state
    ----------------------------------------+--------------------+-----
    White                                   |Johnson             |CA
    Green                                   |Marjorie            |CA
    Carson                                  |Cheryl              |CA
    O'Leary                                 |Michael             |CA
    Straight                                |Dean                |CA
     5 row(s) fetched.
    SQL>quit
    Again (y/n) ? n
    Have a nice day.
    [localhost:~] openlink%
    ```

</div>

</div>

</div>

<div id="mt_jdbcsaa" class="section">

<div class="titlepage">

<div>

<div>

### 15.2.5. JDBC Sample Applications &Applets

</div>

</div>

</div>

<div id="mt_JDBCDemo" class="section">

<div class="titlepage">

<div>

<div>

#### JDBCDemo Java Application

</div>

</div>

</div>

<div class="orderedlist">

1.  Go to the OpenLink Data Access Drivers "Start Menu" program group
    and then follow the JDBC Samples menu path to the appropriate JDK,
    and then JDBCDemo. This will execute a DOS batch program that
    initialises the Java demo application.

    <div class="figure-float">

    <div id="mt_jdemo1" class="figure">

    **Figure 15.13. JDBC Demo**

    <div class="figure-contents">

    <div class="mediaobject">

    |                                                             |
    |-------------------------------------------------------------|
    | <img src="images/jdemo1.gif" width="395" alt="JDBC Demo" /> |

    </div>

    </div>

    </div>

      

    </div>

2.  Set the JDBC Driver Name and URL settings for the connection to your
    database. The "Driver Name" field identifies the jdbc Driver. The
    "Connection URL" field requires a valid JDBC URL.

    <div class="figure-float">

    <div id="mt_jdemo2" class="figure">

    **Figure 15.14. JDBC Demo**

    <div class="figure-contents">

    <div class="mediaobject">

    |                                                              |
    |--------------------------------------------------------------|
    | <img src="images/jdemo2.gif" height="203" alt="JDBC Demo" /> |

    </div>

    </div>

    </div>

      

    </div>

3.  Enter a valid SQL statement and then click the "Query" button, the
    example below uses a SQL statement requesting all records from the
    "Customers" table.

    <div class="figure-float">

    <div id="mt_jdemo3" class="figure">

    **Figure 15.15. JDBC Demo**

    <div class="figure-contents">

    <div class="mediaobject">

    |                                                             |
    |-------------------------------------------------------------|
    | <img src="images/jdemo3.gif" width="395" alt="JDBC Demo" /> |

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

<div id="mt_rowsetdemo" class="section">

<div class="titlepage">

<div>

<div>

#### Rowset Java Application

</div>

</div>

</div>

<div class="orderedlist">

1.  Go to the OpenLink Data Access Drivers "Start Menu" program group
    and then follow the JDBC Samples menu path to the appropriate JDK,
    and then Rowset Demo. This will execute a DOS batch program that
    initialises the Java demo application.

    <div class="figure-float">

    <div id="mt_rowset1" class="figure">

    **Figure 15.16. Rowset Demo**

    <div class="figure-contents">

    <div class="mediaobject">

    |                                                                 |
    |-----------------------------------------------------------------|
    | <img src="images/rowset1.gif" height="256" alt="Rowset Demo" /> |

    </div>

    </div>

    </div>

      

    </div>

2.  Set the JDBC URL settings for the connection to your database. The
    "Connection URL" field requires a valid JDBC URL.

    <div class="figure-float">

    <div id="mt_rowset2" class="figure">

    **Figure 15.17. Rowset Demo**

    <div class="figure-contents">

    <div class="mediaobject">

    |                                                                 |
    |-----------------------------------------------------------------|
    | <img src="images/rowset2.gif" height="185" alt="Rowset Demo" /> |

    </div>

    </div>

    </div>

      

    </div>

3.  Enter a valid SQL statement and then click the "Query" button. The
    first rowset of the resultset will be shown.

    <div class="figure-float">

    <div id="mt_rowset3" class="figure">

    **Figure 15.18. Rowset Demo**

    <div class="figure-contents">

    <div class="mediaobject">

    |                                                                |
    |----------------------------------------------------------------|
    | <img src="images/rowset3.gif" width="646" alt="Rowset Demo" /> |

    </div>

    </div>

    </div>

      

    </div>

4.  Click on the "Next" button to retrieve the next rowset, "Prior" to
    go back a rowset, "First" to move directly to the first rowset, and
    "Last" to move to the last rowset.

    "Delete", "Refresh", "Lock", "Unlock", "Add" and Update" work on the
    principle of a current row in the rowset. To indicate the current
    row to the applet, you must click on any column of a particular row
    and then press a key. The status panel will then display "Current
    Row = 2" or similar, indicating that the current row is set.

    Clicking "Delete" will attempt to delete the row from the database.
    Clicking on "Refresh" will now retrieve the latest values from the
    database to refresh that row. However this may not be successful
    dependent on the restrictions place on the resultset by the
    underlying database.

    "Lock" and "Unlock" will attempt to perform those operations on the
    current row, which again, may or may not be successful, dependent on
    the restrictions of the underlying database.

    "Add" will attempt to add the contents of the current row as a new
    row to the relevant tables forming the resultset. "Update" will
    attempt to update the modified contents of the current row to the
    database. Again the success of these two operations depend on the
    restrictions placed on the underlying database.

    "Get Bookmark" will attempt to retrieve a bookmark for the current
    rowset position, which "Set Bookmark" will attempt to return to.

    To move to a particular position in the resultset, enter that
    position into the edit box next to the "Goto" button and click the
    "Goto" button.

</div>

</div>

<div id="mt_ScrollDemo2" class="section">

<div class="titlepage">

<div>

<div>

#### ScrollDemo2 Java Application

</div>

</div>

</div>

<div class="orderedlist">

1.  Go to the OpenLink Data Access Drivers "Start Menu" program group
    and then follow the JDBC Samples--\>ScrollDemo2 (JDK1.2) menu path,
    this will execute a DOS batch program that initializes the Java demo
    application.

    <div class="figure-float">

    <div id="mt_image50" class="figure">

    **Figure 15.19. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image50.gif)

    </div>

    </div>

    </div>

      

    </div>

2.  Set the JDBC Driver Name and URL settings for your connection to a
    database of your choice. The "Driver Name" field identifies the
    OpenLink Driver. If it is left blank, then it defaults to
    "openlink.jdbc2.Driver", which is the OpenLink Driver for JDBC 2.0.
    The "Connection URL" field requires a valid OpenLink JDBC URL.

    <div class="figure-float">

    <div id="mt_image51" class="figure">

    **Figure 15.20. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image51.gif)

    </div>

    </div>

    </div>

      

    </div>

3.  Enter a valid SQL statement and then click the "Query" button.

    <div class="figure-float">

    <div id="mt_image52" class="figure">

    **Figure 15.21. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image52.gif)

    </div>

    </div>

    </div>

      

    </div>

4.  You can now use the navigational buttons to Scroll backwards and
    forwards, each of these navigational buttons highlights OpenLink's
    full implementation of the JDBC 2.0 Scrollable Cursors
    specifications.

</div>

</div>

<div id="mt_scd2aplt" class="section">

<div class="titlepage">

<div>

<div>

#### ScrollDemo2 Java Applet

</div>

</div>

</div>

<div class="orderedlist">

1.  Start the OpenLink Admin Assistant and then follow the Sample
    Applications--\>JDBC Applet Demos menu path.

    <div class="figure-float">

    <div id="mt_image53" class="figure">

    **Figure 15.22. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image53.gif)

    </div>

    </div>

    </div>

      

    </div>

2.  Click on the "ScrollDemo2" hyperlink which initializes the
    ScrollDemo2 applet, if you do not have a Java 1.2 or Java 2.0
    compliant browser you will not be able to run this Applet demo. The
    other way to experience this demo is to run the Application version
    which uses your operating systems Java Virtual Machine (JVM) instead
    of a JVM inherently linked to a Web Browser.

</div>

</div>

<div id="mt_JBenchApplication" class="section">

<div class="titlepage">

<div>

<div>

#### JBench Application

</div>

</div>

</div>

<div class="orderedlist">

1.  Go to the OpenLink Data Access Drivers "Start Menu" program group
    and then follow the JDBC Samples--\>Jbench (for JDK1.1 1.2 or 1.3)
    menu path, depending on the JVM you have installed. This will
    execute a DOS batch program that initializes the JBench application.

    <div class="figure-float">

    <div id="mt_image54" class="figure">

    **Figure 15.23. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image54.gif)

    </div>

    </div>

    </div>

      

    </div>

2.  The follow the File--\>Connect menu path to make your initial
    connection. You will need to identify your JDBC Driver (by providing
    appropriate Driver Name values in the JDBC Driver field) and then
    provide a valid JDBC URL for your specific JDBC Driver.

    <div class="figure-float">

    <div id="mt_image55" class="figure">

    **Figure 15.24. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image55.gif)

    </div>

    </div>

    </div>

      

    </div>

3.  Select the open JDBC connection that you wish to test.

4.  Follow the TPC-A--\>Load Tables menu path to prepare your database
    for the TPC-A benchmark, select a database schema type that matches
    the database engine that you are benchmarking. If your database
    isn't listed ANSI should suffice (as long as this is an ANSI SQL
    compliant database).

    <div class="figure-float">

    <div id="mt_image56" class="figure">

    **Figure 15.25. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image56.gif)

    </div>

    </div>

    </div>

      

    </div>

5.  Follow the TPC-A--\>Load Procedures menu path to Load the TPC-A
    stored procedures.

6.  Now that all the benchmark data and stored procedures have been
    loaded into your database, follow the TPC-A--\>Run Benchmark menu
    path and then configure your actual benchmark session parameters:

    The benchmark parameters fall into 4 categories, Bench execution
    mode, Run Options, SQL Options, and Execution Options.

    <div class="figure-float">

    <div id="mt_image57" class="figure">

    **Figure 15.26. **

    <div class="figure-contents">

    <div class="mediaobject">

    ![](images/image57.gif)

    </div>

    </div>

    </div>

      

    </div>

</div>

<div id="mt_benexemode" class="section">

<div class="titlepage">

<div>

<div>

##### Bench execution mode:

</div>

</div>

</div>

These setting allow you to configure the threads used for the benchmark.

Decide on a single or multiple threads test.

**No. Threads. ** this is the number of concurrent threads to be used
during the benchmark.

</div>

<div id="mt_benrunopt" class="section">

<div class="titlepage">

<div>

<div>

##### Run Options:

</div>

</div>

</div>

These setting allow you to configure the duration related aspects of
this benchmark program.

**No. runs. ** this controls how many iterations of the benchmarks you
actually run (the default is 100 benchmark iterations).

**Duration (mins.). ** this is the duration in minutes of each benchmark
run.

</div>

<div id="mt_bensqlopt" class="section">

<div class="titlepage">

<div>

<div>

##### SQL Options:

</div>

</div>

</div>

These setting allow you to configure how your benchmark's SQL
instructions are actually handled.

**ExecDirect with SQL Text. ** this means that no form of repetitive SQL
execution optimization is being applied (SQL statements are prepared and
executed repetitively)

**Prepare/Execute Bound Params. ** this means that the Parameter Binding
SQL execution optimization is being applied (SQL is prepared once but
executed many times without the overhead of re-preparing statements
prior to execution)

**Use Stored Procedures. ** this means that the Stored Procedure SQL
optimization is being applied (benchmark instructions are stored within
database being benchmarked)

**Execution Options: ** These setting allow you to configure the tone of
your benchmark, for instance it could have Transaction scoping and a mix
of record retrieval queries, or it could simply be input and update
intensive with a minimal amount of record retrieval queries (the case
when the 100 row query checkbox is unchecked a typical OLTP scenario)

**Use Transactions. ** make the benchmark use transaction control
(instructions are scoped to transaction blocks)

**Do 100 row Query. ** perform a simulation of a 100 record retrieval as
part of the benchmark activity.

</div>

<div id="id1360" class="section">

<div class="titlepage">

<div>

<div>

##### 

</div>

</div>

</div>

<div class="orderedlist">

1.  Press Run or Run All to start your TPC-A benchmark. The Run All will
    sequence through all SQL and Execution combinations, so it will take
    much longer.

2.  Follow the TPC-A--\>Cleanup menu path to clean up your database so
    that you can then run other benchmarks.

</div>

</div>

</div>

</div>

</div>
