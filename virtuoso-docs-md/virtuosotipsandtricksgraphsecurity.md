<div id="virtuosotipsandtricksgraphsecurity" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.9. How to display only some information from RDF graph?

</div>

</div>

</div>

Virtuoso supports graph-level security, as described
<a href="rdfgraphsecurity.html" class="link"
title="16.4. RDF Graphs Security">here</a> but not subject-level or
predicate-level. When exposing data that needs protected access, triples
should be confined to private name graphs which are protected by ACLs
using WebID.

Note, how you can use <a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VirtSPARQLSecurityWebID"
class="ulink" target="_top">WebID to protect Virtuoso SPARQL
endpoints</a> .

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                           |
|:--------------------------:|:----------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                 |
|                            | <a href="rdfgraphsecurity.html" class="link"              
                              title="16.4. RDF Graphs Security">RDF Graphs Security</a>  |

</div>

</div>
