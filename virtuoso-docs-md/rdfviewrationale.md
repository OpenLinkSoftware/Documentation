<div id="rdfviewrationale" class="section">

<div class="titlepage">

<div>

<div>

### 16.5.2. Rationale

</div>

</div>

</div>

Since most of the data that is of likely use for the emerging semantic
web is stored in relational databases, the argument for exposing this to
SPARQL access is clear. We note that historically, SQL access to
relational data has essentially never been given to the public outside
of the organization. If programmatic access to corporate IS has been
available to partners or the public, it has been through dynamic web
pages or more recently web services. There are reasons of performance,
security, maintainability and so forth for this.

The culture of the emerging semantic web is however taking a different
turn. Since RDF and OWL offer a mergeable and queryable model for
heterogeneous data, it is more meaningful and maintainable to expose
selected data for outside query than it would be with SQL. Advances in
hardware make this also less of a performance issue than it would have
been in the client-server database era.

In the context of Virtuoso, since Virtuoso is originally a
virtual/federated database, incorporating SPARQL to relational mapping
is an evident extension of the product's mission as a multi-protocol,
multi-platform connector between information systems.

</div>
