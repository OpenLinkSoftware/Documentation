<div>

<div>

</div>

<div>

## Name

vt_batch_d_id — Specify a document to update in a vt batch.

</div>

<div>

## Synopsis

<div>

|                            |                     |
|----------------------------|---------------------|
| ` `**`vt_batch_d_id`**` (` | in `d_id ` any `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Multiple documents may be indexed or unindexed with a single batch. In
this case this function will be called for each document id, in
ascending order of ID.

</div>

<div>

## Parameters

<div>

### d_id

the free text document ID of the row whose index entry is to be updated.

</div>

</div>

<div>

## Errors

<div>

**Table 24.114. Errors signalled by**

<div>

| SQLState                        | Error Code                      | Error Text                      | Description |
|---------------------------------|---------------------------------|---------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode"></span> | <span class="errortext"></span> |             |

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_vt_drop_ftt.html" class="link"
title="VT_DROP_FTT">vt_drop_ftt()</a>

<a href="fn_vt_batch.html" class="link" title="vt_batch">vt_batch()</a>

<a href="fn_vt_batch_update.html" class="link"
title="VT_BATCH_UPDATE">vt_batch_update()</a>

<a href="fn_vt_create_text_index.html" class="link"
title="vt_create_text_index">vt_create_text_index()</a>

</div>

</div>
