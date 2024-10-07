<div id="sequenceobjects" class="section">

<div class="titlepage">

<div>

<div>

## 9.16. Sequence Objects

</div>

</div>

</div>

Virtuoso supports sequence objects. These can be used to generate
sequential numbers which can be used as unique identifiers. A sequence
object is guaranteed never to give the same number twice. Each sequence
has a name and a state. The state of a sequence is stored in the
database at checkpoint time. Between checkpoints sequence states are
logged so that a possible roll forward recovery will not lose
information.

The SQL functions `sequence_next` () and `sequence_set` () are used to
access and set the state of sequences. These take the name of the
sequence as argument. This is a server/wide unique string. There are no
restrictions on the length or character set of the sequence

Sequences do not have to be separately created. A sequence object will
automatically be generated when first referenced by `sequence_next` ()
or sequence_set.

``` programlisting
sequence_next (in name varchar) returns integer
```

``` programlisting
sequence_set (in name varchar, in state integer, in mode integer)
        returns integer
```

Function `sequence_next` () returns the current state of the specified
sequence and atomically increments it by one. The next call will thus
return a number one greater than the previous. The sequence is shared
between all connections and all transactions. Using a sequence never
involves locking.

Function `sequence_set` () sets and returns the state of a sequence
object. The next call to `sequence_next` () will return this same
number. If mode equals 0, the state is set regardless of the previous
state. If mode is non-zero, the state is set only if the new state is
greater then the previous state. Calling sequence_set ('sequence'' ,
0, 1) will always return the sequence's state without changing it.

Each autoincrement column corresponds to an internal sequence object.
The name of the sequence object is'DB.DBA.' plus the concatenation of
the table's qualifier, owner, table name and column name, e.g.
'DB.DBA.db.dba.my_table.ai_column'. The user does not normally need to
know about the sequence associated with an autoincrement column unless
he or she wishes to change the sequence values using the
`sequence_set()` function and the sequence objects name.

See the section on identity columns under create table and the function
identity_value and the related ODBC statement option SQL_GETLASTSERIAL
for more.

</div>
