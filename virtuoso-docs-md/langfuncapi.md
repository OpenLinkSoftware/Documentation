<div>

<div>

<div>

<div>

### 18.5.10. Adding New Languages And Encodings Into Virtuoso

</div>

</div>

</div>

There are too many languages to be able to support them all by default
so Virtuoso is user extensible in this respect. The built-in 'x-any'
language supports most languages to a degree, but it is not the optimum
solution for some specific languages or if you want to perform a words'
normalization to make text search more effective. To make Virtuoso
extensible, language-specific functions are organized into
<span class="emphasis">*language handlers*</span> , and handlers are
organized in hierarchical trees. Every handler contains pointers to such
functions as "count words in given string", "call given callback once
for every word in the string" etc.

XML documents and SQL procedures may identify languages by their names,
for example by value of <span class="emphasis">*xml:lang*</span>
attribute, *`content_language`* argument of built-in functions, or by
*`__lang`* option etc... Every language handler defines up to two names
of the language it supports, one matching ISO 639 regulations (e.g.
'en'), and one matching RFC 1766 (e.g. 'en-UK'). When Virtuoso finds a
match to the language name specified, it searches through the an
internal hash-table. If the name is unknown, the 'x-any' handler will be
returned as a default.

Custom language handlers should contain a pointer to a more generic
handler, e.g. to the handler, Handler may have NULLs stored instead of
pointers to required functions, these NULLs will be replaced with
pointers to generic handler's functions automatically when the custom
handler will be activated.

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="fn_lh_get_handler.html" class="link"
title="lh_get_handler">lh_get_handler</a></p>
<p><a href="fn_lh_load_handler.html" class="link"
title="lh_load_handler">lh_load_handler</a></p></td>
</tr>
</tbody>
</table>

</div>

There are two trees of language handlers in current version of Virtuoso.
"Main" tree starts from 'x-any' root and contains handlers of languages
used in documents, another tree starts from 'x-ftq-x-any' root contains
handlers of Free Text query ('ftq') languages. The difference is in
handling of wildcard characters: query string 'hello, wo\*ld' consists
of two "words", 'hello' and 'wo\*ld', and 'x-ftq-x-any' will properly
locate them, but 'x-any' handler will report three words -- 'hello',
'wo' and 'ld', because it knows nothing about special meaning of '\*' in
query strings. That is why every handler may contain a pointer to a
handler of its own query language.

In addition to plain language handlers, it's possible to add handlers of
"encoded language" They are useful if you have large number of documents
in some particular encoding and speed of free text indexing is critical
for your applications. While usual handlers deal with Unicode data, and
it requires data to be decoded before processing, functions of "encoded
language" handler may accept buffers of encoded text, eliminating
decoding.

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="fn_elh_get_handler.html" class="link"
title="elh_get_handler">elh_get_handler</a></p>
<p><a href="fn_elh_load_handler.html" class="link"
title="elh_load_handler">elh_load_handler</a></p></td>
</tr>
</tbody>
</table>

</div>

The OpenLink Virtuoso Server distribution contains sources of sample
language handler for 'en-UK' language. The difference between 'x-any'
handler and this one is in handling of abbreviations and numbers.
'en-UK' handler will read phrase '\$3.54 per sq.inch.' as the sequence
of words '3.54', 'per' and 'sq.inch', instead of sequence '54', 'per',
'sq' and 'inch' that 'x-any' will read. The generic 'x-any' handler has
no specific rules for dealing with the "decimal point" because in many
scripts "decimal comma" is used, thus '3.54' will be processed as pair
of words '3' and '54', but '3' will be ignored in many cases as noise
word due to its 1-character length.

In addition to the language extension interface, Virtuoso provides an
<span class="emphasis">*eh_load_handler*</span> function to add new
encodings, but it should be used solely for multi-character encodings
which cannot be supported through the usual Virtuoso
<a href="ch-concepts.html#internationalization" class="link"
title="5.1.6. Internationalization &amp; Unicode">International
Character Support</a> . If an encoding was created by the
<a href="fn_charset_define.html" class="link"
title="charset_define">CHARSET_DEFINE</a> function, Virtuoso can build
special lookup tables for very fast text translation from Unicode to the
encoding, thus you are not likely to gain in performance by writing your
own C code, but some applications will know nothing about your encoding
because they will check only the SYS_CHARSETS system table.

</div>
