<div>

<div>

</div>

<div>

## Name

format-number

</div>

<div>

## Synopsis

<div>

|                                  |                               |
|----------------------------------|-------------------------------|
| `string `**`format-number`**` (` | `num ` number ,               |
|                                  | `format_pattern ` string ,    |
|                                  | `decimal_format ` string `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function converts the *`num`* argument to a string using the format
pattern string specified by the *`format_pattern`* and the
decimal-format named by the *`decimal_format`* , or the default
decimal-format, if there is no third argument.

The format pattern string is in the syntax specified by the JDK 1.1
DecimalFormat class. The following describes the structure of the
pattern.

<div>

- The pattern consists of one or two subpatterns, first is for positive
  numbers and zero, second is for negative numbers. Two subpatterns are
  delimited by semicolon. If there is only one subpattern, - is prefixed
  to the positive subpattern.

- Every subpattern consists of optional prefix characters followed by an
  integer part followed by an optional fraction part followed by an
  optional suffix characters.

- Prefix and suffix characters are any Unicode characters except special
  formatting characters described below, while integer and fraction part
  consist only from that special formatting characters. (As an
  exception, special characters may appear in prefix in suffix parts if
  enclosed in single quotes.

- If fractional present, it starts from '.' character, and only one '.'
  may occur in the subformat. Thus it is easy to find where each part
  begins.

</div>

By default, the following characters are treated as special when used in
the parts of the subpattern:

<div>

**Table 24.142.  Sub-pattern character substitutions**

<div>

| Symbol | Meaning                                                                                                             |
|--------|---------------------------------------------------------------------------------------------------------------------|
| 0      | A digit, zero will be printed. 0 must be the last character of integer part.                                        |
| \#     | A digit, zero will not be printed.                                                                                  |
| .      | Placeholder for decimal separator in the beginning of fraction part.                                                |
| ,      | Placeholder for grouping separator. It may appear only in integer part. All commas except the last will be ignored. |
| ;      | Separates formats. It may appear only once in the pattern.                                                          |
| \-     | Placeholder for negative prefix.                                                                                    |
| %      | Indicates that the value must be multiplied by 100 and shown as percentage.                                         |
| ?      | Indicates that the value must be multiplied by 1000 and shown as per mille.                                         |

</div>

</div>

  

Note that character '¤' have a special meaning in DecimalFormat of JDK
1.1, but not in XPATH.

The format pattern string may be in a localized notation. The
*`decimal_format`* may determine what characters have a special meaning
in the pattern (with the exception of the quote character, which is not
localized). The *`decimal_format`* must be a QName, and a search will be
performed for top-level \<xsl:decimal-format\> key whose "key" attribute
is equal to *`decimal_format`* ; all names will be expanded before the
search. It is an error if the stylesheet does not contain a declaration
of the decimal-format with the specified expanded name.

</div>

<div>

## Parameters

<div>

### num

Number to format.

</div>

<div>

### format_pattern

Format pattern which must be applied to the number.

</div>

<div>

### decimal_format

Name of \<xsl:decimal-format\> element which must be used to parse
format pattern.

</div>

</div>

<div>

## Return Types

String

</div>

<div>

## Errors

<div>

**Table 24.143. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                         | Description                                                                                                                      |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">XS370 </span> | <span class="errorcode">XS036 </span> | <span class="errortext">Number format ... is not defined in XPath function format-number() </span> | The function is called outside an XSLT processor or the current stylesheet contains no format definition with the required name. |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.589. **

<div>

If the XSLT stylesheet defines format 'financial' as '###,###.00####',
then the following returns '123,456.789':

``` screen
format(123456.789, "financial")
```

</div>

</div>

  

</div>

</div>
