<div id="fn_group_concat_distinct" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.GROUP_CONCAT_DISTINCT — returns a string that is concatenation of
token strings delimited with delimiter

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_group_concat_distinct" class="funcsynopsis">

|                                           |                          |
|-------------------------------------------|--------------------------|
| ` `**`DB.DBA.GROUP_CONCAT_DISTINCT`**` (` | in `token ` varchar ,    |
|                                           | in `delim ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_group_concat_distinct" class="refsect1">

## Description

DB.DBA.GROUP_CONCAT_DISTINCT is aggregate function that performs a
string concatenation across the values of an expression with a group.
The order of the strings is not specified. The separator character used
in the concatenation may be given with the scalar argument delimiter.

Note: the "sql:" prefix is mandatory when this aggregate is used in
SPARQL queries. In SQL queries the prefix is "DB.DBA".

</div>

<div id="params_group_concat_distinct" class="refsect1">

## Parameters

<div id="id102748" class="refsect2">

### token

An item that should be added to a delimited list.

</div>

<div id="id102751" class="refsect2">

### delim

The delimeter character to be used in the concatenation.

</div>

</div>

<div id="ret_group_concat_distinct" class="refsect1">

## Return Types

any

</div>

<div id="examples_group_concat_distinct" class="refsect1">

## Examples

<div id="ex_group_concat_distinct" class="example">

**Example 24.288. Simple Use**

<div class="example-contents">

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

<div id="seealso_group_concat_distinct" class="refsect1">

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
