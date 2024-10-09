<div>

<div>

<div>

<div>

# Chapter 9. SQL Reference

</div>

<div>

<div>

**Abstract**

SQL Reference.

</div>

</div>

</div>

</div>

<div>

**Table of Contents**

<span class="section">9.1.
[Datatypes](ch-sqlreference.html#sqlrefdatatypes)</span>

<span class="section">9.1.1. [Date
Literals](ch-sqlreference.html#dt_dateliterals)</span>

<span class="section">9.1.2.
[Casting](ch-sqlreference.html#dtcasting)</span>

<span class="section">9.1.3. [Time & Date
Manipulation](ch-sqlreference.html#sqldatemanus)</span>

<span class="section">9.1.4. [Declaring Collations of
Expressions](ch-sqlreference.html#deccolexp)</span>

<span class="section">9.2. [User Defined
Types](udt_overview.html)</span>

<span class="section">9.2.1. [CREATE TYPE
Statement](udt_overview.html#udtcreatetypestmt)</span>

<span class="section">9.2.2. [ALTER TYPE
Statement](udtaltertypestmt.html)</span>

<span class="section">9.2.3. [DROP TYPE
Statement](udtdroptypestmt.html)</span>

<span class="section">9.2.4. [CREATE METHOD
Statement](udtcreatemethodstmt.html)</span>

<span class="section">9.2.5. [Type
Instances](udttypeinstances.html)</span>

<span class="section">9.2.6. [Instance
References](udtinstancerefs.html)</span>

<span class="section">9.2.7. [NEW Operator](udtnewop.html)</span>

<span class="section">9.2.8. [Finding Methods - Method Signatures
Generation & Comparison](udtfindingmethods.html)</span>

<span class="section">9.2.9. [Getting & Setting Member Values of Type
Instances (member observers &
mutators)](udtgetsetmembervals.html)</span>

<span class="section">9.2.10. [Calling Static
Methods](udtstaticmethods.html)</span>

<span class="section">9.2.11. [Calling Instance
Methods](udtcallinstmethod.html)</span>

<span class="section">9.2.12. [Serializing & Deserializing Type
Instances](udtserilizingtypeinst.html)</span>

<span class="section">9.2.13. [User Defined Types Utility
Functions](udtutilfuncs.html)</span>

<span class="section">9.2.14. [Hosted Foreign Objects in
Virtuoso](udthostedforiegnobjects.html)</span>

<span class="section">9.2.15. [Using User Defined Types to Represent
SOAP Structures](udtrepressentsoapstruct.html)</span>

<span class="section">9.2.16. [Consuming Third-Party SOAP Services via
User Defined Types](udtcnsmsoap.html)</span>

<span class="section">9.2.17. [UDT Security](udtsecurity.html)</span>

<span class="section">9.3. [XML Column
Type](sqlrefxmldatatype.html)</span>

<span class="section">9.4. [Identifier Case &
Quoting](catidentifiers.html)</span>

<span class="section">9.5. [Wide Character
Identifiers](wideidentifiers.html)</span>

<span class="section">9.5.1. [UTF-8 Implementation Notes For
ODBC](wideidentifiers.html#utf8notes4odbc)</span>

<span class="section">9.5.2. [UTF-8 Implementation Notes In
JDBC](utf8notes4jdbc.html)</span>

<span class="section">9.6. [Qualified Names](qualifiednames.html)</span>

<span class="section">9.6.1. [Qualifiers and
Owners](qualifiednames.html#qual_owners)</span>

<span class="section">9.6.2. [Default
Qualifiers](defaultqualifiers.html)</span>

<span class="section">9.6.3. [USE Statement, USE
identifier](userstmtid.html)</span>

<span class="section">9.7. [Literals, Brace
Escapes](litsbraceescs.html)</span>

<span class="section">9.7.1.
[Strings](litsbraceescs.html#strings)</span>

<span class="section">9.7.2. [Numbers](numbers.html)</span>

<span class="section">9.7.3. [ODBC Brace
Escapes](odbcbraceesc.html)</span>

<span class="section">9.7.4. [Hexadecimal
Literals](sqlrefhexliterals.html)</span>

<span class="section">9.7.5. [Binary
Literals](sqlrefbinliterals.html)</span>

<span class="section">9.8. [CREATE TABLE
Statement](createtable.html)</span>

<span class="section">9.8.1. [Syntax](createtable.html#syntax)</span>

<span class="section">9.8.2. [NOT NULL](consnotnull.html)</span>

<span class="section">9.8.3. [IDENTITY (Auto
Increment)](identity.html)</span>

<span class="section">9.8.4. [DEFAULT](default.html)</span>

<span class="section">9.8.5. [PRIMARY KEY
Constraint](pkeycons.html)</span>

<span class="section">9.8.6. [UNDER](under.html)</span>

<span class="section">9.8.7. [FOREIGN KEY Constraint](fkeys.html)</span>

<span class="section">9.8.8. [The CHECK
Constraint](sqlrefcreattablecheck.html)</span>

<span class="section">9.8.9. [The WITH SCHEMA
Constraint](sqlrefcreattablewithschema.html)</span>

<span class="section">9.9. [DROP TABLE Statement](droptable.html)</span>

<span class="section">9.10. [CREATE INDEX
Statement](createindex.html)</span>

<span class="section">9.11. [DROP INDEX
Statement](dropindex.html)</span>

<span class="section">9.12. [ALTER TABLE
Statement](altertable.html)</span>

<span class="section">9.12.1. [Adding a CHECK
Constraint](altertable.html#sqlrefalttabcheck)</span>

<span class="section">9.13. [CREATE VIEW
Statement](createview.html)</span>

<span class="section">9.14. [CREATE XML SCHEMA
Statement](createxmlschema.html)</span>

<span class="section">9.15. [DROP XML SCHEMA
Statement](dropxmlschema.html)</span>

<span class="section">9.16. [Sequence
Objects](sequenceobjects.html)</span>

<span class="section">9.17. [INSERT Statement](insertstmt.html)</span>

<span class="section">9.17.1. [INSERT
SOFT](insertstmt.html#insertsoft)</span>

<span class="section">9.17.2. [INSERT
REPLACING](insertreplacing.html)</span>

<span class="section">9.18. [UPDATE Statement](updatestmt.html)</span>

<span class="section">9.19. [SELECT Statement](selectstmt.html)</span>

<span class="section">9.19.1.
[Syntax](selectstmt.html#selectsyntax)</span>

<span class="section">9.19.2. [Description](descrip.html)</span>

<span class="section">9.19.3. [Column Aliasing - AS
Declaration](asdec.html)</span>

<span class="section">9.19.4. [Join examples](joinexamples.html)</span>

<span class="section">9.19.5. [Ordering and
Grouping](ordergrping.html)</span>

<span class="section">9.19.6. [Grouping Sets](gsets.html)</span>

<span class="section">9.19.7. [Derived
Tables](derivedtables.html)</span>

<span class="section">9.19.8. [Query
Expressions](qryexpressions.html)</span>

<span class="section">9.19.9. [LIKE Predicate & Search
Patterns](likepredicate.html)</span>

<span class="section">9.19.10. [The TOP SELECT
Option](topselectoption.html)</span>

<span class="section">9.19.11. [CASE, NULLIF, COALESCE, CAST Value
Expressions](caseandco.html)</span>

<span class="section">9.19.12. [SELECT BREAKUP](selbreackup.html)</span>

<span class="section">9.20. [COMMIT WORK, ROLLBACK WORK
Statement](commit_rollback.html)</span>

<span class="section">9.21. [CHECKPOINT, SHUTDOWN
Statement](checkpoint.html)</span>

<span class="section">9.21.1. [Checkpoint & Page
Remapping](checkpoint.html#checkpointparams)</span>

<span class="section">9.22. [Stored Procedures as Views & Derived
Tables](spasviewsandtables.html)</span>

<span class="section">9.22.1. [Procedure Table
Parameters](spasviewsandtables.html#proctabparams)</span>

<span class="section">9.22.2. [Procedure Table Result
Sets](proctabressets.html)</span>

<span class="section">9.22.3. [Procedure Tables &
Security](proctabsecurity.html)</span>

<span class="section">9.22.4. [Procedure Table Cost and Join
Order](proctabcost.html)</span>

<span class="section">9.22.5. [Limitations](proctablimits.html)</span>

<span class="section">9.22.6. [Procedure Table
Examples](procexamples.html)</span>

<span class="section">9.23. [GRANT, REVOKE Statement](grant.html)</span>

<span class="section">9.24. [SET Statement](setstmt.html)</span>

<span class="section">9.24.1. [ISOLATION](setstmt.html#isolation)</span>

<span class="section">9.24.2.
[LOCK_ESCALATION_PCT](lockescalation.html)</span>

<span class="section">9.24.3.
[transaction_timeout](transactiontimeout.html)</span>

<span class="section">9.24.4. [PARAM_BATCH](parambatch.html)</span>

<span class="section">9.25. [Anytime
Queries](anytimequeries.html)</span>

<span class="section">9.26. [Best Effort
Union](besteffortunion.html)</span>

<span class="section">9.27. [Standard and User-Defined Aggregate
Functions](aggregates.html)</span>

<span class="section">9.27.1. [Create Aggregate
Statement](aggregates.html#aggcreateaggrstmt1)</span>

<span class="section">9.27.2. [Drop Aggregate
Statement](aggdropaggrstmt.html)</span>

<span class="section">9.27.3. [Examples of User-Defined
Aggregates](createaggrsam.html)</span>

<span class="section">9.28. [Virtuoso SQL
Optimization](sqloptimizer.html)</span>

<span class="section">9.28.1. [Optimization
Techniques](sqloptimizer.html#opttechniques)</span>

<span class="section">9.28.2. [Query Options](queryoptions.html)</span>

<span class="section">9.28.3. [Query Optimization
Diagnostics](queryoptdiagn.html)</span>

<span class="section">9.28.4. [ANY ORDER](opttechanyorder.html)</span>

<span class="section">9.28.5. [VDB Statistics for the SQL Compiler
Collection](vdbcoststats.html)</span>

<span class="section">9.29. [SQL Inverse
Functions](sqlinverse.html)</span>

<span class="section">9.29.1. [Updating through
Inverses](sqlinverse.html#updthoughinverses)</span>

<span class="section">9.30. [SQL Grammar](grammar.html)</span>

<span class="section">9.31. [Bitmap Indices](bitmapindices.html)</span>

<span class="section">9.31.1. [Bitmap Indices and
Transactions](bitmapindices.html#bitmapindandtrans)</span>

<span class="section">9.31.2. [Performance
Implications](bitmapindandperfmimpl.html)</span>

<span class="section">9.31.3. [Physical Structure and
Overheads](physicalstroverheads.html)</span>

<span class="section">9.32. [Transitivity in
SQL](transitivityinsql.html)</span>

<span class="section">9.33. [Fast Phrase Match
Processor](sqlreffastphrasematch.html)</span>

<span class="section">9.33.1. [Phrases, Phrase Sets and Phrase
Classes](sqlreffastphrasematch.html#sqlreffastphrasematchscl)</span>

<span class="section">9.33.2. [Phrase Set Configuration
API](sqlreffastphrasematchapi.html)</span>

<span class="section">9.33.3. [Advertisers and Advertisement
Rules](sqlreffastphrasematchsadv.html)</span>

<span class="section">9.33.4.
[Example](sqlreffastphraseexample.html)</span>

<span class="section">9.34. [Geometry Data Types and Spatial Index
Support](sqlrefgeospatial.html)</span>

<span class="section">9.34.1. [Spatial
References](sqlrefgeospatial.html#sqlrefgeospatialspatref)</span>

<span class="section">9.34.2. [Geometric
Objects](sqlrefgeospatialgo.html)</span>

<span class="section">9.34.3. [Precision of
Geometries](sqlrefgeospatialpg.html)</span>

<span class="section">9.34.4.
[Predicates](sqlrefgeospatialpr.html)</span>

<span class="section">9.34.5. [Querying Geometric
Relations](sqlrefgeospatialqgr.html)</span>

<span class="section">9.34.6. [Defining a Geometry
Index](sqlrefgeospatialdgi.html)</span>

<span class="section">9.34.7. [Insert and
Delete](sqlrefgeospatialinsdel.html)</span>

<span class="section">9.34.8. [Using Geometries in Client Applications
and SQL Procedures](sqlrefgeospatialugcp.html)</span>

<span class="section">9.34.9. [Virtuoso 7.1+ Geo Spatial Data type and
function enhancements](sqlrefgeospatial7enchance.html)</span>

<span class="section">9.35. [SQL Bulk Load, ELT, File Tables and Zero
Load Operations](sqlbulkloadoperations.html)</span>

<span class="section">9.35.1. [File
Tables](sqlbulkloadoperations.html#sqlbulkloadoperationsftable)</span>

<span class="section">9.35.2. [Parallel Insert With File Tables and
Transactions](sqlbulkloadoperationsftableparallel.html)</span>

</div>

<div>

<div>

<div>

<div>

## 9.1. Datatypes

</div>

</div>

</div>

<div>

<span class="term">CHARACTER</span>  
CHARACTER

VARCHAR

VARCHAR'('INTNUM')'

NVARCHAR

NVARCHAR'('INTNUM')'

CHAR'('INTNUM')'

<span class="term">NUMERIC</span>  
NUMERIC

NUMERIC'('INTNUM')'

NUMERIC'('INTNUM','INTNUM')'

<span class="term">DECIMAL</span>  
DECIMAL

DECIMAL'('INTNUM')'

DECIMAL'('INTNUM','INTNUM')'

<span class="term">INTEGER</span>  
INT

INTEGER

SMALLINT

<span class="term">FLOAT</span>  
FLOAT

FLOAT'('INTNUM')'

<span class="term">REAL</span>  
REAL

DOUBLE PRECISION

<span class="term">LONG VARCHAR</span>  
BLOB data

<span class="term">VARBINARY \[( precision )\]</span>  
Binary data

<span class="term">LONG VARBINARY</span>  
Binary BLOB data

<span class="term">TIMESTAMP</span>  
TIMESTAMP

DATETIME

TIME

DATE

<span class="term">\<UDT\></span>  
User Defined Type with varbinary-like size properties.

<span class="term">LONG \<UDT\></span>  
User Defined Type with LONG varbinary-like size properties.

<span class="term">LONG XML</span>  
LONG XML BLOB-like data type.

</div>

<div>

|                              |                                                                                                                                                                                                                         |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                   |
|                              | User Defined Types can be created from native or external types, composites or classes from any hosted language such as Java or .Net. Any User Defined Type can be used to define a column in a CREATE TABLE statement. |

</div>

<div>

<div>

<div>

<div>

### 9.1.1. Date Literals

</div>

</div>

</div>

Virtuoso does not support date literals or the DATE reserved keyword.
Literal dates should be enclosed in a conversion function such as
`stringdate()` , as in this example:

``` programlisting
select * from demo.demo.orders o
  where o.orderdate between stringdate('1994-01-01') And stringdate('1997-12-31')
```

Alternatively type casts can be used to explicitly instruct Virtuoso to
assume a string as a date, see below.

</div>

<div>

<div>

<div>

<div>

### 9.1.2. Casting

</div>

</div>

</div>

Blob types can be cast to varchars. This will produce a string of up to
16 MB in length and an error for longer blobs.

Nothing can be cast to a blob type. Blobs only come from selecting blob
columns and are created by assigning values to such columns.

Converting non-integer values to integers rounds towards 0.

Any data type can be converted to binary with the VARBINARY target data
type. The result may or may not be meaningful. Specifically datetime can
be converted to binary and back.

``` programlisting
cast_expression :
        CAST '(' scalar_exp AS data_type [COLLATE collation_name ] ')'

collation_name :
    identifier
    | owner '.' identifier
    | qualifier '.' owner '.' identifier
```

The CAST expression converts the type of the scalar_exp into the
data_type, if possible. If the conversion is not meaningful, as from a
float to a date, an error is signalled.

CAST is the recommended way of converting between data types, including
any conversion between strings, different number types and datetime
types.

<div>

**Example 9.1. Examples:**

<div>

``` programlisting
select cast ('2000-1-3' as date);

select cast (cast ('2000-1-3' as date) as varchar);
    = 2000-01-03 00-00-00 000000
```

</div>

</div>

  

</div>

<div>

<div>

<div>

<div>

### 9.1.3. Time & Date Manipulation

</div>

</div>

</div>

The SQL92 standard functions for time and date queries are available.
These are mapped to Virtuoso internal functions as follows:

|                                                                                                                   |
|-------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*CURRENT_DATE* </span> - <a href="fn_curdate.html" class="link" title="curdate"><code      
 class="function">curdate() </code></a>                                                                             |
| <span class="emphasis">*CURRENT_TIME* </span> - <a href="fn_curdate.html" class="link" title="curdate"><code      
 class="function">curtime() </code></a>                                                                             |
| <span class="emphasis">*CURRENT_TIMESTAMP* </span> - <a href="fn_curdate.html" class="link" title="curdate"><code 
 class="function">curdatetime() </code></a>                                                                         |

The results of the above functions can also be obtained using the
<a href="fn_now.html" class="link" title="now"><code
class="function">now()</code></a> function and casting to the
appropriate target type.

Dates and times should be input or compared as literals in a standard
format. The following table describes the proper methods available:

<div>

**Table 9.1. Time & date syntax**

<div>

| Datatype           | ODBC Syntax                         |
|--------------------|-------------------------------------|
| Date               | {d 'yyyy-mm-dd'}                    |
| Time               | {t 'hh:mm:ss'}                      |
| Datetime/timestamp | {ts 'yyyy-mm-dd hh:mm:ss\[.f...\]'} |

</div>

</div>

  

<div>

**Example 9.2. Example: comparing dates**

<div>

``` programlisting
select datecol from table
  where datecol > cast('1900-01-01' as date)
    and datecol < cast(now() as date);
```

now() is cast for explicit compatibility although not required.

</div>

</div>

  

</div>

<div>

<div>

<div>

<div>

### 9.1.4. Declaring Collations of Expressions

</div>

</div>

</div>

A collation can be declared with CAST for string expressions. Suppose
insensitive_ascii were a collation name specifying case insensitive
comparison of ASCII strings, the predicate:

``` programlisting
CAST 'foo' as varchar collate insensitive_ascii) = CAST 'FOO as varchar collate insensitive_ascii)
```

would be true.

This will alter the semantic of string comparison and can be used to
define a collation where the collation would otherwise be default, for
instance when comparing results of expressions or constants. This can
also alter the default collation implied by the collation declaration in
column options in CREATE TABLE.

</div>

</div>

</div>
