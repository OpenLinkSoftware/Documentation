<div>

<div>

<div>

<div>

### 1.4.22. How will Virtuoso handle regional clusters?

</div>

</div>

</div>

Performance of a cluster depends on the latency and bandwidth of the
interconnect. At least dual 1Gbit ethernet is recommended for each node.
Thus a cluster should be on a single local or system area network.

If regional copies are needed, we would replicate between clusters by
asynchronous log shipping. This requires some custom engineering.

When a transaction is committed at one site, it is logged and sent to
the subscribing sites if they are online. If there is no connection, the
subscribing sites will get the data from the log. This scheme now works
between single Virtuoso servers, and needs some custom development to be
adapted to clusters.

If replicating all the data of one site to another site is not possible,
then application logic should be involved. Also, if consolidated queries
should be made against large, geographically-separated clusters, then it
is best to query them separately and merge the results in the
application. All depends on the application level rules on where data
resides.

</div>
