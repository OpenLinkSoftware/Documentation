<div id="rdfperfcost" class="section">

<div class="titlepage">

<div>

<div>

### 16.17.5. Erroneous Cost Estimates and Explicit Join Order

</div>

</div>

</div>

The selectivity of triple patterns is determined at query compile time
from sampling the data. It is possible that misleading data is produced.
To see if the cardinality guesses are generally valid, look at the query
plan with the
<a href="fn_explain.html" class="link" title="explain"><code
class="function">explain</code> ()</a> function.

Below is a sample from the LUBM qualification data set in the Virtuoso
distribution. After running <span class="emphasis">*make test*</span> in
<span class="emphasis">*binsrc/test/lubm*</span> , there is a loaded
database with the data. Start a server in the same directory to see the
data.

``` programlisting
SQL> EXPLAIN
  ('SPARQL
  PREFIX  ub:  <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#>
  SELECT *
  FROM <lubm>
  WHERE { ?x  rdf:type  ub:GraduateStudent }
  ');

REPORT
VARCHAR
_______________________________________________________________________________

{

Precode:
      0: $25 "callret" := Call __BOX_FLAGS_TWEAK (<constant (lubm)>, <constant (1)>)
      5: $26 "lubm" := Call DB.DBA.RDF_MAKE_IID_OF_QNAME_SAFE ($25 "callret")
      12: $27 "callret" := Call __BOX_FLAGS_TWEAK (<constant (http://www.w3.org/1999/02/22-rdf-syntax-ns#type)>, <constant (1)>)
      17: $28 "-ns#type" := Call DB.DBA.RDF_MAKE_IID_OF_QNAME_SAFE ($27 "callret")
      24: $29 "callret" := Call __BOX_FLAGS_TWEAK (<constant (http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#GraduateStudent)>, <constant (1)>)
      29: $30 "owl#GraduateStudent" := Call DB.DBA.RDF_MAKE_IID_OF_QNAME_SAFE ($29 "callret")
      36: BReturn 0
from DB.DBA.RDF_QUAD by RDF_QUAD_OGPS    1.9e+03 rows
Key RDF_QUAD_OGPS  ASC ($32 "s-3-1-t0.S")
<col=415 O = $30 "owl#GraduateStudent"> , <col=412 G = $26 "lubm"> , <col=414 P = $28 "-ns#type">
row specs: <col=415 O LIKE <constant (T)>>

Current of: <$34 "<DB.DBA.RDF_QUAD s-3-1-t0>" spec 5>

After code:
      0: $35 "x" := Call ID_TO_IRI ($32 "s-3-1-t0.S")
      5: BReturn 0
Select ($35 "x", <$34 "<DB.DBA.RDF_QUAD s-3-1-t0>" spec 5>)
}

22 Rows. -- 1 msec.
```

This finds the graduate student instances in the LUBM graph. First the
query converts the IRI literals to IDs. Then, using a match of `OG` on
`OGPS` , it finds the IRIs of the graduate students. Then, it converts
the IRI ID to return to the string form.

The cardinality estimate of 1.9e+03 rows is on the `FROM` line.

Doing an `EXPLAIN()` on the queries will show the cardinality estimates.
To drill down further, one can split the query into smaller chunks and
see the estimates for these, up to doing it at the triple pattern level.
To indicate a variable that is bound but whose value is not a literal
known at compile time, one can use the parameter marker
<span class="emphasis">*??*</span> .

``` programlisting
SQL> EXPLAIN
  ('
      SPARQL
      DEFINE  sql:table-option "order"
      PREFIX  ub:  <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#>
      SELECT *
      FROM <lubm>
      WHERE { ?x  rdf:type  ?? }
  ');
```

This will not know the type but will know that a type will be provided.
So instead of guessing 1900 matches, this will guess a smaller number,
which is obviously less precise. Thus literals are generally better.

In some cases, generally to work around an optimization error, one can
specify an explicit <span class="emphasis">*JOIN*</span> order. This is
done with the <span class="emphasis">*sql:select-option "order"*</span>
clause in the SPARQL query prefix:

``` programlisting
SQL> SELECT SPARQL_to_sql_text
  ('
      DEFINE sql:select-option "order"
      PREFIX  ub:  <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#>
      SELECT *
      FROM <lubm>
      WHERE
        {
          ?x  rdf:type        ub:GraduateStudent                                       .
          ?x  ub:takesCourse  <http://www.Department0.University0.edu/GraduateCourse0>
        }
  ');
```

shows the SQL text with the order option at the end.

If an estimate is radically wrong then this should be reported as a bug.

If there is a `FROM` with a `KEY` on the next line and no column specs
then this is a full table scan. The more columns are specified the less
rows will be passed to the next operation in the chain. In the example
above, there are three columns whose values are known before reading the
table and these columns are leading columns of the index in use so
column specs are:

``` programlisting
<col=415 O = $30 "owl#GraduateStudent"> ,
<col=412 G = $26 "lubm"> ,
<col=414 P = $28 "-ns#type">
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                               |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                                                          |
|                              | Note: A `KEY` with only a row spec is a full table scan with the row spec applied as a filter. This is usually not good unless this is specifically intended. |

</div>

If queries are compiled to make full table scans when this is not
specifically intended, this should be reported as a bug. The
`explain ()` output and the query text should be included in the report.

Consider:

``` programlisting
SQL> EXPLAIN
  ('
      SPARQL
      DEFINE sql:select-option "order, loop"
      PREFIX  ub:  <http://www.lehigh.edu/~zhp2/2004/0401/univ-bench.owl#>
      SELECT *
      FROM <lubm>
      WHERE
        {
          ?x  ub:takesCourse  ?c                  .
          ?x  rdf:type        ub:GraduateStudent
        }
  ');
```

One will see in the output that the first table access is to retrieve
all in the LUBM graph which take some course and then later to check if
this is a graduate student. This is obviously not the preferred order
but the <span class="emphasis">*sql:select-option "order"*</span> forces
the optimizer to join from left to right.

It is very easy to end up with completely unworkable query plans in this
manner but if the optimizer really is in error, then this is the only
way of overriding its preferences. The effect of
<span class="emphasis">*sql:select-option*</span> is pervasive,
extending inside unions, optionals, subqueries etc. within the
statement.

We note that if, in the above query, both the course taken by the
student and the type of the student are given, the query compilation
will be, at least for all non-cluster cases, an index intersection. This
is not overridden by the `sql:select-option` clause since an index
intersection is always a safe guess, regardless of the correctness of
the cardinality guesses of the patterns involved.

<div id="rdfperfcosttransanalyze" class="section">

<div class="titlepage">

<div>

<div>

#### Translate and Analyze modes for analyzing sparql queries

</div>

</div>

</div>

Virtuoso Release 6.4 ISQL offers 2 new modes for analyzing sparql
queries:

<div class="orderedlist">

1.  Translate a sparql query into the correspondent sql:

    ``` programlisting
    SQL> SET SPARQL_TRANSLATE ON;
    SQL> SELECT * FROM <graph> WHERE {?S a ?O};
    SQL> SET SPARQL_TRANSLATE OFF;
    ```

2.  Analyze a given SQL query:

    ``` programlisting
    SQL> SET EXPLAIN ON;
    SQL> SELECT * FROM TABLE WHERE field = 'text';
    SQL> SET EXPLAIN OFF;
    ```

    <div class="itemizedlist">

    - <a href="fn_explain.html" class="link" title="explain"><code
      class="function">explain</code> ()</a> is much more difficult to
      use since you cannot just cut and past a query as all quotes need
      to be doubled inside the `explain (' ... ')` :

      ``` programlisting
      SQL> explain('select * from table where field = ''text''');
      ```

    </div>

</div>

Here is simple example of how to combine the two options to get a full
explain plan for a simple SPARQL query:

<div class="orderedlist">

1.  Assume the following query:

    ``` programlisting
    SELECT *
    FROM <http://dbpedia.org>
    WHERE
      {
        ?s a ?o
      }
    LIMIT 10
    ```

2.  Connect using the ISQL command line tool to your database and
    execute:

    ``` programlisting
    SQL> SET BLOBS ON;           -- in case output is very large
    SQL> SET SPARQL_TRANSLATE ON;
    SQL> SELECT * FROM <http://dbpedia.org> WHERE {?s a ?o} LIMIT 10;

    SPARQL_TO_SQL_TEXT
    VARCHAR
    _______________________________________________________________________________

    SELECT TOP 10 __id2i ( "s_1_0-t0"."S" ) AS "s",
      __ro2sq ( "s_1_0-t0"."O" ) AS "o"
    FROM DB.DBA.RDF_QUAD AS "s_1_0-t0"
    WHERE "s_1_0-t0"."G" = __i2idn ( __bft( 'http://dbpedia.org' , 1))
      AND  "s_1_0-t0"."P" = __i2idn ( __bft( 'http://www.w3.org/1999/02/22-rdf-syntax-ns#type' , 1))
    OPTION (QUIETCAST)

    1 Rows. -- 1 msec.

    SQL> SET SPARQL_TRANSLATE OFF;
    ```

3.  Use mouse to select the above query output and paste it after the
    `SET EXPLAIN ON;` command. After pasting in the command, followed by
    the ENTER key:

    ``` programlisting
    SQL> SET EXPLAIN ON;
    SQL> SELECT TOP 10 __id2i ( "s_1_0-t0"."S" ) AS "s", __ro2sq ( "s_1_0-t0"."O" ) AS "o"
     FROM DB.DBA.RDF_QUAD AS "s_1_0-t0"
     WHERE "s_1_0-t0"."G" = __i2idn ( __bft( 'http://dbpedia.org' , 1))
       AND  "s_1_0-t0"."P" = __i2idn ( __bft( 'http://www.w3.org/1999/02/22-rdf-syn tax-ns#type' , 1))
     OPTION (QUIETCAST)
    ;

    REPORT
    VARCHAR
    _______________________________________________________________________________

    {
    from DB.DBA.RDF_QUAD by RDF_QUAD_POGS    4.5e+05 rows
    Key RDF_QUAD_POGS  ASC ($22 "s_1_0-t0.S", $21 "s_1_0-t0.O")
     inlined <col=556 P =  #type >
    row specs: <col=554 G =  #http://dbpedia.org >

    After code:
          0: $25 "s" := Call __id2i ($22 "s_1_0-t0.S")
          5: $26 "o" := Call __ro2sq ($21 "s_1_0-t0.O")
          10: BReturn 0
    Select (TOP  10 ) ($25 "s", $26 "o", <$24 "<DB.DBA.RDF_QUAD s_1_0-t0>" spec 5>)
    }

    13 Rows. -- 1 msec.

    SQL> SET EXPLAIN OFF;
    ```

</div>

</div>

</div>
