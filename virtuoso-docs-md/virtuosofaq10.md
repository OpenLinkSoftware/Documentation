<div>

<div>

<div>

<div>

### 1.4.10. How can data be partitioned across multiple servers?

</div>

</div>

</div>

Virtuoso Cluster partitions each index of all tables containing RDF data
separately. The partitioning is by hash. The result is that the data is
evenly distributed over the selected number of servers. Immediately
consecutive triples are generally in the same partition, since the low
bits of IDs do not enter in into the partition hash. This means that key
compression works well.

Since RDF tables are in the end just SQL tables, SQL can be used for
specifying a non-standard partitioning scheme. For example, one could
dedicate one set of servers for one index, and another set for another
index. Special cases might justify doing this.

With very large deployments, using a degree of application-specific data
structures may be advisable. See "Does Virtuoso support property
tables".

</div>
