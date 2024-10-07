<div id="xmldom" class="section">

<div class="titlepage">

<div>

<div>

## 15.11. Changing XML entities in DOM style

</div>

</div>

</div>

An application may need to perform small irregular changes in an XML
document. It can be time-consuming to create a modified copy of a whole
document for making each small change. It can be also hard to express
condition for making the change in terms of XPath in order to use XSLT
or XQuery.

Virtuoso offers a way to modify an existing XML entity by local
operations like "insert a subtree before current node" or "replace one
subtree with a given one". These operations are called DOM operations
because they are similar to JavaScript operations with the Document
Object Model.

DOM operations are the only operations that change an existing XML
document instead of creating a new modified document. It is very
important to understand that one document can be shared between many XML
entities so changes made via one entity may affect data accessible via
other entities that share the same document. Every XML document has
special flags to "lock" its content and thus prevent the content from
being changed. E.g. XSLT and XQuery processors optimize access to the
source document in hope that every access to any entity will produce the
same result during the whole run of the processor. If an extension
function will modify the source document in the middle then the result
of the processing is probably corrupted and this error may be very hard
to detect and debug. To prevent this sort of problems, the XSLT
processor locks the source at start and unlock at end so any attempt to
modify the source during the run will signal an error. The document can
be locked in the following cases:

<div class="itemizedlist">

- The document is the source of the XSLT processing that is in progress.

- The document contains the context node that is passed to the XQuery
  processor at start.

- The document is used as a external generic entity in some other
  document.

- The document is created by the call of XPath function doc, document or
  document-literal during the processing of some other document and that
  document is still in use.

</div>

One additional issue of using DOM operations is that any DOM operation
invalidates DTD and schema validation information that was associated
with the document before the operation.

<div class="itemizedlist">

- **Schema validation status ("is validated" flag). ** E.g. if an schema
  based instance of XMLType is validated against its schema and thus it
  has set its "is validated" flag to 1 then the flag is to be reset to
  zero if the XML entity of this instance is modified by DOM operation,
  because there is no guarantee that the modified document is still
  valid against the declared schema; if the application will repeat the
  validation and it is successful then the flag will be set to 1 again.

- **DTD-based processing of ID attributes. ** A validating XML parser
  can build special dictionaries of ID attributes when it reads a
  document. These dictionaries are used by
  <a href="xpf_id.html" class="link" title="id"><code
  class="function">id</code></a> XPATH function and "pointer operator"
  of XQuery to find a node labeled by a given ID value without searching
  the whole document. Any change in document tree invalidates data in
  these dictionaries so any access to them will signal an error.

</div>

<div id="xmldomtypecasting" class="section">

<div class="titlepage">

<div>

<div>

### 15.11.1. Composing Document Fragments From DOM Function Arguments

</div>

</div>

</div>

When a DOM modification function adds some nodes to the tree, the
content of these nodes comes from values of arguments of the function.
In the most common case, some generic entity is created from one or more
arguments and the function adds the content of the entity into the
appropriate place of the document. This process is regulated by a small
set of very intuitive rules.

All data to be inserted are calculated before any modification of the
document is started. For example it is safe to insert into the document
a fragment of this document, even if it contains the point of insertion;
such operation will never cause infinite loops.

If an instance of XMLType is passed then its internal XML entity is
used.

If an argument is neither an XML entity nor a string then it is cast to
the string first.

If an argument is NULL then it is fully ignored, as if there is no such
argument at all.

A root node of a document can not be added into the tree of other
document. Instead, every child node of the root (i.e. every top-level
node of the document) is added to the target document, the order of
child nodes will be preserved. An XML document usually contains only one
top-level element node, but it also can contain comment and processing
instruction nodes at top-level. Depending on the application, such
comments and instructions may be inappropriate in the middle of the
modified document. Thus it is worth to check what the application should
insert: the root node with everything inside or only a top-level element
node.

If some function accepts a list of arguments as list of values to be
inserted, these values will be concatenated into a single generic
entity. It is important to remember that the XML document can not
contain two neighbour text nodes. If two consecutive arguments are
strings then a single node that is a concatenation of these string is
added. If the value of one argument is a string and the value of the
next argument is a tree fragment that starts with a string then this
pair of strings will also be replaced with a concatenation of these
strings. When a function inserts a text after some existing text node of
the XML document, no new node is created and the existing text node is
replaced with the text node that is the concatenation of old and new
texts.

In general, you should not expect that adding N values into the document
will add N new nodes to the document. It can add a lesser number of
nodes due to ignoring NULLs and concatenating some texts. It can also
add a greater number of nodes if some values are root nodes with many
children.

</div>

</div>
