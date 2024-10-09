<div>

<div>

<div>

<div>

### 16.2.4. Troubleshooting SPARQL Queries

</div>

</div>

</div>

A short SPARQL query can be compiled into a long SQL statement,
especially if data comes from many quad map patterns. A moderately sized
application with 50 tables and 10 columns per table may create thousands
of quad map patterns for subjects spanning hundreds of different types.
An attempt to "select everything" from Linked Data View of that
complexity may easily create 5000 lines of SQL code. Thus it is to be
expected that some queries will be rejected even if the same queries
would work fine if the RDF data were held as physical quads in default
storage, rather than synthesized through an Linked Data View.

In addition, the SQL compiler catches typos efficiently, signalling an
error if a table or column name is unknown, efficiently catching typos.
SPARQL uses IRIs that are long and sometimes unreadable, but there is no
"closed world" schema of the data so a typo in an IRI is not an error;
it is simply some other IRI. So a typo in an IRI or in a namespace
prefix causes missing bindings of some triple patterns of the query and
an incomplete result, but usually no errors are reported. A typo in
graph or predicate IRI may cause the SPARQL compiler to generate code
that accesses default (quad) storage instead of a relational source or
generate empty code that accesses nothing.

The SQL compiler does not signal casting errors when it runs the
statement generated from SPARQL, because the generated SQL code contains
<span class="emphasis">*option (QUIETCAST)*</span> . This means that
mismatches between expected and actual datatypes of values stay
invisible and may cause rounding errors (e.g. integer division instead
of floating-point) and even empty joins (due to join conditions that
silently return NULL instead of returning a comparison error).

In other words, SPARQL queries are so laconic that there is no room for
details that let the compiler distinguish between intent and a bug. This
masks query complexity, misuse of names and type mismatches. One may
make debugging easier by making queries longer.

Two very helpful debugging tools are automatic void variable recognition
and plain old code inspection. "Automatic" means "cheap" so the very
first step of debugging is to ensure that every triple pattern of the
query may in principle return something. This helps in finding typos
when the query gets data from Linked Data Views. It also helps when a
query tries to join two disjoint sorts of subjects. If the
<span class="emphasis">*define sql:signal-void-variables 1*</span>
directive is placed in the preamble of the SPARQL query, the compiler
will signal an error if it finds any triple pattern that cannot bind
variables or any variable that is proved to be always unbound. This is
especially useful when data are supposed to come from an
<span class="emphasis">*option (exclusive)*</span> or
<span class="emphasis">*option (soft exclusive)*</span> quad map.
Without one of these options, the SPARQL compiler will usually bind
variables using "physical quads"; the table of physical quads may
contain any rows that match any given triple pattern; thus many errors
will remain undiscovered. If the name of a quad map pattern is known
then it is possible to force the SPARQL compiler to use only that quad
map for the whole query or a part of the query. This is possible by
using the following syntax:

``` programlisting
QUAD MAP quad-map-name { group-pattern }
```

If some triple pattern inside <span class="emphasis">*group-pattern*
</span> cannot be bound using <span class="emphasis">*quad-map-name*
</span> or one of its descendants then <span class="emphasis">*define
sql:signal-void-variables 1* </span> will force the compiler to signal
the error.

<div>

|                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
|:----------------------------:|:---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
|                              | Although it is technically possible to use <span class="emphasis">*QUAD MAP*</span> to improve the performance of a query that tries to access redundant Linked Data Views, it is much better to achieve the same effect by providing a more restrictive query or by changing/extending the Linked Data View. If an application relies on this trick then interoperable third-party SPARQL clients may experience problems because they cannot use Virtuoso-specific extensions. |

</div>

If the automated query checking gives nothing, function
`sparql_to_sql_text` can be used in order to get the SQL text generated
from the given query. Its only argument is the text of the SPARQL query
to compile (without any leading SPARQL keyword or semicolon at the end).
The returned value is the SQL text. The output may be long but it is the
most authoritative source of diagnostic data.

When called from ISQL or an ODBC client, the return value of
`sparql_to_sql_text` may be transferred as a BLOB so ISQL requires the
"set blobs on" instruction to avoid data truncation. Even better, the
SQL text can be saved to a file:

``` programlisting
string_to_file ('debug.sql', sparql_to_sql_text ('SELECT * WHERE { graph ?g { ?s a ?type }}'), -2);
```

(The -2 is to overwrite the previous version of the file, as this
function may be called many times).

<div>

|                              |                                                                                                                                                                                                         |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                    |
|                              | When passing the query text to sparql_to_sql_text, if the query contains single quotes, each embedded single quote must be doubled up. Use double quotes in SPARQL queries to avoid this inconvenience. |

</div>

As an example, let's find out why the query

``` programlisting
SQL>SPARQL
PREFIX northwind: <http://demo.openlinksw.com/schemas/northwind#>
SELECT DISTINCT ?emp
FROM <http://myhost.example.com/Northwind>
WHERE {
    ?order1 northwind:has_salesrep ?emp ; northwind:shipCountry ?country1 .
    ?order2 northwind:has_salesrep ?emp ; northwind:shipCountry ?country2 .
    filter (?country1 != ?country2) }
```

is much slower than a similar SQL statement. The call of
`sparql_to_sql_text ` returns the equivalent SQL statement:

``` programlisting
SELECT DISTINCT sprintf_iri ( 'http://myhost.example.com/Northwind/Employee/%U%U%d#this' ,
    /*retval[*/ "s-6-1-t0"."b067b7d~FirstName~0" /* emp */ /*]retval*/ ,
    /*retval[*/  "s-6-1-t0"."b067b7d~FirstName~1" /*]retval*/ ,
    /*retval[*/  "s-6-1-t0"."b067b7d~FirstName~2" /*]retval*/ ) AS /*tmpl*/ "emp"
FROM (SELECT "s-6-1-t0-int~orders"."OrderID" AS /*tmpl*/ "20ffecc~OrderID",
         "s-6-1-t0-int~employees"."FirstName" AS /*as-name-N*/ "b067b7d~FirstName~0",
         "s-6-1-t0-int~employees"."LastName" AS /*as-name-N*/ "b067b7d~FirstName~1",
         "s-6-1-t0-int~employees"."EmployeeID" AS /*as-name-N*/ "b067b7d~FirstName~2"
         FROM Demo.demo.Employees AS "s-6-1-t0-int~employees", Demo.demo.Orders AS "s-6-1-t0-int~orders"
         WHERE /* inter-alias join cond */
       "s-6-1-t0-int~orders".EmployeeID = "s-6-1-t0-int~employees".EmployeeID) AS "s-6-1-t0",
    (SELECT "s-6-1-t1-int~orders"."OrderID" AS /*tmpl*/ "20ffecc~OrderID",
        "s-6-1-t1-int~orders"."ShipCountry" AS /*tmpl*/ "e45a7f~ShipCountry"
        FROM Demo.demo.Orders AS "s-6-1-t1-int~orders") AS "s-6-1-t1",
    (SELECT "s-6-1-t2-int~orders"."OrderID" AS /*tmpl*/ "20ffecc~OrderID",
        "s-6-1-t2-int~employees"."FirstName" AS /*as-name-N*/ "b067b7d~FirstName~0",
    "s-6-1-t2-int~employees"."LastName" AS /*as-name-N*/ "b067b7d~FirstName~1",
    "s-6-1-t2-int~employees"."EmployeeID" AS /*as-name-N*/ "b067b7d~FirstName~2"
    FROM Demo.demo.Employees AS "s-6-1-t2-int~employees", Demo.demo.Orders AS "s-6-1-t2-int~orders"
    WHERE /* inter-alias join cond */
       "s-6-1-t2-int~orders".EmployeeID = "s-6-1-t2-int~employees".EmployeeID) AS "s-6-1-t2",
    (SELECT "s-6-1-t3-int~orders"."OrderID" AS /*tmpl*/ "20ffecc~OrderID",
        "s-6-1-t3-int~orders"."ShipCountry" AS /*tmpl*/ "e45a7f~ShipCountry"
    FROM Demo.demo.Orders AS "s-6-1-t3-int~orders") AS "s-6-1-t3"
WHERE /* two fields belong to same equiv */
    /*retval[*/  "s-6-1-t0"."20ffecc~OrderID" /* order1 */ /*]retval*/  =
    /*retval[*/  "s-6-1-t1"."20ffecc~OrderID" /* order1 */ /*]retval*/
    AND /* two fields belong to same equiv */
    sprintf_iri ( 'http://myhost.example.com/Northwind/Employee/%U%U%d#this' ,
        /*retval[*/  "s-6-1-t0"."b067b7d~FirstName~0" /* emp */ /*]retval*/ ,
    /*retval[*/  "s-6-1-t0"."b067b7d~FirstName~1" /*]retval*/ ,
    /*retval[*/  "s-6-1-t0"."b067b7d~FirstName~2" /*]retval*/ ) =
    sprintf_iri ( 'http://myhost.example.com/Northwind/Employee/%U%U%d#this' ,
        /*retval[*/  "s-6-1-t2"."b067b7d~FirstName~0" /* emp */ /*]retval*/ ,
    /*retval[*/  "s-6-1-t2"."b067b7d~FirstName~1" /*]retval*/ ,
    /*retval[*/  "s-6-1-t2"."b067b7d~FirstName~2" /*]retval*/ )
    AND /* two fields belong to same equiv */
    /*retval[*/  "s-6-1-t2"."20ffecc~OrderID" /* order2 */ /*]retval*/  =
    /*retval[*/  "s-6-1-t3"."20ffecc~OrderID" /* order2 */ /*]retval*/
    AND /* filter */
   ( /*retval[*/  "s-6-1-t1"."e45a7f~ShipCountry" /* country1 */ /*]retval*/  <>
        /*retval[*/  "s-6-1-t3"."e45a7f~ShipCountry" /* country2 */ /*]retval*/ )
OPTION (QUIETCAST)
```

The query is next to unreadable but some comments split it into
meaningful expressions. Every triple (or list of similar triples)
becomes a subquery that returns fields needed to build the values of
bound variables. The fields are printed wrapped by comments like
<span class="emphasis">*/\*retval\[\*/ expression /\* original variable
name \*/ /\*\]retval\*/*</span> . Names
like<span class="emphasis">*"s-6-1-t0"*</span> contain the source line
number where a group pattern begins (6) and the serial number of the
triple (0). Comment <span class="emphasis">*/\* inter-alias join cond
\*/*</span> means that the expression which follows is the condition as
written in the declaration of the quad map pattern. Comment
<span class="emphasis">*/\* filter \*/*</span> precedes expressions for
FILTER expressions in the source SPARQL. The word "equiv" means
"equivalence class", i.e. a group of occurrences of variables in the
source query such that all occurrences are bound to the same value. E.g.
when a name repeats in many triples of a group, all its occurrences form
an equivalence class. In some cases the compiler can prove that two
variables are always equal even if the names differ - these variables
are also placed into an "equiv".

Looking at this query, you may notice equalities like
<span class="emphasis">*sprintf_iri (...) = sprintf_iri (...)*</span> .
That is sub-optimal because it indicates that no index will be used to
optimize the join and that there will be one function call per row. When
the variable <span class="emphasis">*?emp*</span> appears in two
different triples, it means that the value of the variable is the same
in both triples. The query compares IRIs instead of comparing the
arguments of
<a href="fn_sprintf_iri.html" class="link" title="sprintf_iri"><code
class="function">sprintf_iri</code></a> because the format string is not
proven to be a bijection. Indeed it cannot be a bijection for
<span class="emphasis">*arbitrary*</span> strings, but the database must
reflect the real world. If it is assumed that the real names of persons
never start with a digit, within the
<span class="emphasis">*%d%U*</span> format fragment, the digits will
always be distinguishable from the name; so the IRI class can be
declared as a bijection even if it is not true for arbitrary strings.
The script can then include "suspicious" <span class="emphasis">*option
(bijection)*</span> as follows:

``` programlisting
create iri class sample:Employee "http://example.com/Employee/%d%U#this"
  (in employee_id integer not null, in employee_lastname varchar not null)
  option (bijection) .
```

Unfortunately, attempts to use the same trick with the declaration from
the Northwind example will fail:

``` programlisting
create iri class northwind:Employee "http://^{URIQADefaultHost}^/Northwind/Employee/%U%U%d#this"
  (in employee_firstname varchar not null, in employee_lastname varchar not null, in employee_id integer not null)
  option (bijection) .
```

Bijection will allow the parsing, but it will never give the proper
result, because the first <span class="emphasis">*%U*</span> will read
the whole concatenation of <span class="emphasis">*%U%U%d*</span> ,
leaving nothing before the<span class="emphasis">*\#this*</span> for the
second <span class="emphasis">*%U*</span> (this is an error) and leaving
nothing for the <span class="emphasis">*%d*</span> (that is an explicit
parse error, becauses the integer field cannot be empty).

The string parser will process the string from left to right so it will
be unable to parse the string. The compiler might sometimes report an
error if it can prove that the format string is not appropriate for
bijection.

The correct way of improving the Northwind example is to enable reliable
bijection by adding strong delimiters:

``` programlisting
create iri class northwind:Employee "http://^{URIQADefaultHost}^/Northwind/Employee/%U/%U/%d#this"
  (in employee_firstname varchar not null, in employee_lastname varchar not null, in employee_id integer not null)
  option (bijection) .
```

After running the updated script, the query contains three comparisons
of fields that were arguments of `sprintf_iri ` in the previous version.

<span class="emphasis">*Example for casting string as IRI type* </span>

``` programlisting
create function DB.DBA.RDF_DF_GRANTEE_ID_URI (in id integer)
{
  declare isrole integer;
  isrole := coalesce ((SELECT top 1 U_IS_ROLE FROM DB.DBA.SYS_USERS WHERE U_ID = id));
  if (isrole is null)
    return NULL;
  else if (isrole)
    return sprintf ('http://%s/sys/group?id=%d', registry_get ('URIQADefaultHost'), id);
  else
    return sprintf ('http://%s/sys/user?id=%d', registry_get ('URIQADefaultHost'), id);
}
;

grant execute on DB.DBA.RDF_DF_GRANTEE_ID_URI to SPARQL_SELECT
;

create function DB.DBA.RDF_DF_GRANTEE_ID_URI_INVERSE (in id_iri varchar)
{
  declare parts any;
  parts := sprintf_inverse (id_iri, sprintf ('http://%s/sys/user?id=%%d', registry_get ('URIQADefaultHost')), 1);
  if (parts is not null)
    {
      if (exists (SELECT TOP 1 1 FROM DB.DBA.SYS_USERS WHERE U_ID = parts[0] and not U_IS_ROLE))
        return parts[0];
    }
  parts := sprintf_inverse (id_iri, sprintf ('http://%s/sys/group?id=%%d', registry_get ('URIQADefaultHost')), 1);
  if (parts is not null)
    {
      if (exists (SELECT TOP 1 1 FROM DB.DBA.SYS_USERS WHERE U_ID = parts[0] and U_IS_ROLE))
        return parts[0];
    }
  return NULL;
}
;

grant execute on DB.DBA.RDF_DF_GRANTEE_ID_URI_INVERSE to SPARQL_SELECT
;

create iri class oplsioc:grantee_iri using
  function DB.DBA.RDF_DF_GRANTEE_ID_URI (in id integer) returns varchar ,
  function DB.DBA.RDF_DF_GRANTEE_ID_URI_INVERSE (in id_iri varchar) returns integer
  option ( bijection ,
    returns "http://^{URIQADefaultHost}^/sys/group?id=%d"
    union   "http://^{URIQADefaultHost}^/sys/user?id=%d" ) .
```

</div>
