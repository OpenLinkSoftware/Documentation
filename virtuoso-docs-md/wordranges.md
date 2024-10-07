<div id="wordranges" class="section">

<div class="titlepage">

<div>

<div>

### 20.2.7. Word Ranges

</div>

</div>

</div>

This feature allows returning the positions of matches of a query inside
the indexed text. This is done by creating a virtual column which gets
as its value an array of arrays, one array for each top level term of
the text query expression. The component arrays in turn contain word
positions, expressed as the ordinal number of the first and last word of
each match of the term in question. The ordinal numbers are counted from
0, skipping noise words.

<div id="id66845" class="example">

**Example 20.2. Word Ranges**

<div class="example-contents">

``` programlisting
select dbg_obj_print (r), * from ftt
    where contains (dt, 'foo', ranges, r);
    
```

Prints the array

``` screen
(L(0 0 ) )
    
```

to the server standard output, indicating that the match starts and ends
at the 0'th word, inclusive.

</div>

</div>

  

This feature can be used to show specific portions of matching documents
in applications. This is internally used as part of the xcontains
predicate for XML text. Also see the function search_excerpt ().

</div>
