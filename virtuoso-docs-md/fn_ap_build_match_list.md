<div id="fn_ap_build_match_list" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

AP_BUILD_MATCH_LIST — Returns report of all occurrences of phrases from
the specified sets in the text.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_ap_build_match_list" class="funcsynopsis">

|                                  |                                           |
|----------------------------------|-------------------------------------------|
| ` `**`AP_BUILD_MATCH_LIST`**` (` | in `phrase_set_ids ` vector of integers , |
|                                  | in `source_UTF8_text ` varchar not null , |
|                                  | in `lang_name ` varchar not null ,        |
|                                  | in `source_text_is_html ` integer ,       |
|                                  | in `report_flags ` integer `)`;           |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_ap_build_match_list" class="refsect1">

## Description

Forms a report that lists all occurrences of phrases from the specified
sets in the text.

The report describes "phrase hits", i.e. occurrences of annotation
phrases in the text, using "arrows" that point to specific fragments in
the text, such as words of found phrases or HTML tags.

The structure of the report is complicated, due to contradiction in
requirements. It is compact to provide reasonable performance and
scalability, so common data should not be repeated, saving memory. It is
complete enough to prevent application from reading omitted data from
system tables, saving time.

All objects of one type are listed as items of some vector and the whole
report consists of several such vectors. An item in one vector may refer
to item in other vector by its index, without storing a local copy.

Detailed description of the report structure can be found
<a href="sqlreffastphrasematchapi.html" class="link"
title="9.33.2. Phrase Set Configuration API">here</a> .

</div>

<div id="params_ap_build_match_list" class="refsect1">

## Parameters

<div id="id103136" class="refsect2">

### phrase_set_ids

vector of numeric identifiers of phrase sets at work, they may belong to
various phrase classes, but if language of some phrase set differs from
value of lang_name argument then the phrase set is silently ignored.

</div>

<div id="id103139" class="refsect2">

### source_UTF8_text

a plain text or an HTML

</div>

<div id="id103142" class="refsect2">

### lang_name

language name

</div>

<div id="id103145" class="refsect2">

### source_text_is_html

0 for plain text, 1 for standard-compliant HTML or 2 for "dirty" HTML

</div>

<div id="id103148" class="refsect2">

### report_flags

Report flag

</div>

</div>

<div id="examples_ap_build_match_list" class="refsect1">

## Examples

<div id="ex_ap_build_match_list" class="example">

**Example 24.294. Simple Use**

<div class="example-contents">

Usage example can be found
<a href="sqlreffastphraseexample.html" class="link"
title="9.33.4. Example">here</a> .

</div>

</div>

  

</div>

<div id="seealso_ap_build_match_list" class="refsect1">

## See Also

<a href="fn_ann_phrase_class_add.html" class="link"
title="DB.DBA.ANN_PHRASE_CLASS_ADD"><code
class="function">DB.DBA.ANN_PHRASE_CLASS_ADD </code></a>

<a href="fn_ann_phrase_class_del.html" class="link"
title="DB.DBA.ANN_PHRASE_CLASS_DEL"><code
class="function">DB.DBA.ANN_PHRASE_CLASS_DEL </code></a>

</div>

</div>
