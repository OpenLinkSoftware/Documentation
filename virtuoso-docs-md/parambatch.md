<div id="parambatch" class="section">

<div class="titlepage">

<div>

<div>

### 9.24.4. PARAM_BATCH

</div>

</div>

</div>

This sets the batch size used by the virtual database array parameter
optimization batch size. This causes several consecutive executes of the
same statement to be grouped as a single ODBC operation with array
parameters. This optimizes joins of tables on different servers and
searched updates, inserts and deletes on attached tables. Most ODBC
drivers do not support array parameters. A value of 1 or 0 disables the
optimization. This should be done if there is a driver which falsely
claims to support array parameters. If a given driver returns an error
when setting array parameters the VDB will detect this and will not try
to use them.

The effect of this setting is global and persists until the server is
restarted. The default value comes from the ArrayParameters
configuration parameter.

</div>
