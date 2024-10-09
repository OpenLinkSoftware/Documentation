<div>

<div>

<div>

<div>

### 11.17.2. Connection Level

</div>

</div>

</div>

The switch SET SQL_NO_CHAR_C_ESCAPE can be set to 'on' or 'off' to
respectively turn backslash support on or off for the current connection

There is an ODBC connection attribute that can be set for the same
effect in an ODBC connection. SQLGetConnectAttr/SQLSetConnectAttr with
option ID of 5002 takes values 0 or 1 to facilitate this

</div>
