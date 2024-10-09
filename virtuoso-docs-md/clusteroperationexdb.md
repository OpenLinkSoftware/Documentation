<div>

<div>

<div>

<div>

### 6.3.3. Using Clustering with an Existing Database

</div>

</div>

</div>

The procedure for converting a single server database into a clustered
one will be specified later. For 6.0, there is no automatic way of doing
this.

One can take an existing database and convert it to clustered operation
by copying the initial database to each node of the cluster. Set up the
database so that each node would run an identical copy. Then make the
cluster.ini files.

Start the servers. Connect to the master and run the partitioning
statements for all keys of all tables that are to be managed by the
cluster.

At this point, each database will also hold rows that are not its
responsibility, unless of course all tables are declared as replicated.
The rows that are present and do not fall in the partition managed by
the host should be deleted.

This can be done with a stored procedure to be supplied later

</div>
