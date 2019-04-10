::: {.topic-text}
\

\

[]{#Server Startup & Shutdown Issues}Server Startup & Shutdown Issues
---------------------------------------------------------------------

### []{#Delete & Register a new Virtuoso Windows Service}Delete & Register a new Virtuoso Windows Service

1\) Unregister the service using the line:\

    virtuoso-t +service delete +instance "instance name"

\
2) Remove the Virtuoso System DSN entry from the ODBC driver.

3\) Unregister the virtuoso ODBC driver\

    regsvr32 /u virtodbc.dll  

\
4) Rename the previous virtuoso home folder.

5\) Copy into a folder with the same name the contents of the Virtuoso
zip file.

6\) Register the new service from the database directory:\

    virtuoso-t +service create +instance "instance name""

\
7) Check that it is listed.\

    virtuoso-t +service list

\
8) Start the service\

    virtuoso-t -I "instance name"" +service start
:::
