<div id="fn_xml_namespace_scope" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xml_namespace_scope — Returns a vector of all namespace declarations in
all ancestors of the given XML entity.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xml_namespace_scope" class="funcsynopsis">

|                                        |                                   |
|----------------------------------------|-----------------------------------|
| `vector `**`xml_namespace_scope`**` (` | in `ent ` XML Entity ,            |
|                                        | in `use_default_ns ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xml_namespace_scope" class="refsect1">

## Description

The function returns a vector of even length that consists of all
declared namespace prefixes and namespace URIs from the `ent` and all
its ancestors. This information is needed for processing XML documents
that contains a mix of data and XPath expressions, such as BPEL
documents.

</div>

<div id="params_xml_namespace_scope" class="refsect1">

## Parameters

<div id="id123162" class="refsect2">

### ent

The entity to process.

</div>

<div id="id123165" class="refsect2">

### use_default_ns

Flags if the resulting array should contain declarations of default
namespace. If it is zero then only declarations of namespace prefixes
are listed; if non-zero then all declarations are listed.

</div>

</div>

<div id="ret_xml_namespace_scope" class="refsect1">

## Return Types

The function returns a vector of even length that contains narrow
strings in UTF-8 encoding.

</div>

<div id="examples_xml_namespace_scope" class="refsect1">

## Examples

<div id="ex_xml_namespace_scope" class="example">

**Example 24.515. Adding namespace declarations to the XPath
expression**

<div class="example-contents">

The function gets an entity whose string-value is an XPATH expression
and returns the text of expression with all namespace declarations that
are in scope. The resulting expression is context-independent. This is
useful for BPEL-like applications and for extracting XPATH expressions
from XML Schema documents.

``` screen
create procedure xpath_add_namespace_scope (in ent any, in use_default_ns integer)
{
  declare _expn varchar;
  declare _ses any;
  declare _scope any;
  declare _ctr any;
  _expn := charset_recode (xpath_eval ('string(.)', ent), '_WIDE_', 'UTF-8');
  _scope := xml_namespace_scope (ent, use_default_ns);
  _ctr := length (_scope);
  if (_ctr = 0)
    return _expn;
  _ses := string_output ();
  http ('[', _ses);
  while (_ctr > 0)
    {
      if (_scope[_ctr-2] = '')
        http (sprintf (' xmlns="%s"', _scope[_ctr-1]), _ses);
      else
        http (sprintf (' xmlns:%s="%s"', _scope[_ctr-2], _scope[_ctr-1]), _ses);
      _ctr := _ctr - 2;
    }
  http (' ] ', _ses);
  http (_expn, _ses);
  return string_output_string (_ses);
}

select xpath_add_namespace_scope (
  xquery_eval (
'declare namespace xsd="http://www.w3.org/2001/XMLSchema";
//xsd:keyref[@name="ISBNnumber"]/xsd:field/@xpath',
    xtree_doc (
'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"
        targetNamespace="http://www.publishing.org"
        xmlns="http://www.publishing.org">
  <xsd:element name="Book"  minOccurs="1" maxOccurs="unbounded">
    <xsd:keyref name="ISBNnumber" refer="BookDB_ISBN">
      <xsd:selector xpath="."/>
      <xsd:field xpath="ISBN"/>
    </xsd:keyref>
  </xsd:element>
  <!-- The rest of the XML Schema file is skipped -->

</xsd:schema>')),
  1 );

callret
VARCHAR
_______________________________________________________________________________

[ xmlns="http://www.publishing.org" xmlns:xsd="http://www.w3.org/2001/XMLSchema" ] ISBN
```

</div>

</div>

  

</div>

<div id="seealso_xml_namespace_scope" class="refsect1">

## See Also

<a href="fn_xpath_eval.html" class="link" title="xpath_eval"><code
class="function">xpath_eval </code></a>

</div>

</div>
