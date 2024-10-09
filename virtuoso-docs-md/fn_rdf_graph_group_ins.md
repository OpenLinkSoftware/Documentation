<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_GRAPH_GROUP_INS — Inserts graph into group.

</div>

<div>

## Synopsis

<div>

|                                         |                              |
|-----------------------------------------|------------------------------|
| ` `**`DB.DBA.RDF_GRAPH_GROUP_INS`**` (` | in `group_name ` varchar ,   |
|                                         | in `graph_uri ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Inserts graph into a given group.

</div>

<div>

## Parameters

<div>

### group_name

The name of the graph group

</div>

<div>

### graph_uri

graph uri IRI string or IRI_ID

</div>

</div>

<div>

## Return Types

The return value is not specified and may be changed in future versions.

</div>

<div>

## Examples

<div>

**Example 24.275. Simple example**

<div>

``` screen
SQL>DB.DBA.RDF_GRAPH_GROUP_CREATE ('TestGroup',1);
Done. -- 50 msec.
SQL>DB.DBA.RDF_GRAPH_GROUP_INS ('TestGroup','http://myopenlink.net');
Done. -- 50 msec.
SQL>DB.DBA.RDF_GRAPH_GROUP_INS ('TestGroup','http://demo.openlinksw.com');
Done. -- 50 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_rdf_graph_group_create.html" class="link"
title="DB.DBA.RDF_GRAPH_GROUP_CREATE"><code
class="function">DB.DBA.RDF_GRAPH_GROUP_CREATE </code></a>

</div>

</div>
