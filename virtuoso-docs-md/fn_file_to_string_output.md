<div id="fn_file_to_string_output" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

file_to_string_output — get contents of a file as a string output stream

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_file_to_string_output" class="funcsynopsis">

|                                    |                       |
|------------------------------------|-----------------------|
| ` `**`file_to_string_output`**` (` | in `file ` varchar ,  |
|                                    | in `from ` integer ,  |
|                                    | in `to ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_file_to_string_output" class="refsect1">

## Description

This function requires dba privileges.

This function returns a string output stream initialized to contain the
text of the file or its segment, on local file system path relative to
the server's working directory.

`file_to_string_output` can handle longer files than
<a href="fn_file_to_string.html" class="link"
title="file_to_string"><code class="function">file_to_string</code></a>
and the resulting string output, if too long to be converted into a
varchar, can be stored inside a blob.

Access controls in the server configuration file apply. An attempt to
access a file in a directory where access is not explicitly allowed will
signal an error.

</div>

<div id="params_file_to_string_output" class="refsect1">

## Parameters

<div id="id88979" class="refsect2">

### file

a <span class="type">varchar </span> path relative to server's working
directory.

</div>

<div id="id88983" class="refsect2">

### from

an optional <span class="type">integer </span> byte offset of the start
of the segment to extract. Defaults to 0.

</div>

<div id="id88987" class="refsect2">

### to

an optional <span class="type">integer </span> byte offset of the end of
the requested segment. Defaults to file length.

</div>

</div>

<div id="examples_file_to_string_output" class="refsect1">

## Examples

<div id="ex_file_to_string_output" class="example">

**Example 24.117. Insert file contents into a table**

<div class="example-contents">

This example shows how to insert file contents into a table `file_table`
with two columns.

``` screen
create table
file_table (
  ft_name varchar,
  ft_cont long varbinary,
  primary key (ft_name));

create procedure
insert_files (in fname varchar)
{
  declare strout_handle any;

  strout_handle := file_to_string_output (fname);
  insert into file_table (ft_name, ft_cont)
    values (fname, strout_handle);

  strout_handle := file_to_string_output (fname, 10);
  insert into file_table (concat (ft_name, '_1'), ft_cont)
    values (fname, strout_handle);

  strout_handle := file_to_string_output (fname, 10, 20);
  insert into file_table (concat (ft_name, '_2'), ft_cont)
    values (fname, strout_handle);
};

insert_file ('foo.dat');
```

</div>

</div>

  

</div>

<div id="seealso_file_to_string_output" class="refsect1">

## See Also

<a href="fn_file_to_string.html" class="link"
title="file_to_string"><code class="function">file_to_string </code></a>
, <a href="fn_string_to_file.html" class="link"
title="string_to_file"><code class="function">string_to_file</code></a>
,
<a href="fn_string_output.html" class="link" title="string_output"><code
class="function">string_output</code></a>

</div>

</div>
