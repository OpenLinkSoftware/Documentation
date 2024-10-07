<div id="sqlrefgeospatialdgi" class="section">

<div class="titlepage">

<div>

<div>

### 9.34.6. Defining a Geometry Index

</div>

</div>

</div>

The below sequence defines a table called geo and a geometry index on
its geo column.

``` programlisting
create table GEO (ID bigint, GEO any, primary key (ID))
 alter index geo on geo partition (id int);

CREATE TABLE GEO_INX ( X real no compress,
                       Y real no compress,
                       X2 real no compress,
                       Y2 real no compress,
                       id bigint no compress,
                       primary key (X, Y, X2, Y2, id))
                       ALTER INDEX geo_inx ON geo_inx PARTITION (id int);

INSERT INTO sys_vt_index ( vi_table,
                           vi_index,
                           vi_col,
                           vi_id_col,
                           vi_index_table,
                           vi_id_is_pk,
                           vi_options)
  VALUES ('DB.DBA.GEO',
          'GEO',
          'GEO',
          'ID',
          'DB.DBA.GEO_INX',
          1,
          'G');

-- Reload the changed schema
__ddl_changed ('DB.DBA.GEO');
```

A geometry index is a table of always five columns, the first 4 are the
lower x, y and higher x, y of the object's bounding box, id is the
identifier of the object, a foreign key into the table holding the
geometries. In a cluster setting the geometry index must be partitioned
on the id column. The columns of a geometry index must never be
compressed, hence the mandatory no compress declaration.

Geometry indices are declared in the sys_vt_index table, which also
declares text indices. The G in the options column declares that this is
a geometry index.

A geometry index will be used when appropriate. The table holding the R
tree with the bounding boxes should not normally be accessed directly.
Explicit selects from a geometry index table with conditions on the
columns will not generally work since the collation is not linear as in
a regular index. Inserts by means other than geo_insert are not allowed.

</div>
