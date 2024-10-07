<div id="fn_nm_min_notnull" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

\_\_min_notnull — Returns minimum value among all its arguments,
ignoring NULLs entirely.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn___min_notnull" class="funcsynopsis">

|                               |                  |
|-------------------------------|------------------|
| `any `**`__min_notnull`**` (` | `arg1 ` any ,    |
|                               | `arg2 ` any ,    |
|                               | `... ` ,         |
|                               | `argN ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc___min_notnull" class="refsect1">

## Description

The function returns the minimum value among all values in all its
arguments by ignoring NULLs entirely.

</div>

<div id="params___min_notnull" class="refsect1">

## Parameters

<div id="id94529" class="refsect2">

### argI

Values which can be with type float, integer etc.

</div>

</div>

<div id="examples___min_notnull" class="refsect1">

## Examples

<div id="ex___min_notnull" class="example">

**Example 24.194. **

<div class="example-contents">

<span class="emphasis">*Example 1* </span>

``` screen
SQL> select __min_notnull (null, 1, 0);
__min_notnull
VARCHAR
_______________________________________________________________________________

0

1 Rows. -- 0 msec.
SQL> select __min (null, 1, 0);
__min
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

SQL> SPARQL SELECT ?s, (bif:__min_notnull (?pr1, ?pr2, ?pr3))
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
http://mygraph2.com/pricing/#QVal2   1
http://mygraph2.com/pricing/#QVal1   1
http://mygraph2.com/pricing/#QVal3   2

No. of rows in result: 2
```

</div>

</div>

  

</div>

<div id="seealso___min_notnull" class="refsect1">

## See Also

<a href="fn_nm_max.html" class="link" title="__max"><code
class="function">__max() </code></a>

<a href="fn_nm_min.html" class="link" title="__min"><code
class="function">__min() </code></a>

<a href="fn_nm_max_notnull.html" class="link"
title="__max_notnull"><code class="function">__max_notnull() </code></a>

</div>

</div>
