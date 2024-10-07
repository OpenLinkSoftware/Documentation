<div id="sqlsecandparsetrees" class="section">

<div class="titlepage">

<div>

<div>

### 12.7.2. SQL Security and Parse Trees

</div>

</div>

</div>

When compiling table access the access rights granted on the table are
checked against the user and group marked on the table reference
(TABLE_DOTTED) parse tree node. When a user writes a table reference the
user id and group of the user are marked in the parse tree and these are
compared against the grants in effect.

When a table reference comes from a view the reference is annotated with
the view owner's user id and group. Hence a view may introduce
references that would not otherwise be granted to a user.

This is used in the need to know example, marking the group and user of
the reference to NEED_TO_KNOW to be 0, meaning dba.

There are no other security related features in the parse tree.
Procedure security is resolved exclusively at run time.

</div>
