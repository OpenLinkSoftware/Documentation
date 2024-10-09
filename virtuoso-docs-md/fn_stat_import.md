<div>

<div>

</div>

<div>

## Name

stat_import — Imports database statistics

</div>

<div>

## Synopsis

<div>

|                          |                            |
|--------------------------|----------------------------|
| ` `**`stat_import`**` (` | in `st_name ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function imports produced database statistics.

</div>

<div>

## Parameters

<div>

### st_name

Name of the statistics file.

</div>

</div>

<div>

## Examples

<div>

**Example 24.213. Simple Use**

<div>

``` programlisting
-- produce statistics for a given database:
SQL> string_to_file('stat.dv', serialize(stat_export()), -2);

-- import the produced statistics:
SQL> stat_import (deserialize (file_to_string ('stat.dv')));
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_stat_export.html" class="link" title="stat_export"><code
class="function">stat_export() </code></a>

</div>

</div>
