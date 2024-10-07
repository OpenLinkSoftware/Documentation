<div id="fn_xmltype.getnamespace" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

XMLType.getNamespace — Returns the namespace of the top level element
providing the instance is schema-based rather than a fragment.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xmltype.getnamespace" class="funcsynopsis">

|                                   |      |
|-----------------------------------|------|
| ` `**`XMLType.getNamespace`**` (` | `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xmltype.getnamespace" class="refsect1">

## Description

The member function returns the namespace URI of the top level element
providing that the given instance is schema-based and is well-formed.
This function returns NULL if the instance is a fragment. If there are
many top level elements then they may have different namespace URIs and
if there is no top level element then there is nothing to return. It
also returns NULL if the instance is non-schema based for compatibility.

</div>

<div id="ret_xmltype.getnamespace" class="refsect1">

## Return Types

This function returns a wide string or NULL.

</div>

<div id="examples_xmltype.getnamespace" class="refsect1">

## Examples

<div id="ex_xmltype.getnamespace" class="example">

**Example 24.550. Factors that affect the result of getNamespace()**

<div class="example-contents">

The following statements demonstrate how various circumstances may force
getNamespace() to return NULL.

``` screen
-- First of all, top level element may have a name with no namespace.
select XMLType('<local />').getNamespace()
_______________________________________________________________________________
NULL

-- Compatibility: the instance should be schema-based.
select XMLType('<z:qname xmlns:z="http://www.example.com/"/>').getNamespace()
_______________________________________________________________________________
NULL

-- This is schema-based, but top level element has no namespace.
select XMLType('<local />', 'http://www.example2.com/test.xsd').getNamespace()
_______________________________________________________________________________
NULL

-- Note that for XPATH processor return an empty string, not a NULL,
-- as a namespace uri of a name with no URI.
select xpath_eval('namespace-uri(.)', XMLType('<local />', 'http://www.example2.com/test.xsd'))
_______________________________________________________________________________

1 Rows. -- 00000 msec.

-- Schema-based instance with nonempty namespace URI.
select XMLType('<z:qname xmlns:z="http://www.example.com/"/>', 'http://www.example2.com/test.xsd').getNamespace()
_______________________________________________________________________________
http://www.example.com/

-- It also works with default namespace URIs.
select XMLType('<qname xmlns="http://www.example.com/"/>', 'http://www.example2.com/test.xsd').getNamespace()
_______________________________________________________________________________
http://www.example.com/

-- Finally, it returns NULL for fragments even if all top-level elements of
-- a fragment have identical namespace URIs.
select XMLType('
    <z:qname xmlns:z="http://www.example.com/"/>
    <z:qname xmlns:z="http://www.example.com/"/>',
  'http://www.example2.com/test.xsd').getNamespace()
_______________________________________________________________________________
NULL
```

</div>

</div>

  

</div>

<div id="seealso_xmltype.getnamespace" class="refsect1">

## See Also

<a href="fn_xmltype.isfragment.html" class="link"
title="XMLType.isFragment"><code
class="function">XMLType.isFragment() </code></a>

</div>

</div>
