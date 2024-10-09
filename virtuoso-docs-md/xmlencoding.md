<div>

<div>

<div>

<div>

### 15.4.9. XML Processing & Free Text Encoding Issues

</div>

</div>

</div>

XML document may be written in a variety of encodings, and it may cause
errors if an incorrect encoding is used for reading a document. Most
common errors can easily be eliminated by writing proper XML prologs in
documents, but this is not always possible, e.g. if documents are
composed by third-party applications. Virtuoso provides various tools to
support different types of encodings and to specify encodings to use if
a given document has no XML prolog.

<div>

<div>

<div>

<div>

#### Encodings: The Difference Between Encodings & Character Sets

</div>

</div>

</div>

Not all documents may be converted to Unicode by using simple character
sets. Some of them are stored in so-called "multibyte" encodings. It
means that every letter (or ideograph) is represented as a sequence of
one or more bytes, not by exactly one byte. The conversion from such
representation to Unicode and back is usually significantly slower than
simple transformation via character sets, so these representations are
supported by data import operations only, but not by internal RDBMS
routines.

The Virtuoso Server "knows" some number of built-in encodings, such as
UTF-8, UTF-16BE and UTF-16LE. It can load additional encoding
descriptions from a "UCM" file, and can automatically create a new
encoding from a known charset with the same name. See the
<a href="xmlencoding.html#ucmencodings" class="link"
title="UCM Encodings">UCM Encodings</a> section for more details.

An encoding may be used in the following places:

|                                                                                                                          |
|--------------------------------------------------------------------------------------------------------------------------|
| The XML/HTML parser to convert source text to Unicode.                                                                   |
| The free-text indexing engine to convert plain-text or XML documents to Unicode during the indexing.                     |
| It may be used by the compiler of free-text search expressions to convert string constants of the expression to Unicode. |
| It may be used to convert string constants of XPath/XQuery expressions.                                                  |

You can only use character sets, not encodings as an ODBC connection
character set, as a character set attribute of a column of a database
table, as an output encoding of the built-in XSLT processor (it is for
future versions). UTF-8 is an exception, it is supported in many places
where other encodings are not.

<div>

|                            |                                                                                                                                                                                                                                                                                                                                                                                                                          |
|:--------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | Security Note:                                                                                                                                                                                                                                                                                                                                                                                                           |
|                            | Two strings converted to Unicode may be identical, but this does not guarantee that their source strings were equal byte-by-byte due to the nature of some encodings. For this reason you should avoid processing authorization data that are neither in Unicode nor in one of the standard character sets (single-byte encodings). Multibyte encodings and user-defined character sets may be unsafe for such purposes. |

</div>

<div>

<div>

<div>

<div>

##### UCM Encodings

</div>

</div>

</div>

The description of a multibyte encodings is much longer than the
description of a character set. It is inconvenient to keep such amounts
of data inside the executable. Virtuoso can load descriptions of
required encodings from external files in UCM format. Every UCM file
describes one encoding.

Virtuoso loads UCM files at system initialization. The list of UCM files
is kept in the <a href="ch-server.html#virtini" class="link"
title="Virtuoso Configuration File">Virtuoso INI file</a> under a
section called \[Ucms\]. This section should contain a UcmPath parameter
and one or more parameters with names Ucm1, Ucm2, Ucm3 and so on (up to
Ucm99).

The UcmPath parameter specifies the directory where UCM files are
located, and every UcmNN parameter specifies the name of a UCM file to
load and a list of names that the encoding can be identified by the
\<?xml ... encoding="..." ?\> XML preamble. A vertical bar character is
used to delimit names in the list.

<div>

**Example 15.16. Sample \[Ucms\] Section**

<div>

``` programlisting
[Ucms]
UcmPath = /usr/local/javalib/ucm
Ucm1 = java-Cp933-1.3-P.ucm,Cp933
Ucm2 = java-Cp949-1.3-P.ucm,Cp949|Korean
```

This section describes two UCM files located in /usr/local/javalib/ucm
directory: data from java-Cp933-1.3-P.ucm will be used for documents in
the 'Cp933' encoding; data from java-Cp949-1.3-P.ucm will be used for
documents in the 'Cp949' encoding and for documents in the 'Korean'
encoding (because these two names refers to the same encoding).

</div>

</div>

  

<div>

|                              |                                                                     |
|:----------------------------:|:--------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                               |
|                              | The encoding name specified inside the UCM file itself is not used. |

</div>

The Virtuoso server will log the results of processing each UCM file
specified in the Virtuoso INI file. If a UCM file specified is not found
or contains syntax errors, the error is logged, otherwise only the type
and name(s) of the encoding are logged.

<div>

|                              |                                                                                                                                                                                                                                                        |
|:----------------------------:|:-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                  |
|                              | If the virtuoso.ini contains a misspelled name of a parameter or section, the parameter (or a whole section) is ignored without being reported as an error. It is always wise to verify that the log contains a record about the encoding(s) you load. |

</div>

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
<td style="text-align: left;" data-valign="top"><p>UCM files can be
found freely from various sites concerning the "International Components
for Unicode" project, such as: <a href="http://www-124.ibm.com/icu"
class="ulink" target="_top">IBM ICU Homepage</a> or the <a
href="http://oss.software.ibm.com/cvs/icu/charset/data/ucm/"
class="ulink" target="_top">IBM UCM files directory</a> .</p>
<p>The <a href="cinterface.html" class="link"
title="18.5. Virtuoso Server Extension Interface (VSEI) (C Interface)">C
Interface</a> chapter contains further information regarding user
customizable support for new encodings and languages. For almost all
tasks, it is enough to define a new charset or to load an additional UCM
file, but some special tasks may require writing additional C
code.</p></td>
</tr>
</tbody>
</table>

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### The *`Encoding`* Attribute

</div>

</div>

</div>

If an XML document contains the *`encoding`* parameter in its

``` programlisting
<?xml ... ?>
```

prolog declaration, it will be properly decoded and converted into
UTF-8, so the application code is free from encoding problems. If the
value of this attribute is the name of a pre-set or user-defined
character set, that character set will be used. Virtuoso will recognize
names such as *`UTF-8`* and *`UTF8`* as multi-character or special
encodings. Virtuoso recognizes both official names and aliases.

If an encoding is not specified in an XML prolog, or if the document
contains no prolog, the default encoding will be used to read the
document. If a built-in SQL function invokes the XML parser, it will
have an optional argument *`parser_mode`* to specify whether source text
should be parsed as strict XML or as HTML. If the source text is 8-bit,
then UTF-8 will be used as the default encoding for "XML mode", and
ISO-8859-1 (Latin-1) will be the default for "HTML mode". If the source
text is of some wide-character type, Unicode is the default. To make
another encoding the default, you may specify its official or alias name
as the *`content_encoding`* argument of a built-in function you call.

</div>

<div>

<div>

<div>

<div>

#### Encoding in XPath Expressions

</div>

</div>

</div>

Sometimes applications should perform XPath queries using the encoding
specified by a client. For example, a search engine may ask a user to
specify a pattern to search and use the browser's current encoding as a
hint to parse the pattern properly. In such cases you may wish to use
the *`__enc`* XPath option to specify the encoding used for the rest of
XPath string:

<div>

**Example 15.17. Specifying Search Encodings in XPath**

<div>

Create a sample table and store an XML with non-Latin-1 characters

``` programlisting
create table ENC_XML_SAMPLE (
  ID integer,
  XPER long varchar,
  primary key (ID)
);

insert into ENC_XML_SAMPLE (ID, XPER)


values (
  1,
  xml_persistent ('<?xml version="1.0" encoding="WINDOWS-1251" ?>
    <book><cit>Îí äîáàâèë
      êàðòîøêè,
    ïîñîëèë è
    ïîñòàâèë
    àêâàðèóì íà
    îãîíü
    (Ì.Æâàíåöêèé
    )</cit></book>'
  )
);
...
  
```

Find the IDs of all XML documents whose texts contain a specified
phrase. Note that there are pairs of single quotes (not double quotes)
around *`KOI8-R`* . The encoding name should be in single quotes, but
because it is inside a string constant the quotes must be duplicated.

``` programlisting
select ID from ENC_XML_SAMPLE where
  xcontains (XPER, '[__enc ''KOI8-R''] //cit[text-contains(.,
  "''ÐÏÓÔÁ×ÉÌ
    ÁË×ÁÒÉÕÍ
    ÎÁ ÏÇÏÎØ''")]');



```

</div>

</div>

  

</div>

<div>

<div>

<div>

<div>

#### Encoding in Free Text Search Indexes & Patterns

</div>

</div>

</div>

Like XML applications, free text searching may have encoding problems,
and Virtuoso offers a similar solution for them.

Both the CREATE TEXT INDEX statement and vt_create_text_index()
Virtuoso/PL procedure have an optional argument to specify the encoding
of the indexed data. The specified encoding will be applied to all
source text documents (if the TEXT INDEX was created), or to all XML
documents that have no encoding attribute of the sort \<?xml ...
encoding="..." ?\> (if the TEXT XML INDEX was created).

The option *`__enc`* may be specified at the beginning of free text
search pattern, even if the pattern is inside an XPath statement:

<div>

**Example 15.18. Specifying an Encoding for Free Text Searching**

<div>

Create a sample table and store a sample of text with non-Latin-1
characters (assuming that client encoding is Windows-1251)

``` programlisting
create table ENC_TEXT_SAMPLE (
  ID integer,
  TEXT long nvarchar,
  primary key (ID)
);

insert into ENC_TEXT_SAMPLE (ID, XPER)


values (
  1,
  '<?xml version="1.0" encoding="WINDOWS-1251" ?>
Îí äîáàâèë
    êàðòîøêè,
    ïîñîëèë è
    ïîñòàâèë
    àêâàðèóì
    íà îãîíü
    (Ì.Æâàíåöêèé')
);
...
```

Find the IDs of all text documents whose texts contain a specified
phrase.

``` programlisting
select ID from ENC_SAMPLE where
  contains (TEXT, '[__enc ''KOI8-R'']
    "ÐÏÓÔÁ×ÉÌ
    ÁË×ÁÒÉÕÍ
    ÎÁ ÏÇÏÎØ"'
  );
```

Encoding may be applied locally to an argument of the text-search
predicate. It may be used if the document contains citations in
different encodings or if the XML document contains non-ASCII characters
in names of tags or attributes, or if the encoding affects character
codes of ASCII symbols such as '/' or '\['.

``` programlisting
select ID from ENC_XML_SAMPLE where
  xcontains (XPER, '//cit[text-contains(., "[__enc ''KOI8-R'']
    ''ÐÏÓÔÁ×ÉÌ
    ÁË×ÁÒÉÕÍ ÎÁ
    ÏÇÏÎØ''")]'
  );
```

</div>

</div>

  

<div>

|                              |                                                                                                                                                                                                                                                                                                                                                                                          |
|:----------------------------:|:-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note:                                                                                                                                                                                                                                                                                                                                                                                    |
|                              | You may have free-text a expression written as a literal constant: e.g. if the argument of text-contains XPath function is a literal constant. Be careful to not declare the \_\_enc twice, once in the beginning of the whole XPath expression and then again in the beginning of the free-text expression constant, because words of the text expression will thus be converted twice. |

</div>

</div>

</div>
