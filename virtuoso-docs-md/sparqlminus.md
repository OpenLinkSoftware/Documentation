<div id="sparqlminus" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.57. How Do I Use MINUS in SPARQL Query?

</div>

</div>

</div>

Virtuoso supports "MINUS" SPARQL 1.1 feature. For example:

``` programlisting

SQL> SPARQL
SELECT COUNT(*)
WHERE
  {
    { ?s ?p "Novosibirsk" } MINUS { ?s ?p "&#1053;&#1086;&#1074;&#1086;&#1089;&#1080;&#1073;&#1080;&#1088;&#1089;&#1082;" } }

callret-0
INTEGER
 313
No. of rows in result: 1
```

This query is equivalent to the following query:

``` programlisting
SQL> SPARQL
SELECT COUNT(*)
WHERE
  {
    ?s ?p "Novosibirsk"  FILTER NOT EXISTS { ?s ?p "&#1053;&#1086;&#1074;&#1086;&#1089;&#1080;&#1073;&#1080;&#1088;&#1089;&#1082;" }
  }

callret-0
INTEGER
313
No. of rows in result: 1
```

</div>
