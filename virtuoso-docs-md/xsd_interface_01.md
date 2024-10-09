<div>

<div>

<div>

<div>

### 15.7.4. XML Schema Functions

</div>

</div>

</div>

The Virtuoso interface to XML Schema is represented primarily by two
functions:

|                                                     |
|-----------------------------------------------------|
| <a href="fn_xml_validate_schema.html" class="link"  
 title="xml_validate_schema"><code                    
 class="function">xml_validate_schema()</code></a>    |
| <a href="fn_xml_load_schema_decl.html" class="link" 
 title="xml_load_schema_decl"><code                   
 class="function">xml_load_schema_decl()</code></a>   |

The signature of the function
<a href="fn_xml_validate_schema.html" class="link"
title="xml_validate_schema"><code
class="function">xml_validate_schema()</code></a> is the same as the
function <a href="fn_xml_validate_dtd.html" class="link"
title="xml_validate_dtd"><code
class="function">xml_validate_dtd()</code></a> . It parses and validates
an XML document. The root element of the document must contain the
*`"schemaLocation"`* attribute with the value of the document's URI.

As described above, the XML Schema Processor implemented within Virtuoso
relies on the XML Schema DTD, which is composed of two files:
"XMLSchema.dtd" and "datatypes.dtd." These files must be placed in the
system directory (see <a href="fn_xml_add_system_path.html" class="link"
title="xml_add_system_path"><code
class="function">xml_add_system_path()</code></a> ).

The following XML Schema items are not fully implemented:

|                                                                        |
|------------------------------------------------------------------------|
| facets support is primitive;                                           |
| you may only derive by restriction from the "anyType" type;            |
| enumerations are not supported;                                        |
| the "all" particle is not supported;                                   |
| elements may not be defined within an element model group declaration; |
| unions are not supported;                                              |
| "appinfo," "documentation," "list," and "notation" tags are ignored.   |

Virtuoso does not cache XML Schema documents; they are completely
reprocessed every time the document is loaded.

</div>
