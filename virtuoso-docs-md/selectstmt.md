<div>

<div>

<div>

<div>

## 9.19. SELECT Statement

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 9.19.1. Syntax

</div>

</div>

</div>

``` programlisting
< select statement: single row > ::= SELECT [ < set quantifier > ] < select list >

      INTO < select target list >

      < table expression >

< select target list > ::=
      < target specification > [ { < comma > < target specification > }... ]

< query expression > ::=
      < non-join query expression >

    | < joined table >

< non-join query expression > ::=
      < non-join query term >

    | < query expression > UNION  [ ALL ]
          [ < corresponding spec > ] < query term >

    | < query expression > EXCEPT [ ALL ]
          [ < corresponding spec > ] < query term >

< non-join query term > ::=
      < non-join query primary >

    | < query term > INTERSECT [ ALL ]
          [ < corresponding spec > ] < query primary >

< non-join query primary > ::=
      < simple table >

    | < left parent > < non-join query expression > < right parent >

< simple table > ::=
      < query specification >
    | < table value constructor >
    | < explicit table >

< query specification > ::=
    SELECT [ < set quantifier > ] < select list > < table expression >

< select list > ::=
      < asterisk >
    | < select sublist > [ { < comma > < select sublist > }... ]

< select sublist > ::=
      < derived column >
    | < qualifier > < period > < asterisk >

< derived column > ::= < value expression > [ < as clause > ]

< as clause > ::= [ AS ] < column name >

< table expression > ::=
    < from clause >
    [ < where clause > ]
    [ < group by clause > ]
    [ < having clause > ]

< from clause > ::= FROM < table reference >
    [ { < comma > < table reference > }... ]

< table reference > ::=
      < table name > [ [ AS ] < correlation name >
          [ < left parent > < derived column list > < right parent > ] ]
    | < derived table > [ AS ] < correlation name >
          [ < left parent > < derived column list > < right parent > ]
    | < joined table >

< derived column list > ::= < column name list >

< derived table > ::= < table subquery >

< table subquery > ::= < subquery >

< joined table > ::=
      < cross join >
    | < qualified join >
    | < left parent > < joined table > < right parent >

< cross join > ::=
    < table reference > CROSS JOIN < table reference >

< qualified join > ::=
    < table reference > [ NATURAL ] [ < join type > ] JOIN
      < table reference > [ < join specification > ]

< join type > ::=
      INNER
    | < outer join type > [ OUTER ]
    | UNION

< outer join type > ::=
      LEFT
    | RIGHT
    | FULL

< join specification > ::=

      < join condition >
    | < named columns join >

< join condition > ::= ON < search condition >

< named columns join > ::=
    USING < left parent > < join column list > < right parent >

< join column list > ::= < column name list >

< where clause > ::= WHERE < search condition >

< group by clause > ::=
    GROUP BY < grouping column reference list >

< grouping column reference list > ::=

    < grouping column reference >
        [ { < comma > < grouping column reference > }... ]

< grouping column reference > ::=

    < column reference > [ < collate clause > ]
```

</div>

</div>
