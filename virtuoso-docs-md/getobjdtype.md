<div id="getobjdtype" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.49. How can I get object datatype?

</div>

</div>

</div>

To get object datatype should be used the internal Virtuoso/PL function
<a href="fn_rdf_datatype_of_obj.html" class="link"
title="DB.DBA.RDF_DATATYPE_OF_OBJ"><code
class="function">DB.DBA.RDF_DATATYPE_OF_OBJ</code></a> , visible in
SPARQL as sql:RDF_DATATYPE_OF_OBJ.

Suppose the following scenario:

``` programlisting
# Explicit typecast (insert)
SQL> sparql insert into <test_datatype> { <a> <string> "string 1"^^xsd:string . };
callret-0
VARCHAR
_______________________________________________________________________________

Insert into <test_datatype>, 1 (or less) triples -- done

1 Rows. -- 94 msec.

#Not explicit typecast (insert)
SQL> sparql insert into <test_datatype> { <a> <string> "string 2". };
callret-0
VARCHAR
_______________________________________________________________________________

Insert into <test_datatype>, 1 (or less) triples -- done

1 Rows. -- 16 msec.

SQL> SPARQL
SELECT ?o (iri(sql:RDF_DATATYPE_OF_OBJ(?o, 'untyped!')))
FROM <test_datatype> { <a> <string> ?o} ;
o                       callret-1
VARCHAR                 VARCHAR
_______________________________________________________________________________

string 1                http://www.w3.org/2001/XMLSchema#string
string 2                untyped!

2 Rows. -- 16 msec.
SQL>
```

</div>
