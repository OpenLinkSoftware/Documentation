<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_GRAPH_GROUP_CREATE — Creates graph group.

</div>

<div>

## Synopsis

<div>

|                                            |                              |
|--------------------------------------------|------------------------------|
| ` `**`DB.DBA.RDF_GRAPH_GROUP_CREATE`**` (` | in `group_name ` varchar ,   |
|                                            | in `is_silent ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Creates graph group.

</div>

<div>

## Parameters

<div>

### group_name

The name of the graph group

</div>

<div>

### is_silent

0 (default) or 1. When set to 0, and there is already group with the
given name, error will be raised. When set to 1, there will be no error
message.

</div>

</div>

<div>

## Return Types

The return value is not specified and may be changed in future versions.

</div>

<div>

## Examples

<div>

**Example 24.274. Simple example**

<div>

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

<div>

## See Also

<a href="fn_rdf_graph_group_ins.html" class="link"
title="DB.DBA.RDF_GRAPH_GROUP_INS"><code
class="function">DB.DBA.RDF_GRAPH_GROUP_INS </code></a>

</div>

</div>
