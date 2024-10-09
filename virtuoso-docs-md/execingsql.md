<div>

<div>

<div>

<div>

### 18.5.9. Executing SQL

</div>

</div>

</div>

``` programlisting
query_t * sql_compile (char *string2, client_connection_t * cli,
                caddr_t * err, int store_procs);
void qr_free (query_t * qr);

client_connection_t * qi_client (caddr_t * qi);
```

These functions allow executing SQL from VSEs. First the SQL statement
needs to be compiled with sql_compile. The statement may take value
parameters and may be a DDL or DML statement, including select, update,
procedure call, table creation etc.

The query_t returned can be used multiple times on any number of
simultaneous threads. if an application repeatedly performs the same
queries the text can be compiled once and reused at infinitum.

qr_free will free a query returned by sql_compile.

<div>

**Example 18.3. Example**

<div>

``` programlisting
{
  caddr_t err = NULL;
  query_t * qr  = sql_compile ("select * from SYS_USERS", qi_client (qst), &err, 0);
  ...
  if (err)
  exit (-1);
  qr_free (qr);
}
```

</div>

</div>

  

``` programlisting
caddr_t qr_rec_exec (query_t * qr, client_connection_t * cli,
    local_cursor_t ** lc_ret, query_instance_t * caller, stmt_options_t * opts,
    long n_pars, ...);
```

Once a query is compiled it can be executed and fetched. This function
executes a query in the context of a VSE. The execution is on behalf of
the same user and in the same transaction as the VSE. This is only
possible in the context of a VSE, not at top level in the main program,
for example.

The first argument is the compiled query to execute. The second is the
client connection, obtained by qi_client from the qst argument of the
VSE. The lc_ret, if non NULL will get a be set to a newly allocated
local_cursor_t \* that allows fetching rows from the result set. This
only applies to a select statement. The caller is the qst argument of
the VSE, The opts can be NULL. The n_args is the count of query
parameters, 0 if no parameters are passed.

The return value is an error, suitable for sqlr_resignal. A NULL value
means success.

It should be double-checked if the query access or potentially may
access any tables or indexes. If it may do this, the VSE must be
described as deadlock-unsafe by calling bif_set_uses_index() after
bif_define() or bif_define_typed(). If qr_rec_exec access any tables or
views, and the call of VSE from Virtuoso/PL code is compiled as
deadlock-safe, the whole server may be halted.

If parameters are passed, a group of 3 actual parameters follows for
each ? in the query being executed. In each such group the first is the
name of the parameter, of the form ":n", where n is the position of the
parameter, starting at 0, so ":0" corresponds to the 1st ? and ":11" to
the 12th. The second in the group of 3 is the value, usually a box
pointer. The third is the type, one of QRP_INT, QRP_STRING or QRP_RAW.

QRP_INT means that the value will be converted to a box as by box_num.
QRP_STRING means that the value will be converted to a string as by
box_dv_short_string. In either case the value is allocated and freed as
part of the execution. QRP_RAW means that an arbitrary box is passed as
is. If so, this box will be freed in the process and MUST NOT BE
REFERENCED AGAIN in the VSE. if the statement is a select, lc_ret should
be specified and should be the address of a local_cursor_t \* variable,
where the cursor can be returned.

``` programlisting
long lc_next (local_cursor_t * lc);
caddr_t lc_nth_col (local_cursor_t * lc, int n);
void lc_free (local_cursor_t * lc);
```

These functions allow reading through a result set. The local_cursor_t
\* must have come from qr_rec_exec.

lc_next will move the cursor one row forward. The first call after the
exec places the cursor on the first row. A 0 return value indicates that
the cursor is at end. if 0 is returned at the first call, the result set
had zero rows. The data member lc_error may be set and should be checked
after calls to this function. See examples. The value will be suitable
for sqlr_resignal if copied (box_copy_tree).

The lc_nth_col returns the value of the nth column of the current row.
The index is 0 based. The value is an arbitrary box pointer and is READ
ONLY, to be copied (box_copy_tree) if the application needs to keep it
around. The value will stay readable until the next lc_next or lc_free.
Use DV_TYPE_OF et al to determine the type of the value.

lc_free frees the cursor and any resources associated to it. This has no
effect on the transaction.

The bif_my_select function returns an array with one element for each
row of the SYS_KEYS table. The rows are themselves arrays containing the
column values.

</div>
