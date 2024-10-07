<div id="charescaping" class="section">

<div class="titlepage">

<div>

<div>

## 11.17. Character Escaping

</div>

</div>

</div>

The C style escape character can be used to include special characters
inside literals. The backslash character, '\\, followed by an octal
character code or a special character provides a notation for characters
that are normally not typable in a string literal such as tab or crlf.
Backslash support can be turned on or off at the statement level, the
connection level or server default level.

<div id="backslashstmt" class="section">

<div class="titlepage">

<div>

<div>

### 11.17.1. Statement Level

</div>

</div>

</div>

If you want to activate or deactivate the backslash support in a stored
procedure you can use the following two special comments (on a separate
line) :

``` programlisting
--no_c_escapes+
```

turns the backslash escaping support off (insert into x values
('c:\test') will result in 'c:\test' in the column

``` programlisting
--no_c_escapes-
```

turns the backslash escaping support on. (same as above will insert
'c:test' in the column.)

</div>

</div>
