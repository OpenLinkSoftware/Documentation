<div id="r2rmlcondwiz" class="section">

<div class="titlepage">

<div>

<div>

### 16.7.6. Virtuoso Conductor R2RML Import Wizard

</div>

</div>

</div>

The Virtuoso Conductor can be used for importing existing R2RML scripts
into Virtuoso and generate the necessary RDF Linked Data Views for
Virtuoso hosting and deployment.

<div id="r2rmlcondwizex" class="section">

<div class="titlepage">

<div>

<div>

#### Usage Example

</div>

</div>

</div>

<div class="orderedlist">

1.  Ensure the R2RML <a
    href="http://opldownload.s3.amazonaws.com/uda/vad-packages/6.3/virtuoso/rdb2rdf_dav.vad"
    class="ulink" target="_top">rdb2rdf_dav.vad</a> and latest Conductor
    <a
    href="http://opldownload.s3.amazonaws.com/uda/vad-packages/6.3/virtuoso/conductor_dav.vad"
    class="ulink" target="_top">conductor_dav.vad</a> VAD packages are
    installed.

2.  Create a test table with sample data:

    ``` programlisting
    SQL> CREATE TABLE "R2RML"."TEST"."PRODUCT"
    (
      "id" INTEGER,
      "name" VARCHAR(100),
      PRIMARY KEY ("id")
    );
    Done. -- 16 msec.
    SQL> INSERT SOFT "R2RML"."TEST"."PRODUCT" VALUES(1, 'Virtuoso');
    Done. -- 0 msec.
    SQL> INSERT SOFT "R2RML"."TEST"."PRODUCT" VALUES(2, 'UDA');
    Done. -- 0 msec.
    SQL>
    ```

3.  Grant select privileges on the "R2RML"."TEST"."PRODUCT" table to the
    SPARQL user to enable execution via SPARQL endpoint:

    ``` programlisting
    SQL> GRANT SELECT ON R2RML.TEST.PRODUCT  TO "SPARQL", "SPARQL_UPDATE"
    Done. -- 1 msec.
    ```

4.  Create the following R2RML mapping script for the
    "R2RML"."TEST"."PRODUCT" table:

    ``` programlisting
    $ cat demo.n3
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
    $
    ```

5.  Got to the Linked Data -\> R2RML tab of the Virtuoso Conductor:

    <div class="figure-float">

    <div id="virtconductorr2rmlimport01" class="figure">

    **Figure 16.66. Conductor R2RML Import Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor R2RML Import
    Wizard](images/ui/VirtConductorR2RMLImport01.png)

    </div>

    </div>

    </div>

      

    </div>

6.  Select the Choose File button and select the R2RML file to load:

    <div class="figure-float">

    <div id="virtconductorr2rmlimport02" class="figure">

    **Figure 16.67. Conductor R2RML Import Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor R2RML Import
    Wizard](images/ui/VirtConductorR2RMLImport02.png)

    </div>

    </div>

    </div>

      

    </div>

7.  Select the Validate button to verify the R2RML mapping script:

    <div class="figure-float">

    <div id="virtconductorr2rmlimport03" class="figure">

    **Figure 16.68. Conductor R2RML Import Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor R2RML Import
    Wizard](images/ui/VirtConductorR2RMLImport03.png)

    </div>

    </div>

    </div>

      

    </div>

8.  Select the Generate button to generate the RDF Linked Data Views
    mappings for the R2RML mapping script:

    <div class="figure-float">

    <div id="virtconductorr2rmlimport04" class="figure">

    **Figure 16.69. Conductor R2RML Import Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor R2RML Import
    Wizard](images/ui/VirtConductorR2RMLImport04.png)

    </div>

    </div>

    </div>

      

    </div>

9.  Select the Execute button to create the RDF Linked Data Views
    mapping the the Quad Store:

    <div class="figure-float">

    <div id="virtconductorr2rmlimport05" class="figure">

    **Figure 16.70. Conductor R2RML Import Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor R2RML Import
    Wizard](images/ui/VirtConductorR2RMLImport05.png)

    </div>

    </div>

    </div>

      

    </div>

10. The RDF Linked Data View creation is complete and status is
    displayed:

    <div class="figure-float">

    <div id="virtconductorr2rmlimport06" class="figure">

    **Figure 16.71. Conductor R2RML Import Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor R2RML Import
    Wizard](images/ui/VirtConductorR2RMLImport06.png)

    </div>

    </div>

    </div>

      

    </div>

11. The Default Graph Name (transient) specified
    http://demo.openlinksw.com/r2rml# can now be used to run a SPARQL
    query against the created Linked Data View. If the Generate
    <a href="rdb2rdftriggers.html" class="link"
    title="16.17.17. RDB2RDF Triggers">RDB2RDF triggers</a> and Enable
    Data Syncs with Physical Quad Store check boxes are selected the
    Physical Graph Name (persistent) specified
    urn:demo.openlinksw.com/r2rml# can be used to run a SPARQL query
    against the materialized triples in the Quad Store.

    <div class="figure-float">

    <div id="virtconductorr2rmlimport07" class="figure">

    **Figure 16.72. Conductor R2RML Import Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor R2RML Import
    Wizard](images/ui/VirtConductorR2RMLImport07.png)

    </div>

    </div>

    </div>

      

    </div>

12. The results set for the Linked Data View graph are displayed:

    <div class="figure-float">

    <div id="virtconductorr2rmlimport08" class="figure">

    **Figure 16.73. Conductor R2RML Import Wizard**

    <div class="figure-contents">

    <div class="mediaobject">

    ![Conductor R2RML Import
    Wizard](images/ui/VirtConductorR2RMLImport08.png)

    </div>

    </div>

    </div>

      

    </div>

</div>

</div>

</div>
