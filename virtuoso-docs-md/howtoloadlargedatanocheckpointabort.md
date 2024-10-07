<div id="howtoloadlargedatanocheckpointabort" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.77. How to Update Large SPARQL Data avoiding due to database checkpoint abortion?

</div>

</div>

</div>

Assume while performing large SPARQL update, for example of triples
around 80 millions in total, one gets the following error which aborts
the update:

``` programlisting
"Transaction aborted due to a database checkpoint or database-wide
atomic operation. Please retry transaction" .
```

The error means that the SPARQL update has possibly encountered a
database checkpoint during the load. Thus one should check the
CheckpointInterval in the INI file and possible increase its value:

``` programlisting
;
;  Server parameters
;
[Parameters]
...
CheckpointInterval       = 60
...
```

Note: The <a
href="http://virtuoso.openlinksw.com/dataspace/dav/wiki/Main/VirtBulkRDFLoader"
class="ulink" target="_top">RDF Bulk loader</a> can be used for loading
large datasets, and it will handle the checkpoint matter automatically.

</div>
