<div id="fn_vt_batch_d_id" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

vt_batch_d_id — Specify a document to update in a vt batch.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_batch_d_id_01" class="funcsynopsis">

|                            |                     |
|----------------------------|---------------------|
| ` `**`vt_batch_d_id`**` (` | in `d_id ` any `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vt_batch_d_id_01" class="refsect1">

## Description

Multiple documents may be indexed or unindexed with a single batch. In
this case this function will be called for each document id, in
ascending order of ID.

</div>

<div id="params_vt_batch_d_id_01" class="refsect1">

## Parameters

<div id="id118786" class="refsect2">

### d_id

the free text document ID of the row whose index entry is to be updated.

</div>

</div>

<div id="errors_vt_batch_d_id_01" class="refsect1">

## Errors

<div id="id118791" class="table">

**Table 24.115. Errors signalled by**

<div class="table-contents">

| SQLState                        | Error Code                      | Error Text                      | Description |
|---------------------------------|---------------------------------|---------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode"></span> | <span class="errortext"></span> |             |

</div>

</div>

  

</div>

<div id="seealso_vt_batch_d_id_01" class="refsect1">

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
