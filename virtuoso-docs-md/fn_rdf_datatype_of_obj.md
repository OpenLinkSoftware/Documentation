<div id="fn_rdf_datatype_of_obj" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

DB.DBA.RDF_DATATYPE_OF_OBJ — Returns the datatype of a given argument.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_rdf_datatype_of_obj" class="funcsynopsis">

|                                         |                         |
|-----------------------------------------|-------------------------|
| ` `**`DB.DBA.RDF_DATATYPE_OF_OBJ`**` (` | in `arg ` any ,         |
|                                         | in `type_val ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_rdf_datatype_of_obj" class="refsect1">

## Description

Returns the datatype of a given argument.

</div>

<div id="params_rdf_datatype_of_obj" class="refsect1">

## Parameters

<div id="id101213" class="refsect2">

### arg

The argument which datatype should be returned.

</div>

<div id="id101216" class="refsect2">

### type_val

The value to be returned for untyped literal arguments. When omitted,
its default value http://www.w3.org/2001/XMLSchema#string is used.

</div>

</div>

<div id="ret_rdf_datatype_of_obj" class="refsect1">

## Return Types

any

</div>

<div id="examples_rdf_datatype_of_obj" class="refsect1">

## Examples

<div id="ex_rdf_datatype_of_obj" class="example">

**Example 24.269. Usage Examples**

<div class="example-contents">

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

</div>

  

</div>

</div>
