<div>

<div>

<div>

<div>

### 16.15.2. Creating Geometries From RDF Data

</div>

</div>

</div>

Many data sets use the geo:lat and geo:long properties for describing a
position. Virtuoso comes with a function for converting these properties
into geometries. This operation reads through all graphs and for each
subject with at least one geo:lat and geo:long, a point geometry is made
for each distinct lat/long pair where lat and long are in the same
graph. It should not happen in practice that a single subject has
multiple lats or long within one graph. If this still happens, a
geometry is made for each combination. The geometry is added to the
subject with the lat and long as the value of the geo:geometry property.
This is added to the same graph where the lat and long were.

The SQL procedure DB.DBA.RDF_GEO_FILL () performs this operation. This
is performed in parallel on multiple threads and is optimized for
cluster execution. This is done without transaction logging and is not
transactional. To make the result persistent, the operator should do an
explicit checkpoint. This is done by executing:

``` programlisting
SQL>cl_exec ('checkpoint');
```

on any process of a cluster or single server. Otherwise the result may
be lost if the server terminates abnormally before an automatic
checkpoint is made.

The DB.DBA.RDF_GEO_FILL procedure may in principle be called several
times but it will read every lat and long in the database. This is
inefficient if there are large numbers of geometries.

Application logic must generally be used for constructing geometries and
adding these to RDF subjects. It is easiest for the application to
construct a text representation of the geometries in TTL and to use the
<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">ttlp</code></a> function for loading this.

</div>
