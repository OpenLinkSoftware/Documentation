<div id="difcrdrdelgr" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.43. What are the differences between create, drop, clear and delete Graph?

</div>

</div>

</div>

In Virtuoso it does not matter whether <span class="emphasis">*CREATE
GRAPH*</span> and <span class="emphasis">*DROP GRAPH*</span> are called
or not. Their purpose is to provide compatibility with the original
SPARUL that was designed for Jena. Some Jena triple stores require
explicit creation of each graph (like CREATE TABLE in SQL), they report
errors if one tries to create a graph twice and so on.

For Virtuoso, a new graph is not an important system event, it has
single quad store shared by all graphs. When a graph is made by
<span class="emphasis">*CREATE GRAPH*</span> , its name is placed in an
auxiliary table that is used solely to signal appropriate errors on
CREATE graph that is CREATE-d already or on DROP of a missing graph;
this table is not used in any way in SPARQL or other subsystems. In a
perfect world, smart development tools will query that table to give
hints to a programmer regarding available graphs, but the reality is not
so perfect.

What's more important is a difference between
<span class="emphasis">*DELETE FROM g { ?s ?p ?o } FROM g WHERE { ?s ?p
?o }*</span> and <span class="emphasis">*CLEAR GRAPH g*</span> , as both
will delete all triples from the specified graph \<g\> with equal speed,
but <span class="emphasis">*CLEAR GRAPH*</span> will also delete
free-text index data about occurrences of literals in this specific
graph. So <span class="emphasis">*CLEAR GRAPH*</span> will make the
database slightly more compact and the text search slightly faster.
(Naturally, <span class="emphasis">*DROP GRAPH*</span> makes
<span class="emphasis">*CLEAR GRAPH*</span> inside, not just
<span class="emphasis">*DELETE FROM ...*</span> )

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                    |
|:--------------------------:|:-------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                          |
|                            | <a href="rdfinsertmethods.html" class="link"                       
                              title="16.9. RDF Insert Methods in Virtuoso">RDF Insert Methods in  
                              Virtuoso</a>                                                        |

</div>

</div>
