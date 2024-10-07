<div id="fn_uuencode" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

uuencode — Encodes string or string session into sequence of printable
characters, suitable for transfer via "ASCII-only" data channels

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_uuencode" class="funcsynopsis">

|                       |                                        |
|-----------------------|----------------------------------------|
| ` `**`uuencode`**` (` | in `input ` string or string session , |
|                       | in `mode ` integer ,                   |
|                       | in `maxlines ` integer `)`;            |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_uuencode" class="refsect1">

## Description

There are many protocols, like classic UNIX uuencode, which are used to
transmit binary files over transmission mediums that do not support
other than simple ASCII data. The epoch of physical lines of such sort
is in past but file attachments in most popular mail systems still
follow old regulations.

Encoded data are transmitted as a sequence of one or more "sections".
They may be stored or sent as independent documents. Every section
contains some range of original document's data. They may be decoded one
after another, and original document may be composed by concatenation of
decoded fragments. If the document is small (or if there's no limit on
the size of message), it may be sent as single section.

Every section has some header and footer and a set of lines with data
between them. Headers and especially footers are usually optional and
may vary from system to system whereas data lines are described by
standards. Data lines of any two consequent sections may be concatenated
together, if needed, to create longer section.

`uuencode` creates a vector of strings, where every string contains some
number of data lines, without headers or footers. A Virtuoso/PL stored
procedure may be used to create some output stream(s) and put there
sections of appropriate format with data lines from vector. Every item
of the created vector will contain up to *`maxlines`* lines of data,
usually 60 to 80 bytes per line; *`maxlines`* may vary from 10 to 120000
so section may be 0.8Kb to 10Mb long depending on your choice. Last
section may be shorter than other, if only partially filled. 10Mb limit
may be bypassed by sending of sections one after another without
intermediate footers or headers, but please keep in mind that you cannot
concatenate two strings in memory if the sum of their lengths exceeds
system-wide 10Mb.

RFC 2045, (N. Borenstein, N. Freed. MIME (Multipurpose Internet Mail
Extensions) Part One: The Format of Internet Message Bodies), contains
detailed description of most important encodings used by mail systems.
Older RFC 1521 is now obsoleted.

Currently, eight conventions are used for mail attachments. In Virtuoso,
they are enumerated by integer IDs.

<div id="id117145" class="table">

**Table 24.109. Unicode-like standards, supported by Virtuoso**

<div class="table-contents">

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

<div id="params_uuencode" class="refsect1">

## Parameters

<div id="id117192" class="refsect2">

### input

String or string-output session with data to be encoded.

</div>

<div id="id117195" class="refsect2">

### mode

Integer ID of encoding to be used.

</div>

<div id="id117198" class="refsect2">

### maxlines

Number of data lines per section. Should be in range 10 to 120000,
otherwise nearest suitable value will be used without reporting any
error.

</div>

</div>

<div id="ret_uuencode" class="refsect1">

## Return Types

Vector of strings, where every string contains all data lines of a
section.

</div>

<div id="errors_uuencode_01" class="refsect1">

## Errors

<div id="id117206" class="table">

**Table 24.110. Errors signalled by**

<div class="table-contents">

| SQLState                              | Error Code                            | Error Text                                                                                                                      | Description |
|---------------------------------------|---------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|-------------|
| <span class="errorcode">22023 </span> | <span class="errorcode">UUE01 </span> | <span class="errortext">Function uuencode needs a string output or a string as argument 1, not an arg of type ... (...) </span> |             |
| <span class="errorcode">22023 </span> | <span class="errorcode">UUE02 </span> | <span class="errortext">Unsupported type of UU-encoding (...) </span>                                                           |             |

</div>

</div>

  

</div>

<div id="examples_uuencode" class="refsect1">

## Examples

<div id="ex_uuencode" class="example">

**Example 24.434. BinHex**

<div class="example-contents">

This function displays BinHex result of uuencode as a result-set of
sections.

``` screen
-- Line 4:
create procedure BINHEX_ENCODE (in txt varchar, in lines_per_section integer)
{
  declare SECTION varchar;
  declare sections any;
  result_names (SECTION);
  sections := uuencode (txt, 5, lines_per_section);
  foreach (varchar sect in sections) do
    result (':' || sect);
}

Done. -- 00000 msec.

BINHEX_ENCODE ('Hello', 10)
SECTION
VARCHAR
_______________________________________________________________________________

:5'9XE'm:

1 Rows. -- 00000 msec.

BINHEX_ENCODE (repeat ('Hello', 100), 10)
SECTION
VARCHAR
_______________________________________________________________________________

:5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[
5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[
5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[
5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[
5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[
5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[
5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[
5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[
5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[
5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[

:5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[5'9XE'p)C@aXEdKPE'a[
5'9XE'm:

2 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div id="seealso_uuencode" class="refsect1">

## See Also

<a href="fn_uudecode.html" class="link" title="uudecode">uudecode</a> ,
<a href="fn_uudecode.html" class="link" title="uudecode">uuvalidate</a>

</div>

</div>
