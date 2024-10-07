<div id="samplegroupconcatdigest" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.59. What is the difference between the functions SAMPLE, GROUP_CONCAT and GROUP_DIGEST?

</div>

</div>

</div>

This section demonstrates the differences between the functions
<a href="fn_sample.html" class="link" title="DB.DBA.SAMPLE"><code
class="function">SAMPLE</code></a> ,
<a href="fn_group_concat.html" class="link"
title="DB.DBA.GROUP_CONCAT"><code
class="function">GROUP_CONCAT</code></a> and
<a href="fn_group_digest.html" class="link"
title="DB.DBA.GROUP_DIGEST"><code
class="function">GROUP_DIGEST</code></a> .

Assume the following query that should get all ?assets as a list with
delimiters:

``` programlisting
SPARQL SELECT ?view ?path (sql:GROUP_CONCAT (?asset, ' ')) as ?asset_list
FROM <http://mygraph.com>
WHERE
 {
   ?view <viewPath> ?path ;
     <viewContent> ?asset ;
     <viewType>  'phyview'.
 }
;
```

This method is not universal, because conversion to strings will
eliminate the difference between strings and IRIs and there should be
some delimiter that never appears in values of ?asset. In addition, the
query may fail with "row too long" error if values of ?asset are lengthy
and/or numerous enough. It is also possible the query not work
completely free from duplicates if more than one list is desired. E.g.:

``` programlisting
SPARQL
SELECT ?view (sql:GROUP_CONCAT (?path, ' ')) as ?path_list
  (sql:GROUP_CONCAT (?asset, ' ')) as ?asset_list
FROM <http://mygraph.com>
WHERE
  {
    ?view <viewPath> ?path ;
      <viewContent> ?asset ;
      <viewType> 'phyview' .
  }
```

will not contain duplicates in lists only if either ?path or ?asset is
unique for every found ?view; but if it's so unique then there's no need
in the corresponding sql:GROUP_CONCAT().

If there are many values per property but it's enough to return any
single value and ignore the rest then use
sql:<a href="fn_sample.html" class="link" title="DB.DBA.SAMPLE"><code
class="function">SAMPLE ()</code></a> function instead of
sql:<a href="fn_group_concat.html" class="link"
title="DB.DBA.GROUP_CONCAT"><code
class="function">GROUP_CONCAT ()</code></a> .

If there are many values per property and it's better to show more than
one value but "row too long" error happens, then the
sql:<a href="fn_group_digest.html" class="link"
title="DB.DBA.GROUP_DIGEST"><code
class="function">GROUP_DIGEST ()</code></a> function can be used:

``` programlisting
SPARQL
SELECT ?view (sql:GROUP_DIGEST (?path, ' ', 1000, 1)) as ?path_list
  (sql:GROUP_DIGEST (?asset, ' ', 1000, 1)) as ?asset_list
FROM <http://mygraph.com>
WHERE
  {
    ?view <viewPath> ?path ;
      <viewContent> ?asset ;
      <viewType> 'phyview' .
  }
```

</div>
