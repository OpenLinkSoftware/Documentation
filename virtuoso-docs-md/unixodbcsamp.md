<div id="unixodbcsamp" class="section">

<div class="titlepage">

<div>

<div>

### 4.2.3. Linux & UNIX

</div>

</div>

</div>

<div id="odbctestnix" class="section">

<div class="titlepage">

<div>

<div>

#### ODBCTEST:

</div>

</div>

</div>

This is a simple 'C' based and ODBC compliant Interactive SQL processor.

<div class="orderedlist">

1.  Run the script virtuoso-enterprise.sh to set up your environment:

    ``` programlisting
    . virtuoso-enterprise.sh
    ```

2.  Start ODBCTEST by executing the following command:

    ``` programlisting
    odbctest
    ```

3.  At the SQL command prompt enter "?" for a list of ODBC DSNs on your
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

4.  Any valid SQL or ODBC command may be executed through this
    interface. The following example shows a connection to Microsoft SQL
    Server 2000, making a simple query against the sample Northwind
    database:

    ``` programlisting
    [localhost:~] openlink% odbctest
    iODBC Demonstration program
    This program shows an interactive SQL processor

    Enter ODBC connect string (? shows list, or DSN=...): DSN=test_sql2k

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
