<div id="configuringvirtuosoclients" class="section">

<div class="titlepage">

<div>

<div>

### 2.2.7. Configuring Virtuoso Client Components

</div>

</div>

</div>

The Virtuoso client components set consists of the following:

|                                                  |
|--------------------------------------------------|
| Virtuoso Driver for ODBC                         |
| Virtuoso Driver for JDBC                         |
| Native Virtuoso Interactive SQL Query (ISQL)     |
| ODBC based Interactive SQL Query Utility (ISQLO) |

The sections that follow address the configuration and utilization of
each one of these client components separately.

<div id="virtuosodriverodbc" class="section">

<div class="titlepage">

<div>

<div>

#### Virtuoso Driver for ODBC

</div>

</div>

</div>

The Virtuoso Driver for ODBC conforms to both the ODBC 1.x,2.x,and 3.x
versions of the ODBC specification, it implements Core, Level 1, Level
2, and Extensions functionality. This driver enables you to communicate
with local or remote Virtuoso servers across any combination of
platforms supported by Virtuoso.

At installation time two ODBC data source names (DSN's) are created with
default values by the Virtuoso installer, the first DSN named "Local
Virtuoso" provides a link to a local default Virtuoso database server
instance, while the other named "Local Virtuoso Demo" provides a link to
a local Virtuoso server for the Virtuoso demonstration database.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                               |
|:--------------------------:|:----------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                     |
|                            | the <a href="odbcimplementation.html#virtdsnsetup" class="link"                               
                              title="7.3.1. Windows ODBC Driver Configuration">Data Access                                   
                              Interfaces</a> chapter for more detailed information regarding the Virtuoso ODBC Driver setup  |

</div>

</div>

<div id="virtuosodriverjdbc_clients" class="section">

<div class="titlepage">

<div>

<div>

#### Virtuoso Drivers for JDBC

</div>

</div>

</div>

The Virtuoso Drivers for JDBC are available in "jar" file formats for
the JDBC 1.x, JDBC 2.x and JDBC 3.x JDBC specifications. These are Type
4 Drivers implying that utilization is simply a case of adding the
relevant "jar" file to your CLASSPATH and then providing an appropriate
JDBC URL format in order to establish a JDBC session with a local or
remote Virtuoso server. It is important to note that when you make a
JDBC connection to a Virtuoso Server, you do also have access to Native
and External Virtuoso tables. Thus, you actually have a type 4 JDBC
Driver for any number of different database types that have been linked
into Virtuoso.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                 |
|:--------------------------:|:------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                       |
|                            | The <a href="virtuosodriverjdbc.html" class="link"                                              
                              title="7.4. Virtuoso Driver for JDBC">JDBC Driver</a> section in the Access Interfaces chapter.  |

</div>

</div>

<div id="isql" class="section">

<div class="titlepage">

<div>

<div>

#### Native Virtuoso Interactive SQL Query (ISQL)

</div>

</div>

</div>

To assist you with the use of Virtuoso an interactive SQL interpreter
utility called "ISQL" is bundled with all Virtuoso installations. This
utility allows you to enter and execute SQL statements from a command
line prompt against a local or remote Virtuoso server.

The command line format for executing this utility is:

``` programlisting
isql [<hostname>][:<port#>]
```

The steps that follow guide you through the process of using ISQL to
verify your Virtuoso installation:

<div class="orderedlist">

1.  Open up a DOS shell

2.  Move into the "bin" sub-directory of your Virtuoso installation

3.  Type the following command: isql

    This will connect you to the default Virtuoso server at port "1111",
    if you want to connect to your demonstration Virtuoso database
    (which listens at port 1112 by default) then enter: isql 1112

4.  At the ISQL command line prompt type in the following command:

    ``` programlisting
    tables ;
    ```

    This will produce a list of tables in the current Virtuoso database,
    you can also enter other SQL statements e.g.:

    ``` programlisting
    select * from Customers
    ```

    This will produce a listing of records in the "Customers" table.

5.  If you are not able to perform these task that it implies that your
    Virtuoso database server is not running or that it has not been
    installed properly.

</div>

</div>

<div id="isqlo" class="section">

<div class="titlepage">

<div>

<div>

#### ODBC based Interactive SQL Query Utility (ISQLO)

</div>

</div>

</div>

In addition to a Native ISQL utility, your Virtuoso installation
includes an ODBC based version of "ISQL" called "ISQLO", this enable you
to connect to ODBC DSN's rather than Virtuoso only. To use this program
perform the following steps:

<div class="orderedlist">

1.  Open up a DOS shell

2.  Move into the "bin" sub-directory of your Virtuoso installation

3.  Type the following command :

    ``` programlisting
    isqlo <enter a valid ODBC Data Source Name>
    ```

    <div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

    |                              |                                                                                                                      |
    |:----------------------------:|:---------------------------------------------------------------------------------------------------------------------|
    | ![\[Note\]](images/note.png) | Note:                                                                                                                |
    |                              | If your DSN contains spaces you will need to enclose it within double quotes when passing it as a parameter to ISQLO |

    </div>

4.  Enter any valid SQL at the ISQLO command line prompt.

5.  You can also use this utility from within the Virtuoso Conductor

</div>

</div>

</div>
