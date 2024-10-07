<div id="fn_rdf_graph_group_create" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_GRAPH_GROUP_CREATE — Creates graph group.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_graph_group_create" class="funcsynopsis">

|                                            |                              |
|--------------------------------------------|------------------------------|
| ` `**`DB.DBA.RDF_GRAPH_GROUP_CREATE`**` (` | in `group_name ` varchar ,   |
|                                            | in `is_silent ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_graph_group_create" class="refsect1">

## Description

Creates graph group.

</div>

<div id="params_rdf_graph_group_create" class="refsect1">

## Parameters

<div id="id101538" class="refsect2">

### group_name

The name of the graph group

</div>

<div id="id101541" class="refsect2">

### is_silent

0 (default) or 1. When set to 0, and there is already group with the
given name, error will be raised. When set to 1, there will be no error
message.

</div>

</div>

<div id="ret_rdf_graph_group_create" class="refsect1">

## Return Types

The return value is not specified and may be changed in future versions.

</div>

<div id="examples_rdf_graph_group_create" class="refsect1">

## Examples

<div id="ex_rdf_graph_group_create" class="example">

**Example 24.274. Simple example**

<div class="example-contents">

``` screen
SQL>DB.DBA.RDF_GRAPH_GROUP_CREATE ('TestGroup',1);
Done. -- 50 msec.
SQL> select * from DB.DBA.RDF_GRAPH_GROUP ;
RGG_IID           RGG_IRI            RGG_MEMBER_PATTERN  RGG_COMMENT
VARCHAR NOT NULL  VARCHAR NOT NULL   VARCHAR             VARCHAR
_______________________________________________________________________________

#i1020000         TestGroup          NULL                NULL

1 Rows. -- 10 msec.
```

</div>

</div>

  

</div>

<div id="seealso_rdf_graph_group_create" class="refsect1">

## See Also

<a href="fn_rdf_graph_group_ins.html" class="link"
title="DB.DBA.RDF_GRAPH_GROUP_INS"><code
class="function">DB.DBA.RDF_GRAPH_GROUP_INS </code></a>

</div>

</div>
