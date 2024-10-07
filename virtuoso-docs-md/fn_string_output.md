<div id="fn_string_output" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

string_output — make a string output stream

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_string_output" class="funcsynopsis">

|                            |                              |
|----------------------------|------------------------------|
| ` `**`string_output`**` (` | in `threshold ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_33" class="refsect1">

## Description

A string output stream is a special object that may be used to buffer
arbitrarily long streams of data. They are useful for handling data that
would not otherwise fit within normal <span class="type">varchar</span>
size limitations. The HTTP output functions optionally take a string
output stream handle as a parameter and then output to said stream
instead of the HTTP client. A string output stream can be assigned to a
database column in insert or update, causing the characters written to
the stream to be assigned to the column as a narrow string.

The function <a href="fn_string_output_string.html" class="link"
title="string_output_string"><code
class="function">string_output_string </code></a> can be used to produce
a varchar out of a string output stream. It may be called repeatedly to
obtain several copies of the data.
<a href="fn_http_rewrite.html" class="link" title="http_rewrite"><code
class="function">http_rewrite</code></a> can be used to flush a string
output stream.

If a string output stream is passed to the function
<a href="fn_result.html" class="link" title="result"><code
class="function">result</code></a> the data stored in it is sent to the
client.

The string output object cannot be copied. It cannot therefore be
assigned between two variables or passed by value (as an IN parameter.)
It can be passed by reference (OUT, INOUT parameter.)

</div>

<div id="params_string_output" class="refsect1">

## Parameters

<div id="id112338" class="refsect2">

### threshold

Optional size threshold, exceeding this the object will be stored in a
temp directory specified by 'TempSesDir' INI parameter.

</div>

</div>

<div id="examples_05_01" class="refsect1">

## Examples

<div id="ex_string_output" class="example">

**Example 24.407. Handling string output streams**

<div class="example-contents">

This example takes a string as an argument, creates a new string output
stream, writes the string into the stream and inserts stream contents to
a DB table.

``` screen
create table
foo_table (
a integer identity,
b long varchar,
primary key (a));

create procedure
foo_out (in x varchar)
{
  declare str_out any;
  declare str varchar;

-- Pass correct result metadata to client
  result_names (str);

-- Get a new string output stream
  str_out := string_output();

  http (x, str_out);

-- These produce the same result
  result (string_output_string (str_out));
  result (str_out);

-- insert string output contents
  insert into foo_table (b) values (str_out);

-- Write it again to the string output
  http (concat (' ', x), str_out);

  result (str_out);
}
;

SQL> foo_out ('Ceterum censeo, Carthaginem esse delendum!');
str
VARCHAR NOT NULL
_______________________________________________________________________________

Ceterum censeo, Carthaginem esse delendum!
Ceterum censeo, Carthaginem esse delendum!
Ceterum censeo, Carthaginem esse delendum! Ceterum censeo, Carthaginem esse delendum!

2 Rows. -- 2 msec.

SQL> select * from foo_table;
a                 b
INTEGER NOT NULL  LONG VARCHAR
_______________________________________________________________________________

1                 Ceterum censeo, Carthaginem esse delendum!

1 Rows. -- 2 msec.
```

</div>

</div>

  

</div>

<div id="seealso_15" class="refsect1">

## See Also

<a href="fn_string_output_string.html" class="link"
title="string_output_string"><code
class="function">string_output_stream </code></a> ,
<a href="fn_http.html" class="link" title="http"><code
class="function">http</code></a> ,
<a href="fn_http_value.html" class="link" title="http_value"><code
class="function">http_value</code></a>

</div>

</div>
