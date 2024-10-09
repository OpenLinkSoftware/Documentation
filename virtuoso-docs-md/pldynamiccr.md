<div>

<div>

<div>

<div>

### 11.18.6. DYNAMIC (traditional cursor statement) Example

</div>

</div>

</div>

<div>

**Example 11.13. Procedure using dynamic cursor**

<div>

``` programlisting
create procedure TEST_DYNAMIC ()
{
  declare cr dynamic cursor for select KEY_ID from DB.DBA.SYS_KEYS;
  declare inx, data integer;
  inx := 0;

  whenever not found goto done;
  open cr;
  while (1)
    {
      fetch cr into data;
      inx := inx + 1;
    }
done:
  close cr;
  result_names (data);
  result (inx);
};
TEST_DYNAMIC ();
```

</div>

</div>

  

</div>
