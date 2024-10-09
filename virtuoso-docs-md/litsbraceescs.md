<div>

<div>

<div>

<div>

## 9.7. Literals, Brace Escapes

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 9.7.1. Strings

</div>

</div>

</div>

String literals are delimited with single quotes. A double single quote
is an escape notation for a single quote character inside a string
literal. Additionally, standard C language escapes are supported.
Support of C escapes can be turned off for compatibility with other SQL
databases by using the SQL_NO_CHAR_C_ESCAPE option in the configuration
file or as an ODBC connection option.

``` screen
Literal         meaning
''          <empty>
''''            '
''''''          ''
'\t\r\n\\'      tab, carriage return, newline, backslash
'\012'          Character 012 octal, i.e. newline
```

</div>

</div>
