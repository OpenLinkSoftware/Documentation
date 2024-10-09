<div>

<div>

</div>

<div>

## Name

DB.DBA.GROUP_CONCAT_DISTINCT — returns a string that is concatenation of
token strings delimited with delimiter

</div>

<div>

## Synopsis

<div>

|                                           |                          |
|-------------------------------------------|--------------------------|
| ` `**`DB.DBA.GROUP_CONCAT_DISTINCT`**` (` | in `token ` varchar ,    |
|                                           | in `delim ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

DB.DBA.GROUP_CONCAT_DISTINCT is aggregate function that performs a
string concatenation across the values of an expression with a group.
The order of the strings is not specified. The separator character used
in the concatenation may be given with the scalar argument delimiter.

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

**Example 24.288. Simple Use**

<div>

``` programlisting
SQL>SPARQL
SELECT ?name, (sql:GROUP_CONCAT_DISTINCT(?near, ' , '))
WHERE
  {
    GRAPH ?g
      {
        [] a foaf:Person ;
        foaf:name ?name ;
        foaf:based_near ?near
      }
  }
LIMIT 2

name callret-1
ANY  ANY
________________________________________________
Donny Hathaway   http://linkeddata.uriburner.com/about/id/entity/http/sws.geonames.org/3996063/ , http://linkeddata.uriburner.com/about/id/entity/http/sws.geonames.org/4990729/ , ..
Jill Scott       http://linkeddata.uriburner.com/about/id/entity/http/sws.geonames.org/3996034/ , http://linkeddata.uriburner.com/about/id/entity/http/sws.geonames.org/4990735/ , ...
No. of rows in result: 2
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_sample.html" class="link" title="DB.DBA.SAMPLE"><code
class="function">DB.DBA.SAMPLE() </code></a>

<a href="fn_group_concat.html" class="link"
title="DB.DBA.GROUP_CONCAT"><code
class="function">DB.DBA.GROUP_CONCAT() </code></a>

<a href="fn_group_digest.html" class="link"
title="DB.DBA.GROUP_DIGEST"><code
class="function">DB.DBA.GROUP_DIGEST() </code></a>

<a href="samplegroupconcatdigest.html" class="link"
title="1.5.59. What is the difference between the functions SAMPLE, GROUP_CONCAT and GROUP_DIGEST?">Differences
between DB.DBA.SAMPLE, DB.DBA.GROUP_CONCAT, DB.DBA.GROUP_CONCAT_DISTINCT
and DB.DBA.GROUP_DIGEST functions usage.</a>

</div>

</div>
