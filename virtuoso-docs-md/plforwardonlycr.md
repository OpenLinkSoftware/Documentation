<div id="plforwardonlycr" class="section">

<div class="titlepage">

<div>

<div>

### 11.18.5. FORWARD-ONLY (traditional cursor statement) Example

</div>

</div>

</div>

<div id="id36114" class="example">

**Example 11.12. Procedure using forward only cursor**

<div class="example-contents">

``` programlisting
create procedure TEST_FW()
{
  declare cr cursor for select KEY_ID from DB.DBA.SYS_KEYS;
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
TEST_FW();
```

</div>

</div>

  

</div>
