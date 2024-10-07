<div id="virtuosotipsandtricksdumparbqntr" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.24. How can I dump arbitrary query result as N-Triples?

</div>

</div>

</div>

Assume the following arbitrary query:

``` programlisting
SPARQL define output:format "NT"
CONSTRUCT { ?s a ?t }
FROM virtrdf:
WHERE { ?s a ?t };
```

For iteration over result-set of an arbitrary query, use
<a href="fn_exec_next.html" class="link" title="exec_next"><code
class="function">exec_next()</code></a> in a loop that begins with
<a href="fn_exec.html" class="link" title="exec"><code
class="function">exec()</code></a> with cursor output variable as an
argument and ends with
<a href="fn_exec_close.html" class="link" title="close"><code
class="function">exec_close()</code></a> after it is out of data.

</div>
