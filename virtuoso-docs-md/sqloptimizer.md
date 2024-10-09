<div>

<div>

<div>

<div>

## 9.28. Virtuoso SQL Optimization

</div>

</div>

</div>

Virtuoso provides a cost based SQL optimizer which performs the
following types of query transformation:

|                                                                    |
|--------------------------------------------------------------------|
| Join Order                                                         |
| Loop Invariants                                                    |
| Opening derived tables                                             |
| Migrating enclosing predicates into derived tables or unions       |
| Dropping unreferenced columns or results                           |
| Detection of identically false predicates                          |
| Index selection                                                    |
| Grouping of co-located remote tables into single remote statements |
| Selection of join algorithm                                        |

Virtuoso evaluates various permutations of joined tables against its
cost model and determines the best fit, from which it generates a query
graph. This query graph can be returned as a result set by the
<a href="fn_explain.html" class="link" title="explain"><code
class="function">explain()</code></a> SQL function. The cost model is
based on table row counts, defined indices and uniqueness constraints,
and column cardinalities, i.e. counts of distinct values in columns.
Additionally, histograms can be made for value distribution of
individual columns.

Virtuoso automatically maintains statistics about tables in the local
database. When tables are attached from known types of remote DBMS's,
Virtuoso also attempts to retrieve statistics information if available.
The sys_stat_analyze or sys_db_stat stored procedures can be used to
force an update of statistics, also recompiling all SQL statements or
procedures depending on these statistics. Once this is done, this
overrides the automatic statistics. The values of automatic statistics
can be seen in the SYS_COL_AUTO_STAT table.

The stored procedure:

<a href="fn_sys_stat_analyze.html" class="link"
title="sys_stat_analyze"><code
class="code">DB.DBA.SYS_STAT_ANALYZE (in full_table_name varchar, in prec integer, ) </code></a>

constructs the basic table statistics and feeds it into the
DB.DBA.SYS_COL_STAT system table. The
<a href="fn_sys_db_stat.html" class="link"
title="SYS_DB_STAT">DB.DBA.SYS_DB_STAT</a> stored procedure performs
this operation on the entire database.

The stored procedure:

<a href="fn_sys_stat_histogram.html" class="link"
title="sys_stat_histogram"><code
class="code">DB.DBA.SYS_STAT_HISTOGRAM (in full_table_name varchar, in full_column_name varchar, in n_buckets integer, in prec integer, ) </code></a>

constructs table column histogram and feeds it into the
DB.DBA.SYS_COL_HIST system table. The default value of prec, in both
cases, is 5, which implies that a five percent sample of the table will
be used. A percentage of 0 means that the whole table will be read.

<div>

**Example 9.43. Demonstration of the STAT_ANALYSE & STAT_HISTOGRAM
Procedures**

<div>

The following script is intended for use with the ISQL program as the
user dba, in the DB qualifier. The foreach statement is a special
feature of the ISQL utility.

``` programlisting
create table "DB"."DBA"."DTTEST" ("ID" integer primary key);
foreach integer between 1 10 insert into "DB"."DBA"."DTTEST" ("ID") values (?);
sys_stat_analyze ('DB.DBA.DTTEST');
select * from DB.DBA.SYS_COL_STAT;
sys_stat_histogram ('DB.DBA.DTTEST', 'ID', 2);
select * from DB.DBA.SYS_COL_HIST;
```

That yields:

``` screen
Resultset 1 (from DB.DBA.SYS_COL_STAT)
----------------------------------------
CS_TABLE         CS_COL           CS_N_DISTINCT CS_MIN  CS_MAX  CS_N_VALUES CS_N_ROWS
VARCHAR NOT NULL VARCHAR NOT NULL INTEGER       VARCHAR VARCHAR INTEGER     INTEGER
_______________________________________________________________________________

DB.DBA.DTTEST    ID               10            1       10      10          10

Resultset 2 (from DB.DBA.SYS_COL_HIST)
---------------------------------------
CH_TABLE          CH_COL            CH_NTH_SAMPLE     CH_VALUE
VARCHAR NOT NULL  VARCHAR NOT NULL  INTEGER NOT NULL  VARCHAR
_______________________________________________________________________________

DB.DBA.DTTEST     id                0                 1
DB.DBA.DTTEST     id                5                 6
DB.DBA.DTTEST     id                10                0
```

</div>

</div>

  

<div>

<div>

<div>

<div>

### 9.28.1. Optimization Techniques

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### Join Order

</div>

</div>

</div>

The SQL compiler constructs permutations of tables in the FROM clause of
a query. The qualified inner join (x inner join y on p syntax) does not
dictate a join order but the outer join syntax does. Otherwise join
order is subject to change by the compiler's decision. This can be
disabled with the OPTION (ORDER) global query option, see sections
below.

The first order tried by the optimizer is the initial left to right
order of the FROM clause. The compiler remembers its best result so far
attained in trying various compilations, so it will not explore branches
of the table permutation tree which, while incomplete, exceed the cost
of the best complete result so far. Thus a good guess of initial table
order by the programmer may save compilation time.

</div>

<div>

<div>

<div>

<div>

#### Loop Invariants

</div>

</div>

</div>

The compiler will evaluate all expressions and predicates as early as
possible.

Consider the query:

``` programlisting
select count (*) from item where i_price > (select avg (i_price) from item);
```

The compiler will detect that the sub query is data-independent from the
main from and thus will compute the average price before starting the
select for the count. Thus the above query executes in time linear to
the item table count instead of quadratic time, as it would without the
removal of the invariant.

</div>

<div>

<div>

<div>

<div>

#### Opening Derived Tables & Views

</div>

</div>

</div>

Views are initially opened into equivalent derived tables. If a derived
table in a FROM clause is sufficiently simple, i.e. has no distinct,
top, group by, and is not a multiple query expression such as a union,
it can be in-lined.

<div>

**Example 9.44. Derived Tables & Views**

<div>

``` programlisting
create view i as select * from item;

select i_id from i;
```

becomes

``` programlisting
select i_id from (select * from item) xx;
```

which becomes

``` programlisting
select i_id from item;
```

In joins involving views representing joins, the in-lining of a derived
table will add degrees of freedom to join order selection, since the
tables joined in the view will not have to be laid out contiguously.

</div>

</div>

  

</div>

<div>

<div>

<div>

<div>

#### Migrating Enclosing Predicates

</div>

</div>

</div>

When there is a derived table or view expansion which cannot be
in-lined, i.e. it has a group by or is a union or such, predicates of
the enclosing WHERE phrase are migrated into the derived table itself.
The set of predicates that may be thus migrated will be a function of
the join order, thus different combinations will be tried.

<div>

**Example 9.45. Example of Migrating Predicates**

<div>

``` programlisting
select i_id from (select * from item1 union all select * from item2) f where i_id = 11;
```

becomes

``` programlisting
select i_id from (select i_id from item1
  where i_id = 11 union all select i_id from item2 where i_id = 11) f;
```

</div>

</div>

  

</div>

<div>

<div>

<div>

<div>

#### Dropping Unreferenced Columns or Results

</div>

</div>

</div>

It may happen as a result of view expansion that columns get introduced
into derived table selection which are nowhere referenced in the actual
query. The compiler will detect this and will not compile code accessing
these. (see above for example)

</div>

<div>

<div>

<div>

<div>

#### Detection of Identically False Predicates

</div>

</div>

</div>

It is possible that view expansions introduce predicates that are never
simultaneously true with predicates of the enclosing query. This is
recognized and can result in an empty query being produced or in union
terms being dropped.

The rules for combining predicates are as follows:

``` programlisting
- a < b and a < c -> a < min (a, b)
```

And similarly for \<=, \>, and \>=.

``` programlisting
a in (constant1) and a in (constant2)
```

becomes identically false if the intersection of the constant lists is
empty.

``` programlisting
- a = b and a = c
```

becomes identically false if b and c are different constants.

This can lead to transformations such as

``` programlisting
select * from (select * from item where i_type = 2 union all
  select * from item where i_type = 3) xx where i_type = 2;
```

becomes

``` programlisting
select * from (select * from item where i_type = 2 ) xx where i_type = 2;
```

</div>

<div>

<div>

<div>

<div>

#### Index Selection

</div>

</div>

</div>

Once a join order is hypothesized, the compiler picks various indices to
use for accessing tables. The predicates applicable to the table in the
specific join order being considered, as well as a possible ORDER BY
clause affect the index choice. If there is an ORDER BY and there is an
index which can be used to directly satisfy this, the compiler tries
this index as well as the index which seems best in the light of the
available predicates. Thus having an applicable ORDER BY does not always
imply index selection. If there is a restrictive index for row selection
and an order by which could be done by following an index for which
there are no predicates, the restrictive index plus sorting will be
preferred.

The general rules for index selection based on predicates are:

|                                                           |
|-----------------------------------------------------------|
| Primary key is preferred if 2 equally good choices exist. |
| Equality conditions are preferred over all others.        |
| Uniqueness of an index is a plus.                         |

</div>

<div>

<div>

<div>

<div>

#### Grouping Co-Located Tables

</div>

</div>

</div>

In queries involving distributed data the principal cost factor is often
the RPC latency between the participating databases. In a local area
network environment with no other load we estimate one RPC to be about 5
times longer than the selection of a single row on primary key from a
table of 1 million, not counting disk I/O. In wide area contexts and
with effective load the difference is still more marked. Thus when
considering a loop join between a local and a remote table, it becomes
obvious that the remote table should be the outer loop, unless there are
extremely restrictive criteria on the local table. The cost model takes
such considerations into account.

The best case of remote statement compilation is when the statement can
be passed through as is to the remote. This is first checked for the
whole query and subsequently for each sub query or derived table. The
pass-through is not possible if:

|                                                                                                     |
|-----------------------------------------------------------------------------------------------------|
| The expression involves tables from multiple remotes or local and remote ones.                      |
| The expression involves predicates or functions or SQL constructs which do not exist on the remote. |

Even if a derived table or sub query can be passed through the normal
SQL optimization applies, thus Virtuoso will import predicates and
suggest a join order for these cases, so that the query gets rewritten
with the suggested join order left to right in the text.

If one join has multiple tables from the same remote but also other
tables, the optimizer will attempt to group the co-located tables
together.

``` programlisting
select * from r1 join t1 on r1.k = t1.k join r2 on r1.k = r2.k;
```

will preferentially be compiled as

``` programlisting
select * from (select r1.k as r1_k, ... from r1, r2
  where r1.k = r2.k) xx, t1 where r1_k = t1.k;
```

Note that above the join order is meant left to right and that the
derived table of r1, r2 is passed through as a unit. This becomes the
leading loop in the join because fewer RPC's are likely to be needed
then due to row prefetch. As for placing function calls, the general
rule is to place them where the arguments are, thus passed through to
the remote if they are defined there. On the other hand, if these are
invariant they are always computed locally. The explain function can be
used to see the details of the compilation. If a function is described
as being defined on the particular remote database, this information is
taken into account when compiling.

</div>

<div>

<div>

<div>

<div>

#### Join Type Selection

</div>

</div>

</div>

Starting with Virtuoso 3.0, hash joins are used where appropriate. A
hash join is about three to four times faster for a local table than
with a loop join using an exact match of primary key, thus the gain is
substantial.

A hash join works by scanning the shorter of two joined tables and
making a hash table from the join columns. This is only possible for
joins involving equality, but most joins tend to have equalities in
practice.

<div>

|                              |                                                                                                                                                                    |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                              |
|                              | A hash join does not need indices to be defined and the hash table constructed for one hash join may be reused by another if the table is not modified in-between. |

</div>

A hash join will be preferred if there is a sufficient number of
estimated accesses to the joined table in the query. If a table is
expected to be accessed only once, there is less point in making the
temporary hash table.

The hash join temporary structures are disk based and reside in the
temporary side of the database. They do not survive a database restart
but will be ad hoc reused if such are left over from earlier queries and
there is no change in the base table between the construction of the
hash and its reuse.

A hash join may be specially beneficial if a remote table is on the
inner loop of a loop join. The n random accesses can then be replaced
with a single sequential scan of the remote table.

The selected join type can be seen in the explain output. The WITH
keyword can be used to explicitly specify a join type for a table, see
query options below.

</div>

</div>

</div>
