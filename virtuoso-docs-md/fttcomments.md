<div id="fttcomments" class="section">

<div class="titlepage">

<div>

<div>

### 20.3.2. Comments

</div>

</div>

</div>

<span class="emphasis">*Order*</span> - If the select statement
containing the contains predicate does not specify an exact match of the
primary key of the table having the contains predicate, then the
contains predicate will be the 'driving' condition, meaning that rows
come in ascending or descending order of the free text document ID.

The <span class="emphasis">*DESCENDING*</span> keyword specifies the
descending order of the free text index document ID and has nothing to
do with a possible ORDER BY of the enclosing statement. Even if there is
an ORDER BY in the enclosing statement the DESCENDING keyword of
contains has an effect in the interpretation of the STRT_ID and END_ID
contains options.

If there is a full equality match of the primary key of the table, this
will be the driving predicate and contains will only be used to check if
the text expression matches the single row identified by the full match
of the primary key.

The contains predicate may not appear outside of a select statement and
may only reference a column for which a free text index has been
declared. The first argument must be a column for which there is such an
index. The text expression may be variable and computed, although it
must be constant during the evaluation of the select statement
containing it.

The contains predicate must be a part of the top level AND of the WHERE
clause of the containing select. It may not for example be a term of an
OR predicate in the select but can be AND'ed with an OR expression.

</div>
