<div id="virtuosotipsandtrickscontrolunicode3" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.12. How Can I Control the normalization of UNICODE3 accented chars in free-text index?

</div>

</div>

</div>

The normalization of UNICODE3 accented chars in free-text index can be
controlled by setting up the configuration parameter
<span class="emphasis">*XAnyNormalization*</span> in the virtuoso.ini
config file, section \[I18N\]. This parameter controls whether accented
UNICODE characters should be converted to their non-accented base
variants at the very beginning of free-text indexing or parsing a
free-text query string. The parameter's value is an integer that is
bitmask with only 2 bits in use atm:

<div class="orderedlist">

1.  0: the default behavior, do not normalize anything, so "Jose" and
    "José" are two distinct words.

2.  2: Any combined char is converted to its (smallest known) base. So
    "é" will lose its accent and become plain old ASCII "e".

3.  3: This is equl to 1\|2 and when set then performs both conversions.
    As a result, pair of base char and combinig char loses its second
    char and chars with accents will lose accents.

</div>

If the parameter is required at all, the needed value is probably 3. So
the fragment of virtuoso.ini is:

``` programlisting
[I18N]
XAnyNormalization=3
```

In some seldom case the value of 1 can be appropriate. The parameter
should be set once before creating the database. If changed on the
existing database, all free-text indexes that may contain non-ASCII data
should be re-created. On a typical system, the parameter affects all
text columns, XML columns, RDF literals and queries.

Strictly speaking, it affects not all of them but only items that use
default "x-any" language or language derived from x-any such as "en" and
"en-US" but if you haven't tried writing new C plugins for custom
languages you should not look so deep.

As an example, with <span class="emphasis">*XAnyNormalization=3*</span>
once can get the following:

``` programlisting
SQL>SPARQL

INSERT IN <http://InternationalNSMs/>
   { <s> <sp> "Índio João Macapá Júnior Tôrres Luís Araújo José" ;
     <ru> "&#1054;&#1085; &#1076;&#1086;&#1073;&#1072;&#1074;&#1080;&#1083; &#1082;&#1072;&#1088;&#1090;&#1086;&#1096;&#1082;&#1080;, &#1087;&#1086;&#1089;&#1086;&#1083;&#1080;&#1083; &#1080; &#1087;&#1086;&#1089;&#1090;&#1072;&#1074;&#1080;&#1083; &#1072;&#1082;&#1074;&#1072;&#1088;&#1080;&#1091;&#1084; &#1085;&#1072; &#1086;&#1075;&#1086;&#1085;&#1100;" . }

INSERT INTO <http://InternationalNSMs/>, 2 (or less) triples -- done

SQL> DB.DBA.RDF_OBJ_FT_RULE_ADD (null, null, 'InternationalNSMs.wb');

Done. -- 0 msec.

SQL>vt_inc_index_db_dba_rdf_obj();

Done. -- 26 msec.

SQL>SPARQL
SELECT *
FROM <http://InternationalNSMs/>
WHERE
  {
    ?s ?p ?o
  }
ORDER BY ASC (str(?o))

s  sp  Índio João Macapá Júnior Tôrres Luís Araújo José
s  ru  &#1054;&#1085; &#1076;&#1086;&#1073;&#1072;&#1074;&#1080;&#1083; &#1082;&#1072;&#1088;&#1090;&#1086;&#1096;&#1082;&#1080;, &#1087;&#1086;&#1089;&#1086;&#1083;&#1080;&#1083; &#1080; &#1087;&#1086;&#1089;&#1090;&#1072;&#1074;&#1080;&#1083; &#1072;&#1082;&#1074;&#1072;&#1088;&#1080;&#1091;&#1084; &#1085;&#1072; &#1086;&#1075;&#1086;&#1085;&#1100;

2 Rows. -- 2 msec.

SQL> SPARQL
SELECT *
FROM <http://InternationalNSMs/>
WHERE
  {
    ?s ?p ?o . ?o bif:contains "'Índio João Macapá Júnior Tôrres Luís Araújo José'" .
  }

s  sp  Índio João Macapá Júnior Tôrres Luís Araújo José

1 Rows. -- 2 msec.

SQL>SPARQL
SELECT *
FROM <http://InternationalNSMs/>
WHERE
  {
    ?s ?p ?o . ?o bif:contains "'Indio Joao Macapa Junior Torres Luis Araujo Jose'" . }

s  sp  Índio João Macapá Júnior Tôrres Luís Araújo José

1 Rows. -- 1 msec.

SQL> SPARQL
SELECT *
FROM <http://InternationalNSMs/>
WHERE
  {
    ?s ?p ?o . ?o bif:contains "'&#1087;&#1086;&#1089;&#1090;&#1072;&#1074;&#1080;&#1083; &#1072;&#1082;&#1074;&#1072;&#1088;&#1080;&#1091;&#1084; &#1085;&#1072; &#1086;&#1075;&#1086;&#1085;&#1100;'" . }

s  ru  &#1054;&#1085; &#1076;&#1086;&#1073;&#1072;&#1074;&#1080;&#1083; &#1082;&#1072;&#1088;&#1090;&#1086;&#1096;&#1082;&#1080;, &#1087;&#1086;&#1089;&#1086;&#1083;&#1080;&#1083; &#1080; &#1087;&#1086;&#1089;&#1090;&#1072;&#1074;&#1080;&#1083; &#1072;&#1082;&#1074;&#1072;&#1088;&#1080;&#1091;&#1084; &#1085;&#1072; &#1086;&#1075;&#1086;&#1085;&#1100;
```

There was also request for function that normalizes characters in
strings as free-text engine will do with XAnyNormalization=3 , the
function will be provided as a separate patch and depends on this
specific patch.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                     |
|:--------------------------:|:--------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                           |
|                            | <a href="ch-server.html#virtini" class="link"                       
                              title="Virtuoso Configuration File">Virtuoso Configuration File</a>  |

</div>

</div>
