<div>

<div>

<div>

<div>

## 20.8. Internationalization & Unicode

</div>

</div>

</div>

The text being indexed and the text query expression may both be wide
strings. The word boundaries used to cut the text in words in both
queries and index maintenance may depend on a language declared for the
text index.

The default language has white space and punctuation as word delimiters
and will recognize Unicode ideographic characters as self standing. A
single non-ideographic character will always be considered noise and not
indexed.

Non-ASCII Unicode values are converted to UTF8 before being stored into
the word table as narrow strings. Narrow 8 bit strings are stored in the
words table as is.

<div>

|                            |                                                                                     |
|:--------------------------:|:------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                           |
|                            | The LANGUAGE option in <a href="creatingtxtidxs.html#createtxtidxstmt" class="link" 
                              title="20.2.1. The CREATE TEXT INDEX statement">CREATE TEXT INDEX</a> .              |

</div>

</div>
