<div id="determiningactions" class="section">

<div class="titlepage">

<div>

<div>

### 15.5.3. Determining Actions

</div>

</div>

</div>

If only the *`<after>`* block is specified, the rows specified in the
*`<after>`* block are inserted in the table(s). If both the *`<before>`*
and *`<after>`* blocks are specified, then rows specified in the
*`<after>`* block for which there are no corresponding rows in the
*`<before>`* block are inserted in the table(s).

In an update operation, the rows specified in the *`<before>`* block
refer to existing rows in the database. The corresponding rows in the
*`<after>`* block reflect what the user wants in the database. A row
update operation is performed if there is a row in both the *`<before>`*
and *`<after>`* sections with the same set of values for the attributes
that uniquely identify a row in a table. Rows specified in the
*`<before>`* block must be valid in the database for the updategram to
successfully update the rows.

In a delete operation, if only the *`<before>`* block is specified in
the update gram, the rows specified in the *`<before>`* block are
deleted from the table(s). If both the *`<before>`* and *`<after>`*
blocks are specified, the rows for which there are no corresponding rows
in the *`<after>`* block are deleted from the table(s).

</div>
