<div id="joinexamples" class="section">

<div class="titlepage">

<div>

<div>

### 9.19.4. Join examples

</div>

</div>

</div>

The following three statements produce an identical result.

``` programlisting
select Orders.OrderID, ProductID
    from Orders natural join Order_Details using (OrderID)
select Orders.OrderID, ProductID
    from Orders join Order_Details on Orders.OrderID = Order_Details.OrderID
select Orders.OrderID, ProductID
    from Orders,  Order_Details where Orders.OrderID = Order_Details.OrderID
```

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                                                                                                                                                                   |
|:----------------------------:|:------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                             |
|                              | In all these cases if there exists no Order_Details row matching the Orders row there will no no result row corresponding to the Orders row. An outer join can can be used to also retrieve left table records for which there is no matching right table record. |

</div>

``` programlisting
select Orders.OrderID, ProductID
    from Orders natural left outer join Order_Details using (OrderID)
```

will produce a result identical to the above sample if for each Orders
row there is at least one Order_Details row. If there is none however,
the OrderID column from Orders will appear together with a NULL
ProductID from the non-existent Order_Details.

A right outer join is like a left outer join with the left and right
tables reversed.

</div>
