<div id="virtuosofaq4" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.4. What is the cost to search on a given property?

</div>

</div>

</div>

If we are looking for equality matches, a single 2GHz core can do about
250,000 single triple random lookups per second as long as disk reads
are not involved. If each triple requires a disk seek the number is
naturally lower.

Parallelism depends on the query. With a query like counting all x and y
such that x knows y and y knows x, we get up to 3.4 million
single-triple lookups-per-second on a cluster of 2 8-core Xeon servers.
With complex nested sub-queries the parallelism may be less.

Lookups involving ranges of values, such as ranges of geographical
coordinates or dates use an index, since quads are indexed in a manner
that collates in the natural order of the data type.

</div>
