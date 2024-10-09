<div>

<div>

</div>

<div>

## Name

AP_ADD_PHRASES — Adds phrases to given set.

</div>

<div>

## Synopsis

<div>

|                             |                                       |
|-----------------------------|---------------------------------------|
| ` `**`AP_ADD_PHRASES`**` (` | in `phrase_id ` integer ,             |
|                             | in `description_phrases ` vector `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

The function gets two arguments, the integer ID of annotation phrase set
and a vector of \$ descriptions of phrases that should be edited in that
phrase set.

Every item of vector of descriptions is in turn vector of one or two
values; first value is the text of the phrase, second value is
associated application specific data, the absence of second value
indicates that the phrase should be removed. If same text of phrase
appears in the vector of description more than once, and associated data
differ then any version of data can be stored for future use; it is the
roll of dice because the vector is reordered for faster processing.

</div>

<div>

## Parameters

<div>

### phrase_id

integer ID of the annotation phrase set

</div>

<div>

### description_phrases

vector of descriptions of phrases that should be edited in that phrase
set

</div>

</div>

<div>

## Examples

<div>

**Example 24.295. Simple Example**

<div>

``` programlisting
SQL>insert replacing DB.DBA.SYS_ANN_PHRASE_SET (APS_ID, APS_NAME, APS_OWNER_UID, APS_READER_GID, APS_APC_ID, APS_LANG_NAME, APS_APP_ENV, APS_SIZE, APS_LOAD_AT_BOOT)
values (5, 'Debug aps #5', http_dav_uid(), http_admin_gid(), 3, 'x-any', 'Debug aps #5 env', 10000, 0)
;
Done. -- 0 msec.

SQL>ap_add_phrases (5,
  vector (
    vector ('Debug5', 'Debug5 env'),
    vector ('Debug5 one', 'Debug5 one env'),
    vector ('Debug5 two', 'Debug5 two env'),
    vector ('Debug5 three', 'Debug5 three env'),
    vector ('Debug5 twenty one', 'Debug5 twenty one env'),
    vector ('Debug5 twenty two', 'Debug5 twenty two env'),
    vector ('Debug5 twenty three', 'Debug5 twenty three env')
    ) )
;
Done. -- 0 msec.
```

</div>

</div>

  

Detailed example can be found
<a href="sqlreffastphraseexample.html" class="link"
title="9.33.4. Example">here</a> .

</div>

<div>

## See Also

<a href="fn_ann_phrase_class_add.html" class="link"
title="DB.DBA.ANN_PHRASE_CLASS_ADD"><code
class="function">DB.DBA.ANN_PHRASE_CLASS_ADD </code></a>

<a href="fn_ann_phrase_class_del.html" class="link"
title="DB.DBA.ANN_PHRASE_CLASS_DEL"><code
class="function">DB.DBA.ANN_PHRASE_CLASS_DEL </code></a>

</div>

</div>
