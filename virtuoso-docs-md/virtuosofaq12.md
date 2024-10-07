<div id="virtuosofaq12" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.12. What is the performance impact of going from the billion to the trillion triples?

</div>

</div>

</div>

Performance dynamics change when going from a single server to a
cluster. If each partition is around a billion triples in size, then the
single triple lookup takes the same time, but there is cluster
interconnect latency added to the mix.

On the other hand, queries that touch multiple partitions or multiple
triples in a partition will do this in parallel and usually with a
single message per partition. Thus throughput is higher.

In general terms, operations on a single triple at a time from a single
thread are penalized and operations on hundreds or more triples at a
time win. Multiuser throughput is generally better due to more cores and
more memory, and latency is absorbed by having large numbers of
concurrent requests.

See <a href="http://www.openlinksw.com/weblog/oerling/?id=1487"
class="ulink" target="_top">a sample of SPARQL scalability</a> .

</div>
