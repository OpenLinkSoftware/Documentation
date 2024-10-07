<div id="plkeysetcr" class="section">

<div class="titlepage">

<div>

<div>

### 11.18.7. KEYSET (traditional cursor statement) Example

</div>

</div>

</div>

<div id="id36124" class="example">

**Example 11.14. Procedure using keyset cursor**

<div class="example-contents">

``` programlisting
create procedure TEST_KEYSET ()
{
  declare cr keyset cursor for select KEY_ID from DB.DBA.SYS_KEYS;
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
TEST_KEYSET ();
```

</div>

</div>

  

</div>