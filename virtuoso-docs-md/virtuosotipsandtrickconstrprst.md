<div>

<div>

<div>

<div>

### 1.5.16. How can I use CONSTRUCT with PreparedStatements?

</div>

</div>

</div>

Assume a given query which uses pragma
<span class="emphasis">*output:format '\_JAVA\_'*</span> with CONSTRUCT:

``` programlisting
SPARQL DEFINE output:format '_JAVA_'
   CONSTRUCT { ?s ?p ?o }
WHERE
  {
    ?s ?p ?o .
    FILTER (?s = iri(?::0))
  }
LIMIT 1
```

In order to work correctly, the query should be modified to:

``` programlisting
SPARQL DEFINE output:format '_JAVA_'
   CONSTRUCT { `iri(?::0)` ?p ?o }
WHERE
  {
    `iri(?::0)` ?p ?o
  }
LIMIT 1
```

Equivalent variant of the query is also:

``` programlisting
SPARQL DEFINE output:format '_JAVA_'
  CONSTRUCT { ?s ?p ?o }
WHERE
  {
    ?s ?p ?o .
    FILTER (?s = iri(?::0))
  }
LIMIT 1
```

</div>
