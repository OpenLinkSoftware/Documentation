<div>

<div>

<div>

<div>

### 1.4.6. What inferencing is supported?

</div>

</div>

</div>

Subclass, subproperty, identity by inverse-functional properties, and
owl:sameAs are processed at run time if an inference context option is
specified in the query.

There is a general-purpose transitivity feature that can be used for a
wide variety of graph algorithms. For example:

``` programlisting
SELECT ?friend
WHERE
  {
    <alice> foaf:knows ?friend option (transitive)
  }
```

would return all the people directly or indirectly known by \<alice\>.

</div>
