<div id="udtinstancerefs" class="section">

<div class="titlepage">

<div>

<div>

### 9.2.6. Instance References

</div>

</div>

</div>

Because the SQL types instances cannot be referenced by more than one
variable/type member Virtuoso PL implements instance references. The
references are created for the types marked with
`SELF AS REF type_option` (see
<a href="udt_overview.html#udtcreatetypestmt" class="link"
title="9.2.1. CREATE TYPE Statement">CREATE TYPE</a> ). For such types
the constructor(s) make a SQL value of reference type in addition to
making the instance itself. The engine places the instances in a
connection specific cache of instances and returns a SQL value of type
reference which points to that instance. Copying the reference value
will not cause copying the instance into the cache, so a `SELF AS REF`
type will behave as a hosted class with respect to changing values in
the copy. A new instance in the cache will be created only when the
constructor for the type is called again. The server will accept a SQL
reference value in every place where an instance value is expected. When
a reference is serialized, as in when storing into a column of a table,
the server will serialize the instance data, not the reference itself.

The connection's instance cache is cleared after the completion of the
current server operation, i.e. completion of the top level state,
statement invoked by a client or the completion of processing an HTTP
request. The cache will thus survive multiple transactions if these are
transacted within a single client initiated operation.

</div>
