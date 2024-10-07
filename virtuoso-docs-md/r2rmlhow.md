<div id="r2rmlhow" class="section">

<div class="titlepage">

<div>

<div>

### 16.7.3. How do I use it with Virtuoso?

</div>

</div>

</div>

Virtuoso has its own previously-developed proprietary equivalent of
R2RML called <a href="rdfviewsrdbms.html" class="link"
title="16.5. Linked Data Views over RDBMS Data Source">Linked Data
Views</a> , which uses Virtuoso's <a
href="http://virtuoso.openlinksw.com/whitepapers/relational%20rdf%20views%20mapping.html"
class="ulink" target="_top">Meta Schema Mapping Language</a> to map
relational data to RDF.

R2RML support is achieved by the inclusion of a simple translator which
basically translates R2RML syntax to Virtuoso's own Linked Data Views
syntax, which can then be executed to create the Linked Data Views
themselves.

<div id="r2rmlhowinst" class="section">

<div class="titlepage">

<div>

<div>

#### Install R2RML VAD package

</div>

</div>

</div>

First you will need to ensure you have the R2RML VAD package (<a
href="http://opldownload.s3.amazonaws.com/uda/vad-packages/6.3/virtuoso/rdb2rdf_dav.vad"
class="ulink" target="_top">rdb2rdf_dav.vad</a> ) installed.

</div>

<div id="r2rmlhowtest" class="section">

<div class="titlepage">

<div>

<div>

#### Test with simple test script (basic.sql)

</div>

</div>

</div>

Having installed the R2RML VAD package, to test R2RML functionality, the
easiest way is by executing a basic.sql script via the command line isql
tool:

``` programlisting

CREATE TABLE "R2RML"."TEST"."PRODUCT"(
  id integer primary key,
  name VARCHAR(100)
);

INSERT SOFT "R2RML"."TEST"."PRODUCT" VALUES (1, 'Virtuoso');

SPARQL CLEAR GRAPH <http://temp/product>;
SPARQL CLEAR GRAPH <http://example.com/>;

DB.DBA.TTLP ('
@prefix rr: <http://www.w3.org/ns/r2rml#> .
@prefix exa: <http://example.com/ns#> .
@prefix product: <http://example.com/product#> .

<http://example.com/ns#TriplesMap1>
    a rr:TriplesMap;

    rr:logicalTable
    [
      rr:tableSchema "R2RML";
      rr:tableOwner "TEST";
      rr:tableName  "PRODUCT"
    ];

    rr:subjectMap
    [
      rr:template "http://example.com/product/{id}";
      rr:class exa:product;
      rr:graph <http://example.com/>;
    ];

    rr:predicateObjectMap
    [
      rr:predicate product:id;
      rr:objectMap [ rr:column "id" ];
    ];

    rr:predicateObjectMap
    [
      rr:predicate product:name;
      rr:objectMap [ rr:column "name" ];
    ];
.
', 'http://temp/product', 'http://temp/product' )
;

--select DB.DBA.R2RML_TEST ('http://temp/product');

--DB.DBA.OVL_VALIDATE ('http://temp/product', 'http://www.w3.org/ns/r2rml#OVL');

-- Running the validation in order to find error in name of R2RML description graph
--DB.DBA.OVL_VALIDATE ('http://temp/product-nosuch', 'http://www.w3.org/ns/r2rml#OVL');

-- Running the validation in order to find error in name of R2RML metadata graph
--DB.DBA.OVL_VALIDATE ('http://temp/product', 'http://www.w3.org/ns/r2rml#OVL-nosuch');

--select DB.DBA.R2RML_EXECUTE ('http://temp/product');

exec ('sparql ' || DB.DBA.R2RML_MAKE_QM_FROM_G ('http://temp/product'));

--sparql select distinct ?g where { graph ?g { ?s a ?t }};

SPARQL
SELECT * FROM <http://example.com/>
WHERE {?s ?p ?o .};
```

<div class="orderedlist">

1.  First, copy basic.sql into:

    ``` programlisting
    <VIRTUOSO_INSTALL>/bin/
    ```

2.  Next, open Unix session or Windows Command Prompt and execute:

    ``` programlisting

    cd <OPENLINK_INSTALL>/bin

    ./isql     (Unix)
    isql.exe   (Windows)

    OpenLink Interactive SQL (Virtuoso), version 0.9849b.
    Type HELP; for help and EXIT; to exit.
    SQL>
    ```

3.  Then, within isql execute:

    ``` programlisting
    SQL> load basic.sql;
    ```

4.  Execution should finish with a simple SPARQL query that will return
    Linked Data for the test table created at the start of the script:

    ``` programlisting
    s                               p                                                  o
    VARCHAR                         VARCHAR                                            VARCHAR
    ________________________________________________________________________________________________________________

    http://example.com/product/1    http://example.com/product#id                      1
    http://example.com/product/1    http://example.com/product#name                    Virtuoso
    http://example.com/product/1    http://www.w3.org/1999/02/22-rdf-syntax-ns#type    http://example.com/ns#product
    3 Rows. -- 0 msec.
    ```

</div>

<span class="emphasis">*Note*</span> : Subsequent executions of
basic.sql will return an error since the test table will already exist.
However, the remainder of the script will execute fine.

</div>

<div id="r2rmlhowexam" class="section">

<div class="titlepage">

<div>

<div>

#### Examining basic.sql

</div>

</div>

</div>

<div class="orderedlist">

1.  We start by creating and populating the test table:

    ``` programlisting
    CREATE TABLE "R2RML"."TEST"."PRODUCT"
      (
        id   INTEGER PRIMARY KEY ,
        name VARCHAR(100)
      );

    INSERT SOFT "R2RML"."TEST"."PRODUCT"
      VALUES
        (
          1, 'Virtuoso'
        );
    ```

2.  Next we clear any graphs (temporary or permanent) that are to be
    used during this process:

    ``` programlisting
    SPARQL CLEAR GRAPH <http://temp/product> ;
    SPARQL CLEAR GRAPH <http://example.com/> ;
    ```

3.  Next we use the
    <a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
    class="function">DB.DBA.TTLP()</code></a> procedure to insert the
    R2RML into a temporary graph, \<http://temp/product\>:

    ``` programlisting
    DB.DBA.TTLP
      (
        ' @prefix       rr:  <http://www.w3.org/ns/r2rml#>    .
          @prefix      exa:  <http://example.com/ns#>         .
          @prefix  product:  <http://example.com/product#>    .

          <http://example.com/ns#TriplesMap1>
              a                              rr:TriplesMap  ;

              rr:logicalTable
                [
                  rr:tableSchema  "R2RML"    ;
                  rr:tableOwner   "TEST"     ;
                  rr:tableName    "PRODUCT"
                ];

              rr:subjectMap
                [
                  rr:template  "http://example.com/product/{id}" ;
                  rr:class     exa:product                       ;
                  rr:graph     <http://example.com/>
                ];

              rr:predicateObjectMap
                [
                  rr:predicate  product:id  ;
                  rr:objectMap
                    [
                      rr:column  "id"
                    ];
                ];

              rr:predicateObjectMap
                [
                  rr:predicate  product:name  ;
                  rr:objectMap
                    [
                      rr:column "name"
                    ];
                ];
             .
        ',
        'http://temp/product',
        'http://temp/product'
      );
    ```

4.  Next, there is a series of commented out lines that can be used for
    sanity checking:

    ``` programlisting
    --SELECT DB.DBA.R2RML_TEST ('http://temp/product');

    --DB.DBA.OVL_VALIDATE ('http://temp/product', 'http://www.w3.org/ns/r2rml#OVL');

    -- Running the validation in order to find error in name of R2RML description graph
    --DB.DBA.OVL_VALIDATE ('http://temp/product-nosuch', 'http://www.w3.org/ns/r2rml#OVL');

    -- Running the validation in order to find error in name of R2RML metadata graph
    --DB.DBA.OVL_VALIDATE ('http://temp/product', 'http://www.w3.org/ns/r2rml#OVL-nosuch');

    --SELECT DB.DBA.R2RML_EXECUTE ('http://temp/product');
    ```

5.  Next, DB.DBA.R2RML_MAKE_QM_FROM_G() is used to perform the
    conversion from R2RML into Virtuoso's own Linked Data Views script.
    The output is then prepended with the keyword 'SPARQL' and a space,
    and executed using
    <a href="fn_exec.html" class="link" title="exec"><code
    class="function">exec()</code></a> :

    ``` programlisting
    EXEC ('SPARQL ' || DB.DBA.R2RML_MAKE_QM_FROM_G ('http://temp/product'));
    ```

    <span class="emphasis">*Note*</span> : The final triples are placed
    in the graph defined in the R2RML script itself
    (\<http://example.com/\>)

    Alternatively, the destination graph can be specified as an optional
    second parameter of DB.DBA.R2RML_MAKE_QM_FROM_G():

    ``` programlisting
    DB.DBA.R2RML_MAKE_QM_FROM_G
      (
        (
          IN g VARCHAR
       [, IN target_graph VARCHAR := NULL]
        )
      )
    ```

6.  Finally, a simple SPARQL statement is executed to prove data is
    returned:

    ``` programlisting
    SPARQL
      SELECT *
      FROM <http://example.com/>
      WHERE {?s ?p ?o .};
    ```

</div>

</div>

</div>
