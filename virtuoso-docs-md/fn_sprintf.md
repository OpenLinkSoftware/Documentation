<div>

<div>

</div>

<div>

## Name

sprintf — returns a formatted string

</div>

<div>

## Synopsis

<div>

|                      |                    |
|----------------------|--------------------|
| ` `**`sprintf`**` (` | `format ` string , |
|                      | `arg_1 ` any ,     |
|                      | `... ` ,           |
|                      | `arg_x ` any `)`;  |

<div>

 

</div>

</div>

</div>

<div>

## Description

sprintf returns a new string formed by "printing" a variable number of
arguments arg_1 - arg_x according to the format string format, that is,
exactly the same way as with the sprintf function of C language. However
the sprintf function enforces some additional limitations over the
sprintf C function. It does not allow for single value output to take
more than 2000 characters. It does support the following additional
format characters:

diouxXeEfgcs - as in the C language printf

S - as 's' but escapes the single quotes by doubling them (as per
SQL/92). This is suitable for constructing dynamic SQL statements with
string literals inline.

``` screen
    sprintf ('insert into testit (data) values ('%S')', 'Test ''Real'' data')
    -> insert into testit (data) values ('Test ''Real'' data')
```

I - as 's' but escapes the string value to form a valid identifier name
(will double the double quotes). This is suitable for constructing
dynamic SQL statements with identifiers inline.

``` screen
    sprintf ('select * from "%I"', 'Big "Table" Name')
    -> select * from "Big ""Table"" Name"
```

U - as 's' but escapes the string value as an HTTP URL (same as
http_url() function). Useful for making dynamic VSP content

``` screen
    sprintf ('<a href="%U">', 'day & night')
    -> <a href="day+%26+night">
```

R - use to replace leading spaces: the modifiers are one of + - \# 0 and
space.

``` screen
    sprintf ('%-R', ' 123')
    -123
    sprintf ('%-R', '  123')
    --123
```

V - as 's' but escapes the string value as an HTTP Value (same as
http_value). Useful for making dynamic VSP content

``` screen
    sprintf ('<INPUT name="test" value="%V">', 'day & night')
    -> <INPUT name="test" value="day &amp; night">
```

Note that the sprintf format length and precision modifiers do not apply
to the extension format characters

``` screen
sprintf('Int=%d/%o/%x, String=%s, Character=%c',
    42798,42798,42798,'la cadena',65)
 -> 'Int=42798/123456/a72e, String=la cadena, Character=A'
```

In addition, <span class="emphasis">*%{varname}U* </span> syntax
extension is supported, mostly for
<a href="rdfconnvarsiniriclasses.html" class="link"
title="16.5.8. Connection Variables in IRI Classes">uing connection
variables in RDF IRI classes</a> . That syntax is to print the value of
client connection variable <span class="emphasis">*varname* </span>
using print format <span class="emphasis">*%U* </span> . Other format
characters are not supported for that feature in current version of
Virtuoso but might be supported in the future.

</div>

</div>
