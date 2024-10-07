<div id="lite_jetfix" class="section">

<div class="titlepage">

<div>

<div>

## 5.4. ODBC to Jet Data Type Mapping

</div>

</div>

</div>

<div id="lite_jetoverview" class="section">

<div class="titlepage">

<div>

<div>

### 5.4.1. Overview

</div>

</div>

</div>

When linking to a remote table, Microsoft Jet calls the ODBC SQLColumns
function to gather information on the fields in the table. The
information returned by SQLColumns determines how the data type of each
field will be mapped to a Microsoft Jet data type.

Jet uses the <span class="emphasis">*fSqlType*</span>,
<span class="emphasis">*lPrecision*</span>, and
<span class="emphasis">*wScale*</span> values to determine an
appropriate local data type, on a field-by-field basis, and uses that
data type to represent the remote data in a linked table. Each time
Microsoft Jet executes an action or parameter query against the remote
data source, the information stored in the linked table is used to
ensure that ODBC calls are made with a valid ODBC data type.

The Jet Engine's mapping of the ODBC SQL_DECIMAL and SQL_NUMERIC types
is detailed below. The mapping of these column types is problematic when
the precision of a column is greater than 15. Under these circumstances
Jet maps the column to the Jet Text type. This is done so as not to lose
precision, since the maximum precision of the Jet numeric types is 15.
An unfortunate consequence of mapping to the Text type is that the data
is no longer recognised as being numeric.

To overcome this limitation, the Jetfix switch (+jetfix) changes the
ODBC type returned by SQLColumns for native database column types which
would normally be reported as SQL_DECIMAL or SQL_NUMERIC. These might,
for example, be MONEY, DECIMAL or NUMERIC columns in the remote table.
With Jetfix enabled, these columns are typically reported as SQL_DOUBLE;
which Jet always maps to Number (Double). As a result, Jet recognises
the data as numeric, albeit with a possible loss of precision, depending
on the actual data values.

</div>

<div id="lite_jetmap" class="section">

<div class="titlepage">

<div>

<div>

### 5.4.2. ODBC to Jet Data Type Mapping

</div>

</div>

</div>

<div id="id44335" class="decimalstyle">

**Table 5.6. ODBC to Jet Data Type Mapping performed by Jet Engine**

<div class="decimalstyle-contents">

<table
data-summary="ODBC to Jet Data Type Mapping performed by Jet Engine"
data-border="1">
<thead>
<tr class="header">
<th colspan="3" style="text-align: center;" data-char="."
data-charoff="50">ODBC Data Type</th>
<th rowspan="2" data-valign="bottom" data-char="." data-charoff="50">Jet
Data Type</th>
<th rowspan="2" data-valign="bottom" data-char="."
data-charoff="50">Notes</th>
</tr>
<tr class="odd">
<th data-char="." data-charoff="50">Type</th>
<th data-char="." data-charoff="50">Precision p</th>
<th data-char="." data-charoff="50">Scale s</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td rowspan="7" data-char="." data-charoff="50"><p>SQL_DECIMAL</p>
<p>SQL_NUMERIC</p></td>
<td data-char="." data-charoff="50">p &lt;= 4</td>
<td data-char="." data-charoff="50">s = 0</td>
<td data-char="." data-charoff="50">Number (Integer)</td>
<td data-char="." data-charoff="50"></td>
</tr>
<tr class="even">
<td data-char="." data-charoff="50">p &lt;= 9</td>
<td data-char="." data-charoff="50">s = 0</td>
<td data-char="." data-charoff="50">Number (Long Integer)</td>
<td data-char="." data-charoff="50"></td>
</tr>
<tr class="odd">
<td data-char="." data-charoff="50">p &lt;= 15</td>
<td data-char="." data-charoff="50">0 &lt;= s &lt;=4</td>
<td data-char="." data-charoff="50">Number (Double)</td>
<td data-char="." data-charoff="50"></td>
</tr>
<tr class="even">
<td data-char="." data-charoff="50">p &lt;= 15?</td>
<td data-char="." data-charoff="50">s &gt; 4</td>
<td data-char="." data-charoff="50">Number (Double)</td>
<td data-char="." data-charoff="50">"ODBC to Jet Data Type Mapping"
document unclear here.</td>
</tr>
<tr class="odd">
<td data-char="." data-charoff="50">p = 19</td>
<td data-char="." data-charoff="50">s = 4</td>
<td data-char="." data-charoff="50">Currency</td>
<td data-char="." data-charoff="50">MS SQL Server only</td>
</tr>
<tr class="even">
<td data-char="." data-charoff="50">p = 10</td>
<td data-char="." data-charoff="50">s = 4</td>
<td data-char="." data-charoff="50">Currency</td>
<td data-char="." data-charoff="50">MS SQL Server only</td>
</tr>
<tr class="odd">
<td data-char="." data-charoff="50">p &gt; 15</td>
<td data-char="." data-charoff="50">s irrelevant</td>
<td data-char="." data-charoff="50">Text</td>
<td data-char="." data-charoff="50">Not documented. Based on
testing.</td>
</tr>
</tbody>
</table>

</div>

</div>

  

The Jet Data Type is a property setting available in the table Design
view.

</div>

<div id="lite_jetranges" class="section">

<div class="titlepage">

<div>

<div>

### 5.4.3. Jet Data Type Ranges

</div>

</div>

</div>

<div id="id44395" class="decimalstyle">

**Table 5.7. Jet Data Type Ranges**

<div class="decimalstyle-contents">

| Jet Data Type | Range                                                 |
|---------------|-------------------------------------------------------|
| Integer       | – 32,768 … 32,767                                     |
| Long Integer  | – 2,147,483,648 … 2,147,483,647                       |
| Double        | -1.8E+308 … -1.8E-308, 1.8E-308 … 1.8E+308            |
| Currency      | – 922,337,203,685,477.5808 … 922,337,203,685,477.5807 |

</div>

</div>

  

</div>

<div id="lite_jetref" class="section">

<div class="titlepage">

<div>

<div>

### 5.4.4. References

</div>

</div>

</div>

See the following articles from Microsoft:

<div class="itemizedlist">

- Knowledge base article KB214854, "Improved ODBC DataType Mappings with
  Jet 4.0" on the <a href="http://support.microsoft.com/" class="ulink"
  target="_top">Microsoft Support Website</a> .

- See Chapter 9 "Developing Client/Server Application" of Microsoft Jet
  Database Engine Programmer's Guide, Second Edition. Redmond, WA:
  Microsoft Press, 1997.

</div>

</div>

<div id="lite_jetinf" class="section">

<div class="titlepage">

<div>

<div>

### 5.4.5. Informix Jet Support

</div>

</div>

</div>

<div id="lite_jetinftest" class="section">

<div class="titlepage">

<div>

<div>

#### Informix Jetfix Testing

</div>

</div>

</div>

To verify the effect of the +jetfix switch, two tables were created and
then linked to from Access, once with +jetfix enabled, and once with
+jetfix disabled. The first table contained five MONEY columns of
various precisions and scales. The second table was identical except
that it used DECIMAL instead of MONEY columns. The resulting Jet data
type mappings as shown in the 'Table Design' view are detailed below:

<div id="id44430" class="decimalstyle">

**Table 5.8. Informix ODBC to Jet Data Type Mapping**

<div class="decimalstyle-contents">

<table data-summary="Informix ODBC to Jet Data Type Mapping"
data-border="1">
<thead>
<tr class="header">
<th rowspan="2" data-valign="bottom" data-char="."
data-charoff="50"><p>Informix table definition:</p>
<p>create table CBTEST (&lt;column defs&gt;)</p></th>
<th data-char="." data-charoff="50">Jet Type Mappings</th>
<th class="auto-generated"> </th>
</tr>
<tr class="odd">
<th data-char="." data-charoff="50">Jetfix off</th>
<th data-char="." data-charoff="50">Jetfix on</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td data-char="." data-charoff="50">col1 {MONEY| DECIMAL} (14, 4)</td>
<td data-char="." data-charoff="50">Number (Double)</td>
<td data-char="." data-charoff="50">Number (Double)</td>
</tr>
<tr class="even">
<td data-char="." data-charoff="50">col2 {MONEY| DECIMAL} (14, 5)</td>
<td data-char="." data-charoff="50">Number (Double)</td>
<td data-char="." data-charoff="50">Number (Double)</td>
</tr>
<tr class="odd">
<td data-char="." data-charoff="50">col3 {MONEY| DECIMAL} (16, 0)</td>
<td data-char="." data-charoff="50">Text</td>
<td data-char="." data-charoff="50">Number (Double)</td>
</tr>
<tr class="even">
<td data-char="." data-charoff="50">col4 {MONEY| DECIMAL} (16, 4)</td>
<td data-char="." data-charoff="50">Text</td>
<td data-char="." data-charoff="50">Number (Double)</td>
</tr>
<tr class="odd">
<td data-char="." data-charoff="50">col5 {MONEY| DECIMAL} (16, 5)</td>
<td data-char="." data-charoff="50">Text</td>
<td data-char="." data-charoff="50">Number (Double)</td>
</tr>
</tbody>
</table>

</div>

</div>

  

</div>

<div id="lite_jetinfnum" class="section">

<div class="titlepage">

<div>

<div>

#### OpenLink Informix Agent – Numeric Data type Mappings

</div>

</div>

</div>

The following table details how the Informix agent fetches numeric data
from Informix. The SQL type reported for a SELECT column varies
depending on the native Informix type of the column, and its precision
and scale. The OpenLink C type used to fetch the data is also shown,
together with the effect of the JetFix command line switch.

Changes to the type mappings required to implement the +jetfix option
are shown in

``` screen
italics
```

.

<div id="id44472" class="decimalstyle">

**Table 5.9. Informix Agent – Numeric Data type Mappings**

<div class="decimalstyle-contents">

<table data-summary="Informix Agent  Numeric Data type Mappings"
data-border="1">
<thead>
<tr class="header">
<th data-char="." data-charoff="50">Informix Type</th>
<th data-char="." data-charoff="50">Scale (s)</th>
<th data-char="." data-charoff="50"><p>Decimal Precision (p)</p>
<p>Range (r)</p></th>
<th data-char="." data-charoff="50">JetFix</th>
<th data-char="." data-charoff="50">SQL Type</th>
<th data-char="." data-charoff="50"><p>OpenLink Fetch Type</p>
<p>CTYPE_xxx</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td data-char="." data-charoff="50"><p>FLOAT [(n)] {1}</p>
<p>Synonyms:</p>
<p>DOUBLE PRECISION</p></td>
<td data-char="." data-charoff="50">NA</td>
<td data-char="." data-charoff="50"><p>p &lt;= 16</p>
<p>r = 1.7E 308 (15 digits precision)</p></td>
<td data-char="." data-charoff="50">NA</td>
<td data-char="." data-charoff="50">SQL_DOUBLE</td>
<td data-char="." data-charoff="50">FLT64</td>
</tr>
<tr class="even">
<td rowspan="2" data-char="." data-charoff="50"><p>DECIMAL</p>
<p>DECIMAL (p)</p>
<p>DECIMAL (p,s)</p>
<p>Synonyms:</p>
<p>NUMERIC</p></td>
<td rowspan="2" data-char="." data-charoff="50"><p>NA</p>
<p>NA</p></td>
<td rowspan="2" data-char="." data-charoff="50"><p>p = 16</p>
<p>p &lt;= 32</p>
<p>p &lt;= 32</p>
<p>r = 1E+124 … 1E-130 ..</p></td>
<td data-char="." data-charoff="50">OFF</td>
<td data-char="." data-charoff="50">SQL_DECIMAL</td>
<td data-char="." data-charoff="50">VCHR</td>
</tr>
<tr class="odd">
<td data-char="." data-charoff="50"><pre class="screen"><code>ON</code></pre></td>
<td data-char="." data-charoff="50"><pre class="screen"><code>SQL_DOUBLE</code></pre></td>
<td data-char="." data-charoff="50"><pre class="screen"><code>FLT64  {2}</code></pre></td>
</tr>
<tr class="even">
<td data-char="." data-charoff="50"><p>INTEGER</p>
<p>Synonymns:</p>
<p>INT</p></td>
<td data-char="." data-charoff="50">s = 0</td>
<td data-char="." data-charoff="50"><p>p &lt;= 9</p>
<p>r = -2,147,483,648 to +2,147,483,647</p></td>
<td data-char="." data-charoff="50">NA</td>
<td data-char="." data-charoff="50">SQL_INTEGER</td>
<td data-char="." data-charoff="50">SGN32</td>
</tr>
<tr class="odd">
<td rowspan="2" data-char="." data-charoff="50"><p>MONEY</p>
<p>MONEY(p)</p>
<p>MONEY (p,s)</p></td>
<td rowspan="2" data-char="." data-charoff="50"><p>s = 2</p>
<p>s = 2</p></td>
<td rowspan="2" data-char="." data-charoff="50"><p>p = 16</p>
<p>p &lt;= 32</p>
<p>p &lt;=32</p>
<p>r = 1E(p-s) - 1E(-s)</p></td>
<td data-char="." data-charoff="50">OFF</td>
<td data-char="." data-charoff="50">SQL_DECIMAL</td>
<td data-char="." data-charoff="50">VCHR</td>
</tr>
<tr class="even">
<td data-char="." data-charoff="50"><pre class="screen"><code>ON</code></pre></td>
<td data-char="." data-charoff="50"><pre class="screen"><code>SQL_DOUBLE</code></pre></td>
<td data-char="." data-charoff="50"><pre class="screen"><code>FLT64 {2}</code></pre></td>
</tr>
<tr class="odd">
<td data-char="." data-charoff="50"><p>SMALLFLOAT</p>
<p>Synonyms:</p>
<p>REAL</p></td>
<td data-char="." data-charoff="50">NA</td>
<td data-char="." data-charoff="50">r = 3.4E38</td>
<td data-char="." data-charoff="50">NA</td>
<td data-char="." data-charoff="50">SQL_REAL</td>
<td data-char="." data-charoff="50">FLT32</td>
</tr>
<tr class="even">
<td data-char="." data-charoff="50">SMALLINT</td>
<td data-char="." data-charoff="50">s = 0</td>
<td data-char="." data-charoff="50"><p>p = 5</p>
<p>r = -32,768 to +32,767</p></td>
<td data-char="." data-charoff="50">NA</td>
<td data-char="." data-charoff="50">SQL_SMALLINT</td>
<td data-char="." data-charoff="50">SGN16</td>
</tr>
</tbody>
</table>

</div>

</div>

  

<div class="itemizedlist">

- {1} Informix SQL ignores the specified float precision.

- {2} Possible loss of precision.

</div>

</div>

<div id="lite_jetinfctype" class="section">

<div class="titlepage">

<div>

<div>

#### Precision of OpenLink C Types

</div>

</div>

</div>

The choice of OpenLink C type used to fetch a numeric value is
determined by the maximum precision supported by the type. If a numeric
type exists which can represent the data to be fetched, without loss of
precision, then this is used as the preferred fetch type. If a numeric
type capable of supporting the required precision does not exist, then
the data is fetched in character form, unless the JetFix switch is on.
In this case, the data is fetched using the CTYPE_FLT64 fetch type. This
type has sufficient range to store the maximum numeric values supported
by Informix, but its use may result in a loss of precision, if the
precision of the data to be fetched exceeds 15 decimal digits.

<div id="id44587" class="decimalstyle">

**Table 5.10. Precision of OpenLink C Types**

<div class="decimalstyle-contents">

| OpenLink C Type CTYPE_xxx | Equivalent built in C type (32bit processor) | Range                           | Can hold all numbers of precision \<= p decimal digits |
|---------------------------|----------------------------------------------|---------------------------------|--------------------------------------------------------|
| SGN8                      | signed char                                  | -128…127                        | p = 2                                                  |
| SGN16                     | short                                        | -32768…32767                    | p = 4                                                  |
| FLT32                     | float                                        | 3.4E38 (6 digits precision)     | p = 6                                                  |
| SGN32                     | long                                         | -2,147,483,648…2,147,483,647    | p = 9                                                  |
| FLT64                     | double                                       | 1.7 E 308 (15 digits precision) | p = 15                                                 |

</div>

</div>

  

</div>

</div>

<div id="lite_jetora" class="section">

<div class="titlepage">

<div>

<div>

### 5.4.6. Oracle Jet Support

</div>

</div>

</div>

<div id="lite_jetoramap" class="section">

<div class="titlepage">

<div>

<div>

#### OpenLink Oracle Agent – Numeric Data type Mappings

</div>

</div>

</div>

The following table details how the Oracle agent fetches numeric data
from Oracle. The SQL type reported for a SELECT column varies depending
on the native Oracle type of the column, and its precision and scale.
The OpenLink C type used to fetch the data is also shown, together with
the effect of the JetFix command line switch.

Changes to the type mappings are shown in the table as

``` screen
italics
```

.

<div id="id44629" class="decimalstyle">

**Table 5.11. Informix ODBC to Jet Data Type Mapping**

<div class="decimalstyle-contents">

<table data-summary="Informix ODBC to Jet Data Type Mapping"
data-border="1">
<thead>
<tr class="header">
<th data-char="." data-charoff="50">Oracle Type</th>
<th data-char="." data-charoff="50">Scale (s)</th>
<th data-char="." data-charoff="50">Decimal Precision (p)</th>
<th data-char="." data-charoff="50">JetFix</th>
<th data-char="." data-charoff="50">SQL Type</th>
<th data-char="." data-charoff="50">OpenLink Fetch Type CTYPE_xxx</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td rowspan="3" data-char="." data-charoff="50">FLOAT (b)</td>
<td rowspan="3" data-char="." data-charoff="50">NA</td>
<td data-char="." data-charoff="50"><p>p &lt;= 15</p>
<p>(b &lt;= 50) {1}</p></td>
<td data-char="." data-charoff="50">NA</td>
<td data-char="." data-charoff="50">SQL_DOUBLE</td>
<td data-char="." data-charoff="50">FLT64</td>
</tr>
<tr class="even">
<td rowspan="2" data-char="." data-charoff="50"><p>15 &lt; p &lt; 38</p>
<p>(50 &lt; b &lt; 126)</p></td>
<td data-char="." data-charoff="50">ON</td>
<td data-char="." data-charoff="50">SQL_DOUBLE</td>
<td data-char="." data-charoff="50">FLT64 {2}</td>
</tr>
<tr class="odd">
<td data-char="." data-charoff="50">OFF</td>
<td data-char="." data-charoff="50">SQL_DECIMAL</td>
<td data-char="." data-charoff="50">VCHR16</td>
</tr>
<tr class="even">
<td rowspan="2" data-char="." data-charoff="50">FLOAT {3} , NUMBER
{4}</td>
<td rowspan="2" data-char="." data-charoff="50">NA</td>
<td rowspan="2" data-char="." data-charoff="50">p = 38</td>
<td data-char="." data-charoff="50">ON</td>
<td data-char="." data-charoff="50">SQL_DOUBLE</td>
<td data-char="." data-charoff="50">FLT64 {2}</td>
</tr>
<tr class="odd">
<td data-char="." data-charoff="50">OFF</td>
<td data-char="." data-charoff="50">SQL_DECIMAL</td>
<td data-char="." data-charoff="50">VCHR16</td>
</tr>
<tr class="even">
<td rowspan="4" data-char="." data-charoff="50">NUMBER (p,s)</td>
<td rowspan="4" data-char="." data-charoff="50">s &lt;&gt; 0</td>
<td rowspan="2" data-char="." data-charoff="50">p &lt;= 15</td>
<td data-char="." data-charoff="50">ON</td>
<td data-char="." data-charoff="50">SQL_DOUBLE</td>
<td data-char="." data-charoff="50">FLT64</td>
</tr>
<tr class="odd">
<td data-char="." data-charoff="50">OFF</td>
<td data-char="." data-charoff="50">SQL_DECIMAL</td>
<td data-char="." data-charoff="50">VCHR16</td>
</tr>
<tr class="even">
<td rowspan="2" data-char="." data-charoff="50">p &gt; 15</td>
<td data-char="." data-charoff="50">ON</td>
<td data-char="." data-charoff="50"><p>SQL_DECIMAL</p>
<pre class="screen"><code>SQL_DOUBLE</code></pre></td>
<td data-char="." data-charoff="50"><p>VCHR16</p>
<pre class="screen"><code>FLT64</code></pre>
<p>{2}?</p></td>
</tr>
<tr class="odd">
<td data-char="." data-charoff="50">OFF</td>
<td data-char="." data-charoff="50">SQL_DECIMAL</td>
<td data-char="." data-charoff="50">VCHR16</td>
</tr>
<tr class="even">
<td rowspan="2" data-char="." data-charoff="50">Calculated field</td>
<td rowspan="2" data-char="." data-charoff="50">s = 0</td>
<td rowspan="2" data-char="." data-charoff="50">p = 0 {5}</td>
<td data-char="." data-charoff="50">ON</td>
<td data-char="." data-charoff="50">SQL_DOUBLE</td>
<td data-char="." data-charoff="50">FLT64</td>
</tr>
<tr class="odd">
<td data-char="." data-charoff="50">OFF</td>
<td data-char="." data-charoff="50">SQL_DECIMAL</td>
<td data-char="." data-charoff="50">VCHR16</td>
</tr>
<tr class="even">
<td rowspan="7" data-char="." data-charoff="50">NUMBER (p)</td>
<td rowspan="7" data-char="." data-charoff="50">s = 0</td>
<td data-char="." data-charoff="50">0 &lt; p &lt;= 2</td>
<td data-char="." data-charoff="50">NA</td>
<td data-char="." data-charoff="50">SQL_TINYINT</td>
<td data-char="." data-charoff="50">SGN8</td>
</tr>
<tr class="odd">
<td data-char="." data-charoff="50">2 &lt; p &lt;= 4</td>
<td data-char="." data-charoff="50">NA</td>
<td data-char="." data-charoff="50">SQL_SMALLINT</td>
<td data-char="." data-charoff="50">SGN16</td>
</tr>
<tr class="even">
<td data-char="." data-charoff="50">4 &lt; p &lt;= 9</td>
<td data-char="." data-charoff="50">NA</td>
<td data-char="." data-charoff="50">SQL_INTEGER</td>
<td data-char="." data-charoff="50">SGN32</td>
</tr>
<tr class="odd">
<td rowspan="2" data-char="." data-charoff="50">9 &lt; p &lt;= 15</td>
<td data-char="." data-charoff="50">ON</td>
<td data-char="." data-charoff="50">SQL_DOUBLE</td>
<td data-char="." data-charoff="50"><p>VCHR16</p>
<pre class="screen"><code>FLT64</code></pre></td>
</tr>
<tr class="even">
<td data-char="." data-charoff="50">OFF</td>
<td data-char="." data-charoff="50"><p>SQL_DOUBLE</p>
<pre class="screen"><code>SQL_DECIMAL</code></pre></td>
<td data-char="." data-charoff="50">VCHR16</td>
</tr>
<tr class="odd">
<td rowspan="2" data-char="." data-charoff="50">15 &lt; p &lt;= 38
{6}</td>
<td data-char="." data-charoff="50">ON</td>
<td data-char="." data-charoff="50">SQL_DOUBLE</td>
<td data-char="." data-charoff="50">FLT64{2}</td>
</tr>
<tr class="even">
<td data-char="." data-charoff="50">OFF</td>
<td data-char="." data-charoff="50">SQL_DECIMAL</td>
<td data-char="." data-charoff="50">VCHR16</td>
</tr>
</tbody>
</table>

</div>

</div>

  

{Notes}:

<div class="itemizedlist">

- FLOAT(b) specifies a floating point number with binary precision b.
  The precision can range from 1 to 126. To convert from binary to
  decimal precision, multiply b by 0.30103.

- Possible loss of precision

- FLOAT specifies a floating point number with decimal precision 38, or
  a binary precision of 126.

- NUMBER specifies a floating point number with decimal precision = 38.

- Oracle appears to return s=0, p=0 for a calculated field

- Oracle permits a maximum precision of 38.

</div>

</div>

<div id="lite_jetoractype" class="section">

<div class="titlepage">

<div>

<div>

#### Precision of OpenLink C Types

</div>

</div>

</div>

The choice of OpenLink C type used to fetch a numeric value is
determined by the maximum precision supported by the type. If a numeric
type exists which can represent the data to be fetched, without loss of
precision, then this is used as the preferred fetch type. If a numeric
type capable of supporting the required precision does not exist, then
the data is fetched in character form, unless the JetFix switch is on.
In this case, the data is fetched using the CTYPE_FLT64 fetch type. This
type has sufficient range to store the maximum numeric values supported
by Oracle, but its use may result in a loss of precision, if the
precision of the data to be fetched exceeds 15 decimal digits.

<div id="id44767" class="decimalstyle">

**Table 5.12. Precision of OpenLink Oracle C Types**

<div class="decimalstyle-contents">

| OpenLink C Type CTYPE_xxx | Equivalent built in C type (32 bit processor) | Range                           | Can hold all numbers of precision \<= p decimal digits |
|---------------------------|-----------------------------------------------|---------------------------------|--------------------------------------------------------|
| SGN8                      | signed char                                   | -128…127                        | p = 2                                                  |
| SGN16                     | short                                         | -32768…32767                    | p = 4                                                  |
| SGN32                     | long                                          | -2,147,483,648…2,147,483,647    | p = 9                                                  |
| FLT64                     | double                                        | 1.7 E 308 (15 digits precision) | p = 15                                                 |

</div>

</div>

  

</div>

</div>

</div>
