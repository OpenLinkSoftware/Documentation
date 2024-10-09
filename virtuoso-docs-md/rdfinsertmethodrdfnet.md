<div>

<div>

<div>

<div>

### 16.9.12. Using RDF NET

</div>

</div>

</div>

<span class="emphasis">*Example:*</span>

Execute the following query:

``` programlisting
SQL> SELECT DB.DBA.HTTP_RDF_NET ('sparql load
"http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com"
into graph <http://www.openlinksw.com/>');
```

As result should be shown:

``` programlisting
callret
VARCHAR
_______________________________________________________

<?xml version="1.0" ?>
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
xmlns:vcard="http://www.w3.org/2001/vcard-rdf/3.0#"
xmlns="http://example.org/book/" xmlns:dc="http://purl.org/dc/elements/1.1/"
xmlns:ns="http://example.org/ns#">
<rdf:Description>
<callret-0>Load <http://www.openlinksw.com/dataspace/person/kidehen@openlinksw.com>
into graph <http://www.openlinksw.com/> -- done</callret-0>
</rdf:Description>
</rdf:RDF>

1 Rows. -- 1982 msec.
```

</div>
