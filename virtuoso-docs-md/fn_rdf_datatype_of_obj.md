<div>

<div>

</div>

<div>

## Name

DB.DBA.RDF_DATATYPE_OF_OBJ — Returns the datatype of a given argument.

</div>

<div>

## Synopsis

<div>

|                                         |                         |
|-----------------------------------------|-------------------------|
| ` `**`DB.DBA.RDF_DATATYPE_OF_OBJ`**` (` | in `arg ` any ,         |
|                                         | in `type_val ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns the datatype of a given argument.

</div>

<div>

## Parameters

<div>

### arg

The argument which datatype should be returned.

</div>

<div>

### type_val

The value to be returned for untyped literal arguments. When omitted,
its default value http://www.w3.org/2001/XMLSchema#string is used.

</div>

</div>

<div>

## Return Types

any

</div>

<div>

## Examples

<div>

**Example 24.269. Usage Examples**

<div>

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
