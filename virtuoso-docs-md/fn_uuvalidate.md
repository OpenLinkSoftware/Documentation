<div>

<div>

</div>

<div>

## Name

uuvalidate — Encodes string or string session into sequence of printable
characters, suitable for transfer via "ASCII-only" data channels

</div>

<div>

## Synopsis

<div>

|                         |                                        |
|-------------------------|----------------------------------------|
| ` `**`uuvalidate`**` (` | in `input ` string or string session , |
|                         | in `mode ` integer `)`;                |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function tries to ensure what applied data have a pointed encoding
mode. If mode parameter is 0 (ie unknown) or if the validation fails, it
will try to determine which mode was used in fact.

RFC 1521, (N. Borenstein, N. Freed. MIME (Multipurpose Internet Mail
Extensions) Part One: Mechanisms for Specifying and Describing the
Format of Internet Message Bodies), contains detailed description of
most important encodings used by mail systems. RFC 2045, (N. Borenstein,
N. Freed. MIME (Multipurpose Internet Mail Extensions) Part One: The
Format of Internet Message Bodies).

Currently, eight conventions are used for mail attachments. In Virtuoso,
they are enumerated by integer IDs.

<div>

**Table 24.110. Unicode-like standards, supported by Virtuoso**

<div>

| ID  | Standard                             | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|-----|--------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1   | "Native" UUencode                    | Optional header is one line started by "begin " or "\<pre\>begin " keyword, with some system-specific data after it. Optional footer is one line started by "end" keyword.                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| 2   | Base-64, UNIX version                | There are no agreements about headers or footers.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| 3   | Base-64, MIME version                | This standard is very similar to "Base-64, UNIX version". Virtuoso, like all modern mail clients, feel no difference between them when decode sections, because the only difference is in the number of data bytes per line.                                                                                                                                                                                                                                                                                                                                                                                                                      |
| 4   | XXencode                             | This standard is an obsolete standard, similar to Unicode, but not compatible. There are no agreements about headers or footers.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| 5   | BinHex                               | There are no header or footer lines, but first line of every section should be prefixed by colon (':') character. Application should place colon before data lines of every section. (this function will prepare only data lines without this prefix).                                                                                                                                                                                                                                                                                                                                                                                            |
| 6-9 | reserved                             | More standards may be used in the future. It is unsafe to assume that all existing standards are listed here. Real application will often receive messages with unknown or misspelled encodings' names, syntax errors in data etc.                                                                                                                                                                                                                                                                                                                                                                                                                |
| 10  | MIME Plain-Text                      | This "encoding" is suitable only for texts. They are stored "as is", but line ends will not be preserved.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 11  | MIME Quoted-Printable (for texts)    | This encoding is suitable for any sort of textual data, because ASCII printable characters are stored "as is" and only nonprintable characters are encoded. UNIX linefeeds (LF chars) will be encoded as "hard breaks", so decoding side may convert them into its own system-specific "line end" chars, e.g. in CRLF sequence.                                                                                                                                                                                                                                                                                                                   |
| 12  | MIME Quoted-Printable (for binaries) | This encoding is suitable for any sort of data but it is especially useful for textual data, because ASCII printable characters are stored "as is" and only nonprintable characters are encoded. No "hard breaks" will be used for UNIX linefeeds (LF chars) of source file, so the file will be decoded exactly as it was encoded, no matter which character sequence is used for "line end" in the decoder's OS. When in trouble, whether the data encoded are text or binary, use this variant ("for binaries"): text may be easily recovered by recipient if linefeeds are wrong whereas binary data will become unusable if encoded as text. |

</div>

</div>

  

</div>

<div>

## Parameters

<div>

### input

String or string-output session with data to be encoded.

</div>

<div>

### mode

Integer ID of encoding to be used.

</div>

</div>

<div>

## Return Types

Vector of strings, where every string contains all data lines of a
section.

</div>

<div>

## Errors

<div>

**Table 24.111. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                           | Description |
|---------------------------------------|---------------------------------------|----------------------------------------------------------------------|-------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">UUV01 </span> | <span class="errortext">Unsupported type of UU-encoding (..) </span> |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.435. Detection of encoding type**

<div>

The function gets a string 'Hello' in BinHex encoding and returns 5
indicating that the string is probably in BinHex encoding.

``` screen
-- note doubled single quotes inside string literal
select uuvalidate (':5''9XE''m:', 0);
5
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_uudecode.html" class="link" title="uudecode">uuencode</a> ,
<a href="fn_uudecode.html" class="link" title="uudecode">uudecode</a>

</div>

</div>
