<div>

<div>

</div>

<div>

## Name

current — Returns a node-set that has the current node as its only
member.

</div>

<div>

## Synopsis

<div>

|                              |          |     |
|------------------------------|----------|-----|
| `node-set `**`current`**` (` | `void)`; |     |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function returns a node-set that has the current node as its only
member. For an outermost expression (an expression not occurring within
another expression), the current node is always the same as the context
node. For an expression occurring within another expression, e.g. within
predicate in some path, the current node is the same as the context node
of the first step in the path.

Please refer XSL standard before the first use of this function, to
understand exact difference between "current" and "context" node.

XSLT 1.0 states that it is an error to use the current() function in a
XSL "pattern", e.g. in "match" attribute of \<xsl:key\> element, because
patterns have no value assigned for current node assigned processing.
Instead of reporting the error, Virtuoso's XSLT processor uses context
node if current node is not set.

</div>

<div>

## Return Types

Node-set that has exactly one member.

</div>

<div>

## Examples

<div>

**Example 24.575. Function current() in top-level expression.**

<div>

These two elements produce the same result:

``` screen
<xsl:value-of select="current()"/>
<xsl:value-of select="."/>
      
```

</div>

</div>

  

<div>

**Example 24.576. Function current() inside the path.**

<div>

For current node, which is equal to context node of whole
\<xsl:apply-templates\> key, try to find such item of glossary in the
document, that the name of item is equal to "ref" attribute of current
node.

``` screen
<xsl:apply-templates select="//glossary/item[@name=current()/@ref]"/>
      
```

</div>

</div>

  

</div>

</div>
