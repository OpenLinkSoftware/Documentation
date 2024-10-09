<div>

<div>

</div>

<div>

## Name

DB.DBA.GROUP_CONCAT — returns an arbitrary value from the multiset
passed to it.

</div>

<div>

## Synopsis

<div>

|                                  |                          |
|----------------------------------|--------------------------|
| ` `**`DB.DBA.GROUP_CONCAT`**` (` | in `token ` varchar ,    |
|                                  | in `delim ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

DB.DBA.GROUP_CONCAT is aggregate function that performs a string
concatenation across the values of an expression with a group. The order
of the strings is not specified. The separator character used in the
concatenation may be given with the scalar argument delimiter.

Note: the "sql:" prefix is mandatory when this aggregate is used in
SPARQL queries. In SQL queries the prefix is "DB.DBA".

</div>

<div>

## Parameters

<div>

### token

An item that should be added to a delimited list.

</div>

<div>

### delim

The delimeter character to be used in the concatenation.

</div>

</div>

<div>

## Return Types

any

</div>

<div>

## Examples

<div>

**Example 24.287. Simple Use**

<div>

``` programlisting
SQL>SPARQL
SELECT ?name, (sql:GROUP_CONCAT(?near, ' , '))
WHERE
  {
    GRAPH ?g
      {
        [] a foaf:Person ;
        foaf:name ?name ;
        foaf:based_near ?near
      }
  }
LIMIT 10

name callret-1
ANY  ANY
________________________________________________
Jonas Smedegaard     nodeID://b6190457 , nodeID://b6190507
Adam Harvey        nodeID://b780751
John Breslin         nodeID://b56694
John Breslin         nodeID://b56694
Chris Bizer        http://sws.geonames.org/2950159/ , http://dbpedia.org/resource/Berlin
Leo Sauermann        nodeID://b53598
Andreas Harth        http://dbpedia.org/resource/Karlsruhe , nodeID://b53559 , nodeID://b53569
Alexandre Passant    http://dbpedia.org/resource/Galway
Leon Lord            http://ods-qa.openlinksw.com/dataspace/person/t1#based_near
Leon Smith         http://ods-qa.openlinksw.com/dataspace/person/t2#based_near
No. of rows in result: 10
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_sample.html" class="link" title="DB.DBA.SAMPLE"><code
class="function">DB.DBA.SAMPLE() </code></a>

<a href="fn_group_concat_distinct.html" class="link"
title="DB.DBA.GROUP_CONCAT_DISTINCT"><code
class="function">DB.DBA.GROUP_CONCAT_DISTINCT() </code></a>

<a href="fn_group_digest.html" class="link"
title="DB.DBA.GROUP_DIGEST"><code
class="function">DB.DBA.GROUP_DIGEST() </code></a>

<a href="samplegroupconcatdigest.html" class="link"
title="1.5.59. What is the difference between the functions SAMPLE, GROUP_CONCAT and GROUP_DIGEST?">Differences
between DB.DBA.SAMPLE, DB.DBA.GROUP_CONCAT and DB.DBA.GROUP_DIGEST
functions usage.</a>

</div>

</div>
