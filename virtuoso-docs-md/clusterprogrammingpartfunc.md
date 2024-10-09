<div>

<div>

<div>

<div>

## 10.5. Partition Functions

</div>

</div>

</div>

Given a key and a set of values, the partition function can determine
which cluster nodes hold the value.

``` programlisting
partition_list ( in table_name varchar,
                 in key_name varchar,
                 in list any,
                 in is_update int)
```

The table name is a case sensitive full name of a table as it appears in
SYS_KEYS. The key_name is the case sensitive name of the index. The
values are key part values in the index order. The is_update, if
non-zero, specifies that if the value is stored in multiple places, all
are to be returned, otherwise just one is picked at random, preferring
the local if there is a local copy of the partition.

The value is a list of node numbers, corresponding to the Host\<n\>
entries in the cluster.ini file.

<span class="emphasis">*Example:*</span>

``` programlisting
select partition_list ('DB.DBA.CT', 'CT', vector (2), 1);
```

</div>
