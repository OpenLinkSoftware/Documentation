<div>

<div>

<div>

<div>

### 1.5.23. How to exploit RDF Schema and OWL Inference Rules with minimal effort?

</div>

</div>

</div>

When you install Virtuoso, it's reasoner and highly scalable inference
capabilities may not be obvious. Typical cases involve using
<span class="emphasis">*rdfs:subClassOf*</span> predicates in queries
and wondering why reasoning hasn't occurred in line with the semantics
defined in RDF Schema.

The experience applies when using more sophisticated predicates from OWL
such as <span class="emphasis">*owl:equivalentProperty*</span> ,
<span class="emphasis">*owl:equivalentClass*</span> ,
<span class="emphasis">*owl:sameAs*</span> ,
<span class="emphasis">*owl:SymmetricalProperty*</span> ,
<span class="emphasis">*owl:inverseOf*</span> etc ...

Virtuoso implemented inference rules processing in a loosely coupled
manner that allow users to conditionally apply inference context (via
rules) to SPARQL queries. Typically, you have to create these rules
following steps outlined <a href="rdfsparqlrule.html" class="link"
title="16.14. Inference Rules &amp; Reasoning">here</a> .

This tips and tricks note provides a shortcut for setting up and
exploring RDF Schema and OWL reasoning once you've installed the <a
href="http://s3.amazonaws.com/opldownload/uda/vad-packages/6.1/virtuoso/fct_dav.vad"
class="ulink" target="_top">Virtuoso Faceted Browser VAD package</a> .

<div>

<table data-border="0" data-summary="Tip: See Also:">
<colgroup>
<col style="width: 50%" />
<col style="width: 50%" />
</colgroup>
<tbody>
<tr class="odd">
<td rowspan="2" style="text-align: center;" data-valign="top"
width="25"><img src="images/tip.png" alt="[Tip]" /></td>
<td style="text-align: left;">See Also:</td>
</tr>
<tr class="even">
<td style="text-align: left;" data-valign="top"><p><a
href="rdfsparqlrule.html" class="link"
title="16.14. Inference Rules &amp; Reasoning">Inference Rules and
Reasoning</a></p>
<p><a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VirtFacetBrowserInstallConfig"
class="ulink" target="_top">Virtuoso Faceted Browser Installation and
configuration</a></p>
<p><a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VirtuosoFacetsWebService"
class="ulink" target="_top">Virtuoso Faceted Web Service</a></p></td>
</tr>
</tbody>
</table>

</div>

</div>
