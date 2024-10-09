<div>

<div>

</div>

<div>

## Name

system-property — Returns a value of the system property identified by
the name

</div>

<div>

## Synopsis

<div>

|                                    |                                |
|------------------------------------|--------------------------------|
| `object `**`system-property`**` (` | `property_qname ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns an object representing the value of the system
property identified by the name. If there is no such system property,
the empty string is returned.

</div>

<div>

## Parameters

<div>

### property_qname

a string that is a QName. The QName is expanded into a name using the
namespace declarations in scope for the expression.

</div>

</div>

<div>

## Return Types

String or double precision number.

</div>

<div>

## Examples

<div>

**Example 24.627. xsl:version**

<div>

xsl:version is a number giving the version of XSLT implemented by the
processor; this version returns 1.0.

``` screen
[xmlns:xsl='http://www.w3.org/1999/XSL/Transform'] system-property('xsl:version')
```

</div>

</div>

  

<div>

**Example 24.628. xsl:vendor**

<div>

xsl:vendor is a string identifying the vendor of the XSLT processor;
this version returns 'OpenLink Software'.

``` screen
[xmlns:xsl='http://www.w3.org/1999/XSL/Transform'] system-property('xsl:vendor')
```

</div>

</div>

  

<div>

**Example 24.629. xsl:vendor-url**

<div>

xsl:vendor-url is a string containing a URL identifying the vendor of
the XSLT processor; this version returns 'http://www.openlinksw.com'.

``` screen
[xmlns:xsl='http://www.w3.org/1999/XSL/Transform'] system-property('xsl:vendor-url')
```

</div>

</div>

  

<div>

**Example 24.630. xsl:product-name**

<div>

xsl:product-name is a string containing a name of XSLT processor; this
version returns 'OpenLink Virtuoso Server'.

``` screen
[xmlns:xsl='http://www.w3.org/1999/XSL/Transform'] system-property('xsl:product-name')
```

</div>

</div>

  

<div>

**Example 24.631. xsl:product-version**

<div>

xsl:product-version is a string containing a version of XSLT processor
implementation; the returned string may depend on OS, hardware and other
parameters of installation.

``` screen
[xmlns:xsl='http://www.w3.org/1999/XSL/Transform'] system-property('xsl:product-version')
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_function_available.html" class="link"
title="function-available"><code
class="function">function_available </code> ()</a>

</div>

</div>
