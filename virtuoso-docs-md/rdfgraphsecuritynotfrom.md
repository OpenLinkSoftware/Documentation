<div>

<div>

<div>

<div>

### 16.4.2. NOT FROM and NOT FROM NAMED Clauses

</div>

</div>

</div>

In addition to standard FROM and FROM NAMED clauses, Virtuoso extends
SPARQL with NOT FROM and NOT FROM NAMED clauses of "opposite" meaning.

``` programlisting
SELECT ... NOT FROM <x> ... WHERE {...}
```

means "SELECT FROM other graphs, but not from the given one". This is
especially useful because NOT FROM supports graph groups (NOT FROM NAMED
supports only plain graphs). So if

``` programlisting
<http://example.com/users/private>
```

is a graph group of all graphs with confidential data about users then

``` programlisting
SELECT * NOT FROM <http://example.com/users/private> WHERE {...}
```

will be restricted only to insecure data.

NOT FROM overrides any FROM and NOT FROM NAMED overrides any FROM NAMED,
the order of clauses in the query text is not important.

The SPARQL web service endpoint configuration string may contain pragmas
<span class="emphasis">*input:default-graph-exclude*</span> and
<span class="emphasis">*input:named-graph-exclude*</span> that become
equivalent to NOT FROM and NOT FROM NAMED clauses like
<span class="emphasis">*input:default-graph-uri*</span> and
<span class="emphasis">*input:named-graph-uri*</span> mimics FROM and
FROM NAMED.

</div>
