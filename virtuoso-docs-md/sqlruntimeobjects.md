<div id="sqlruntimeobjects" class="section">

<div class="titlepage">

<div>

<div>

### 18.5.2. SQL Run Time Objects

</div>

</div>

</div>

The Virtuoso Server Extension API introduces the following data types:

<div class="variablelist">

<span class="term">box</span>  
This is a run-time-typed block of memory which represents any SQL data
type, e.g. number, string, array etc. Boxes have a type and length that
are retrievable at run time and can be allocated, freed and otherwise
manipulated by functions appropriate to each type of box. Boxes may form
trees through use of heterogeneous arrays but should not form graphs.

<span class="term">query_t</span>  
This is a compiled query, corresponding to a SQL statement or procedure
compilation. The *`query_t`* is made from a SQL string and can
thereafter be executed multiple times. This is a read-only object, not
affected by execution on any number of threads, analogously to machine
code not being affected by being executed.

<span class="term">query_instance_t</span>  
This is a structure representing a query execution state. These are
created when executing a *`query_t`* . This is analogous to a stack
frame of a C function. It holds all relevant query state, such as cursor
positions, intermediate results, column values etc. This is passed to
all VSEs so they can have access to environment information such as
current transaction, current client etc. The query instance references
the *`query_t`* . As a rule, the query instance is specific to a thread.
A query instance can be relatively long lived in the case of a cursor,
which may live across multiple client-server message exchanges.

<span class="term">state_slot_t</span>  
This is a part of *`query_t`* that specifies or describes a query time
variable, column, parameter, intermediate result etc. This is analogous
to an offset in a stack frame, it actually indexes a position inside a
query instance. Given the state slot and the instance, it is possible to
read or to set a value in the query state. Arguments of VSEs are passed
as an array of state. Slots combined with the running query instance
give the arguments values, and can be used to set output parameters.

<span class="term">local_cursor_t</span>  
When executing a select statement, the local cursor structure is
returned for accessing the result set rows. This is always a
forward-only cursor. This can be advanced, column values may be accessed
and the cursor may be closed.

</div>

</div>
