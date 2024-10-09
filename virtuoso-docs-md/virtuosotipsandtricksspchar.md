<div>

<div>

<div>

<div>

### 1.5.2. How Can I execute SPARQL queries containing '\$' character using ISQL?

</div>

</div>

</div>

Assuming a SPARQL query should filter on the length of labels:

``` programlisting
SELECT ?label
FROM <http://mygraph.com>
WHERE
  {
    ?s ?p ?label
    FILTER(regex(str(?label), "^.{1,256}$") )
  }
```

ISQL uses '<span class="emphasis">*\$*</span> ' character as a prefix
for macro names of its preprocessor. When
'<span class="emphasis">*\$*</span> ' character is used in SPARQL query
to be executed in ISQL, the character should be replaced with
'<span class="emphasis">*\$\$*</span> ' notation or an escape char +
numeric code:

``` programlisting
SQL> SPARQL
SELECT ?label
FROM <http://mygraph.com>
WHERE
  {
    ?s ?p ?label
    FILTER(REGEX(str(?label), "^.{1,256}$$") )
  }
```

Note also that the FILTER written in this way, finds
<span class="emphasis">*?label-s*</span> with length less than 256.

To achieve fast results, <span class="emphasis">*REGEX*</span> should be
replaced with the <span class="emphasis">*bif:length*</span> function:

``` programlisting
SQL> SPARQL
SELECT ?label
FROM <http://mygraph.com>
WHERE
  {
    ?s ?p ?label
    FILTER (bif:length(str(?label))<= 256)
  }
```

In this way the SPARQL query execution can work much faster if the
interoperability is not required and
<span class="emphasis">*?label-s*</span> are numerous.

</div>
