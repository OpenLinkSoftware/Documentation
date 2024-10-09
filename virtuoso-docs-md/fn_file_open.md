<div>

<div>

</div>

<div>

## Name

file_open — returns the contents of a file.

</div>

<div>

## Synopsis

<div>

|                               |                         |
|-------------------------------|-------------------------|
| `varchar `**`file_open`**` (` | in `path ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns the contents of a file. The path is relative to the working
directory of the database server.

</div>

<div>

## Parameters

<div>

### path

Path name of the file to read.

</div>

</div>

<div>

## Examples

<div>

**Example 24.114. Simple Use**

<div>

For loading N3 and Turtle files you can use:

``` screen
SQL>DB.DBA.TTLP_MT (file_open('tmp/file1.n3'), 'base uri', 'graph uri', 255);
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_file_delete.html" class="link" title="file_delete"><code
class="function">file_delete() </code></a>

<a href="fn_ttlp.html" class="link" title="DB.DBA.TTLP"><code
class="function">DB.DBA.TTLP() </code></a>

<a href="fn_ttlp_mt.html" class="link" title="DB.DBA.TTLP_MT"><code
class="function">DB.DBA.TTLP_MT() </code></a>

<a href="fn_ttlp_mt_local_file.html" class="link"
title="DB.DBA.TTLP_MT_LOCAL_FILE"><code
class="function">DB.DBA.TTLP_MT_LOCAL_FILE() </code></a>

</div>

</div>
