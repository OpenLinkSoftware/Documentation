<div id="lite_unicodechapter" class="chapter">

<div class="titlepage">

<div>

<div>

# Chapter 10. OpenLink ODBC Driver (Single-Tier Edition) Unicode Support

</div>

<div>

<div class="abstract">

**Abstract**

Our drivers support the latest releases of all supported database
engines. This includes:

<div class="orderedlist">

1.  Oracle 8i & 9i

2.  Microsoft SQL Server 2000

3.  DB/2 v7

4.  Informix 9

5.  Sybase Adaptive Server 12.5

6.  Progress 9 (SQL-92)

</div>

Note that for those Drivers above for which Unicode Support is provided
a unicode and non-unicode enabled Driver is provided with ODBC driver
names of the form:

``` screen
OpenLink Lite for Database (32 Bit) (Unicode)      ; Unicode enabled driver
```

``` screen
OpenLink Lite for Database (32 Bit)            ; Non-unicode enabled driver
```

Where 'Database' is the name of the Database from the list of unicode
enabled drivers above. The Uniocde enabled driver should be used when
connecting to a unicode created database, otherwise we recommend you use
the non-uniocde driver for connecting to a non-unicode created
databases.

</div>

</div>

</div>

</div>

<div class="toc">

**Table of Contents**

<span class="section">10.1. [Database Configuration for
Unicode](lite_unicode.html)</span>

<span class="section">10.1.1. [Oracle 8 &
9](lite_unicode.html#lite_uniora)</span>

<span class="section">10.1.2. [Informix
9.x](lite_unicode.html#lite_uniinf)</span>

<span class="section">10.1.3. [Sybase 12.5
+](lite_unicode.html#lite_unisyb)</span>

<span class="section">10.1.4. [Progress 9.1
(SQL-92)](lite_unicode.html#lite_unipro)</span>

<span class="section">10.1.5. [DB/2
v7.x](lite_unicode.html#lite_unidb2)</span>

<span class="section">10.1.6. [MS SQLServer
2000](lite_unicode.html#lite_unisql)</span>

<span class="section">10.1.7. [Operational
Notes](lite_unicode.html#lite_unigeninfo)</span>

</div>

</div>
