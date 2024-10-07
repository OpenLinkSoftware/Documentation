<div id="fn_charsets_list" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

charsets_list — List known character set names and aliases.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_charsets_list" class="funcsynopsis">

|                               |                                |
|-------------------------------|--------------------------------|
| `any `**`charsets_list`**` (` | in `gen_res_set ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_charsets_list" class="refsect1">

## Description

This function produces a list of all character set names and aliases
known to Virtuoso. The returned value is an
<span class="type">array</span> of <span class="type">string</span> s
with a character set name as each element. If the *`gen_res_set`* flag
is 1, the function also produces a result set in which each row contains
one varchar column with a name of a character set or alias.

</div>

<div id="params_charsets_list" class="refsect1">

## Parameters

<div id="id82161" class="refsect2">

### *`gen_res_set `*

<span class="type">Integer </span> flag to determine whether to produce
a result set: 0 means no, 1 means yes.

</div>

</div>

<div id="ret_charsets_list" class="refsect1">

## Return Types

An <span class="type">array </span> of <span class="type">string </span>
, optionally generates a result set of single varchar columns.

</div>

<div id="errors_charsets_list" class="refsect1">

## Errors

This function can generate the following errors:
<span class="errorcode">SR008 </span><span class="errorcode">SR001
</span>

</div>

<div id="examples_charsets_list" class="refsect1">

## Examples

<div id="ex_charsets_list1" class="example">

**Example 24.39. List character sets as a result set**

<div class="example-contents">

``` screen
SQL> charsets_list(1);
CS_NAME
VARCHAR
___________________________________________

437
819
850
855
866
874
999
CP1250
CP1251
CP1252
CP1257
CP437
....
```

There are 132 predefined character sets in total that would be listed.

</div>

</div>

  

<div id="ex_charsets_list0" class="example">

**Example 24.40. Get first 2 character set names/aliases**

<div class="example-contents">

``` programlisting
....
x:= charsets_list (0);
y := aref (x, 0); -- will be '437'
y := aref (x, 1); -- will be '819'
....
```

</div>

</div>

  

</div>

<div id="seealso_charsets_list" class="refsect1">

## See Also

<a href="fn_charset_define.html" class="link"
title="charset_define"><code
class="function">charset_define() </code></a>

</div>

</div>
