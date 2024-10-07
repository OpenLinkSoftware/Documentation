<div id="virtuosofaq8" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.8. Do you support full-text search?

</div>

</div>

</div>

Virtuoso has an optional full-text index on RDF literals. Searching for
text matches using the SPARQL regex feature is very inefficient in the
best of cases. This is why Virtuoso offers a special
<span class="emphasis">*bif:contains*</span> predicate similar to the
SQL <span class="emphasis">*contains*</span> predicate of many
relational databases. This supports a full-text query language with
proximity, and/or/and-not, wildcards, etc.

While the full-text index is a general-purpose SQL feature in Virtuoso,
there is extra RDF-specific intelligence built into it. One can, for
example, specify which properties are indexed, and within which graphs
this applies.

</div>
