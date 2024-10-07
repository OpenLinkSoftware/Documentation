<div id="virtuosofaq23" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.23. Is there a mechanism for terminating long running queries?

</div>

</div>

</div>

Virtuoso SPARQL and SQL offer an "anytime" option that will return
partial results after a configurable timeout.

In this way, queries will return in a predictable time and indicate
whether the results are complete or not, as well as give a summary of
resource utilization.

This is especially useful for publishing a SPARQL endpoint where a
single long running query could impact the performance of the whole
system. This timeout significantly reduces the risk of denial of
service.

This is also more user-friendly than simply timing-out a query after a
set period and returning an error. With the anytime option, the user
gets a feel for what data may exist, including whether any data exists
at all. This feature works with arbitrarily complex queries, including
aggregation, GROUP BY, ORDER BY, transitivity, etc.

Since the Virtuoso SPARQL endpoint supports open authentication (OAuth),
the authentication can be used for setting timeouts, so as to give
different service to different users.

It is also possible to set a timeout that will simply abort a query or
an update transaction if it fails to terminate in a set time.

Disconnecting the client from the server will also terminate any
processing on behalf of that client, regardless of timeout settings.

The SQL client call-level interfaces (ODBC, JDBC, OLE-DB, ADO.NET, XMLA)
each support a cancel call that can terminate a long running query from
the application, without needing to disconnect.

</div>
