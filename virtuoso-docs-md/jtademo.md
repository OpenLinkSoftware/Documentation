<div id="jtademo" class="section">

<div class="titlepage">

<div>

<div>

### 4.3.5. JTA Demo Application

</div>

</div>

</div>

The JTA demo is located in the

``` programlisting
<VIRTUOSO_INSTALLATION_DIRECTORY>\samples\jdbc\JTADemo
```

folder.

<div id="jtademosetup" class="section">

<div class="titlepage">

<div>

<div>

#### Software Setup

</div>

</div>

</div>

<div class="orderedlist">

1.  The sample requires 2 or 3 Virtuoso instances and an instance of a
    J2EE 1.3.1 server properly set up and running on the same computer
    or on the network. To build the sample it's also necessary to have a
    J2SE 1.4 SDK installed.

2.  The JAVA_HOME and J2EE_HOME environment variables must be set to the
    J2SE SDK and J2EE installation path respectively.

3.  The virtjdbc3.jar file must be in the classpath of the J2EE server.
    The setting of the classpath differs across different J2EE servers.
    For J2EE Reference Implementation (RI) the J2EE_CLASSPATH variable
    might be set in %J2EE_HOME%\bin\userconfig.bat on Windows or
    \$(J2EE_HOME)/bin/userconfig.sh on Unix.

    ``` programlisting
        set J2EE_CLASSPATH=C:/Virtuoso/lib/virtjdbc3.jar
    ```

    or

    ``` programlisting
        J2EE_CLASSPATH=/home/login/virtuoso/lib/virtjdbc3.jar
        export J2EE_CLASSPATH
    ```

4.  Add the Virtuoso XA datasources to J2EE server. For J2EE RI this is
    done like this:

    ``` programlisting
        j2eeadmin -addJdbcXADatasource jdbc/Virtuoso1 virtuoso.jdbc3.VirtuosoXADataSource dba dba -props serverName=localhost portNumber=1111
        j2eeadmin -addJdbcXADatasource jdbc/Virtuoso2 virtuoso.jdbc3.VirtuosoXADataSource dba dba -props serverName=localhost portNumber=2222
        j2eeadmin -addJdbcXADatasource jdbc/Virtuoso3 virtuoso.jdbc3.VirtuosoXADataSource dba dba -props serverName=localhost portNumber=3333
    ```

    Please note that the newly added datasources take effect only after
    restart of the J2EE server.

</div>

</div>

<div id="jtademoconfig" class="section">

<div class="titlepage">

<div>

<div>

#### Configuration

</div>

</div>

</div>

The sample folder contains the jtademo.properties file which can be used
to configure the sample application. The configuration options are
described within the file.

</div>

<div id="jtademo_deploy" class="section">

<div class="titlepage">

<div>

<div>

#### Building and Deployment

</div>

</div>

</div>

The sample folder contains build and deploy scripts (build.sh and
deploy.sh for Linux and Unix and build.bat and deploy.bat for Windows).

Use the build script to build the sample application from the source
files.

Deploy the application to the J2EE server. The deploy script performs
this task for J2EE RI. Other J2EE application servers might provide
different ways for application deployment.

</div>

<div id="jtademorun" class="section">

<div class="titlepage">

<div>

<div>

#### Running the Sample

</div>

</div>

</div>

The sample folder contains the run scripts for Linux/Unix and Windows.

The run script accepts the following commands:

<div class="variablelist">

<span class="term">create</span>  
Creates and populates the necessary tables.

<span class="term">check</span>  
Verifies data consistency.

<span class="term">drop</span>  
Removes data and tables from the databases.

<span class="term">run</span>  
Executes a number of transactions over database tables.

</div>

The first action to do is to initialize the data with the create
command. After this the command might be used one or more times. This
executes a series of concurrent updates on the distributed data. The
check command verifies that this updates left databases in the
consistent state.

For instance, for Unix:

``` programlisting
    run.sh create
    run.sh run
    run.sh check
```

And for Windows:

``` programlisting
    run.bat create
    run.bat run
    run.bat check
```

</div>

</div>
