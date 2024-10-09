<div>

<div>

<div>

<div>

## 13.2. Snapshot Replication

</div>

</div>

</div>

<div>

<div>

<div>

<div>

### 13.2.1. Non incremental snapshot replication

</div>

</div>

</div>

The Virtuoso Server periodically evaluates a query and inserts the
result into a table, replacing the content. The source and target can be
anywhere but typically will be on different databases of which at least
one is remote.

This makes a two party distributed transaction. Only one of the
transaction branches is writing, hence this goes with a one phase
commit.

<div>

|                              |                                                                   |
|:----------------------------:|:------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                             |
|                              | This can be used to replicate between two non-Virtuoso databases. |

</div>

The prerequisite of this mode of replication is that all tables exist.
The schema is never replicated.

</div>

</div>
