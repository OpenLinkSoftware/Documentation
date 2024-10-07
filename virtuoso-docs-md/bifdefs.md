<div id="bifdefs" class="section">

<div class="titlepage">

<div>

<div>

### 18.5.7. VSEI Definition

</div>

</div>

</div>

``` programlisting
typedef caddr_t (*bif_t) (caddr_t *qst, caddr_t *error_return, state_slot_t ** arguments);
void bif_define (char *name, bif_t bif);
void bif_define_typed (char * name, bif_t bif, bif_type_t *bt);
```

These functions associate a function pointer to a VSE name. The typed
variant allows associating a value type used when inferring SQL
meta-data if the result is returned to a client. The type can be one of
the following externs:

|                                     |
|-------------------------------------|
| extern *`bif_type_t`* bt_varchar;   |
| extern *`bif_type_t`* bt_any;       |
| extern *`bif_type_t`* bt_integer;   |
| extern *`bif_type_t`* bt_double;    |
| extern *`bif_type_t`* bt_float;     |
| extern *`bif_type_t`* bt_numeric;   |
| extern *`bif_type_t`* bt_convert;   |
| extern *`bif_type_t`* bt_timestamp; |
| extern *`bif_type_t`* bt_time;      |
| extern *`bif_type_t`* bt_date;      |
| extern *`bif_type_t`* bt_datetime;  |
| extern *`bif_type_t`* bt_bin;       |

If a VSE accesses indexes either by its own internal code or by
executing Virtuoso/PL statements, there becomes a potential for
deadlocks. To prevent deadlocks, the Virtuoso/PL compiler must be
informed of potential index usage inside the VSE. Special deadlock-safe
code can be created for its needs. The `bif_set_uses_index()` function
should be used after `bif_define()` or `bif_define_typed()` in such
cases.

The potential for deadlocking is always present if the VSE executes
Virtuoso/PL code or uses XPath/XSLT functions. Other functions of
Virtuoso's C interface are deadlock-safe since they perform no database
access.

</div>
