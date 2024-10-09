<div>

<div>

<div>

<div>

### 1.4.2. What is the cost to insert a triple (for the insertion itself, as well as for updating any indices)?

</div>

</div>

</div>

The more triples are inserted at a time, the faster this goes. Also, the
more concurrent triple insertions are going on, the better the
throughput. When loading data such as the US Census, a cluster of 2
commodity servers can insert up to 100,000 triples per second.

A single 4-core machine can load 1 billion triples of LUBM data at an
average rate of 36K triples per second. This is limited by disk.

</div>
