<div>

<div>

<div>

<div>

### 1.5.31. How can I replicate all graphs?

</div>

</div>

</div>

To replicate all graphs ( except the system graph
http://www.openlinksw.com/schemas/virtrdf# ), one should use
http://www.openlinksw.com/schemas/virtrdf#rdf_repl_all as graph IRI:

``` programlisting
SQL> DB.DBA.RDF_RDF_REPL_GRAPH_INS ('http://www.openlinksw.com/schemas/virtrdf#rdf_repl_all');
```

</div>
