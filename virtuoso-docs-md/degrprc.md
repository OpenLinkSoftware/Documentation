<div id="degrprc" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.37. How can I delete graphs using stored procedure?

</div>

</div>

</div>

The following script demonstrates the use of custom stored procedures
for deleting graph(s). It first creates a table
<span class="emphasis">*GRAPHS_TO_DELETE*</span> , into which the names
of the graphs to be deleted should be inserted, as follows:

``` programlisting
use MYUSR;

create procedure GRAPHS_TO_DELETE_SP (in gd_iris any)
{
  declare gd_iri iri_id;
  declare dp, row any;
  result_names (gd_iri);
  dp := dpipe (0, '__I2IDN');
  foreach (varchar iri in GD_IRIS) do
    {
      dpipe_input (dp, iri);
    }
  while (0 <> (row := dpipe_next (dp, 0)))
    {
      result (row[0]);
    }
}
;

drop view GRAPHS_TO_DELETE_VIEW;
create procedure view GRAPHS_TO_DELETE_VIEW as MYUSR.DBA.GRAPHS_TO_DELETE_SP (gd_iris) (gd_iri any);

create procedure DELETE_GRAPHS (in g_iris any)
{
  declare g_iids any;
  if (not isvector (g_iris) and g_iris is not null)
    signal ('22023', '.....', 'The input argument must be an array of strings or null');
  if (not length (g_iris))
    return 0;
  delete from DB.DBA.RDF_QUAD where G in (select * from GRAPHS_TO_DELETE_VIEW where gd_iris = g_iris) option (loop exists);
  return row_count ();
}
;
```

Finally call the procedure DELETE_GRAPHS to perform the deletion of the
specified graphs. Note it does not return a result set and can be called
as follows:

``` programlisting
SQL> select MYUSR.DBA.DELETE_GRAPHS (vector ('g1', 'g2', 'g3'));
```

This will return the number of triples removed from the specified
graphs.

Note: the procedure only applies to the cluster so to get IRI IDs via
partitioned pipe (DAQ). It is not usable on single.

</div>
