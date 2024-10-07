<div id="fn_vt_batch_feed" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

vt_batch_feed — Add words to a free text update batch.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_batch_feed_01" class="funcsynopsis">

|                            |                           |
|----------------------------|---------------------------|
| ` `**`vt_batch_feed`**` (` | in `vt_batch ` any ,      |
|                            | in `text_or_xml ` any ,   |
|                            | in `is_del ` integer ,    |
|                            | in `is_xml ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vt_batch_feed_01" class="refsect1">

## Description

This function allows you to add words to a free text update batch. It
can be called in sequence to feed group of documents that share a common
document ID and the result is similar to the single call whose
*`text_or_xml`* parameter is concatenation of documents of that group.
It is even allowed to mix XML and non-XML documents by feeding an XML
document and some text documents: the first document to feed may be an
XML document, other documents should be only texts.

If one wishes to mix XML and non-XML documents, knowledge of details of
the indexing method is needed. `vt_batch_feed` assigns a sequence number
to every word of the provided document using an internal counter. The
call of `vt_batch_d_id` not only sets document id but also resets this
counter to 0. The first element of an XML document should have number 0
so it is impossible to feed an XML document if there were other calls of
`vt_batch_feed` after the last `vt_batch_d_id` . Moreover, `xcontains`
will ignore words from text documents that were fed after the first XML
document, only `contains ` will use all data.

</div>

<div id="params_vt_batch_feed_01" class="refsect1">

## Parameters

<div id="id118852" class="refsect2">

### vt_batch

must be an object returned by `vt_batch ` on which `vt_batch_d_id ` has
been called; e.g. it can be called inside the index hook function

</div>

<div id="id118857" class="refsect2">

### text_or_xml

must be a blob, wide blob, varchar, nvarchar or XML entity object.

</div>

<div id="id118860" class="refsect2">

### is_del

if 0 means that the data is to be added, 1 means the data is to be
deleted.

</div>

<div id="id118863" class="refsect2">

### is_xml

if 1, means that the *`text_or_xml `* must be a well formed XML fragment
and that it will be indexed for use with `xcontains` . The default is 0
that means "plain text".

</div>

</div>

<div id="ret_vt_batch_feed_01" class="refsect1">

## Return Types

None.

</div>

<div id="examples_vt_batch_feed_01" class="refsect1">

## Examples

Please refer to examples for function
<a href="fn_vt_batch_feed_offband.html" class="link"
title="vt_batch_feed_offband">vt_batch_feed_offband()</a> .

</div>

<div id="seealso_vt_batch_feed_01" class="refsect1">

## See Also

<a href="fn_vt_drop_ftt.html" class="link"
title="VT_DROP_FTT">vt_drop_ftt()</a>

<a href="fn_vt_batch.html" class="link" title="vt_batch">vt_batch()</a>

<a href="fn_vt_batch_feed_offband.html" class="link"
title="vt_batch_feed_offband">vt_batch_feed_offband()</a>

<a href="fn_vt_batch_update.html" class="link"
title="VT_BATCH_UPDATE">vt_batch_update()</a>

<a href="fn_vt_create_text_index.html" class="link"
title="vt_create_text_index">vt_create_text_index</a>

</div>

</div>
