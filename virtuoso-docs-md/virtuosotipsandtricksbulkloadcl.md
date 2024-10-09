<div>

<div>

<div>

<div>

### 1.5.15. How is a Checkpoint performed against a Virtuoso Clustered Server?

</div>

</div>

</div>

The cluster
<a href="fn_cl_exec.html" class="link" title="cl_exec">cl_exec()</a>
function is used to perform a checkpoint across all node of a Virtuoso
cluster as follows:

``` programlisting
SQL>cl_exec ('checkpoint');
```

This typically needs to be run after loading RDF datasets into a
Virtuoso cluster to prevent lose of data when the cluster is restarted.

</div>
