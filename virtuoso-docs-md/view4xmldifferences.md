<div>

<div>

<div>

<div>

### 15.3.8. Differences Between SQLX, FOR XML and XML Views

</div>

</div>

</div>

A SQLX or FOR XML query has no effect on the database schema. It is a
transient event and does not generate procedures or other schema
elements.

These define an ad hoc mapping of a result set to XML. There is no
possibility of using XPATH to specify a search without first
constructing the whole tree. An XML view on the other hand provides a
mapping context in which one can make XQUERY or XPATH queries that are
mapped into SQL and the XML is only generated after applying the
conditions.

XML views will usually be more efficient in complex cases and the
notation there may be simpler than the EXPLICIT notation in FOR XML. For
simple cases SQLX or FOR XML is the more convenient of the two. SQLX or
FOR XML does not restrict the SQL being used and will allow free use of
subqueries, expressions, derived tables, qualified joins etc.

</div>
