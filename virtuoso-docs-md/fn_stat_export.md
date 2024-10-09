<div>

<div>

</div>

<div>

## Name

stat_export — Produces a statistics summary.

</div>

<div>

## Synopsis

<div>

|                          |      |
|--------------------------|------|
| ` `**`stat_export`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function produces a statistics summary that can be read back into
another database with the
<a href="fn_stat_import.html" class="link" title="stat_import"><code
class="function">stat_import() </code></a> function

</div>

<div>

## Parameters

</div>

<div>

## Examples

<div>

**Example 24.214. Simple Use**

<div>

``` programlisting
-- produce statistics for a given database:
SQL> string_to_file('stat.dv', serialize(stat_export()), -2);
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_stat_import.html" class="link" title="stat_import"><code
class="function">stat_import() </code></a>

</div>

</div>
