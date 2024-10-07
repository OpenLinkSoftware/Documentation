<div id="rowlevelsectab" class="section">

<div class="titlepage">

<div>

<div>

### 23.6.3. Row Level Security Table

</div>

</div>

</div>

``` programlisting
create table SYS_RLS_POLICY (
  RLSP_TABLE varchar, - the FQN of the table
  RLSP_OP varchar, - the operation (one per row : I/U/D/S)
  RLSP_FUNC varchar, - the FQN of the stored procedure to be called
  PRIMARY KEY (RLSP_TABLE, RLSP_OP))
```

That system table is used for persisting the definitions

</div>
