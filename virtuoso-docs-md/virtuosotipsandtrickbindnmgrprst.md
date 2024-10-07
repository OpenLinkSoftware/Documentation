<div id="virtuosotipsandtrickbindnmgrprst" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.25. How do I bind named graph parameter in prepared statement?

</div>

</div>

</div>

Assume the following SPARQL query:

``` programlisting
CONSTRUCT
  {
    ?s ?p ?o
  }
FROM ?context
WHERE
  {
    ?s ?p ?o
  }
```

To bind the named graph context of the query from above, the best
solution due to performance implications, is to change the syntax of the
query as:

``` programlisting
CONSTRUCT
  {
    ?s ?p ?o
  }
WHERE
  {
    graph `iri(??)` { ?s ?p ?o }
  }
```

Note: In case of using "FROM clause", it needs a constant in order to
check at the compile time whether the IRI refers to a graph or a graph
group:

<div class="itemizedlist">

- Assume "FROM clause" is used as for ex:

  ``` programlisting
  CONSTRUCT
    {
      ?s ?p ?o
    }
  FROM `iri(??)`
  WHERE
    {
      ?s ?p ?o
    }
  ```

  <div class="itemizedlist">

  - In this case can be made security checks at the compile time (i.e.,
    once) and not waste time at the run time.

  </div>

- Assume "FROM clause" is used as for ex:

  ``` programlisting
  CONSTRUCT
    {
      ?s ?p ?o
    }
  FROM iri(??)
  WHERE
    {
      ?s ?p ?o
    }
  ```

  <div class="itemizedlist">

  - In this case a compile-time check, a run-time check or 50/50 mix of
    them can be performed, depending on the security policies.

  </div>

- FROM without constant would mean that security rules, if they present
  in the storage, are used at the run time, for every triple that
  matches every triple pattern in the default graph. This issue can be
  reproduced if FROM is not specified at all: if security differs from
  default then the effect is noticeably bad.

</div>

</div>
