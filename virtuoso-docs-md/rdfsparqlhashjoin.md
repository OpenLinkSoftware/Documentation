<div>

<div>

<div>

<div>

### 16.2.15. Use of Hash Join With RDF

</div>

</div>

</div>

For queries that touch large quantities of RDF data and have many
selection conditions, use of HASH JOIN is often desirable. For short
lookup queries, HASH JOIN is usually not desirable.

Depending on the version, the query optimizer may or may not do HASH
JOINs with RDF. This is controlled by the
<span class="emphasis">*hash_join_enable*</span> flag.

To check the flag, do:

``` programlisting
sys_stat ('hash_join_enable');
```

<div>

- 0 - means that hash joins are never made

- 1 - means that these are for SQL only

- 2 - means that these can also be used with RDF

</div>

The flag is set in the ini file in the \[Flags\] section:

``` programlisting
[Flags]
hash_join_enable = 2
```

The flag may be transiently set with the SQL statement:

``` programlisting
__dbf_set ('hash_join_enable', 2);
```

To check the effectiveness of HASH JOINs and whether the optimizer
introduces these in the first place, it is most convenient to use the
<span class="emphasis">*profile*</span> function.

In the following example, we look at the star schema benchmark Q4:

``` programlisting
SPARQL PREFIX rdfh: <http://lod2.eu/schemas/rdfh#>
SELECT SUM(?rdfh_lo_revenue) AS ?lo_revenue ?d_year ?p_brand1
FROM <http://lod2.eu/schemas/rdfh-inst#ssb1_ttl_qb>
WHERE
  {
    ?li a rdfh:lineorder ;
        rdfh:lo_orderdate ?lo_orderdate ;
        rdfh:lo_partkey ?lo_partkey ;
        rdfh:lo_suppkey ?lo_suppkey ;
          rdfh:lo_revenue ?rdfh_lo_revenue .

    ?lo_orderdate rdfh:d_year ?d_year .
    ?lo_partkey rdfh:p_brand1 ?p_brand1 .
    ?lo_partkey rdfh:p_category "MFGR#12" .
    ?lo_suppkey rdfh:s_region "AMERICA" .
  }
GROUP BY ?d_year ?p_brand1
ORDER BY ?d_year ?p_brand1
;
```

The query aggregates rows from a large fact table and selects based on a
date range, a brand, and the location of the supplier. To run this, it
is best to put the query in a file and have profile ('sparql... ')
wrapped around the text. Then, in isql:

``` programlisting
SET SET BLOBS ON;
LOAD q4.sql;
```

Without HASH JOIN, the profile is:

``` programlisting
{
time   1.9e-06% fanout         1 input         1 rows

Precode:
      0: __rdflit := Call __rdflit (rdflit170373)
      5: __rdflit := Call __rdflit (rdflit16802)
      10: BReturn 0
Subquery 31
{
time     1e-06% fanout         1 input         1 rows
{ fork
time   0.00035% fanout         1 input         1 rows
{ fork
time       3.6% fanout     1e+06 input         1 rows
RDF_QUAD     1e+06 rows(s_18_9_t6.S, s_18_9_t6.O)
 inlined  P =  #dfh#p_brand1  G =  #nst#ssb1_ttl_qb
time       1.7% fanout   0.03979 input     1e+06 rows
RDF_QUAD_POGS unq      0.04 rows (s_18_9_t7.S)
 P =  #dfh#p_category  ,  O = rdflit170373 ,  S = s_18_9_t6.S ,  G =  #nst#ssb1_ttl_qb
time       2.5% fanout   180.179 input     39790 rows

Precode:
      0: __ro2sq := Call __ro2sq (s_18_9_t6.O)
      5: BReturn 0
RDF_QUAD_POGS   4.4e+02 rows(s_18_9_t2.S)
 P =  #dfh#lo_partkey  ,  O = k_s_18_9_t6.S G =  #nst#ssb1_ttl_qb
time        35% fanout         1 input 7.16932e+06 rows
RDF_QUAD         1 rows(s_18_9_t3.O, s_18_9_t3.S)
 inlined  P =  #dfh#lo_suppkey  ,  S = s_18_9_t2.S G =  #nst#ssb1_ttl_qb
time       4.5% fanout  0.201214 input 7.16932e+06 rows
RDF_QUAD_POGS unq       0.2 rows ()
 P =  #dfh#s_region  ,  O = rdflit16802 ,  S = cast ,  G =  #nst#ssb1_ttl_qb
time        21% fanout         1 input 1.44256e+06 rows
RDF_QUAD         1 rows(s_18_9_t4.S, s_18_9_t4.O)
 inlined  P =  #dfh#lo_revenue  ,  S = k_s_18_9_t2.S G =  #nst#ssb1_ttl_qb
time        12% fanout         1 input 1.44256e+06 rows
RDF_QUAD_POGS unq       0.8 rows (s_18_9_t0.S)
 P =  #-ns#type  ,  O =  #dfh#lineorder  ,  S = k_s_18_9_t2.S ,  G =  #nst#ssb1_ttl_qb
time        14% fanout         1 input 1.44256e+06 rows
RDF_QUAD         1 rows(s_18_9_t1.O)
 inlined  P =  #dfh#lo_orderdate  ,  S = s_18_9_t0.S G =  #nst#ssb1_ttl_qb
time       3.5% fanout         1 input 1.44256e+06 rows
RDF_QUAD         1 rows(s_18_9_t5.O)
 inlined  P =  #dfh#d_year  ,  S = cast G =  #nst#ssb1_ttl_qb
time       1.9% fanout         0 input 1.44256e+06 rows
Sort (s_18_9_t5.O, s_18_9_t6.O) -> (s_18_9_t4.O, __ro2sq)

}
time   4.1e-05% fanout       280 input         1 rows
group by read node
(s_18_9_t5.O, s_18_9_t6.O, aggregate, __ro2sq)
time   0.00043% fanout         0 input       280 rows

Precode:
      0: __ro2sq := Call __ro2sq (s_18_9_t5.O)
      5: BReturn 0
Sort (__ro2sq, __ro2sq) -> (aggregate)

}
time   2.9e-05% fanout       280 input         1 rows
Key from temp (aggregate, __ro2sq, __ro2sq)

After code:
      0: lo_revenue :=  := artm aggregate
      4: d_year :=  := artm __ro2sq
      8: p_brand1 :=  := artm __ro2sq
      12: BReturn 0
time   7.6e-07% fanout         0 input       280 rows
Subquery Select(lo_revenue, d_year, p_brand1)
}

After code:
      0: lo_revenue := Call __ro2sq (lo_revenue)
      5: d_year := Call __ro2sq (d_year)
      10: p_brand1 := Call __ro2sq (p_brand1)
      15: BReturn 0
time   6.3e-07% fanout         0 input       280 rows
Select (lo_revenue, d_year, p_brand1)
}

 5542 msec 2420% cpu, 2.11877e+07 rnd 8.13668e+06 seq   85.6039% same seg   13.6018% same pg
Compilation: 10 msec 0 reads         0% read 0 messages         0% clw

  <para>With hash join the profile is:</para>
<programlisting><![CDATA[
{
time   1.4e-05% fanout         1 input         1 rows
time         7% fanout         1 input         1 rows

Precode:
      0: __rdflit := Call __rdflit (rdflit170373)
      5: __rdflit := Call __rdflit (rdflit16802)
      10: BReturn 0
{ hash filler
time     0.088% fanout     1e+06 input         1 rows
RDF_QUAD     1e+06 rows(s_18_9_t6.S, s_18_9_t6.O)
 inlined  P =  #dfh#p_brand1  G =  #nst#ssb1_ttl_qb
time      0.15% fanout         0 input     1e+06 rows
Sort hf 39 (s_18_9_t6.S, s_18_9_t6.S) -> (s_18_9_t6.O)

}
time   0.00046% fanout         1 input         1 rows
{ hash filler
time    0.0004% fanout      2556 input         1 rows
RDF_QUAD_POGS   2.6e+03 rows(s_18_9_t5.S, s_18_9_t5.O)
 inlined  P =  #dfh#d_year  G =  #nst#ssb1_ttl_qb
time   0.00056% fanout         0 input      2556 rows
Sort hf 56 (s_18_9_t5.S) -> (s_18_9_t5.O)

}
time    0.0036% fanout         1 input         1 rows
{ hash filler
time   0.00094% fanout     12068 input         1 rows
RDF_QUAD_POGS   1.2e+04 rows(s_18_9_t8.S)
 P =  #dfh#s_region  ,  O = rdflit16802 G =  #nst#ssb1_ttl_qb
time   0.00046% fanout         0 input     12068 rows
Sort hf 69 (s_18_9_t8.S)
}
time     0.012% fanout         1 input         1 rows
{ hash filler
time    0.0026% fanout     39790 input         1 rows
RDF_QUAD_POGS     4e+04 rows(s_18_9_t7.S)
 P =  #dfh#p_category  ,  O = rdflit170373 G =  #nst#ssb1_ttl_qb
time    0.0013% fanout         0 input     39790 rows
Sort hf 82 (s_18_9_t7.S)
}
Subquery 88
{
time   1.5e-05% fanout         1 input         1 rows
{ fork
time   1.3e-05% fanout         1 input         1 rows
{ fork
time        52% fanout 7.16932e+06 input         1 rows
RDF_QUAD   1.8e+08 rows(s_18_9_t2.O, s_18_9_t2.S)
 inlined  P =  #dfh#lo_partkey  G =  #nst#ssb1_ttl_qb
hash partition+bloom by 86 (tmp)hash join merged always card      0.04 -> ()
time       6.1% fanout         1 input 7.16932e+06 rows

Precode:
      0: s_18_9_t7.S :=  := artm s_18_9_t2.O
      4: BReturn 0
Hash source 82 merged into ts       0.04 rows(cast) -> ()
time         7% fanout  0.201214 input 7.16932e+06 rows
RDF_QUAD         1 rows(s_18_9_t3.O, s_18_9_t3.S)
 inlined  P =  #dfh#lo_suppkey  ,  S = s_18_9_t2.S G =  #nst#ssb1_ttl_qb
hash partition+bloom by 73 (tmp)hash join merged always card       0.2 -> ()
time    0.0018% fanout         1 input 1.44256e+06 rows
Hash source 69 merged into ts        0.2 rows(cast) -> ()
time       2.3% fanout         1 input 1.44256e+06 rows
RDF_QUAD_POGS unq       0.8 rows (s_18_9_t0.S)
 P =  #-ns#type  ,  O =  #dfh#lineorder  ,  S = k_s_18_9_t2.S ,  G =  #nst#ssb1_ttl_qb
time       2.3% fanout         1 input 1.44256e+06 rows
RDF_QUAD         1 rows(s_18_9_t1.O, s_18_9_t1.S)
 inlined  P =  #dfh#lo_orderdate  ,  S = s_18_9_t0.S G =  #nst#ssb1_ttl_qb
hash partition+bloom by 60 ()
time      0.38% fanout         1 input 1.44256e+06 rows
Hash source 56           1 rows(cast) -> (s_18_9_t5.O)
time       2.2% fanout         1 input 1.44256e+06 rows
RDF_QUAD         1 rows(s_18_9_t4.O)
 inlined  P =  #dfh#lo_revenue  ,  S = k_s_18_9_t0.S G =  #nst#ssb1_ttl_qb
time        20% fanout         1 input 1.44256e+06 rows
Hash source 39         1.6 rows(k_s_18_9_t2.O, k_s_18_9_t7.S) -> (s_18_9_t6.O)
time      0.86% fanout         0 input 1.44256e+06 rows
Sort (set_no, s_18_9_t5.O, s_18_9_t6.O) -> (s_18_9_t4.O)

}
time   0.00023% fanout       280 input         1 rows
group by read node
(gb_set_no, s_18_9_t5.O, s_18_9_t6.O, aggregate)
time       0.1% fanout         0 input       280 rows

Precode:
      0: __ro2sq := Call __ro2sq (s_18_9_t6.O)
      5: __ro2sq := Call __ro2sq (s_18_9_t5.O)
      10: BReturn 0
Sort (__ro2sq, __ro2sq) -> (aggregate)

}
time    0.0002% fanout       280 input         1 rows
Key from temp (aggregate, __ro2sq, __ro2sq)

After code:
      0: lo_revenue :=  := artm aggregate
      4: d_year :=  := artm __ro2sq
      8: p_brand1 :=  := artm __ro2sq
      12: BReturn 0
time   5.3e-06% fanout         0 input       280 rows
Subquery Select(lo_revenue, d_year, p_brand1)
}

After code:
      0: lo_revenue := Call __ro2sq (lo_revenue)
      5: d_year := Call __ro2sq (d_year)
      10: p_brand1 := Call __ro2sq (p_brand1)
      15: BReturn 0
time   5.5e-06% fanout         0 input       280 rows
Select (lo_revenue, d_year, p_brand1)
}

 3101 msec 993% cpu, 1.14967e+07 rnd 1.81041e+08 seq   99.5619% same seg  0.417643% same pg
Compilation: 23 msec 0 reads         0% read 0 messages         0% clw
```

These are runs on warm cache on a dataset of scale factor 30, about 3
billion triples.

We notice that the HASH-based plan completes faster and has a lower CPU
percentage. This is to be expected since HASH JOINs are especially
useful for JOINs between a large table and a smaller one.

The INDEX-based plan does 21M random INDEX lookups whereas the
HASH-based one does only 11M. We also note that the INDEX access pattern
is more local with the HASH plan, with 99% of lookups hitting the same
segment as the previous, against only 85%.

These numbers are in the summary at the bottom of each profile:

<div>

- rnd -- means index access

- seq -- means rows retrieved in sequential scan; same seg is the
  percentage of index accesses that hit the same segment as the previous
  access.

</div>

The INDEX-based plan starts with the smallest selection; in this case,
the days parts with the given brand. From this, it joins to the
lineorder and gets the supplier. It fetches the region of the supplier
and leaves out the ones not in America.

The HASH-based plan makes a hash table of all the parts with the brand,
all the suppliers in America, and all the days in the time dimension. It
then scans lineorder, and first drops the rows whose part is not in the
hash, then drops the rows where the supplier is not in the hash, and
then gets the year of each date. This last operation does not drop any
rows, but is still done by hash, because there are relatively few days
and the day-to-year translation is done a very large number of times.

The number of rows in and out of each operator is given after the time
percent, above the operator. Fanout is the number of rows of output per
one row of input.

Given the long-running queries of any workload, you can perform this
same comparison to determine if HASH JOIN is useful in the case at hand.
Looking at the real time and CPU% is usually enough.

<div>

- Using the sql:select-option pragma: One can specify the HASH JOIN is
  not to be used.

  ``` programlisting
  define sql:select-option "loop"
  ```

  will exclude use of HASH JOIN in the specific query.

- The table_option construct can be used to select the JOIN type for any
  triple pattern.

  ``` programlisting
  {
    ?lo rdfh:lo_suppkey ?supp .
    ?supp rdfh:s_region  "AMERICA" option (table_option "hash")
  }
  ```

  would have the effect of building a hash from the suppliers in
  America.

</div>

You may wish to experiment with these options and look at the profile
output for each.

For some analytics workloads, enabling HASH JOIN may give a factor of 2
or 3 better performance. For lookup workloads, there may be no gain.

Sometimes a HASH JOIN may be used when an INDEX lookup would be better,
thus in some cases it makes sense to turn off HASH JOINs either per
query or globally.

</div>
