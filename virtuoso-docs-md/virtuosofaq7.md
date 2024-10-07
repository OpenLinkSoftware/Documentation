<div id="virtuosofaq7" class="section">

<div class="titlepage">

<div>

<div>

### 1.4.7. Is the inferencing dynamic, or is an extra step required before inferencing can be used?

</div>

</div>

</div>

The mentioned types of inferencing are enabled by a switch in the query
and are done at run-time, with no step for materialization of entailed
triples needed. The pattern:

``` programlisting
{?s a <type>}
```

would iterate over all the RDFS subclasses of \<type\> and look for
subjects with this type.

The pattern:

``` programlisting
{<thing> a ?class}
```

will, if the match of ?class has superclasses, also return the
superclasses even though the superclass membership is not physically
stored for each superclass.

Of course, one can always materialize entailed triples by running
SPARQL/SPARUL statements to explicitly add any implied information.

If two subjects have the same inverse functional property with the same
value, they will be considered the same. For example, if two people have
the same email address, they will be considered the same.

If two subjects are declared to be owl:sameAs, either directly or
through a chain of x owl:sameAs y, y owl:sameAs z, and so on, they will
be considered the same.

These features can be individually enabled and disabled. They all have
some run time cost, hence they are optional. The advantage is that no
preprocessing of the data itself is needed before querying, and the data
does not get bigger. This is important, especially if the database is
very large and queries touch only small parts of it. In such cases,
materializing implied triples can be very costly. See discussion at
<a href="http://www.openlinksw.com/weblog/oerling/?id=1498"
class="ulink" target="_top">E Pluribus Unum</a>

</div>
