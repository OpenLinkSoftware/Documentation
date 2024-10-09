<div>

<div>

</div>

<div>

## Name

filter — Composes trees of shallow copies of given XML entities.

</div>

<div>

## Synopsis

<div>

|                             |                            |
|-----------------------------|----------------------------|
| `node-set `**`filter`**` (` | `selection ` sequence `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function takes a single parameter which can be any expression. The
function evaluates its argument and returns a shallow copy of the nodes
that are selected by the argument, preserving any relationships that
exist among these nodes. Duplicate nodes are removed before the
processing.

The structure of the resulting node-set may be explained in the
following way. First of all, all input entities are grouped by their
documents, so we have a set of distinct documents and for every document
we have a list of entities that refers to various nodes of the document.
After that, every such document is processed separately, and the result
of processing is a node-set; the union of these node-sets will be
returned as the result of the call of filter() function. A copy of the
document is made, and a "color" is assigned to every node of the copy:
it's "black if the original node is listed in the *`selection`*
sequence, otherwise it's "white". Then "white" nodes are removed from
the copy, node after node: if a "white" node may be found, it is
replaced with list of its children. Finally, we have a list of one or
more "black" nodes whose descendants are all "black", too, and this list
is added into the resulting node-set.

(The actual algorithm is much faster and much more complicated than the
described one, but the result is identical.)

Note that this function is defined in XQuery standard, not in XPath, but
in Virtuoso it may be used freely in expression of any kind.

</div>

<div>

## Parameters

<div>

### selection

The sequence of nodes that should be included into the result

</div>

</div>

<div>

## Return Types

Node-set

</div>

<div>

## Errors

<div>

**Table 24.141. Errors signalled by filter()**

<div>

| SQLState                              | Error Code                            | Error Text                                                                                                  | Description                                                                                                           |
|---------------------------------------|---------------------------------------|-------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------|
| <span class="errorcode">XP001 </span> | <span class="errorcode">XPFB0 </span> | <span class="errortext">The argument of XQUERY function filter() must be a sequence of XML entities </span> | According to the XQuery standard, the function should signal an error if input contains values other than XML entity. |

</div>

</div>

  

</div>

<div>

## Examples

<div>

**Example 24.586. Composing table of contents**

<div>

The following example is from the XQuery standard and it illustrates how
filter() might be used to compute a table of contents for a document
that contains many levels of nested sections. The query filters the
document, retaining only section elements, title elements nested
directly inside section elements, and the text of those title elements.
Other elements, such as paragraphs and figure titles, are eliminated,
leaving only the "skeleton" of the document. The example generates a
table of contents for a document named "cookbook.xml".

``` screen
<toc>
   {
   filter(document("cookbook.xml") //
      (section | section/title | section/title/text()))
   }
</toc>
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="xpf_shallow.html" class="link" title="shallow">shallow()</a>

</div>

</div>
