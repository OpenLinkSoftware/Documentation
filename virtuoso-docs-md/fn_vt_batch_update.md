<div id="fn_vt_batch_update" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

VT_BATCH_UPDATE — Set batch mode update of free text indexing.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_vt_batch_update_01" class="funcsynopsis">

|                                             |                                     |
|---------------------------------------------|-------------------------------------|
| `integer DB.DBA. `**`VT_BATCH_UPDATE`**` (` | in `table ` varchar ,               |
|                                             | in `flag ` varchar ,                |
|                                             | in `interval_minutes ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_vt_batch_update_01" class="refsect1">

## Description

This function controls the time of update of a text index. If flag is
ON, changes are accumulated into a change tracking table and applied as
a batch. If flag is OFF, the text index is updated in the same
transaction as the indexed data itself. The change tracking table is
automatically created and is named VTLOG\_\<q\>\_\<o\>\_\<table\>, in
the qualifier and owner of the indexed table, where q, o and table are
the qualifier, owner and name of the table. The changes accumulated into
that table can be explicitly applied to the index using the
VT_INC_INDEX\_\<q\>\_\<o\>\_\<table\> function.

</div>

<div id="params_vt_batch_update_01" class="refsect1">

## Parameters

<div id="id118967" class="refsect2">

### table

the name of the table to perform batch updating of.

</div>

<div id="id118970" class="refsect2">

### flag

If ON, updates are in batch mode, if OFF, they are synchronous.

</div>

<div id="id118973" class="refsect2">

### interval_minutes

the update interval. NULL means that updates are not scheduled.

</div>

</div>

<div id="errors_vt_batch_update_01" class="refsect1">

## Errors

<div id="id118978" class="table">

**Table 24.116. Errors signalled by**

<div class="table-contents">

| SQLState                        | Error Code                      | Error Text                      | Description |
|---------------------------------|---------------------------------|---------------------------------|-------------|
| <span class="errorcode"></span> | <span class="errorcode"></span> | <span class="errortext"></span> |             |

</div>

</div>

  

</div>

<div id="seealso_vt_batch_update_01" class="refsect1">

## See Also

<a href="fn_vt_drop_ftt.html" class="link"
title="VT_DROP_FTT">vt_drop_ftt()</a>

<a href="fn_vt_batch.html" class="link" title="vt_batch">vt_batch()</a>

<a href="fn_vt_create_text_index.html" class="link"
title="vt_create_text_index">vt_create_text_index()</a>

<a href="fn_vt_batch_feed.html" class="link"
title="vt_batch_feed">vt_batch_feed()</a>

</div>

</div>
