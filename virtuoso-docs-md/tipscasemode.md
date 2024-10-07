<div id="tipscasemode" class="section">

<div class="titlepage">

<div>

<div>

### 3.14.3. Case Mode

</div>

</div>

</div>

Whenever a database object is referenced, all names (schema, owner,
table and column) should preferably be placed in double-quotes, exactly
as it appears in the catalog. This way, the object name in the Virtuoso
catalog will be correctly referenced. If names are not quoted, then the
case of the object name will be determined by the value of the CaseMode
property in the virtuoso.ini file:

<div class="itemizedlist">

- The default files supplied with Virtuoso specify a CaseMode of 2,
  which is a case insensitive mode that preserves the declaration case
  of identifiers. If there is no supplied ini file, the default value of
  CaseMode is 1.

- A CaseMode of 1 specifies the upper case mode, which is most commonly
  used in SQL databases, e.g. Oracle. In the upper case mode, all
  unquoted identifiers are converted to upper case by the SQL parser. If
  identifiers are not quoted, the case in which they are entered is
  irrelevant.

- The identifier quote character is the double quote ("). Quoted
  identifiers are processed in the case they are written in and are thus
  case sensitive.

- SQL reserved words are case insensitive in all case modes.

- If CaseMode is 0 or absent, identifiers will be treated as case
  sensitive in all situations, whether quoted or not.

- If an identifier's name is equal to a SQL reserved word, e.g. TABLE,
  it must be quoted ("TABLE") in order to be used as an identifier.

- If an identifier contains non-alphanumeric characters, e.g. space, '-'
  etc. it must be quoted regardless of CaseMode.

- Although CaseMode can be changed at any time it should only be set at
  database creation. Changing the CaseMode may result in view or
  procedure code becoming invalid if it relies on specific case
  conventions.

</div>

<div class="figure-float">

<div id="image33" class="figure">

**Figure 3.59. Virtuoso.ini file in notepad**

<div class="figure-contents">

<div class="mediaobject">

![Virtuoso.ini file in notepad](images/virttour33.gif)

</div>

</div>

</div>

  

</div>

</div>
