<div id="usemodifyasinsert" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.64. How Can I Use MODIFY to update triples?

</div>

</div>

</div>

The following queries are equivalent:

``` programlisting
MODIFY <http://test.com/>
DELETE {?s ?p ?o}
INSERT {?s_new ?p ?o}
FROM <http://test.com/>
WHERE
{
  {
    SELECT iri(bif:replace(str(?s),"http://test.com/link","http://test.com/extra/link" ) )
      AS ?s_new ?s ?p ?o
    WHERE
      {
        ?s ?p ?o FILTER (regex (str(?s), "http://test.com/link"))
      }
  }
}
```

``` programlisting
MODIFY <http://test.com/>
DELETE {?s ?p ?o}
INSERT {`iri(?s_new)` ?p ?o}
FROM <http://test.com/>
WHERE
  {
    {
      SELECT bif:replace(str(?s),"http://test.com/link","http://test.com/extra/link" )
        AS ?s_new ?s ?p ?o
      WHERE
        {
          ?s ?p ?o FILTER (regex (str(?s), "http://test.com/link"))
        }
    }
  }
```

``` programlisting
MODIFY <http://test.com/>
DELETE {?s ?p ?o}
INSERT
  { `iri(bif:replace(str(?s),"http://test.com/link","http://test.com/extra/link" ))`  ?p ?o }
FROM <http://test.com/>
WHERE
  {
    {
      ?s ?p ?o FILTER (regex (str(?s), "http://test.com/link"))
    }
  }
}
```

</div>
