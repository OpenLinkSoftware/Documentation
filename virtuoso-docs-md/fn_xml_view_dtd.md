<div id="fn_xml_view_dtd" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xml_view_dtd — returns an XML DTD for the output of given XML VIEW

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xml_view_dtd" class="funcsynopsis">

|                                  |                                 |
|----------------------------------|---------------------------------|
| `varchar `**`xml_view_dtd`**` (` | in `view_name ` varchar ,       |
|                                  | in `root_element ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_72" class="refsect1">

## Description

This function will return an XML DTD for the output of a given XML VIEW.
The returned DTD will be valid if the HTTP\_... output of the view is
wrapped into the specified root element.

</div>

<div id="params_36" class="refsect1">

## Parameters

<div id="id123749" class="refsect2">

### view_name

Name of an XML View.

</div>

<div id="id123752" class="refsect2">

### root_element

Name of the root element.

</div>

</div>

<div id="ret_11_01" class="refsect1">

## Return Types

XML DTD for the given XML VIEW

</div>

<div id="seealso_45" class="refsect1">

## See Also

<a href="fn_xml_view_schema.html" class="link"
title="xml_view_schema"><code
class="function">xml_view_schema() </code></a>

<a href="fn_xml_validate_dtd.html" class="link"
title="xml_validate_dtd"><code
class="function">xml_validate_dtd() </code></a>

<a href="fn_xml_persistent.html" class="link"
title="xml_persistent"><code
class="function">xml_persistent() </code></a>

</div>

</div>
