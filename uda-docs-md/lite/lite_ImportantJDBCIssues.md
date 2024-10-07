<div id="lite_ImportantJDBCIssues" class="section">

<div class="titlepage">

<div>

<div>

## 8.6. OpenLink JDBC Driver (Single-Tier Edition) Important Multi-User JDBC Solution Development & Utilization Issues

</div>

</div>

</div>

<div id="lite_ChangeSensitivity" class="section">

<div class="titlepage">

<div>

<div>

### 8.6.1. Sensitivity To Changes In Underlying Database

</div>

</div>

</div>

It is extremely important to application developers and end-users alike
to understand the degree to which the Result sets presented to them by a
JDBC solution are actually sensitive to underlying changes in the source
database. JDBC 1.1 not only fails to provide you with Bi-directional
Resultset Scrolling, it also presents what is basically a snapshot of
the data in your database at the time a JDBC query is executed. This has
the effect of increasing Multi-User JDBC solution development complexity
or limiting the functionality and usability of JDBC by end-users.

Sensitive to changes in underlying database takes many forms, this
includes: Static, KeySet, Dynamic, and Mixed modes of sensitivity.

**Static. ** - same as basic JDBC, records scrolling occurs over a
database snapshot and is insensitive to underlying change by other users

**KeySet. ** - JDBC resultset records scroll over a set of record
identifiers uniquely identifying records in the underlying database,
this type of scrolling is sensitive to changes is those records with
identifiers at the time of query execution. This form of scrolling is
insensitive to record record additions or deletions.

**Dynamic. ** - JDBC resultset records scroll over a set of record
identifiers uniquely identifying records in the underlying database,
these unique identifiers are recreated before each RowSet traversal
(collection of resultset records used as scrolling marker or sliding
window or Cursor), rather than once at query execution time. This type
of scrolling is sensitive to all changes in the underlying database but
may introduce a performance penalties depending on the size of RowSets
and available network bandwidth.

**Mixed. ** - JDBC resultset records scroll over a set of record
identifiers uniquely identifying records in the underlying database,
these unique identifiers are created to a limited size (known as the
KeySet Size) at query execution time, only when RowSet traversal goes
beyond the existing set of unique row identifiers is another collection
of unique identifiers assembled. This type of scrolling is sensitive to
all changes in the underlying database, but insensitive to Additions or
Deletions affecting records in the current RowSet scrolling across a
current KeySet, once KeySet boundaries are crossed Insertions or
Deletions are recognized. This mode of sensitivity provides increased
performance and the expense of reduced sensitivity.

</div>

<div id="lite_ConcurrencyControl" class="section">

<div class="titlepage">

<div>

<div>

### 8.6.2. Concurrency Control

</div>

</div>

</div>

In addition to being sensitive to changes in the underlying database,
Multi-User applications need to be able to protect users and application
processes from the effects of one another when the same record or
collection of records are being manipulated at the same time. The
process by which these issue are addressed is known as Concurrency
Control.

Concurrency control occurs in one of two ways, Optimistic or Pessimistic
control.

**Optimistic Concurrency Control. ** - presumes that probability and
frequency of multiple users and processes instigating changes to the
same database records is low. As result when an end-user or process
attempts to change records it first of all determines if the record
values at the point of change are still the same as what they were at
the time of retrieval. If they are unchanged at the point of change then
the change occurs otherwise the change process is rejected and then
re-attempted. Although this reduces concurrent user latency, it does
have the knock on effect of reducing data integrity if changes
rejections aren't managed carefully.

**Pessimistic Concurrency Control. ** - presumes that the probability
and frequency of multiple user processing and instigating changes to the
same records is high. As a result an end-user or process attempts to
changes records it first of all secures Exclusive Locks on the records
in question, performs the changes, and then releases the locks. Although
this increases and preserves data integrity it does introduce concurrent
use latency , which is perceived as performance degradation by the
end-user or application developer.

OpenLink's Scrollable ResultSet and RowSet extensions for JDBC all the
Multi-User JDBC solution issues raised in this section, our bundled and

``` programlisting
http://www.openlinksw.com/demo
```

live online demonstrations enable you to evaluate this for yourself and
ultimately make a knowledgeable JDBC Driver product and vendor
selection.

</div>

</div>
