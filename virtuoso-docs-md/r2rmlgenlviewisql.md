<div>

<div>

<div>

<div>

### 16.7.5. Generating an R2RML based Linked Data View from iSQL command-line

</div>

</div>

</div>

Using Virtuoso you can programmatically generate Linked Data Views atop
Relational Data Sources, using R2RML via the built-in function:
<span class="emphasis">*R2RML_GENERATE_LINKED_VIEW*</span> function. In
order to use this function, you need to have the <a
href="http://opldownload.s3.amazonaws.com/uda/vad-packages/6.3/virtuoso/rdb2rdf_dav.vad"
class="ulink" target="_top">rdb2rdf_dav.vad</a> package installed.

``` programlisting
R2RML_GENERATE_LINKED_VIEW
  (
    in source varchar,
    in destination_graph varchar,
    in graph_type int default 0,
    in clear_source_graph int default 1
  )
```

Here is detailed description of the funcion's parameter:

<div>

- <span class="emphasis">*source*</span>

  : The source R2RMLdocument URI. Acceptable schemes include: file:,
  dav:, http: and https:. These are also acceptable as source graph URI;

- <span class="emphasis">*destination graph*</span>

  : This is a default graph name (an IRI) applicable to either virtual
  or physical graph.

- <span class="emphasis">*graph_type*</span>

  : 0 - virtual; 1 - physical graph which sets the actual graph type;

- <span class="emphasis">*clear_source_graph*</span>

  : Determines if existing R2RML source graphs (those holding view
  declarations) are replaced as part of processing pipeline.

</div>

<span class="emphasis">*Note*</span> : The R2RML mapping script may have
a triples like:

``` programlisting
[] rr:graph <graph_name>
```

and in this case they take precedence and virtual graph would be defined
as in the R2RML. If so, then if destination graph is specified as
physical, all virtual graphs found in the R2RML would go in the
destination_graph.

<div>

<div>

<div>

<div>

#### Usage Example

</div>

</div>

</div>

<div>

1.  Ensure the R2RML VAD package <a
    href="http://opldownload.s3.amazonaws.com/uda/vad-packages/6.3/virtuoso/rdb2rdf_dav.vad"
    class="ulink" target="_top">rdb2rdf_dav.vad</a> is installed.

2.  To clear out existing mappings execute:

    ``` programlisting
    SQL> SELECT RDF_VIEW_DROP_STMT_BY_GRAPH ('http://example.com');
    VARCHAR
    _______________________________________________________________________________

    SPARQL drop silent quad map <http://demo.openlinksw.com/r2rmldemo.n3> .;

    1 Rows. -- 16 msec.

    SQL> SPARQL DROP SILENT QUAD MAP <http://demo.openlinksw.com/r2rmldemo.n3> ;

    STATE    MESSAGE
    VARCHAR  VARCHAR
    _______________________________________________________________________________

    00000    Quad map <http://demo.openlinksw.com/r2rmldemo.n3> is no longer used in storage <http://www.openlinksw.com/schemas/virtrdf#DefaultQuadStorage
    >
    00000    Quad map <http://demo.openlinksw.com/r2rmldemo.n3> is deleted
    00000    Transaction committed, SPARQL compiler re-configured
    00000    2 RDF metadata manipulation operations done

    4 Rows. -- 406 msec.

    SQL> SPARQL CLEAR <http://demo.openlinksw.com/r2rmldemo.n3>;

    callret-0
    VARCHAR
    _______________________________________________________________________________

    Clear <http://demo.openlinksw.com/r2rmldemo.n3> -- done

    1 Rows. -- 15 msec.

    SQL> DROP TABLE "R2RML"."TEST"."PRODUCT" ;

    Done. -- 0 msec.

    SQL> CREATE TABLE "R2RML"."TEST"."PRODUCT"
    (
      "id" INTEGER,
      "name" VARCHAR(100),
      PRIMARY KEY ("id")
    );
    Done. -- 16 msec.
    ```

3.  Insert sample data into a Table by executing:

    ``` programlisting
    SQL> INSERT SOFT "R2RML"."TEST"."PRODUCT" VALUES(1, 'Virtuoso');
    Done. -- 0 msec.
    ```

4.  Locate or create your R2RML mapping document, for example: .n3 file
    with the following content:

    ``` programlisting
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
    ```

5.  Generate a Linked Data View from the R2RML document that applies to
    the sample data (created earlier) by executing the statement:

    ``` programlisting
    SQL> DB.DBA.R2RML_GENERATE_LINKED_VIEW('http://demo.openlinksw.com/r2rmldemo.n3', 'http://example.com', 0);
    STATE    MESSAGE
    VARCHAR  VARCHAR
    _______________________________________________________________________________

    00000    IRI class <r2rml:virt02-8513ca7e0ce41d2e38f0c750fd552139> has been defined (inherited from rdfdf:sql-integer-uri-nullable)
    00000    Literal class <r2rml:virt02-daca9ceddea29d53dbbdb6bd0f3dee68> has been defined (inherited from rdfdf:sql-integer-literal-nullable)
    00000    Quad storage <http://www.openlinksw.com/schemas/virtrdf#DefaultQuadStorage> is flagged as being edited
    00000    Quad map <http://demo.openlinksw.com/r2rmldemo.n3> has been created and added to the <http://www.openlinksw.com/schemas/virtrdf#DefaultQuadSt
    orage>
    00000    Quad map <sys:qm-1be5dbd931459cf9e2df2338428f418d> has been created and added to the <http://www.openlinksw.com/schemas/virtrdf#DefaultQuadSt
    orage>
    00000    Quad map <sys:qm-c5f81d7126efa3e7a93f7e903fd5fa93> has been created and added to the <http://www.openlinksw.com/schemas/virtrdf#DefaultQuadSt
    orage>
    00000    Quad map <sys:qm-25c4599111b9f07fbd8fc60ce0b42eaf> has been created and added to the <http://www.openlinksw.com/schemas/virtrdf#DefaultQuadSt
    orage>
    00000    Quad storage <http://www.openlinksw.com/schemas/virtrdf#DefaultQuadStorage> is unflagged and can be edited by other transactions
    00000    Transaction committed, SPARQL compiler re-configured
    00000    9 RDF metadata manipulation operations done

    10 Rows. -- 1109 msec.
    SQL>
    ```

6.  Verify successful creation of the Linked Data View by executing the
    following SPARQL query via iSQL or Conductor interface:

    ``` programlisting
    SQL> SPARQL
    SELECT *
    FROM <http://example.com>
    WHERE {?s ?p ?o} ;

    s                                p                                                   o
    VARCHAR                          VARCHAR                                             VARCHAR
    _______________________________________________________________________________

    http://example.com/product/1     http://example.com/product#id                       1
    http://example.com/product/1     http://example.com/product#name                     Virtuoso
    http://example.com/product/1     http://www.w3.org/1999/02/22-rdf-syntax-ns#type     http://example.com/ns#product

    3 Rows. -- 15 msec.
    ```

</div>

</div>

</div>
