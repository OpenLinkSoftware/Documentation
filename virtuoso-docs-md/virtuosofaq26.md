<div id="virtuosofaq26" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.26. What is the relative performance of SPARQL queries vs native relational queries?

</div>

</div>

</div>

This is application dependent. In Virtuoso, SPARQL and SQL share the
same query execution engine, query optimizer, and cost model. If data is
highly regular (i.e., a good fit for relational representation), and if
queries typically access most of the row, then SQL will be more
efficient. If queries are unpredictable, data is ragged, schema changes
frequent, or inference is needed, then RDF will do relatively better.

The recent Berlin SPARQL Benchmark shows some figures comparing Virtuoso
SQL and SPARQL and SPARQL in front of relational representation.
However, the test workload is heavily biased in favor of relational. See
also BSBM: MySQL vs Virtuoso.

With the TPC-H workload, relationally stored data, and SPARQL mapped to
SQL, we find that with about half the queries there is no significant
cost to SPARQL. With some queries there is additional overhead because
the mapping does not produce a SQL query identical to that specified in
the benchmark.

</div>
