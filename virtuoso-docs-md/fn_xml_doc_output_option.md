<div>

<div>

</div>

<div>

## Name

xml_doc_output_option

</div>

<div>

## Synopsis

<div>

|                                           |                                 |
|-------------------------------------------|---------------------------------|
| `varchar `**`xml_doc_output_option`**` (` | in `xml_entity ` any ,          |
|                                           | in `option_name ` varchar ,     |
|                                           | in `option_value ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function reads or updates the specified XSLT output option value of
the given `xml_entity` .

The function updates the option if parameter `option_value` is provided,
otherwise it returns the current value of the option without any side
effects.

Supported options are "method", "version", "encoding",
"omit-xml-declaration", "standalone", "doctype-public",
"doctype-system", "indent" and "media-type", but do not
support"cdata-section-elements". When the entity is serialized, the
effect is very similar to the effect of the same option specified in
xsl:output element of an XSLT that created the entity.

Note that output options are properties of the whole document, not
properties of some particular node in the document, so the effect of the
update is document-wide. Please also note that the effect of 'preamble'
options "omit-xml-declaration", "standalone", "doctype-public" and
"doctype-system" is visible only when the root entity of the document is
serialized, not any descendant entity. Even the serialization of
top-level element of the document is not affected by these settings. The
XML preamble is serialized only if the document is composed by an XSLT
processor or "doctype-system" is set or at least one of two boolean
properties "omit-xml-declaration" and "standalone" is set to "yes".

According to the DTD rules, "doctype-public" has no effect on
serialization if "doctype-system" is not set.

</div>

<div>

## Parameters

<div>

### xml_entity

An XML entity such as that returned by the xslt() function.

</div>

<div>

### option_name

A name of output option to in question.

</div>

<div>

### option_value

A new value of output option. This is a string or NULL (that reset
option to default). Allowed values of boolean properties
"omit-xml-declaration" and "standalone" are "yes" and "no", as it is in
XSLT 1.0.

</div>

</div>

<div>

## Return Types

The function returns a string that is a value of the option or NULL if
the option is not set.

</div>

<div>

## Errors

This function can generate the following errors:

<span class="errorcode">22023 </span><span class="errorcode">SR003
</span> Function xml_doc_output_option needs an XML entity as argument
1, not an arg of type \<type_name\> (\<type\>)

</div>

<div>

## Examples

<div>

**Example 24.512. Assessing the SYSTEM DTD location**

<div>

``` screen
create function test_output_option (
  in cnt any, in opt_name any, in opt_value any)
{
  declare xt, ses any;
  declare oldval, newval varchar;
  xt := xtree_doc (cnt, 2, '', 'UTF-8');
  oldval := xml_doc_output_option (xt, opt_name);
  xml_doc_output_option (xt, opt_name, opt_value);
  newval := xml_doc_output_option (xt, opt_name);
  return concat (
    sprintf ('Old value of "%s" is "%s"\nNew value is "%s"\nThe result:\n',
       opt_name,
       cast (oldval as varchar),
       cast (newval as varchar) ),
    serialize_to_UTF8_xml (xt) );
}

select test_output_option (
  '<div xmlns="http://www.w3.org/1999/xhtml">Hello</div>',
  'doctype-system', 'http://www.example.com/xhtml.dtd')
callret
VARCHAR
_______________________________________________________________________________

Old value of "doctype-system" is "(NULL)"
New value is "http://www.example.com/xhtml.dtd"
The result:
<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE http://www.w3.org/1999/xhtml:div
  SYSTEM "http://www.example.com/xhtml.dtd">
<n0:div xmlns:n0="http://www.w3.org/1999/xhtml">Hello</n0:div>

1 Rows. -- 1 msec.
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_xtree_doc.html" class="link" title="xtree_doc"><code
class="function">xtree_doc() </code></a>

</div>

</div>
