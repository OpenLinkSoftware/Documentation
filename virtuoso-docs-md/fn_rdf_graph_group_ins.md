<div id="fn_rdf_graph_group_ins" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_GRAPH_GROUP_INS — Inserts graph into group.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_graph_group_ins" class="funcsynopsis">

|                                         |                              |
|-----------------------------------------|------------------------------|
| ` `**`DB.DBA.RDF_GRAPH_GROUP_INS`**` (` | in `group_name ` varchar ,   |
|                                         | in `graph_uri ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_graph_group_ins" class="refsect1">

## Description

Inserts graph into a given group.

</div>

<div id="params_rdf_graph_group_ins" class="refsect1">

## Parameters

<div id="id101578" class="refsect2">

### group_name

The name of the graph group

</div>

<div id="id101581" class="refsect2">

### graph_uri

graph uri IRI string or IRI_ID

</div>

</div>

<div id="ret_rdf_graph_group_ins" class="refsect1">

## Return Types

The return value is not specified and may be changed in future versions.

</div>

<div id="examples_rdf_graph_group_ins" class="refsect1">

## Examples

<div id="ex_rdf_graph_group_ins" class="example">

**Example 24.275. Simple example**

<div class="example-contents">

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

<div id="seealso_rdf_graph_group_ins" class="refsect1">

## See Also

<a href="fn_rdf_graph_group_create.html" class="link"
title="DB.DBA.RDF_GRAPH_GROUP_CREATE"><code
class="function">DB.DBA.RDF_GRAPH_GROUP_CREATE </code></a>

</div>

</div>
