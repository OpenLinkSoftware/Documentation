<div id="tablesandinternals" class="section">

<div class="titlepage">

<div>

<div>

## 20.5. Generated Tables and Internals

</div>

</div>

</div>

<div id="gentabsaprocs" class="section">

<div class="titlepage">

<div>

<div>

### 20.5.1. Generated Tables and Procedures

</div>

</div>

</div>

vt_create_text_index makes a separate table for storing the text index
information and separate procedures and triggers for maintaining this
data. These are automatically dropped if the original table is dropped.

The updates to the indexed column are recorded in a separate update
tracking table. This table, named
VTLOG\_\<qualifier\>\_\<owner\>\_\<table\> contains a row for each row
in the indexed table that has been changed since the text index was last
updated.

The text index is stored in a table named \<table\>\_\<column\>\_WORDS.
The generated tables are made under the qualifier that is current at the
time of their creation. The owner is the creating user.

</div>

</div>
