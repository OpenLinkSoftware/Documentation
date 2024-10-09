<div>

<div>

</div>

<div>

## Name

charset_define — Define a character set.

</div>

<div>

## Synopsis

<div>

|                             |                            |
|-----------------------------|----------------------------|
| ` `**`charset_define`**` (` | in `name ` varchar ,       |
|                             | in `charset_string ` any , |
|                             | in `aliases ` any `)`;     |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function creates a new narrow language-specific character set, or
redefines an existing one.

</div>

<div>

## Parameters

<div>

### name

The name of the character set to define. This becomes the "preferred"
name of the character set.

</div>

<div>

### charset_string

Wide string with the character codes for each given character from 1 to
255. That is, a 255-byte long NCHAR defining the Unicode codes for
narrow chars 1-255.

</div>

<div>

### aliases

Vector of character set names that are to be aliases of the character
set being defined. Use NULL if there are to be no aliases.

</div>

</div>

<div>

## Return Types

None

</div>

<div>

## Errors

<div>

**Table 24.9. Errors signalled by**

<div>

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

<div>

## Examples

<div>

**Example 24.37. New 4th character, and aliases**

<div>

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

<div>

## See Also

<a href="fn_charsets_list.html" class="link" title="charsets_list"><code
class="function">charsets_list() </code></a>

</div>

</div>
