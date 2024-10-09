<div>

<div>

</div>

<div>

## Name

translate — Performs char-by-char translation of given string

</div>

<div>

## Synopsis

<div>

|                              |                             |
|------------------------------|-----------------------------|
| `string `**`translate`**` (` | `strg ` string ,            |
|                              | `search_list ` string ,     |
|                              | `replace_list ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns the *`strg`* with occurrences of characters in the
*`search_list`* replaced by the character at the corresponding position
in the *`replace_list`* . If there is a character in the *`search_list`*
with no character at a corresponding position in the *`replace_list`*
(because the *`replace_list`* is longer than the *`replace_list`* ),
then occurrences of that character in *`strg`* string are removed.

If a character occurs more than once in the *`search_list`* , then the
first occurrence determines the replacement character. If the
*`replace_list`* is longer than the *`search_list`* , then excess
characters are ignored.

Two popular use cases for this function are case conversion and sorting
with collation. For "to-upper" case conversion, the *`search_list`*
consists of all lowercase characters of some language and the
*`replace_list`* consists of all uppercase characters of that language.
For "to-lower" case conversion, uppercase chars are in the
*`search_list`* and lowercase are in the *`replace_list`* . For sorting
with collation, the function must be used in "select" string expression
attribute of \<xsl:sort\> element; the *`search_list`* consists of all
characters reordered by collation and the *`replace_list`* consists of
corresponding characters from "collation string".

</div>

<div>

## Parameters

<div>

### strg

String that must be translated.

</div>

<div>

### search_list

String of characters that must be edited in the *`strg `* .

</div>

<div>

### replace_list

String of characters that must be inserted in the *`strg `* .

</div>

</div>

<div>

## Return Types

String

</div>

<div>

## Errors

<div>

**Table 24.152. Errors signalled by translate()**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                                                                | Description                                                                                                                                                                                                                                                                |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPF07 </span> | <span class="errortext">Too long string passed as argument 1 to XPATH function translate(), the result of translation is too long </span> | Virtuoso cannot process strings that are longer than 10M. This limit may be exceed if UTF-8 representations of the replacement characters are longer than representations of replaced characters; even if the number of encoded characters remains the same or decrements. |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.633. Trivial cases**

<div>

The following expressions are true:

``` screen
    translate("abracadabra","abc","ABC") = "ABrACAdABrA".
    translate("ab-ra-ca-dab-ra","abc-","ABC") = "ABrACAdABrA".
```

</div>

</div>

  

<div>

**Example 24.634. Sorting with collation in XSL**

<div>

The following \<xsl:sort\> will sort records by its titles, making no
difference between spaces and punctuation marks. In addition, spaces
will be normalized after the collation processing.

``` screen
    <xsl:key select="normalize-space(translate('@title','.,:;!?','      '))"/>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_replace.html" class="link" title="replace">replace()</a>
<a href="xpf_normalize_space.html" class="link"
title="normalize-space">normalize-space()</a>

</div>

</div>
