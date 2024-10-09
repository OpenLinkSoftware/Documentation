<div>

<div>

<div>

<div>

### 9.19.8. Query Expressions

</div>

</div>

</div>

``` programlisting
< non-join query expression > ::=
      < non-join query term >
    | < query expression > UNION  [ ALL ]
          [ < corresponding spec > ] < query term >
    | < query expression > EXCEPT [ ALL ]
          [ < corresponding spec > ] < query term >

< corresponding spec > ::=
    CORRESPONDING [ BY < left parent >
        < corresponding column list > < right parent > ]
```

Queries can be combined by set operators `UNION`, `INTERSECTION`, and
`EXCEPT` (set difference). The `ALL` keyword will allow duplicate rows
in the result set. The `CORRESPONDING BY` clause allows specifying which
columns will be used to determine the equality of rows from the left and
right operands.

``` programlisting
 select OrderID from Orders except
    corresponding by (OrderID) select OrderID from Order_Details
```

will produce the `OrderID` of orders that have no `Order_Details`. This
is equivalent to:

``` programlisting
select OrderID from Orders a 
    where not exists (select 1 from Order_Details b 
                      where a.OrderID = b.OrderID)
        
```

Note that the queries are executed quite differently, although to a
similar effect. There may be significant difference in performance.

</div>
