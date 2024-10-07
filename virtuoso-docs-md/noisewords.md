<div id="noisewords" class="section">

<div class="titlepage">

<div>

<div>

### 20.2.10. Noise Words

</div>

</div>

</div>

Noise words are often occurring words which can be skipped to save space
in the indexing, such as 'the', 'of', and' etc. These are ignored when
they occur in queries or documents to be indexed. The set of noise words
is configurable and is read from the noise.txt file, in the server's
working directory, at server start up. Words mentioned in that file will
be ignored for both indexing and querying.

The file noise.txt consists of control lines and text lines. A text line
is just a string of one or more words to be declared as noise. Please
keep them shorter than 1000 characters.

Control lines are those starting with "Language:" or "Encoding:" (case
is important) "Language: lang-id" tells the system to use rules for
language "lang-id" for subsequent text lines, until either another
"Language:" control line or end of file. Similarly, "Encoding: enc-id"
tells the system to use rules for encoding "enc-id". Control lines are
always in plain ASCII, no matter which encoding is active for text
lines. By default, the server default language and "UTF-8" encoding will
be used.

The simplest way of composing noise.txt is to place every word on a
separate line and save the file in UTF-8 encoding; this will work fine
for most European languages.

<div id="id66887" class="example">

**Example 20.3. Example**

<div class="example-contents">

``` programlisting
AND
OF
THIS
THE
```

</div>

</div>

  

Noise words seem to be case-insensitive, but this is not so. If you
enter a word on a text line, up to four noise words will be registered:

|                                                                                              |
|----------------------------------------------------------------------------------------------|
| the word exactly as it was entered;                                                          |
| an uppercased form of this word, if it is defined for active language;                       |
| an lowercased form of this word, if it is defined for active language;                       |
| a capitalized form, with one (or more) first chars in upper case and the rest in lower case. |

An error is signalled for a free text query consisting exclusively of
noise words.

It is important to understand that changes in noise.txt may invalidate
free text indexes that were filled with the previous version of
noise.txt. For example, if a text contains a phrase 'A B C' and after
indexing the word 'B' is added to the noise.txt then 'contains'
predicate will properly search for words 'A' and 'C' but will fail to
find the phrase 'A B C' or 'A C' due to differences in counting of word
positions. The 'xcontains' predicate is even more sensitive to changes
in word positions, because any change in word counting will corrupt the
index for element names. In addition, "persistent XML" documents may
contain pre-calculated word positions for all elements and these
positions may become out of sync with positions in free text index, so
it is best not to change noise.txt if the database contains any free
text indexes on persistent XMLs.

</div>
