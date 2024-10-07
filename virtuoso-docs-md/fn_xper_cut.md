<div id="fn_xper_cut" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

xper_cut — creates a new "persistent XML"document which contains a copy
of data pointed by given XPER entity

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_xper_cut" class="funcsynopsis">

|                       |                                   |
|-----------------------|-----------------------------------|
| ` `**`xper_cut`**` (` | in `source_xper ` XML_Entity `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_75" class="refsect1">

## Description

As noted in the <a href="ch-concepts.html#storageindb" class="link"
title="Storage in Database">Storage in Database</a> section, a subtree
may be extracted from a document during writing of "persistent XML"
entity into field of type LONG VARCHAR. The procedure of converting a
subtree into complete document is known as "cutting". Cutting is
performed only for "persistent XML" documents, it has nothing common
with serialization of XML entities in form of plain XML text.

Usually it is the job of the Server itself who decides whether a cutting
operation should be performed or not, without any specific activity at
application level. The CPU time occupied due to cutting is up to 10
times greater than the CPU time of plain copying of LONG VARCHAR, but
the amount of disk I/O is about the same, so the optimization rules
discussed below are important only for time-critical, memory-located
database applications.

The Virtuoso Server tries to reduce the number of cuttings to an
absolute minimum. First of all, cutting is not performed when a given
XML entity refers to the root of the document, or to the only child of
the root, because the result of such cutting will be identical to
original document. In addition, every document remembers the result of
last cutting performed on data from this document, so if data of some
XML entity are saved in many places without saving of other XML entities
between them, cutting will be done only once and plain copying will be
done for every subsequent saving.

The only situation when cutting may be seriously optimized by the
application developer is in code like the following:

``` programlisting
declare _blank_forms, _plain, _isdn any;
_blank_forms := xml_persistent ('file://blank_forms.xml');
_plain = xpath_eval ('/forms/form[@name = ''Phone Installation'']', _blank_forms);
_isdn = xpath_eval ('/forms/form[@name = ''ISDN Installation'']', _blank_forms);
for select ID as _id, SERVICE as _service, ADDRESS as _address from CLIENTS do
{
  if (is_isdn(_service))
    {
      insert into JOB_DETAILS (ID, QUERY_XML) values (_id, _isdn);
    }
  else
    {
      insert into JOB_DETAILS (ID, QUERY_XML) values (_id, _plain);
    }
}
```

Calls of xpath_eval are outside the loop, so it is faster than retrieval
of suitable form for every selected record. But values of both \_plain
and \_isdn shares the same underlying XML document and they will be
assigned many times by the 'insert' operation. The XML document has no
place to cache two results of cuttings, so new cutting will be done
every time when \_isdn entity is saved after \_plain or \_plain saved
after \_isdn. To optimize, it is better to cut them once outside the
loop:

``` programlisting
declare _blank_forms, _plain, _isdn any;
_blank_forms := xml_persistent ('file://blank_forms.xml');
_plain = xper_cut (xpath_eval ('/forms/form[@name = ''Phone Installation'']', _blank_forms));
_isdn = xper_cut (xpath_eval ('/forms/form[@name = ''ISDN Installation'']', _blank_forms));
for select ID as _id, SERVICE as _service from CLIENTS do
{
  if (is_isdn(_service))
    {
-- _isdn entity points to the root of its own document, cutting is not needed for root.
      insert into JOB_DETAILS (ID, QUERY_XML) values (_id, _isdn);
    }
  else
    {
-- similarly, _plain entity points to the root of its own document.
      insert into JOB_DETAILS (ID, QUERY_XML) values (_id, _plain);
    }
}
-- If no records found by the 'select' and no inserts done,
-- then we've made two cuts for nothing...
```

The current node of the resulting entity is the node that is a copy of
the current node of the source entity. In common, the top-level node of
the copied subtree becomes the current node of the result. There are two
special cases, however. If the source entity is an attribute entity,
then the result is also an attribute entity and the attribute name
remains the same. If the source entity points to the root of the
document, the resulting entity also points to the root, not to its
top-level node.

</div>

<div id="params_39" class="refsect1">

## Parameters

<div id="id124187" class="refsect2">

### source_xper

XML Entity

</div>

</div>

<div id="seealso_02_01" class="refsect1">

## See Also

<a href="fn_xml_cut.html" class="link" title="xml_cut">xml_doc()</a>

<a href="fn_xper_doc.html" class="link" title="xper_doc">xper_doc()</a>

<a href="fn_xper_right_sibling.html" class="link"
title="XPER navigation">xper_right_sibling(), xper_left_sibling(),
xper_parent(), xper_root_entity(), xper_tell(), xper_length()</a>

</div>

</div>
