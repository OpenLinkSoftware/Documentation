<div>

<div>

<div>

<div>

### 1.5.47. How can I use sub-queries to enable literal values based joins?

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### What?

</div>

</div>

</div>

Use of subqueries to enable literal values based joins.

</div>

<div>

<div>

<div>

<div>

#### Why?

</div>

</div>

</div>

Sophisticated access to literal values via subqueries provides powerful
mechanism for enhancing sparql graph patterns via dynamic literal value
generation.

</div>

<div>

<div>

<div>

<div>

#### How?

</div>

</div>

</div>

Use select list variables from subqueries to produce literal object
values in sparql graph patterns.

<div>

<div>

<div>

<div>

##### Example

</div>

</div>

</div>

Assume in the following query, where should be used a sub-query to
replace ?app:

``` programlisting
SELECT DISTINCT ?r
WHERE
  {
    graph ?g
      {
        ?r nie:url ?url .
      }  .
      ?g nao:maintainedBy ?app .
      ?app nao:identifier "nepomukindexer" .
  }
```

If it is not sure that ?app is the only, for e.g., the triple ?app
nao:identifier "nepomukindexer" can appear in more than one graph, then
the query should be changed to:

``` programlisting
SELECT DISTINCT ?r
WHERE
  {
    graph ?g
      {
        ?r nie:url ?url .
      }  .
      ?g nao:maintainedBy ?app .
      FILTER (?app = (SELECT ?a WHERE { ?a nao:identifier "nepomukindexer" }))
}
```

or even shorter:

``` programlisting
SELECT DISTINCT ?r
WHERE
  {
   graph ?g
     {
       ?r nie:url ?url .
     }  .
   ?g nao:maintainedBy `(SELECT ?a WHERE { ?a nao:identifier "nepomukindexer" })` .
 }
```

</div>

</div>

</div>
