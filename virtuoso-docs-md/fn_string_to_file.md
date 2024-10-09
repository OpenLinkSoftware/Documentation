<div>

<div>

</div>

<div>

## Name

string_to_file — writes a varchar to a file

</div>

<div>

## Synopsis

<div>

|                             |                         |
|-----------------------------|-------------------------|
| ` `**`string_to_file`**` (` | in `path ` varchar ,    |
|                             | in `string ` varchar ,  |
|                             | in `mode ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function requires dba privileges.

`string_to_file ` writes a <span class="type">varchar </span> value or
string session to a file. The path is relative to the server's working
directory. The mode is an integer value interpreted as a position. A
mode of 0 writes the content starting at offset 0. A mode of -1 appends
to the end of the file. The append option is probably the most useful
for producing application level logs, etc.

The string argument can also be a string output object. In this case the
content is used as the string.

If the mode is -2, the new content supersedes the old. This is different
from 0 in that the file will be truncated if the new content is shorter
than the old.

The DirsAllowed and DirsDenied lists in Parameters section of the
virtuoso configuration file (virtuoso.ini by default) are used to
control disk access. An error 42000/FA024 is signalled if an attempt is
made to write to a file in a directory to which disk access is not
explicitly allowed.

</div>

<div>

## Parameters

<div>

### path

<span class="type">varchar </span> relative path.

</div>

<div>

### string

<span class="type">varchar </span> or <span class="type">string session
</span> to write to the file.

</div>

<div>

### mode

<span class="type">integer </span> mode.

|                                   |
|-----------------------------------|
| 0 - overwrite from start offset 0 |
| -1 - append to end of file        |
| -2 - overwrite and truncate.      |

</div>

</div>

<div>

## Examples

<div>

**Example 24.411. Simple example**

<div>

Write an entry to an application log

``` screen
SQL>string_to_file ('logs/applog.txt',
  concat (datestring(now()),'\t','Application started.\n'), -1);

Done. -- 4 msec.
SQL> quit;
bash$ cat logs/applog.txt
2001-03-19 15:15:12.000000  Application started.
bash$
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_file_to_string.html" class="link"
title="file_to_string"><code class="function">file_to_string </code></a>

</div>

</div>
