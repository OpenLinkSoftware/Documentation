<div id="virtuosofaq14" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.14. Should we use RDF for our large metadata store? What are the alternatives?

</div>

</div>

</div>

If the application has high heterogeneity of schema and frequent need
for adaptation, then RDF is recommended. The alternative is making a
relational database.

Making a custom non-RDF object-attribute-value representation on
Virtuoso or some other RDBMS is possible but not recommended.

The reason for this is that this would miss many of the optimizations
made specifically for RDF, use of the SPARQL language, inference,
compatibility with diverse browsers and front end tools, etc. Not to
mention interoperability and joinability with the body of linked data.
Even if the application is strictly private, using entity names and
ontologies from the open world can still have advantages.

If some customization to the quad (triple plus graph layout) is needed,
we can provide consultancy on how to do this while staying within the
general RDF framework and retaining all the interoperability benefits.

</div>
