<div>

<div>

<div>

<div>

## 11.8. Execute Stored Procedures via SELECT statement

</div>

</div>

</div>

Stored SQL Procedures can be executed via SELECT statement:

``` programlisting
SELECT PROCEDURE_NAME (parameter , parameter...);
```

For ex.:

``` programlisting
create procedure mytest ( in ss varchar)
{
  return concat('My simple test with ', ss);
}
;

SQL> select mytest('Virtuoso');
callret
VARCHAR
_______________________________________________________________________________

My simple test with Virtuoso

1 Rows. -- 0 msec.
```

</div>
