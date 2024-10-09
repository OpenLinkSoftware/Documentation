<div>

<div>

<div>

<div>

### 1.4.16. Can multiple servers run off a single shared disk database?

</div>

</div>

</div>

This might be possible with some customization but this is not our
preferred way. Instead, we can store selected indices in duplicate or
more copies inside a clustered database. In this way, all servers can
have their own disk. Each key of each index will belong to one partition
but each partition will have more than one physical copy, each on a
different server. The cluster query logic will perform the load
balancing. On the update side, the cluster will automatically do a
distributed transaction with two phase commit to keep the duplicates in
sync.

</div>
