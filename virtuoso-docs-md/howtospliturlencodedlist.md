<div>

<div>

<div>

<div>

### 1.5.76. How to split a urlencoded ";-" separated list of urls in a SPARQL query?

</div>

</div>

</div>

<div>

1.  Assume the following string:
    "http://example.org/test1;http://example.org/test2".

2.  In order to split the given string into two values i.e.
    http://example.org/test1 and http://example.org/test2 , one should
    use <a href="fn_split_and_decode.html" class="link"
    title="split_and_decode"><code
    class="function">split_and_decode()</code></a> which returns an
    array. Thus the
    <a href="fn_aref.html" class="link" title="aref"><code
    class="function">aref()</code></a> also needs to be used for loading
    the elements.

3.  Example:

    ``` programlisting
    SELECT bif:aref (bif:split_and_decode('http%3A%2F%2Fexample.org%2Ftest1%3Bhttp%3A%2F%2Fexample.org%2Ftest2',0), 0)
    { ?S ?P ?O }
    LIMIT 1
    ```

    <div>

    - <a href="http://bit.ly/19eOiDE" class="ulink" target="_top">View the
      SPARQL Query Definition via SPARQL Protocol URL</a>

    - <a href="http://bit.ly/18AgJS6" class="ulink" target="_top">View the
      SPARQL Query Results via SPARQL Protocol URL</a>

    </div>

</div>

</div>
