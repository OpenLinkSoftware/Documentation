<div>

<div>

<div>

<div>

### 16.4.3. Graph-Level Security

</div>

</div>

</div>

Virtuoso supports graph-level security for "physical" RDF storage. That
is somewhat similar to table access permissions in SQL. However, the
difference between SPARQL and SQL data models results in totally
different style of security administration. In SQL, when new application
is installed it comes with its own set of tables and every query in its
code explicitly specifies tables in use. Security restrictions of two
applications interfere only if applications knows each other and are
supposedly designed to cooperate. It is possible to write an application
that will get list of available tables and retrieve data from any given
table but that is a special case and it usually requires DBA privileges.

In SPARQL, data of different applications shares one table and the query
language allows to select data of all applications at once. This feature
makes SPARQL convenient for cross-application data integration. At the
same time, that become a giant security hole if any sensitive data are
stored.

A blind copying SQL security model to SPARQL domain would result in
significant loss of performance or weak security or even both problems
at the same time. That is why SPARQL model is made much more
restrictive, even if it becomes inconvenient for some administration
tasks.

Graph-level security does not replace traditional SQL security. A user
should become member of appropriate group (`SPARQL_SELECT` ,
`SPARQL_SPONGE` or `SPARQL_UPDATE` ) in order to start using its
graph-level privileges.

</div>
