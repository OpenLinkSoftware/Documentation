<div id="virtuosospongerfacetinstallpreinst" class="section">

<div class="titlepage">

<div>

<div>

### 16.11.2. Pre Installation

</div>

</div>

</div>

<span class="emphasis">*Note*</span> : This step is not required for
Virtuoso Release 6.1 and above builds

If you have an existing Virtuoso 6.x installation, and your Quad Store
has greater than 10K worth of triples, please perform the following
steps:

<div class="orderedlist">

1.  Run the following commands using the Virtuoso isql program before
    installing the Faceted Browser VAD:

    ``` programlisting
      drop index RDF_QUAD_OPGS;
      drop index RDF_QUAD_POGS;
      drop index RDF_QUAD_GPOS;
      drop index RDF_QUAD_OGPS;

      checkpoint;

      create table R2 (G iri_id_8, S iri_id_8, P iri_id_8, O any, primary key (S, P, O, G));
      alter index R2 on R2 partition (S int (0hexffff00));

      log_enable (2);

      INSERT INTO R2 (G, S, P, O) select G, S, P, O FROM rdf_quad;

      DROP TABLE RDF_QUAD;
      ALTER TABLE r2 rename RDF_QUAD;

      checkpoint;

      create bitmap index RDF_QUAD_OPGS on RDF_QUAD (O, P, G, S) partition (O varchar (-1, 0hexffff));
      create bitmap index RDF_QUAD_POGS on RDF_QUAD (P, O, G, S) partition (O varchar (-1, 0hexffff));
      create bitmap index RDF_QUAD_GPOS on RDF_QUAD (G, P, O, S) partition (O varchar (-1, 0hexffff));

      checkpoint;
    ```

</div>

Note this step may take sometime depending on how many triples are
already in your Quad Store.

</div>
