<div>

<div>

</div>

<div>

## Name

XMLType.isFragment — The function returns 1 if the instance is an XML
generic entity or 0 if it is a plain document.

</div>

<div>

## Synopsis

<div>

|                                 |      |
|---------------------------------|------|
| ` `**`XMLType.isFragment`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function checks the number of children elements of the root of the
document root of the given instance. If there are no such documents or
there are many of them then the document is not well-formed, for example
it can not be fully validated against an XML schema. However it can be
used as a fragment of a larger document: it can be declared as an
external generic entity and then referenced in a top-level document or
in one of its subdocuments. For example a book can be stored in XML as a
root document that includes subdocuments, one or more chapter per
subdocument.

The function returns 1 if the given XMLType instance is a fragment and
returns 0 if it is a well-formed XML document.

</div>

<div>

## Return Types

Integer value 1 or 0.

</div>

<div>

## Examples

<div>

**Example 24.555. Basic test**

<div>

The table DB.DBA.SYS_USERS always contains more than one user record so
the call of XMLAGG that returns one element per record creates an valid
generic entity but not a valid document.

``` screen
select XMLAGG (XMLELEMENT ("User",U_NAME)) from DB.DBA.SYS_USERS;
callret
VARCHAR
_______________________________________________________________________________

<User>BACKUP</User><User>SOAP</User><User>dba</User><User>demo</User>

1 Rows. -- 00000 msec.
select XMLType (XMLAGG (XMLELEMENT ("User",U_NAME))).isFragment() from DB.DBA.SYS_USERS;
callret
INTEGER
_______________________________________________________________________________

1

1 Rows. -- 00000 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xmltype.getrootelement.html" class="link"
title="XMLType.getRootElement"><code
class="function">XMLType.getRootElement() </code></a>

</div>

</div>
