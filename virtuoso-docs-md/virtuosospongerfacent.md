<div>

<div>

<div>

<div>

## 16.12. Virtuoso Faceted Web Service

</div>

</div>

</div>

The Virtuoso Faceted web service is a general purpose RDF query facility
for facet based browsing. It takes an XML description of the view
desired and generates the reply as an XML tree containing the requested
data. The user agent or a local web page can use XSLT for rendering this
for the end user. The selection of facets and values is represented as
an XML tree. The rationale for this is the fact that such a
representation is easier to process in an application than the SPARQL
source text or a parse tree of SPARQL and more compactly captures the
specific subset of SPARQL needed for faceted browsing. The web service
returns the SPARQL source text also, thus this can serve as a basis for
and-crafted queries.

The top element of the tree is \<query\>, it must be in namespace
"http://openlinksw.com/services/facets/1.0/".

This has the following attributes:

<div>

- graph="graph_iri" - default is search in all graphs but system
  defaults may override this

- timeout="no_of_msec" - default is no timeout, but system defaults may
  override this

- inference="name" where name is a name of an inference context declared
  with rdfs_rule_set.

- same-as="boolean" - If "boolean" is "yes", then owl:sameAs links will
  be considered in the query evaluation.

</div>

The result is a tree of the form:

``` programlisting
<facets xmlns="http://openlinksw.com/services/facets/1.0/">
<result><row><column datatype="..." shortform="..." xml:lang="..">...</column></row></result>
<time>msecs</time>
<complete>yes or no</complete>
<db-activity>resource use string</db-activity>
<sparql>sparql statement text</sparql>
</facets>
```

By convention, the first column is the subject selected by the view
element, typically a URI, the second a label of the URI and the third,
if present, is either a count or a search summary.

The first column's text child is the text form of the value. The column
element has the following attributes qualifying this further:

<div>

- datatype - The xsd type of the value. If this is a URI, the datatype
  is "uri"

- shortform - If the value is a URI, this is an abbreviated form where
  known namespaces are replaced with their prefixes and very long URI's
  are truncated preserving start and end.

- xml:lang - if the value is a language tagged string, this is the
  language

</div>

The query has the top level element \<query\>. The child elements of
this represent conditions pertaining to a single subject. A join is
expressed with the property or property-of element. This has in turn
children which state conditions on a property of the first subject.
property and property-of elements can be nested to an arbitrary depth
and many can occur inside one containing element. In this way,
tree-shaped structures of joins can be expressed.

Expressing more complex relationships, such as intermediate grouping,
subqueries, arithmetic or such requires writing the query in SPARQL. The
XML format is a shorthand for easy automatic composition of queries
needed for showing facets, not a replacement for SPARQL.

A facet query contains a single view element. This specifies which
subject of the joined subjects is shown. Its attributes specify the
manner of viewing, e.g. list of distinct values, distinct values with
occurrence counts, properties or classes of the selected subjects etc.

The top query element or any property or property-of element can have
the following types of children:

``` programlisting
<text property="iri">text pattern</text>
```

The subject has an O that matches the text pattern. If property is
given, the text pattern must occur in a value of this property. If not
specified, any property will do. The value "none" for property is the
same as not specifying a property. This is restricted to occurring
directly under the top level query element.

``` programlisting
<class iri="iri" inference="ctx_name" />
```

The S must be an instance of this class. If inference is specified then
option (input:inference "ctx_name" is added and applies to this pattern
alone.

``` programlisting
<property iri="iri" same_as="yes" inference="ctx_name">
```

The child elements of this are conditions that apply to the value of
this property of the S that is in scope in the enclosing \<query\> or
\<property\> element. If same_as is present, then option (input:same-as
"yes") is added to the triple pattern which specifies this property. If
inference is present, then option (input:inference "ctx_name") is added
to the triple pattern for the property.

``` programlisting
<property-of iri="iri" same_as="yes" inference="ctx_name" >
```

The child elements of this are conditions that apply to an S which has
property "iri" whose object is the S in scope in the enclosing \<query\>
or \<property\> element. The options are otherwise the same as with
property.

``` programlisting
<value datatype="type" xml:lang="lng" op="= | < | > | >= | <=">value </value>
```

When this occurs inside \<property\> or \<property-of\> this means that
the property in scope has the specified relation to the value. type and
language can be used for XML typed or language tagged literals. The
"uri" type means that the value is a qualified name of a URI. If this
occurs directly under the \<query\> element, this means that the query
starts with a fixed subject. If this is so, then there must be property
or propertyof elements or the view element must specify properties or
classes, list is not allowed as a view type. This is so because the
query must have at least one triple pattern.

``` programlisting
<view type="view" limit="n" offset="n" >
```

This may occur once inside a \<query\> element but may occur either at
top level or inside property or property-of elements. This specifies
what which subject is presented in the result set.

The type can be:

<div>

- "properties"

  ``` programlisting
  SPARQL
  SELECT ?p count (*) { ?this_s ?p ?any_o ...}
  GROUP BY ?p
  ORDER BY DESC 2
  LIMIT l OFFSET 0
  ```

- "properties-in"

  ``` programlisting
  SPARQL
  SELECT ?p count (*) { ?any_s ?p ?this_s ... }
  GROUP BY ?p
  ORDER BY DESC 2
  LIMIT L OFFSET 0
  ```

- "classes"

  ``` programlisting
  SPARQL
  SELECT ?c count (*)
  WHERE { ?xx a ?c ... }
  GROUP BY ?c
  ORDER BY DESC 2
  LIMIT l OFFSET 0
  ```

- "text"

  ``` programlisting
  SPARQL
  SELECT DISTINCT ?s (bif:search_excerpt (sql:search_terms (""pattern"), ?o)) ...
  LIMIT l OFFSET 0
  ```

- "list"

  ``` programlisting
  SPARQL
  SELECT DISTINCT ?s long::sql:fct_label (?s) ...
  LIMIT l OFFSET 0
  ```

- "list-count"

  ``` programlisting
  SPARQL
  SELECT ?s COUNT (*) ....
  GROUP BY ?s
  ORDER BY DESC 2
  ```

- "alphabet"

  ``` programlisting
  SPARQL
  SELECT (sql:subseq (?s, 0, 1)) count (*) ...
  GROUP BY (sql:subseq (?s, 0, 1))
  ORDER BY 1
  ```

- "geo"

  ``` programlisting
  SPARQL
  SELECT DISTINCT ?lat ?long ?s
  WHERE ?s geo:lat ?lat . ?s geo:long ?long . ... }
  ```

- "years"

  ``` programlisting
  SPARQL
  SELECT sql::year (?s) count (*) ...
  GROUP BY (bif:year (?s))
  ORDER BY 1
  OFFSET 0 LIMIT l
  ```

- "months"

  ``` programlisting
  SPARQL
  SELECT sql::round_month (?s) count (*) ...
  GROUP BY (sql:round_month (?s))
  ORDER BY 1 OFFSET 0 LIMIT l
  ```

- "weeks"

  ``` programlisting
  SPARQL
  SELECT sql::round_week (?s) COUNT (*) ...
  GROUP BY (sql:round_week (?s))
  ORDER BY 1 OFFSET 0 LIMIT l
  ```

- "describe"

  ``` programlisting
  SPARQL describe ?s ... OFFSET 0 LIMIT l
  ```

</div>

<div>

<div>

<div>

<div>

### 16.12.1. Customizing

</div>

</div>

</div>

The following types of customization will be generally useful:

<div>

- Resource accounting and limitations, managing access and login

- Localization, choice of labels shown with class/property/instance
  URI's

- Adding types of views, for example timelines, map or business graphics

- Controlling navigation, for example choosing what type of view is
  initially presented when opening a given property.

- Page layout, captions, help texts, etc.

</div>

The source code is divided in two SQL files and a number of XSLT sheets.
The file facet.sql has the code for the web service. The facet_view.sql
file contains the procedures for the sample HTML interface.

</div>

</div>
