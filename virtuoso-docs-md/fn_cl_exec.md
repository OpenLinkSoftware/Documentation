<div>

<div>

</div>

<div>

## Name

cl_exec — executes things on all nodes of a cluster

</div>

<div>

## Synopsis

<div>

|                      |                            |
|----------------------|----------------------------|
| ` `**`cl_exec`**` (` | in `cmd ` varchar ,        |
|                      | in `params ` any := NULL , |
|                      | in `is_txn ` int := 0 `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The cl_exec SQL function can be used for executing things on all nodes
of a cluster.

</div>

<div>

## Parameters

<div>

### cmd

A SQL string. If it contains parameter markers (?), the params array is
used for assigning values, left to right.

</div>

<div>

### params

Any params.

</div>

<div>

### is_txn

If set to 1, the cl_exec makes a distributed transaction and does not
automatically commit on locally on each node. Thus cl_exec can be used
as part of a containing distributed transaction.

</div>

</div>

<div>

## Examples

<div>

**Example 24.90. Simple example**

<div>

``` screen
SQL> cl_exec ('shutdown')
--will shut all nodes.

SQL> cl_exec ('dbg_obj_print (?)', vector ('hello'));
--will print hello to the standard output of all the processes of the cluster.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="http://docs.openlinksw.com/virtuoso/clusterstcnf.html"
class="ulink" target="_top">Cluster Installation and Config</a>

<a
href="http://docs.openlinksw.com/virtuoso/clusterstcnf.html#clusterstcnfbackuprestore"
class="ulink" target="_top">Backup and Restore Example</a>

</div>

</div>
