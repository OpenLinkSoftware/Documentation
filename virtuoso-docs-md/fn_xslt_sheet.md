<div id="fn_xslt_sheet" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xslt_sheet — declares an XSL stylesheet for use

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xslt_sheet" class="funcsynopsis">

|                         |                       |
|-------------------------|-----------------------|
| ` `**`xslt_sheet`**` (` | in `uri ` varchar ,   |
|                         | in `entity ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_xslt_sheet" class="refsect1">

## Description

This function takes a name and the root element of a parsed XML document
and defines these as a stylesheet. The unique element child of the
entity object's document should be an xsl:stylesheet element. Included
or imported stylesheets will be located relative to the base URI of the
entity passed to `xslt_sheet()` . Once a stylesheet thus defined it can
be used as the stylesheet argument of xslt.

</div>

<div id="params_xslt_sheet" class="refsect1">

## Parameters

<div id="id124725" class="refsect2">

### uri

The location of the XSLT style sheet

</div>

<div id="id124728" class="refsect2">

### entity

A valid XSL style sheet, XML entity parsed using the `xml_tree_doc() `
function

</div>

</div>

<div id="examples_xslt_sheet" class="refsect1">

## Examples

<div id="ex_xslt_sheet" class="example">

**Example 24.535. Preparing a Style Sheet from the File System**

<div class="example-contents">

The `xslt_view()` function first defines the style sheet from a file.
The `xslt_sheet()` function is called with the name and the root element
of the parsed file. `xslt_view()` next gets the string to process,
parses the string as XML and converts the parse tree into an entity
object. This is then passed to the `xslt()` function. The result is
another entity object. This is finally serialized as XML text and
written into the file *`xslt.out`* .

``` programlisting
create procedure xslt_view (in v varchar, in xst varchar)
{
  declare str, r varchar;
  xslt_sheet (xst, xml_tree_doc (xml_tree  (file_to_string (xst))));
  str := xml_view_string (v);
  r := xslt (xst, xml_tree_doc (xml_tree (str)));
  declare str any;
  str := string_output ();
  http_value (r, 0, str);
  string_to_file ('xslt.out', string_output_string (str), 0);
}
```

</div>

</div>

  

</div>

<div id="seealso_xslt_sheet" class="refsect1">

## See Also

<a href="fn_xml_tree_doc.html" class="link" title="xml_tree_doc"><code
class="function">xml_tree_doc() </code></a>

</div>

</div>
