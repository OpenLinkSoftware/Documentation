<div id="xpf_system_property" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

system-property — Returns a value of the system property identified by
the name

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="xpf_syn_system_property" class="funcsynopsis">

|                                    |                                |
|------------------------------------|--------------------------------|
| `object `**`system-property`**` (` | `property_qname ` varchar `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="xpf_desc_system_property" class="refsect1">

## Description

The function returns an object representing the value of the system
property identified by the name. If there is no such system property,
the empty string is returned.

</div>

<div id="xpf_params_system_property" class="refsect1">

## Parameters

<div id="id129405" class="refsect2">

### property_qname

a string that is a QName. The QName is expanded into a name using the
namespace declarations in scope for the expression.

</div>

</div>

<div id="xpf_ret_system_property" class="refsect1">

## Return Types

String or double precision number.

</div>

<div id="xpf_examples_system_property" class="refsect1">

## Examples

<div id="xpf_ex_system_property_1" class="example">

**Example 24.627. xsl:version**

<div class="example-contents">

xsl:version is a number giving the version of XSLT implemented by the
processor; this version returns 1.0.

``` screen
[xmlns:xsl='http://www.w3.org/1999/XSL/Transform'] system-property('xsl:version')
```

</div>

</div>

  

<div id="xpf_ex_system_property_2" class="example">

**Example 24.628. xsl:vendor**

<div class="example-contents">

xsl:vendor is a string identifying the vendor of the XSLT processor;
this version returns 'OpenLink Software'.

``` screen
[xmlns:xsl='http://www.w3.org/1999/XSL/Transform'] system-property('xsl:vendor')
```

</div>

</div>

  

<div id="xpf_ex_system_property_3" class="example">

**Example 24.629. xsl:vendor-url**

<div class="example-contents">

xsl:vendor-url is a string containing a URL identifying the vendor of
the XSLT processor; this version returns 'http://www.openlinksw.com'.

``` screen
[xmlns:xsl='http://www.w3.org/1999/XSL/Transform'] system-property('xsl:vendor-url')
```

</div>

</div>

  

<div id="xpf_ex_system_property_4" class="example">

**Example 24.630. xsl:product-name**

<div class="example-contents">

xsl:product-name is a string containing a name of XSLT processor; this
version returns 'OpenLink Virtuoso Server'.

``` screen
[xmlns:xsl='http://www.w3.org/1999/XSL/Transform'] system-property('xsl:product-name')
```

</div>

</div>

  

<div id="xpf_ex_system_property_5" class="example">

**Example 24.631. xsl:product-version**

<div class="example-contents">

xsl:product-version is a string containing a version of XSLT processor
implementation; the returned string may depend on OS, hardware and other
parameters of installation.

``` screen
[xmlns:xsl='http://www.w3.org/1999/XSL/Transform'] system-property('xsl:product-version')
```

</div>

</div>

  

</div>

<div id="xpf_seealso_system_property" class="refsect1">

## See Also

<a href="xpf_function_available.html" class="link"
title="function-available"><code
class="function">function_available </code> ()</a>

</div>

</div>
