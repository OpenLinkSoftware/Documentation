<div id="plscrollexamples" class="section">

<div class="titlepage">

<div>

<div>

### 11.18.4. Virtuoso/PL Scrollable Cursor Examples

</div>

</div>

</div>

<div id="id36109" class="example">

**Example 11.11. Procedure using scrollable cursor to read the keys in
batches of 20**

<div class="example-contents">

``` programlisting
create procedure READ_KEYS_NEXT_20 (in mask varchar, inout bm any) returns integer
{
  --- This procedure reads the next 20 table names based on a bookmark value.
  declare cr static cursor for
      select distinct KEY_TABLE
        from DB.DBA.SYS_KEYS
    where
      KEY_IS_MAIN = 1 and
      KEY_MIGRATE_TO is NULL and
      KEY_TABLE like mask;
  declare table_name varchar;
  declare inx integer;

  inx := 1;

  -- no 'Row Deleted' (HY109) handling as the static cursors doesn't show the deleted rows.
  whenever not found goto done;
  open cr;

  -- positions on the bookmark or on the first if it is null
  -- and fetches the value into table_name
  if (bm is not null)
    {
      fetch cr bookmark bm into table_name;
      -- note that the value from fetch bookmark is omitted
      fetch cr next into table_name;
    }
  else
    fetch cr first into table_name;

  -- fetches the next 20 rows (or less)
  while (inx < 20)
    {
      result (table_name);
      inx := inx + 1;
      fetch cr next into table_name;
    }

  -- 20 rows were fetched - get the bookmark of the last row fetched
  bm := bookmark (cr);
  close cr;
  return;

done:

  -- no more rows - set the bookmark to NULL
  close cr;
  bm := NULL;
};

create procedure READ_KEYS (in mask varchar)
{
  -- the main function (mask is a mask to be applied over the select

  declare table_name varchar;
  declare bm any;

  -- it'll return a resultset with a single column
  result_names (table_name);

  -- sets the bookmark to empty
  bm := NULL;

  while (1)
    {
       READ_KEYS_NEXT_20 (mask, bm);

       -- that's the flag for no more rows
       if (bm is NULL)
         return;
    }
};

READ_KEYS ('%');
```

</div>

</div>

  

</div>
