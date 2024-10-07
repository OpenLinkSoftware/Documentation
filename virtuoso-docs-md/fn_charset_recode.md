<div id="fn_charset_recode" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

charset_recode — Translate a string to another character set

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_charset_recode" class="funcsynopsis">

|                                |                                     |
|--------------------------------|-------------------------------------|
| `any `**`charset_recode`**` (` | in `src_string ` varchar/nvarchar , |
|                                | in `src_charset ` varchar ,         |
|                                | in `dst_charset ` varchar `)`;      |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_charset_recode" class="refsect1">

## Description

This function translates a string from a given source charset to a
destination charset. It provides a generic way of recoding string
entities.

The *`src_charset `* may be a narrow or a wide <span class="type">string
</span> . If it's a <span class="type">narrow string </span> (
<span class="type">VARCHAR </span> ) then the *`src_charset `* is taken
into account and defines the current encoding of the *`src_string `* .
In any other case *`src_charset `* is ignored.

*`src_charset `* and *`dst_charset `* are names of system-defined 8 bit
charset tables. Use `charsets_list ` to obtain a list of currently
defined character sets and aliases. If either of these is null, then the
charset in effect is used. There are two special character set names -
"UTF-8" and "\_WIDE\_" - that are recognized by this function. These
represent UTF-8 encoding of characters and <span class="type">wide
string </span> ( <span class="type">NVARCHAR </span> ).

</div>

<div id="params_charset_recode" class="refsect1">

## Parameters

<div id="id82109" class="refsect2">

### *`src_string `*

The input data to be converted. <span class="type">String </span> or
<span class="type">wide string. </span>

</div>

<div id="id82115" class="refsect2">

### *`src_charset `*

Input data character set, <span class="type">string </span> .

</div>

<div id="id82120" class="refsect2">

### dst_charset

The charset to convert to, <span class="type">string </span> .

</div>

</div>

<div id="examples_charset_recode" class="refsect1">

## Examples

<div id="ex_charset_define_01" class="example">

**Example 24.38. Recoding a narrow ISO-8859-1 string as UTF-8**

<div class="example-contents">

``` screen
select cast (charset_recode ('\xA9', 'ISO-8859-1', 'UTF-8') as varbinary)
  -- converts "Copyright sign" to UTF-8 (output 0xC2A9)
select cast (charset_recode ('\xC0', 'WINDOWS-1251', 'ISO-8859-5') as varbinary)
  -- converts "Cyrillic A" from WINDOWS-1251 charset to ISO-8859-5 (output 0xB0).
select cast (charset_recode (N'\x410', '_WIDE_', 'WINDOWS-1251') as varbinary)
  -- converts "Cyrillic A" from Unicode to WINDOWS-1251 charset (result '\xC0').
select charset_recode (N'\x410', '_WIDE_', 'ISO-8859-1')
  -- converts "Cyrillic A" from Unicode to ISO-8859-1 charset (Not available : result '?').
        
```

</div>

</div>

  

</div>

<div id="seealso_charset_recode" class="refsect1">

## See Also

<a href="fn_elh_get_handler.html" class="link"
title="elh_get_handler">elh_get_handler</a>

<a href="fn_elh_load_handler.html" class="link"
title="elh_load_handler">elh_load_handler</a>

<a href="fn_lh_get_handler.html" class="link"
title="lh_get_handler">lh_get_handler</a>

<a href="fn_lh_load_handler.html" class="link"
title="lh_load_handler">lh_load_handler</a>

</div>

</div>
