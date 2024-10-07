<div id="fn_cl_exec" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

cl_exec — executes things on all nodes of a cluster

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_cl_exec" class="funcsynopsis">

|                      |                            |
|----------------------|----------------------------|
| ` `**`cl_exec`**` (` | in `cmd ` varchar ,        |
|                      | in `params ` any := NULL , |
|                      | in `is_txn ` int := 0 `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_cl_exec" class="refsect1">

## Description

The cl_exec SQL function can be used for executing things on all nodes
of a cluster.

</div>

<div id="params_cl_exec" class="refsect1">

## Parameters

<div id="id86176" class="refsect2">

### cmd

A SQL string. If it contains parameter markers (?), the params array is
used for assigning values, left to right.

</div>

<div id="id86179" class="refsect2">

### params

Any params.

</div>

<div id="id86182" class="refsect2">

### is_txn

If set to 1, the cl_exec makes a distributed transaction and does not
automatically commit on locally on each node. Thus cl_exec can be used
as part of a containing distributed transaction.

</div>

</div>

<div id="examples_cl_exec" class="refsect1">

## Examples

<div id="ex_cl_exec" class="example">

**Example 24.90. Simple example**

<div class="example-contents">

``` screen
SQL> cl_exec ('shutdown')
--will shut all nodes.

SQL> cl_exec ('dbg_obj_print (?)', vector ('hello'));
--will print hello to the standard output of all the processes of the cluster.
```

</div>

</div>

  

</div>

<div id="seealso_rdf_loader_run" class="refsect1">

## See Also

<a href="http://docs.openlinksw.com/virtuoso/clusterstcnf.html"
class="ulink" target="_top">Cluster Installation and Config</a>

<a
href="http://docs.openlinksw.com/virtuoso/clusterstcnf.html#clusterstcnfbackuprestore"
class="ulink" target="_top">Backup and Restore Example</a>

</div>

</div>