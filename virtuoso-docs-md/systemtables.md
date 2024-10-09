<div>

<div>

<div>

<div>

## 23.6. Virtuoso System Tables

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 23.6.1. Core System Tables

</div>

</div>

</div>

``` programlisting
    create table SYS_COLS (
        TABLE           varchar,
        COLUMN          varchar,
        COL_ID          integer,
        COL_DTP         integer,
        primary key (COL_ID))

    create index SYS_COLS_BY_NAME on SYS_COLS (TABLE, COLUMN)

    create table SYS_KEYS (
        KEY_TABLE       varchar,
        KEY_NAME        varchar,
        KEY_ID          integer,
        KEY_N_SIGNIFICANT   integer,
        KEY_CLUSTER_ON_ID   integer,
        KEY_IS_MAIN     integer,
        KEY_IS_OBJECT_ID    integer,
        KEY_IS_UNIQUE       integer,
        KEY_MIGRATE_TO      integer,
        primary key (KEY_TABLE, KEY_NAME))

    create index SYS_KEYS_BY_ID on SYS_KEYS (KEY_ID)

    create table SYS_KEY_PARTS (
        KP_KEY_ID       integer,
        KP_NTH          integer,
        KP_COL          integer
        primary key (KP_KEY_ID, KP_NTH))

    create table SYS_KEY_SUBKEY (
        SUPER           integer,
        SUB         integer,
        primary key (SUPER, SUB))
```

The SYS_COLS table defines all tables and columns. Each column appears
once in this table. No entries are made for inherited columns. The
SYS_KEYS table defines all indices. A row in this table corresponds to
each key in the database, either originally defined or inherited.

KEY_IS_MAIN is non-zero if this is the primary key of its table. The
KEY_MIGRATE_TO is the key ID of a new version of this key if this key is
obsolete (e.g. the primary key of a table from before an ALTER TABLE).
The KEY_N_SIGNIFICANT indicates how many leading key parts are used in
ordering keys.

The KEY_ID references the KP_KEY_ID in the SYS_KEY_PARTS table. This
table embodies the actual layout of keys and rows. The KP_NTH is a
number positioning the KP_COL to the appropriate place in the row. The
KP_COL references the COL_ID in SYS_COLS. The KP_NTH is not necessarily
a series of consecutive integers but the order matches the order of
columns on the row.

The SYS_KEY_SUBKEY table has a row for each pair of keys where one is
the immediate subkey of the other. Note that when a table is altered,
the obsolete layout is marked as a subtable of the new layout of the
primary key. Thus a select on the new primary key will also get the
obsolete rows.

The following SQL procedure exemplifies how the SYS_COLS, SYS_KEYS and
SYS_KEY_PARTS tables combine. Given a table name it produces the set of
columns and the set of indices and their parts.

``` programlisting
    create procedure dt (in tn varchar)
    {
        declare index_name, col, dtp varchar;
        declare t, nth integer;

        dtp := '-';

        result_names (col, t);    --- first result set

        declare cr cursor for select COLUMN, COL_DTP
          from SYS_COLS where TABLE = tn;

        whenever not found goto done;
        open cr;
        while (1=1) {
            fetch cr into col, t;
            result (col, t);
        }
    done:
        result_names (index_name, nth, col);     -- 2nd result set
        end_result ();

        declare icr cursor for select KEY_NAME, KP_NTH, COLUMN
          from SYS_KEYS, SYS_KEY_PARTS, SYS_COLS
          where KEY_TABLE = tn and KP_KEY_ID = KEY_ID
          and KP_NTH < KEY_N_SIGNIFICANT and  COL_ID = KP_COL;

        whenever not found goto k_done;
        open icr;
        while (1=1) {
            fetch icr into index_name, nth, col;
            result (index_name, nth, col);
        }
    k_done:
        return 0;
    }
```

</div>

</div>
