<div id="rdfviewquadmapatternsvalueandiriclasses" class="section">

<div class="titlepage">

<div>

<div>

### 16.5.3. Quad Map Patterns, Values and IRI Classes

</div>

</div>

</div>

In the simplest sense, any relational schema can be rendered into RDF by
converting all primary keys and foreign keys into IRI's, assigning a
predicate IRI to each column, and an rdf:type predicate for each row
linking it to a RDF class IRI corresponding to the table. Then a triple
with the primary key IRI as subject, the column IRI as predicate and the
column's value as object is considered to exist for each column that is
neither part of a primary or foreign key.

Strictly equating a subject value to a row and each column to a
predicate is often good but is too restrictive for the general case.

<div class="itemizedlist">

- Multiple triples with the same subject and predicate can exist.

- A single subject can get single-valued properties from multiple tables
  or in some cases stored procedures.

- An IRI value of a subject or other field of a triple can be composed
  from more than one SQL value, these values may reside in different
  columns, maybe in different joined tables.

- Some table rows should be excluded from mapping.

</div>

Thus in the most common case the RDF meta schema should consist of
independent transformations; the domain of each transformation is a
result-set of some SQL <span class="emphasis">*SELECT*</span> statement
and range is a set of triples. The
<span class="emphasis">*SELECT*</span> that produce the domain is quite
simple: it does not use aggregate functions, joins and sorting, only
inner joins and <span class="emphasis">*WHERE*</span> conditions. There
is no need to support outer joins in the RDF meta schema because NULLs
are usually bad inputs for functions that produce IRIs. In the rare
cases when NULLs are OK for functions, outer joins can be encapsulated
in SQL views. The range of mapping can be described by a SPARQL triple
pattern: a pattern field is a variable if it depends on table columns,
otherwise it is a constant. Values of variables in the pattern may have
additional restrictions on datatypes, when datatypes of columns are
known.

This common case of an RDF meta schema is implemented in Virtuoso, with
one adjustment. Virtuoso stores quads, not triples, using the graph
field (G) to indicate that a triple belongs to some particular
application or resource. A SPARQL query may use quads from different
graphs without large difference between G and the other three fields of
a quad. E.g., variable <span class="emphasis">*?g*</span> in expression
<span class="emphasis">*GRAPH ?g {...}*</span> can be unbound. SPARQL
has special syntax for "graph group patterns" that is convenient for
sets of triple patterns with a common graph, but it also has shorthands
for common subject and predicate, so the difference is no more than in
syntax. There is only one feature that is specific for graphs but not
for other fields: the SPARQL compiler can create restrictions on graphs
according to <span class="emphasis">*FROM*</span> and
<span class="emphasis">*FROM NAMED*</span> clauses.

Virtuoso Linked Data Views should offer the same flexibility with the
graphs as SPARQL addressing physical triples. A transformation cannot
always be identified by the graph used for ranges because graph may be
composed from SQL data. The key element of the meta schema is a
"<span class="emphasis">*quad map pattern*</span> ". A simple quad map
pattern fully defines one particular transformation from one set of
relational columns into triples that match one SPARQL graph pattern. The
main part of quad map pattern is four declarations of
"<span class="emphasis">*quad map values*</span> ", each declaration
specifies how to calculate the value of the corresponding triple field
from the SQL data. The pattern also lists boolean SQL expressions that
should be used to filter out unwanted rows of source data (and to join
multiple tables if source columns belong to different tables). There are
also quad map patterns that group together similar quad patterns but do
not specify any real transformation or even prevent unwanted
transformations from being used, they are described in "Grouping Map
Patterns" below.

Quad map values refer to schema elements of two further types: "IRI
classes" and "literal classes".

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
|:----------------------------:|:----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
|                              | In SQL, adding a new view can not break anything. This is because SQL lacks the ability of querying "everything" so data sources are always specified. This is not true for SPARQL, so please treat <span class="emphasis">*any*</span> metadata manipulation as potentially destructive operation. If an RDF storage is supposed to be used by more than one application then these applications should be tested together, not one after other, and they should be installed/upgraded on live database in the very same order as they were installed/upgraded on instrumental machine during testing. Always remember that these applications share RDF tables so they may interfere. |

</div>

<div id="rdfviewiriclasses" class="section">

<div class="titlepage">

<div>

<div>

#### IRI Classes

</div>

</div>

</div>

An IRI class declares that a column or set of columns gets converted
into a IRI in a certain way. The conversion of this sort can be declared
revertible (bijection) so an IRI can be parsed into original SQL values;
this is useful when some equality of an IRI constant and a calculated
IRI can be replaced with an equality of a parse result of a constant and
an SQL column that is index criteria or simply faster. In addition, the
SPARQL optimizer will eliminate redundant conversions if one IRI class
is explicitly declared as a subclass of another. The most flexible
declaration for conversion consists of specifying functions that
assemble and disassemble from IRI into its constituent parts. This is
overkill for typical conversions so it is possible to specify only one
sprintf-style format string such that
<span class="emphasis">*sprintf()*</span> SQL function will print an IRI
using this format and <span class="emphasis">*sprintf_inverse()*</span>
will be able to parse it back.

The use of <span class="emphasis">*sprintf_inverse()*</span> assumes
that the format does not contain fragments like
<span class="emphasis">*'%s%s'*</span> that make it impossible to
separate parts of IRI from each other.

In the following, we shall map the Virtuoso users and user roles system
tables into the SIOC ontology.

``` programlisting
create iri class oplsioc:user_iri "http://myhost/sys/user?id=%d"
  (in uid integer not null) .
create iri class oplsioc:group_iri "http://myhost/sys/group?id=%d"
  (in gid integer not null) .
create iri class oplsioc:membership_iri
  "http://myhost/sys/membership?super=%d&sub=%d"
  (in super integer not null, in sub integer not null) .
create iri class oplsioc:dav_iri "http://myhost%s"
  (in path varchar) .
```

These IRI classes are used for mapping data from the
<span class="emphasis">*DB.DBA.SYS_USERS*</span> and
<span class="emphasis">*DB.DBA.SYS_ROLE_GRANTS*</span> system tables
that are defined in Virtuoso as follows:

``` programlisting
create table DB.DBA.SYS_USERS (
  U_ID                integer not null unique,
  U_NAME              char (128) not null primary key,
  U_IS_ROLE           integer default 0,
  U_FULL_NAME         char (128),
  U_E_MAIL            char (128) default &quot;,
  U_ACCOUNT_DISABLED  integer default 1,
  U_DAV_ENABLE        integer default 0,
  U_SQL_ENABLE        integer default 1,
  U_HOME              varchar (128),
. . .
 );
```

Single record in <span class="emphasis">*DB.DBA.SYS_USERS*</span>
corresponds to a plain user or a group (role). Users and roles are
collectively named "grantees". Thus a role may be granted to another
role or to a user account. A role grant may be direct (explicit) or
assigned by recursion.

``` programlisting
create table SYS_ROLE_GRANTS (
  GI_SUPER   integer,
  GI_SUB     integer,
  GI_DIRECT  integer default 1,
. . .
  primary key (GI_SUPER, GI_SUB, GI_DIRECT));
```

One IRI class usually corresponds to one ontology class, because similar
things are usually called similarly. One may wish to use identifiers of
ontology classes as identifiers of related IRI classes, to not remember
double number of names, e.g. <span class="emphasis">*create IRI class
mybank:XpressXfer*</span> for subjects that will have
<span class="emphasis">*rdf:type*</span> property
<span class="emphasis">*mybank:XpressXfer*</span> made by mapping. That
is technically possible but proven to become inconvenient and misleading
as application evolves. While RDF types tend to persist, IRI classes may
change over time or same subject may get more than one name via more
than one IRI class, say, for exports to different systems. It is found
to be more convenient to compose names of IRI classes by adding some
common prefixes or suffixes to RDF classes (or to table names), say,
write <span class="emphasis">*create IRI class
mybank:XpressXfer_iri*</span> .

</div>

<div id="rdfviewliteralclasses" class="section">

<div class="titlepage">

<div>

<div>

#### Literal Classes

</div>

</div>

</div>

A "literal class" declares that a column or set of columns gets
converted into a literal instead of an IRI. More precisely, the result
of conversion can be <span class="emphasis">*IRI_ID*</span> so it
represents an IRI, but in current version of Virtuoso this is supported
only for some internal built-in literal classes, not for classes
declared by the user. So for user-defined literal class the result of
the conversion is an RDF literal even if it is a string representation
of a valid IRI.

In any case, a literal class can be used only in quad map values of O
fields, because Virtuoso does not support literal values as subjects.

A special case of literal class is the identity class that converts a
value from <span class="emphasis">*varchar*</span> column into an
untyped literal and value from column of any other SQL datatype into a
typed literal with type from XMLSchema set, i.e.
<span class="emphasis">*xsd:integer*</span> ,
<span class="emphasis">*xsd:dateTime*</span> and so on. Columns of types
<span class="emphasis">*ANY*</span> and
<span class="emphasis">*IRI_ID*</span> are not supported.

The SPARQL optimizer knows that RDF literal types are pairwise disjoint
so literal classes that produce literals of different types are known to
be pairwise disjoint. The optimizer will replace a join on two disjoint
literal classes with an empty statement, to simplify the resulting
query.

</div>

<div id="rdfviewsimplequadmappatterns" class="section">

<div class="titlepage">

<div>

<div>

#### Simple Quad Map Patterns

</div>

</div>

</div>

The following declaration of quad map pattern is self-explanatory. The
line for <span class="emphasis">*object*</span> uses identity literal
class so there's no need to specify its name.

``` programlisting
graph      <http://myhost/sys>
subject    oplsioc:user_iri (DB.DBA.SYS_USERS.U_ID)
predicate  foaf:email
object     DB.DBA.SYS_USERS.U_E_MAIL
```

The description language also supports SPARQL-style notation that
contains less keywords and eliminates duplicate graphs, subjects and
predicates. The following add two patterns with constant graph IRI
<span class="emphasis">*\<http://myhost/sys\>*</span> and subjects are
made from column <span class="emphasis">*DB.DBA.SYS_USERS.U_ID*</span>
by <span class="emphasis">*oplsioc:user_iri*</span> .

``` programlisting
graph <http://myhost/sys>
  {
    oplsioc:user_iri (DB.DBA.SYS_USERS.U_ID)
      a sioc:user ;
      oplsioc:name DB.DBA.SYS_USERS.U_FULL_NAME .
  }
```

</div>

<div id="rdfviewassigningnamestoquadmappatterns" class="section">

<div class="titlepage">

<div>

<div>

#### Assigning Names To Quad Map Patterns

</div>

</div>

</div>

In real applications, quad map patterns should be named, for schema
manipulation and keeping debug info readable. Thus it is much better to
rewrite the previous example as

``` programlisting
create virtrdf:SysUsers as graph <http://myhost/sys>
  {
    oplsioc:user_iri (DB.DBA.SYS_USERS.U_ID)
      a sioc:user
          as virtrdf:SysUserType-User;
      oplsioc:name DB.DBA.SYS_USERS.U_FULL_NAME
          as virtrdf:SysUsersFullName .
  }
```

Using these names, one may later write, say,
<span class="emphasis">*drop quad map virtrdf:SysUserType-User*</span> .

One name, <span class="emphasis">*virtrdf:DefaultQuadMap*</span> is
reserved. It is an internal quad map pattern used to access
"native-form" quads from <span class="emphasis">*DB.DBA.RDF_QUAD*</span>
:

``` programlisting
create virtrdf:DefaultQuadMap as
graph rdfdf:default-iid-nonblank (DB.DBA.RDF_QUAD.G)
subject rdfdf:default-iid (DB.DBA.RDF_QUAD.S)
predicate rdfdf:default-iid-nonblank (DB.DBA.RDF_QUAD.P)
object rdfdf:default (DB.DBA.RDF_QUAD.O)
```

IRI classes from <span class="emphasis">*rdfdf:...*</span> namespace are
also reserved.

</div>

<div id="rdfviewgroupingmappatterns" class="section">

<div class="titlepage">

<div>

<div>

#### Grouping Map Patterns

</div>

</div>

</div>

The previous example actually contains three map patterns, not two. The
name <span class="emphasis">*virtrdf:SysUsers*</span> refers to a
"<span class="emphasis">*group map pattern*</span> " that does not
define any real transformation of relational data into RDF but helps
organize quad map patterns into a tree. Group may contain both quad map
patterns and other groups. A group can be manipulated as a whole, e.g.
<span class="emphasis">*drop quad map virtrdf:SysUsers*</span> will
remove all three map patterns.

</div>

</div>
