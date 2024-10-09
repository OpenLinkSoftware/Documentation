<div>

<div>

</div>

<div>

## Name

xml_view_dtd — returns an XML DTD for the output of given XML VIEW

</div>

<div>

## Synopsis

<div>

|                                  |                                 |
|----------------------------------|---------------------------------|
| `varchar `**`xml_view_dtd`**` (` | in `view_name ` varchar ,       |
|                                  | in `root_element ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function will return an XML DTD for the output of a given XML VIEW.
The returned DTD will be valid if the HTTP\_... output of the view is
wrapped into the specified root element.

</div>

<div>

## Parameters

<div>

### view_name

Name of an XML View.

</div>

<div>

### root_element

Name of the root element.

</div>

</div>

<div>

## Return Types

XML DTD for the given XML VIEW

</div>

<div>

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
