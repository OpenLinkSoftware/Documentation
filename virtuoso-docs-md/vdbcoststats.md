<div>

<div>

<div>

<div>

### 9.28.5. VDB Statistics for the SQL Compiler Collection

</div>

</div>

</div>

In order to correctly estimate the cost of the VDB operations overhead
the optimized SQL compiler should have information for the time it takes
to make a "round trip" - send message and receive response from a given
remote database.

Virtuoso will automatically collect such information when you first
attach a table from the remote data source. The information will be
cached in the `DS_CONN_STR` field of the `SYS_DATA_SOURCE` system table.

Sometimes it may be desirable to update that values manually, for
example when you change the network connection etc. Virtuoso provides,
for the purpose, the stored procedure:

<a href="fn_vd_statistics.html" class="link" title="vd_statistics"><code
class="code">vd_statistics (in </code><em><code>_dsn</code></em><code
class="code"> varchar := '%',in </code><em><code>vd_table_mask</code></em><code
class="code"> varchar := '%')</code></a>

The *`_dsn`* parameter is a LIKE-mask for the name of the DSN as stored
in DS_DSN column of SYS_DATA_SOURCE system table. Its default value is
'%' having the effect to update the "round trip" times for all the
remote data sources.

The *`vd_table_mask`* parameter is a LIKE mask for the name of the table
, as stored in RT_NAME column of SYS_DATA_SOURCE system table. Its
default value of '%' means update all tables.

The current round trip time can be recalculated using the function:

<a href="fn_vdd_measure_rpc_time.html" class="link"
title="vdd_measure_rpc_time"><code
class="code">vdd_measure_rpc_time (in </code><em><code>_dsn</code></em><code
class="code"> varchar)</code></a>

This will return the estimated round-trip time in milliseconds. Calling
this function will not alter the cached statistics for the datasource.

Before collecting statistics data by querying the (potentially very
large) remote tables the Virtuoso VDB will try to collect the statistics
in various less resource extensive ways.

Generally speaking some of the statistics the SQL compiler needs in
order to do cost based optimization are available through one of the
following channels (in order of preference):

|                                                                                                                                                                        |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| by querying the remote DBMS statistics system tables: This will provide a varying amount of information depending on the remote and the mapping function.              |
| through SQLStatistics() ODBC call CARDINALITY column : A platform/remote independent way. This will provide information for the row count only.                        |
| by querying the remote table to collect various aggregate functions values (like COUNT (\*), AVG() etc) : most complete, but may be very slow for large remote tables. |

Unfortunately the first method is DBMS dependent. Therefore some extra
setup is to be done before this can return meaningful data. This is
supported off the shelf for Oracle and Virtuoso.

The <a href="fn_sys_stat_analyze.html" class="link"
title="sys_stat_analyze"><code
class="function">SYS_STAT_ANALYZE()</code></a> Virtuoso function will do
a lookup of the remote DBMS name and version (as returned by
SQL_DBMS_NAME and SQL_DBMS_VER SQLGetInfo () ODBC call) in the system
table DB.DBA.SYS_STAT_VDB_MAPPERS to find a Virtuoso/PL stored procedure
to call for that DBMS to retrieve the statistics data from the remote
DBMS'es system tables in DBMS dependent way.

The DB.DBA.SYS_STAT_VDB_MAPPERS has the following layout:

``` programlisting
create table SYS_STAT_VDB_MAPPERS (
   SVDM_TYPE varchar,
   SVDM_PROC varchar not null,
   SVDM_DBMS_NAME_MASK varchar not null,
   SVDM_DBMS_VER_MASK varchar not null,
   primary key (SVDM_TYPE, SVDM_DBMS_NAME_MASK, SVDM_DBMS_VER_MASK))
```

|                                                                                                                           |
|---------------------------------------------------------------------------------------------------------------------------|
| SVDM_TYPE is the type of the statistics returned by the procedure. Currently only 'SYS_COL_STAT' is supported.            |
| SVDM_PROC is the Fully-qualified-name of the Virtuoso/PL stored procedure to be called.                                   |
| SVDM_DBMS_NAME_MASK is the LIKE kind of mask used to check the SQL_DBMS_NAME SQLGetInfo() returned string (in uppercase). |
| SQL_DBMS_VER_MASK is the LIKE kind of mask use to check the SQL_DBMS_VER SQLGetInfo() returned string (in uppercase)      |

The <a href="fn_sys_stat_analyze.html" class="link"
title="sys_stat_analyze"><code
class="function">SYS_STAT_ANALYZE()</code></a> will use the first
matching row in the order of the primary key.

The procedure that collects the remote DBMS statistics (usually by doing
rexecute() against the remote) has the following signature:

``` programlisting
create procedure DB.DBA.__VIRTUOSO_SYS_COL_STAT (
    in DSN varchar,
    in RT_NAME varchar,
    in RT_REMOTE_NAME varchar
)
```

Here:

|                                                                                                                              |
|------------------------------------------------------------------------------------------------------------------------------|
| DSN is the Virtuoso dsn name.                                                                                                |
| RT_NAME is the local Virtuoso table name of the attached table (as in the RT_NAME of SYS_REMOTE_TABLE system table).         |
| RT_REMOTE_NAME is the name of the attached table in the remote DBMS (as in RT_REMOTE_NAME of SYS_REMOTE_TABLE system table). |

The procedure may return a resultset that will be written into the
SYS_COL_STAT system table. The resultset has to have a row for each
attached table column and the following layout:

|                                                                       |
|-----------------------------------------------------------------------|
| CS_COL - this is the column name                                      |
| CS_N_DISTINCT - the number of distinct non-null values in that column |
| CS_MIN - minimum value                                                |
| CS_MAX - maximum value                                                |
| CS_AVG_LEN - average data length                                      |
| CS_N_VALUES - number of non-null values                               |
| CS_N_ROWS - total number of rows                                      |

Virtuoso predefines two such procedures - one for another virtuoso as a
remote and the second for an Oracle DBMS. Other DBMSes can be freely
added.

``` programlisting
create procedure DB.DBA.__ORACLE_SYS_COL_STAT (in DSN varchar, in RT_NAME
varchar, in RT_REMOTE_NAME varchar)
returns ANY
{
  declare _meta, _res any;

  rexecute (DSN,
    'select c.COLUMN_NAME, c.NUM_DISTINCT, NULL, NULL, c.AVG_COL_LEN, t.NUM_ROWS - c.NUM_NULLS, t.NUM_ROWS ' ||
    ' from ALL_TABLES t, ALL_TAB_COLUMNS c where t.TABLE_NAME = c.TABLE_NAME and t.OWNER = c.OWNER and ' ||
    '  t.OWNER = ? and t.TABLE_NAME = ?',
    NULL, NULL, vector (name_part (RT_REMOTE_NAME, 1, NULL), name_part(RT_REMOTE_NAME, 2, NULL)), NULL, _meta, _res);

  if (isarray (_res) and length (_res) > 0 and isarray (_res[0]) and isarray(_meta) and isarray (_meta[0]))
    {
      declare _inx, _len integer;
      _inx := 0;
      _len := length (_res);
      exec_result_names (_meta[0]);
      while (_inx < _len)
        {
          exec_result (_res[_inx]);
          _inx := _inx + 1;
        }
    }
  return NULL;
};
```

``` programlisting
create procedure DB.DBA.__VIRTUOSO_SYS_COL_STAT (in DSN varchar, in RT_NAME
varchar, in RT_REMOTE_NAME varchar)
returns ANY
{
  declare _meta, _res any;

  rexecute (DSN,
    'select CS_COL, CS_N_DISTINCT, encode_base64 (serialize (CS_MIN)), encode_base64 (serialize (CS_MAX)), ' ||
    ' CS_AVG_LEN, CS_N_VALUES, CS_N_ROWS from ALL_COL_STAT where CS_TABLE = complete_table_name (?, 1)',
    NULL, NULL, vector (RT_REMOTE_NAME), NULL, _meta, _res);

  if (isarray (_res) and length (_res) > 0 and isarray (_res[0]) and isarray(_meta) and isarray (_meta[0]))
    {
      declare _inx, _len integer;
      _inx := 0;
      _len := length (_res);
      exec_result_names (_meta[0]);
      while (_inx < _len)
        {
          declare _res_row any;
          _res_row := _res[_inx];
          _res_row[2] := deserialize (decode_base64 (_res_row[2]));
          _res_row[3] := deserialize (decode_base64 (_res_row[3]));
          exec_result (_res_row);
          _inx := _inx + 1;
        }
    }
  return NULL;
};
```

And here are the respective registration INSERT statements for the above
procedures:

``` programlisting
insert soft SYS_STAT_VDB_MAPPERS (SVDM_TYPE, SVDM_PROC, SVDM_DBMS_NAME_MASK, SVDM_DBMS_VER_MASK)
 values ('SYS_COL_STAT', 'DB.DBA.__ORACLE_SYS_COL_STAT', '%ORACLE%', '%');

insert soft SYS_STAT_VDB_MAPPERS (SVDM_TYPE, SVDM_PROC, SVDM_DBMS_NAME_MASK, SVDM_DBMS_VER_MASK)
 values ('SYS_COL_STAT', 'DB.DBA.__VIRTUOSO_SYS_COL_STAT', '%VIRTUOSO%', '%');
```

In order to facilitate the access to statistics in Virtuoso the
following four views are created with SELECT granted to PUBLIC:

|                                                                                                                        |
|------------------------------------------------------------------------------------------------------------------------|
| ALL_COL_STAT - subset of SYS_COL_STAT (same row layout) but only returning data for the tables the user has access to. |
| USER_COL_STAT - subset of SYS_COL_STAT (same row layout) but returns rows only for the user-owned tables               |
| ALL_COL_HIST - subset of SYS_COL_HIST (same row layout) but only returning data for the tables the user has access to. |
| USER_COL_HIST - subset of SYS_COL_HIST (same row layout) but returns rows only for the user-owned tables               |

</div>
