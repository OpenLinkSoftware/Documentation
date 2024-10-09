<div>

<div>

<div>

<div>

### 9.19.6. Grouping Sets

</div>

</div>

</div>

The grouping sets variant of group by allows specifying exactly which
combinations of groupings are needed. `CUBE` and `ROLLUP` are shorthands
that expand into a grouping sets specification. This is useful for
applications like faceted search where there are separate group by's on
properties of interest.

The grouping function behaves identically to `CUBE` and `ROLLUP` .

The syntax is:

``` programlisting
GROUP BY grouping sets (<grouping set>[,...])
```

The grouping set is a list of grouping columns in parentheses or `()` to
denote an aggregate without grouping.

For example:

``` programlisting
  SELECT key_table, key_is_main, COUNT (*)
    FROM SYS_KEYS
GROUP BY grouping sets ((key_table), (key_is_main), ());
```

This shows for each table the number of indices, then the number of
primary key and non-primary key indices across all tables and finally
the total number of indices in the schema. A `CUBE` would produce these
same groupings but it would further add the `key_table` , `key_is_main`
grouping.

As an extension to SQL 99 OLAP extensions, the Virtuoso grouping sets
specification also supports an `ORDER BY` with optional top. In the
place of a grouping set one can write:

``` programlisting
ORDER BY [top k] (<column> [,...])
```

In this way a single query can produce a set of ordered result rows and
different grouped aggregates on the columns in the result set.

</div>
