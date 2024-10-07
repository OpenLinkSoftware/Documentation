<div id="fn_charset_define" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

charset_define — Define a character set.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_charset_define" class="funcsynopsis">

|                             |                            |
|-----------------------------|----------------------------|
| ` `**`charset_define`**` (` | in `name ` varchar ,       |
|                             | in `charset_string ` any , |
|                             | in `aliases ` any `)`;     |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_charset_define" class="refsect1">

## Description

This function creates a new narrow language-specific character set, or
redefines an existing one.

</div>

<div id="params_charset_define" class="refsect1">

## Parameters

<div id="id82002" class="refsect2">

### name

The name of the character set to define. This becomes the "preferred"
name of the character set.

</div>

<div id="id82005" class="refsect2">

### charset_string

Wide string with the character codes for each given character from 1 to
255. That is, a 255-byte long NCHAR defining the Unicode codes for
narrow chars 1-255.

</div>

<div id="id82008" class="refsect2">

### aliases

Vector of character set names that are to be aliases of the character
set being defined. Use NULL if there are to be no aliases.

</div>

</div>

<div id="ret_charset_define" class="refsect1">

## Return Types

None

</div>

<div id="errors_charset_define" class="refsect1">

## Errors

<div id="id82016" class="table">

**Table 24.9. Errors signalled by**

<div class="table-contents">

| sqlstate                              | error code                            | error text                                                                             |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------|
| <span class="errorcode">2C000 </span> | <span class="errorcode">IN001 </span> | <span class="errortext">The UTF-8 is not a redefinable charset </span>                 |
| <span class="errorcode">2C000 </span> | <span class="errorcode">IN002 </span> | <span class="errortext">charset_define : Charset table not a wide string </span>       |
| <span class="errorcode">2C000 </span> | <span class="errorcode">IN003 </span> | <span class="errortext">charset_define : 0 not allowed as a charset definition </span> |
| <span class="errorcode">2C000 </span> | <span class="errorcode">IN004 </span> | <span class="errortext">charset \<name\> already defined. Drop it first </span>        |
| <span class="errorcode">2C000 </span> | <span class="errorcode">IN005 </span> | <span class="errortext">Alias \<position\> is not of type STRING </span>               |

</div>

</div>

  

</div>

<div id="examples_charset_define" class="refsect1">

## Examples

<div id="ex_charset_define" class="example">

**Example 24.37. New 4th character, and aliases**

<div class="example-contents">

To setup the 4th character to be Unicode 0xffce, and give the character
set 2 aliases, you would make a call like this:

``` programlisting
charset_define ('NEW-CHARSET',
      N'\x1\x2\x3\xffce\x5....' , vector ('SOME-CHARSET', 'ANOTHER-CHARSET'));
```

The character string should contain 255 wide characters that are
arbitrary unicode values.

</div>

</div>

  

</div>

<div id="seealso_charset_define" class="refsect1">

## See Also

<a href="fn_charsets_list.html" class="link" title="charsets_list"><code
class="function">charsets_list() </code></a>

</div>

</div>
