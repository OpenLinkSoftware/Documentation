<div>

<div>

</div>

<div>

## Name

xmlsql_update — Performs insert/update/delete operations based on an XML
updategram.

</div>

<div>

## Synopsis

<div>

|                            |                                 |
|----------------------------|---------------------------------|
| ` `**`xmlsql_update`**` (` | in `xml_grams ` XML_Entity ,    |
|                            | in `input_parameters ` vector , |
|                            | in `debug ` integer `)`;        |

<div>

 

</div>

</div>

</div>

<div>

## Description

`xmlsql_update() ` supports XML-based insert, update, and delete
operations performed on an existing table in the database. See
<a href="updategrams.html" class="link"
title="15.5. Using UpdateGrams to Modify Data">Updategrams basics</a> in
the "Web and XML section" for a detailed explanation.

</div>

<div>

## Parameters

<div>

### xml_grams

Mandatory parameter containing the XML document with gram(s). This can
be produced with sequential calls to the `xml_tree()` and
`xml_tree_doc() ` functions.

</div>

<div>

### input_parameters

Optional array or vector of parameter pairs (parameter_name,
parameter_value).

</div>

<div>

### debug

The debug parameter takes values 1/0 to enable(1) or disable(0) printing
of the SQL statements it generates from the updategrams on the server's
standard output. If not specified the default is disabled (0).

</div>

</div>

<div>

## Return Values

Zero, if no error is signalled.

</div>

<div>

## Errors

<div>

**Table 24.133. Errors signalled by xmlsql_update**

<div>

| Error Code                            | Error Text                                                                                       |
|---------------------------------------|--------------------------------------------------------------------------------------------------|
| <span class="errorcode">XP370 </span> | <span class="errortext">xmlsql_update needs an entity as argument </span>                        |
| <span class="errorcode">42000 </span> | <span class="errortext">xmlsql_update expects a vector of even length as second argument </span> |
| <span class="errorcode">SX999 </span> | <span class="errortext">Empty parameters list </span>                                            |
| <span class="errorcode">SX998 </span> | <span class="errortext">Too many values for query </span>                                        |
| <span class="errorcode">SX998 </span> | <span class="errortext">No columns specified in updategram </span>                               |

</div>

</div>

  

</div>

<div>

## See Also

<a href="updategrams.html" class="link"
title="15.5. Using UpdateGrams to Modify Data">Updategrams basics</a>

</div>

</div>
