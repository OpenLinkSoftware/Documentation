<div id="execpythonscript" class="section">

<div class="titlepage">

<div>

<div>

### 7.3.8. Executing SQL from Python script

</div>

</div>

</div>

In order to execute SQL from Python script, you need to add the
following lines to the /etc/odbc.ini file:

``` programlisting
[Local Virtuoso]
Driver  = /PREFIX/lib/virtodbc_r.so
Address = localhost:1111
```

where PREFIX is replaced by the full path where Virtuoso is installed
and also assuming that is used let's say port 1111 in virtuoso.ini
(which is set by default).

Then you should be able to connect with:

``` programlisting
c = pyodbc.connect('DSN=Local Virtuoso;UID=dba;PWD=dba')
```

</div>
