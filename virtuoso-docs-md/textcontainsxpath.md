<div>

<div>

<div>

<div>

### 15.4.7. text-contains XPath Predicate

</div>

</div>

</div>

``` programlisting
text-contains (node-set, text-expression)
```

This XPath predicate is true if any of the nodes in *`node-set`* have
text values matching the *`text-expression`* . The *`text-expression`*
should be a constant string whose syntax corresponds to the top
production of the free text syntax for patterns in `contains()` . The
string also may not consist exclusively of spaces or noise words.

<div>

|                            |                                                                                              |
|:--------------------------:|:---------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                    |
|                            | "Noise Words" in the <a href="webdavadmin.html#freetext" class="link" title="Free Text">Free 
                              Text Search chapter</a> .                                                                     |

</div>

<div>

**Example 15.14. Selecting All Titles About Aliasing**

<div>

``` programlisting
select n from xml_text2 where
  xcontains (xt_text,
  '//title[text-contains (., "Aliasing")]', 0, n);
```

</div>

</div>

  

This selects all title elements that contain the word "Aliasing" using
free text match rules: case insensitive and whole word.

<div>

**Example 15.15. Select All Trees with Elements Containing "sql
reference"**

<div>

``` programlisting
select n from xml_text2 where
  xcontains (xt_text,
  '//*[text-contains (., ''"sql reference"'')]',
  0, n);
```

</div>

</div>

  

This selects all elements whose text value contains the phrase "sql
reference". Free text matching rules apply. This produces all nodes in
document order for all documents which contains the phrase, starting
with the document node and following downward including all paths to the
innermost element(s) whose text contains the phrase.

</div>
