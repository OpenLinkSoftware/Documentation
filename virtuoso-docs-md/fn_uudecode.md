<div>

<div>

</div>

<div>

## Name

uudecode — Decodes a string previously encoded by uuencode

</div>

<div>

## Synopsis

<div>

|                       |                         |
|-----------------------|-------------------------|
| ` `**`uudecode`**` (` | in `input ` string ,    |
|                       | in `mode ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Uudecode transforms uuencoded data into original form. Uuencode may
return a number of sections as a vector of them, each of these sections
should be decoded by separate call and results should be concatenated in
order to compose original text. The mode of decoding should match to the
mode used for encoding, of course.

RFC 2045, (N. Borenstein, N. Freed. MIME (Multipurpose Internet Mail
Extensions) Part One: The Format of Internet Message Bodies), contains
detailed description of most important encodings used by mail systems.
Older RFC 1521 is now obsoleted.

Currently, eight conventions are used for mail attachments. In Virtuoso,
they are enumerated by integer IDs.

<div>

**Table 24.106. Unicode-like standards, supported by Virtuoso**

<div>

| ID  | Standard                             | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
|-----|--------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1   | "Native" UUencode                    | Optional header is one line started by "begin " or "\<pre\>begin " keyword, with some system-specific data after it. Optional footer is one line started by "end" keyword.                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| 2   | Base-64, UNIX version                | There are no agreements about headers or footers.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| 3   | Base-64, MIME version                | This standard is very similar to "Base-64, UNIX version". Virtuoso, like all modern mail clients, feel no difference between them when decode sections, because the only difference is in the number of data bytes per line.                                                                                                                                                                                                                                                                                                                                                                                                                      |
| 4   | XXencode                             | This standard is an obsolete standard, similar to Unicode, but not compatible. There are no agreements about headers or footers.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| 5   | BinHex                               | There are no header or footer lines, but first line of every section should be prefixed by colon (':') character.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| 6-9 | reserved                             | More standards may be used in the future. It is unsafe to assume that all existing standards are listed here. Real application will often receive messages with unknown or misspelled encodings' names, syntax errors in data etc.                                                                                                                                                                                                                                                                                                                                                                                                                |
| 10  | MIME Plain-Text                      | This "encoding" is suitable only for texts. They are stored "as is", but line ends will not be preserved.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 11  | MIME Quoted-Printable (for texts)    | This encoding is suitable for any sort of textual data, because ASCII printable characters are stored "as is" and only nonprintable characters are encoded. UNIX linefeeds (LF chars) will be encoded as "hard breaks", so decoding side may convert them into its own system-specific "line end" chars, e.g. in CRLF sequence.                                                                                                                                                                                                                                                                                                                   |
| 12  | MIME Quoted-Printable (for binaries) | This encoding is suitable for any sort of data but it is especially useful for textual data, because ASCII printable characters are stored "as is" and only nonprintable characters are encoded. No "hard breaks" will be used for UNIX linefeeds (LF chars) of source file, so the file will be decoded exactly as it was encoded, no matter which character sequence is used for "line end" in the decoder's OS. When in trouble, whether the data encoded are text or binary, use this variant ("for binaries"): text may be easily recovered by recipient if linefeeds are wrong whereas binary data will become unusable if encoded as text. |

</div>

</div>

  

If there's no information about the encoding used in the message, zero
may be passed to the uudecode() function instead of proper ID.
uudecode() will try to guess the proper algorithm. In any case, decoder
feels no difference between modes 2 and 3 (two slightly different
"Base64" encodings) and between modes 11 and 12 (two "Quoted-Printable"
methods which are different only encoding side). Application may try all
methods in turn if automatic guess will fail.

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

**Table 24.107. Errors signalled by**

<div>

| SQLState                              | Error Code                            | Error Text                                                            | Description |
|---------------------------------------|---------------------------------------|-----------------------------------------------------------------------|-------------|
| <span class="errorcode">22003 </span> | <span class="errorcode">UUD01 </span> | <span class="errortext">Unsupported type of UU-encoding (...) </span> |             |
| <span class="errorcode">22003 </span> | <span class="errorcode">UUD02 </span> | <span class="errortext">Data string contains errors \[...\] </span>   |             |
| <span class="errorcode">22003 </span> | <span class="errorcode">UUD03 </span> | <span class="errortext">Encoded data ended prematurely </span>        |             |
| <span class="errorcode">22003 </span> | <span class="errorcode">UUD04 </span> | <span class="errortext">No data found to be decoded </span>           |             |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.433. Encoding with auto-detection of the encoding type**

<div>

The function gets a string 'Hello' in BinHex encoding and zero to let it
guess that the encoding is BinHex. The call returns 'Hello'.

``` screen
-- note doubled single quotes inside string literal
select uudecode (':5''9XE''m:', 0);
Hello
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_uuvalidate.html" class="link"
title="uuvalidate">uuencode</a> ,
<a href="fn_uuvalidate.html" class="link"
title="uuvalidate">uuvalidate</a>

</div>

</div>
