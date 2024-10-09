<div>

<div>

<div>

<div>

## 15.9. XSLT Transformation

</div>

</div>

</div>

Virtuoso implements XSLT 1.0 transformations as SQL callable functions.
In general, Virtuoso's XSLT processor follows the XSLT 1.0 standard as
far as possible without loss of database-related functionality. The most
important difference is in error handling. While XSLT rules assume that
almost any error must be recovered, Virtuoso will stop the
transformation in case of data access error or in case of serious
arithmetic error, such as divide by zero. This is due to the greater
complexity of the Virtuoso XSLT processor's environment. Standalone
processors generally accept a set of files as input parameters, the only
output is the resulting transformation as a file, and all configuration
parameters are listed on the command line. Virtuoso's XSLT processor may
retrieve both data and stylesheets from local filesystems, local tables,
remote datasources, or the Web. Parameters of the stylesheet
transformation may be prepared by complicated Virtuoso PL procedures and
so on. Plain XSLT processors may continue producing "dirty" output;
Virtuoso's processor will stop upon encountering serious in order to
produce helpful error diagnostics.

Another important difference is that Virtuoso has one processor for
XSLT, XPath and XQuery. The user will find this convenient because an
application may use XSLT-specific functions in XPath expressions, XQuery
functions in XSLT, and so on. If extension functions are defined for the
XSLT processor, they may also be used in XPath and XQuery expressions
without any additional operations. One caveat is that this may
invalidate some rules related to the document order of nodes in
node-sets. Both the XPath 1.0 and XSLT 1.0 standards say that some
functions must process the node that is first in document order from a
given node-set. In such cases Virtuoso's processor will process the
first node found in the node-set, regardless of whether it is actually
the first in document order or not. This is done because the old XPath
rule is nonsensical if nodes of the node-set are retrieved from more
than one document or are created in the query. The processor follows the
old rule for 99% of real expressions. Specifically, it fully matches the
standards' rules for all XPath expressions that are free of
reverse-order axes and non-standard functions.

<div>

<div>

<div>

<div>

### 15.9.1. Namespaces

</div>

</div>

</div>

In the following the

``` programlisting
xsl:
```

namespace prefix is used to mean "http://www.w3.org/XSL/Transform/1.0".
In fact all namespace URI's beginning with
"http://www.w3.org/XSL/Transform" are considered as the XSLT namespace.
The namespaces "http://www.w3.org/1999/XSL/Transform" and
"http://www.w3.org/TR/WD-xsl" are recognized as synonymous. No other
namespace URI's have special significance.

</div>

</div>
