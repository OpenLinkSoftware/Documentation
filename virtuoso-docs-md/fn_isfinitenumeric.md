<div id="fn_isfinitenumeric" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

isfinitenumeric — returns 1 if its argument is of numeric type and its
value is plain valid numeric value.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_isfinitenumeric" class="funcsynopsis">

|                              |                      |
|------------------------------|----------------------|
| ` `**`isfinitenumeric`**` (` | `arg ` anything `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_isfinitenumeric" class="refsect1">

## Description

isfinitenumeric returns 1 if its argument is of numeric type and its
value is plain valid numeric value, not a peculiarity like infinity or
not-a-number.

</div>

<div id="examples_isfinitenumeric" class="refsect1">

## Examples

<div id="ex_isfinitenumeric" class="example">

**Example 24.189. Simple Use**

<div class="example-contents">

``` programlisting
SQL>  SPARQL
INSERT INTO GRAPH <http://mygraph.com>
  {
    <http://mygraph2.com/pricing/#QVal1> <price1>  1 ;    <price2> "";    <price3> 5 .
    <http://mygraph2.com/pricing/#QVal2> <price1>  "" ;   <price2> 1 ;    <price3> 4 .
    <http://mygraph2.com/pricing/#QVal3> <price1>  6 ;    <price2> 2 ;    <price3> "".
  };

Insert into <http://mygraph.com>, 9 (or less) triples -- done
No. of rows in result: 1

SQL> SPARQL SELECT ?s (bif:isfinitenumeric(?pr1))
FROM <http://mygraph.com>
WHERE
  {
    ?s <price1> ?pr1 ;
       <price2> ?pr2 ;
       <price3> ?pr3
  };

Query result:
s                                     callret-1
VARCHAR                                 INTEGER
_______________________________________________
http://mygraph2.com/pricing/#QVal2   0
http://mygraph2.com/pricing/#QVal1   1
http://mygraph2.com/pricing/#QVal3   1

No. of rows in result: 3
```

</div>

</div>

  

</div>

</div>
