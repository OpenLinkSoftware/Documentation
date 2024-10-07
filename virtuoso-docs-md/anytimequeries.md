<div id="anytimequeries" class="section">

<div class="titlepage">

<div>

<div>

## 9.25. Anytime Queries

</div>

</div>

</div>

Starting with version 6, Virtuoso offers a partial query evaluation
feature that guarantees answers to arbitrary queries within a fixed
time. This is intended for use in publicly available SPARQL or SQL end
points on large databases. This enforces a finite duration to all
queries and will strive to return meaningful partial results. Thus this
provides the same security as a transaction timeout but will be more
user friendly since results will generally be returned, also for
aggregate queries. Outside of a public query service, this may also be
handy when exploring a large data set with unknown properties.

The feature is activated with the statement

``` programlisting
set result_timeout == <expression>;
```

The expression should be a count of milliseconds. The scope of the
setting is the connection, thus it remains in effect past the return of
the calling procedure. Setting the timeout to 0 returns to the default
state of having no limit on query run time and always returning complete
results. The initial value of the timeout is 0. On a web server thread,
the timeout is reset to 0 at the start of processing each new request
header.

After a query or cursor has exceeded the running time, it is reset. In
the event of the reset occurring inside an aggregation, the part of the
query that produces rows for the aggregation is terminated, the timeout
is reset and the query continues by using the aggregated results that
were obtained before the first timeout. If there is again a timeout, the
present aggregation is reset and the query gets another lease on life
for processing the results accumulated so far. Thus, a query which has a
select, a group by and an order by can consume at most three timeouts.
One for producing the aggregated rows, another for sorting them and
finally a third for returning them to a client or iterating over them in
a stored procedure.

If the timeout occurs outside an aggregation, the result set is simply
truncated.

The fact of a query returning partial results is indicated by the result
set ending with a S1TAT SQL state. If the result set is read to end
without this state being signalled, the results are complete and the
query was not interrupted. If the result set is not consumed to end, the
client cannot be sure of its completeness.

The error message associated with the S1TAT state contains the human
readable version of the output of db_activity () for the query. If
result_timeout is non-zero, the opening of a cursor or execution of a
query on a client connection or with the exec () function will reset the
client resource consumption counters automatically. This is done so as
to have the resource consumption statistics for the error message scoped
to the query. To get the exact counts, the application may call
db_activity (1) in the same procedure. If this is called on a client
server connection with the timeout on, the counts will be reset before
db_activity () is called.

The resolution of the timeout is fairly low, timeouts are checked every
two seconds with default settings.

A query cannot set a timeout from inside itself. Only a stored procedure
or a top level statement on a client connection can do this.

A request to SPARQL web service endpoint may specify the timeout as an
additional <span class="emphasis">*&timeout=\<milliseconds\>*</span>
parameter. The parameter value should be equal to or greater than 1000,
otherwise it will be ignored. If <span class="emphasis">*SPARQL*</span>
Virtuoso configuration file contains
<span class="emphasis">*MaxQueryExecutionTime*</span> parameter and its
value is greater than or equal to 1000 then the actual "anytime" timeout
is the minimum of the requested value and the value in the configuration
file.

The current standard of SPARQL protocol does not provide any support for
partial results. When a SPARQL query ends with S1TAT state, the returned
HTTP header contains four additional rows,
<span class="emphasis">*X-SQL-State:*</span> ,
<span class="emphasis">*X-SQL-Message:*</span> ,
<span class="emphasis">*X-Exec-Milliseconds:*</span> and
<span class="emphasis">*X-Exec-DB-Activity:*</span> ; the returned
document is formatted according to the requested MIME type as if the
result is complete.

</div>
