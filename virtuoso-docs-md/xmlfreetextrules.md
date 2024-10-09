<div>

<div>

<div>

<div>

### 15.4.8. XML Free Text Indexing Rules

</div>

</div>

</div>

XML documents are inserted into the free text index as follows:

|                                                                                                                                                                                                   |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| The process works on the parsed XML tree; therefore character and local entity references are expanded.                                                                                           |
| Whole words of text content, bounded by delimiters used for free text, are each assigned an ordinal number. Noise words defined in the noise.txt file used by free text indexing are not counted. |
| Attribute names and values are not indexed.                                                                                                                                                       |
| Element start and end tags are indexed using the expanded names - that is, prefixed with the namespace URI + ':'.                                                                                 |
| An element start tag's ordinal number is one less than the ordinal number of the first whole word in the text value.                                                                              |
| A close tag's ordinal number is one greater than that of the last word in the text value.                                                                                                         |

From these rules follows that:

``` programlisting
<html>
  <body>
   <title>Title of Document</title>
   <p>Some <b>bold</b> text </p>
  </body>
</html>
```

will be indexed as follows:

``` programlisting
<html>        0
<body>        0
<title>       0
Title       1
of      - no number, noise word
Document        2
</title>      3
   <p>        3
Some        4
 <b>      4
bold        5
</b>      6
 text       6
</p>      6
  </body>     6
</html>       6
```

As a result, the phrase "some bold text" is the string value of the
\<p\> tag and will match the free text expression "some bold text" even
though there is mark-up in it. Conversely, the phrase "Document some
bold" does not match. Words will not considered adjacent if there is a
mix of opening and closing tags. They will only be considered adjacent
if there are solely one or more either opening or closing tags between
them. This can be circumvented by using the *`NEAR`* connective instead
of the phrase construct.

A free text condition will only be true of an element if all the words
needed to satisfy the condition are part of the element's string value.
This string value includes text children of descendants.

</div>
