<div id="fn_nm_max_notnull" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

\_\_max_notnull — Returns maximum value among all its arguments,
ignoring NULLs entirely.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn___max_notnull" class="funcsynopsis">

|                               |                  |
|-------------------------------|------------------|
| `any `**`__max_notnull`**` (` | `arg1 ` any ,    |
|                               | `arg2 ` any ,    |
|                               | `... ` ,         |
|                               | `argN ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc___max_notnull" class="refsect1">

## Description

The function returns the maximum value among all values in all its
arguments by ignoring NULLs entirely.

</div>

<div id="params___max_notnull" class="refsect1">

## Parameters

<div id="id94480" class="refsect2">

### argI

Values which can be with type float, integer etc.

</div>

</div>

<div id="examples___max_notnull" class="refsect1">

## Examples

<div id="ex___max_notnull" class="example">

**Example 24.193. **

<div class="example-contents">

<span class="emphasis">*Example 1* </span>

``` screen
SQL> select __max_notnull (null, 1, 0);
__max_notnull
VARCHAR
_______________________________________________________________________________

1

1 Rows. -- 16 msec.

SQL> select __max (null, 1, 0);
__max
VARCHAR
_______________________________________________________________________________

NULL

1 Rows. -- 0 msec.
```

<span class="emphasis">*Example 2*</span>

``` programlisting
SQL> SPARQL
INSERT INTO GRAPH <http://mygraph.com>
  {
    <http://mygraph2.com/pricing/#QVal1> <price1>  1 ;                    <price3> 5 .
    <http://mygraph2.com/pricing/#QVal2>                  <price2> 1 ;    <price3> 4 .
    <http://mygraph2.com/pricing/#QVal3> <price1>  6 ;    <price2> 2                 .
  };

Insert into <http://mygraph.com>, 6 (or less) triples -- done
No. of rows in result: 1

SQL> SPARQL SELECT ?s, (bif:__max_notnull (?pr1, ?pr2, ?pr3))
FROM <http://mygraph.com>
WHERE
  {
    {
      SELECT DISTINCT ?s
      WHERE
        {
          ?s ?p ?pr .
          FILTER (?p in (<price1>, <price2>, <price3>))
        }
    }
    OPTIONAL { ?s <price1> ?pr1 }
    OPTIONAL { ?s <price2> ?pr2 }
    OPTIONAL { ?s <price3> ?pr3 }
  };

Query result:
s                                     callret-1
VARCHAR                                 VARCHAR
_______________________________________________
http://mygraph2.com/pricing/#QVal2   4
http://mygraph2.com/pricing/#QVal1   5
http://mygraph2.com/pricing/#QVal3   6

No. of rows in result: 2
```

</div>

</div>

  

</div>

<div id="seealso___max_notnull" class="refsect1">

## See Also

<a href="fn_nm_max.html" class="link" title="__max"><code
class="function">__max() </code></a>

<a href="fn_nm_min.html" class="link" title="__min"><code
class="function">__min() </code></a>

<a href="fn_nm_min_notnull.html" class="link"
title="__min_notnull"><code class="function">__min_notnull() </code></a>

</div>

</div>
