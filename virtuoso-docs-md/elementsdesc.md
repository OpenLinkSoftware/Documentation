<div id="elementsdesc" class="section">

<div class="titlepage">

<div>

<div>

### 15.5.2. Elements Description

</div>

</div>

</div>

The *`<sync>`* tag of the updategram signifies the beginning of an
operation(s) The rows specified in the *`<before>`* refer to existing
records in the database. The rows specified in the *`<after>`* block
refer to what the user wants in the database. *`<TABLENAME.../>`*
identifies target table.

The *`sql:at-identity`* attribute stores the last identity value added
by the system (if possible). This identity value can then be used in
subsequent operations.

The *`sql:id`* attribute is used to mark rows. This forces an
association between the record specified in the *`<before>`* and
*`<after>`* block in the update gram. When there are multiple instances
specified, it is recommended that *`sql:id`* attribute be used for all
the instances.

Each *`<TABLENAME.../>`* refers to a single table. Multiple
*`<TABLENAME.../>`* entries are allowed in the same *`<before>`* or
*`<after>`* tags, or in both *`<before>`* and *`<after>`* tags; however,
nesting is not allowed. The *`<before>`* and *`<after>`* tags are
optional. A missing tag is the same as having a tag with no content.

</div>
