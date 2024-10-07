<div id="wideidentifiers" class="section">

<div class="titlepage">

<div>

<div>

## 9.5. Wide Character Identifiers

</div>

</div>

</div>

All Virtuoso schema columns are confined to 8-bit character fields. This
will remain for backwards compatibility and performance reasons,
however, there are two options available for support of non-ASCII
identifier names as follows:

<div class="itemizedlist">

- Maintain an 8-bit system. Pass all 8-bit codes that enter the system
  and read them back according to the current database character set.
  This has the convenience of a 1-to-1 correspondence between the
  character lengths of an identifier and their representation, so it's a
  subject to like single character wildcards etc.

  This works well only for languages that do have single bit encodings
  (like western-european languages and cyrillic). But this does not work
  at all for the far-east languages. It also depends on the database
  character set and does not allow identifiers to be composed from
  multiple character sets.

- Store all identifiers as UTF-8 encoded unicode strings. This would
  allow seamless storage and retrieval of ANY character within the
  unicode character space. This, however, has the disadvantage of the
  varying character length representation which should be taken into
  account when comparing identifier names with LIKE.

</div>

Virtuoso supports the above cases which are switchable through the
"SQL_UTF8_EXECS" = 1/0 flag in the \[Client\] section of the Virtuoso
INI file. Setting SQL_UTF8_EXECS = 1 enables UTF-8 identifier storage
and retrieval, whereas setting SQL_UTF8_EXECS = 0 disables it. The
default setting is 0: disabled for backwards compatible option.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                            |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                      |
|                              | Once a non-ASCII identifier gets stored using a particular setting for the "SQL_UTF8_EXECS" flag and the flag is subsequently changed this will make the stored identifiers unreadable by normal means (but can be read by special means). |

</div>

When an SQL statement comes into the driver(s) it is expanded into
unicode (using either the current database character set if it is a
narrow string like in SQLExecDirect, or taking it verbatim as in
SQLExecDirectW). The unicode string is then encoded into UTF-8 passed to
the SQL parser. The SQL parser knows that it will receive UTF-8 so it
takes that into account when parsing the national character literals
(N'\<literal\>') and the "normal" literals ('\<literal\>'). It will
however return identifier names in UTF-8, these will then get stored
into the DBMS system tables or compared against them depending on the
type of statement.

All returned identifiers will be translated from UTF-8 to Unicode when
returned to the client, so the client should never actually see the
UTF-8 encoding of the identifiers.

Representing a string in UTF-8 will not change the identifier parsing
rules or the SQL applications logic since the SQL special characters -
like dot, quote, space etc - are ASCII symbols and they will get
represented as a single byte sequence in UTF-8.

The upper/lower functions should be used with care when applied to
identifiers: they will get narrow strings in UTF-8, so applying an
upper/lower to them may cause damage to the UTF-8 encoding. That is why
the identifiers should be converted explicitly to wide strings using the
charset_recode function, changed to upper or lower case and then
translated back to UTF-8 using the charset_recode function again.

Using single character LIKE patterns against identifiers stored as
narrow strings in system tables will generally not work, as a single
character may be represented with up to 6 bytes in UTF-8. An exception
to that is when using single character pattern to match an ASCII
character.

<div id="utf8notes4odbc" class="section">

<div class="titlepage">

<div>

<div>

### 9.5.1. UTF-8 Implementation Notes For ODBC

</div>

</div>

</div>

All wide functions which do return an identifier, like SQLDescribeColW
and friends, will return the correct wide literal. For their narrow
counterparts, such as SQLDescribeCol, the UTF-8 string will first be
converted to a wide string and then to a narrow string using the current
database character set. However, an extension to the ODBC standard has
been implemented instructing all result set returning meta-data
functions, such as SQLTables and SQLTablesW, to return SQL_NVARCHAR
instead of SQL_VARCHAR columns. This is not a problem for most
applications since all they do is to map the result to SQL_C_CHAR on
retrieval which will convert the wide string to the appropriate narrow
string inside the driver using the current database character set. This
will cause problems with narrow applications like MS Query, trying to
get identifiers not representable in the current narrow character set,
because all they will get is the "untranslatable char" mark (currently a
question mark).

</div>

</div>
