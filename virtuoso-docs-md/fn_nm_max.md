<div>

<div>

</div>

<div>

## Name

\_\_max — Returns maximum value among all its arguments.

</div>

<div>

## Synopsis

<div>

|                       |                  |
|-----------------------|------------------|
| `any `**`__max`**` (` | `arg1 ` any ,    |
|                       | `arg2 ` any ,    |
|                       | `... ` ,         |
|                       | `argN ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns the maximum value among all values in all its
arguments.

</div>

<div>

## Parameters

<div>

### argI

Values which can be with type float, integer etc.

</div>

</div>

<div>

## Examples

<div>

**Example 24.192. **

<div>

<span class="emphasis">*Example 1* </span>

``` screen
SQL> select __max(12, 2.34, 5, 20.5);
__max
VARCHAR
_______________________________________________________________________________

20.5

1 Rows. -- 16 msec.
```

<span class="emphasis">*Example 2*</span>

``` programlisting
SQL> SPARQL
INSERT INTO GRAPH <http://mygraph2.com>
  {
    <http://mygraph2.com/pricing/#QVal1> <price1>  1 ; <price2> 9 ; <price3> 5 .
    <http://mygraph2.com/pricing/#QVal2> <price1>  3 ; <price2> 1 ; <price3> 4 .
    <http://mygraph2.com/pricing/#QVal3> <price1>  6 ; <price2> 2 ; <price3> 2 .
  };

Insert into <http://mygraph2.com>, 9 (or less) triples -- done
No. of rows in result: 1

SQL> SPARQL SELECT ?s (bif:__max(?pr1, ?pr2, ?pr3))
FROM <http://mygraph2.com>
WHERE
  {
    ?s <price1> ?pr1 ;
       <price2> ?pr2 ;
       <price3> ?pr3
  };

Query result:
s                                     callret-1
VARCHAR                                 VARCHAR
_______________________________________________
http://mygraph2.com/pricing/#QVal3    6
http://mygraph2.com/pricing/#QVal2    4
http://mygraph2.com/pricing/#QVal1    9

No. of rows in result: 3
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_nm_min.html" class="link" title="__min"><code
class="function">__min() </code></a>

<a href="fn_nm_min_notnull.html" class="link"
title="__min_notnull"><code class="function">__min_notnull() </code></a>

<a href="fn_nm_max_notnull.html" class="link"
title="__max_notnull"><code class="function">__max_notnull() </code></a>

</div>

</div>
