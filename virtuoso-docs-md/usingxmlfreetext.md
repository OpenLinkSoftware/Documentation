<div id="usingxmlfreetext" class="section">

<div class="titlepage">

<div>

<div>

### 15.4.5. Using XML and Free Text

</div>

</div>

</div>

Virtuoso integrates classic free text retrieval and XML semi-structured
query features to offer a smart, scalable XML repository. When a column
is declared as indexed XML with the CREATE TEXT XML INDEX statement the
text is checked for well-formedness at time of storage. The specific XML
structure of the text is also considered when making the free text index
entries. This XML-aware free text index is used for processing XPath
queries in the *`xcontains`* SQL predicate. This predicate is only
applicable to columns for which there is an XML free text index.

Arbitrary free text criteria can appear inside the XPath expression of
*`xcontains`* . These are introduced by the XPath extension function
`text-contains()` , which may only be used within *`xcontains`* as it
relies on the underlying free text index.

<div class="note" style="margin-left: 0.5in; margin-right: 0.5in;">

|                              |                                                                                                                           |
|:----------------------------:|:--------------------------------------------------------------------------------------------------------------------------|
| ![\[Note\]](images/note.png) | Note                                                                                                                      |
|                              | `xpath_contains()` does not require the existence of a free text index and can thus apply to any well-formed XML content. |

</div>

</div>
