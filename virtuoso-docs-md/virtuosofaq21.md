<div id="virtuosofaq21" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.21. How do I reconfigure a cluster, adding and removing machines, etc?

</div>

</div>

</div>

We are working on a system whereby servers can be added and removed from
a cluster during operation and no repartitioning of the data is needed.

In the first release, the number of server processes that make up the
cluster is set when creating the database. These processes with their
database files can then be moved between machines but this requires
stopping the cluster and updating configuration files.

</div>
