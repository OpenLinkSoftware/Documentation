<div>

<div>

</div>

<div>

## Name

vt_batch_feed_offband — Add offband information to a free text update
batch.

</div>

<div>

## Synopsis

<div>

|                                    |                                 |
|------------------------------------|---------------------------------|
| ` `**`vt_batch_feed_offband`**` (` | in `vt_batch ` any ,            |
|                                    | in `clustered_values ` string , |
|                                    | in `is_del ` integer `)`;       |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function allows you to add offband information to a free text
update batch. This should be done by index and unindex hook functions of
the free text index if and only if the index is created with both
"CLUSTERED WITH (...)" and "USING FUNCTION" options and the hook
function returns non-zero value, i.e. disables standard indexing of the
document.

This function is needed only for very unusual free text indexes.

</div>

<div>

## Parameters

<div>

### vt_batch

must be an object returned by `vt_batch ` on which `vt_batch_d_id ` has
been called.

</div>

<div>

### clustered_values

must be a string that is made by serialization of a vector of offband
values: the length of vector is equal to number of columns listed in
"CLUSTERED WITH (...)" option of "CREATE TEXT INDEX" statement and
elements of the vector should be values of the listed fields for the
current document.

</div>

<div>

### is_del

if 0 means that the data is to be added, 1 means the data is to be
deleted.

</div>

</div>

<div>

## Return Types

The returned value may vary from version to version and should not be
user by application code

</div>

<div>

## Examples

<div>

**Example 24.447. Free text indexing of composed text clustered with
offband columns**

<div>

Table LEADS contains descriptions of articles of some set of newspapers.
Hook functions compose text that contains not only subject of article,
but also title and first name of the author. The hook function should
return non-zero value to disable default processing of text of SUBJECT
field but it also disables the default processing of offband values. If
the call of `vt_batch_feed_offband` is missing then free text search of
documents is still OK but the call like SELECT ORG_ID FROM LEADS_TEST
WHERE CONTAINS (SUBJECT, 'sample lead', OFFBAND, ORG_ID) will return
NULLs instead of correct values from ORG_ID column because they will not
be retrieved from free text index by "OFFBAND, ORG_ID".

``` screen
create table LEADS (
  ORG_ID      integer not null,     -- ID of a newspaper.
  LEAD_ID     integer not null,     -- Internal ID of an article in a newspaper.
  FREETEXT_ID integer not null,     -- Global document ID of an article.
  SUBJECT     varchar (255),        -- Brief content of an article or a lead.
  NAME_FIRST  varchar (30),     -- First name of the author.
  NAME_LAST   varchar (30),     -- Last name of the author.
  TITLE       varchar (255),        -- Title of an article.
  primary key (ORG_ID, LEAD_ID));

create procedure LEADS_SUBJECT_INDEX_HOOK (inout vtb any, inout pkeyid integer)
{
  declare text_to_index varchar;
  declare oid any;
  text_to_index := coalesce (
    (select concat (
      coalesce (SUBJECT, ''), ' ',
      coalesce (TITLE, ''), ' ',
      coalesce (NAME_FIRST, '') ) from LEADS
    where FREETEXT_ID = pkeyid), null);
  if (text_to_index is null)
    return 0;
  oid := coalesce ((select ORG_ID from LEADS where FREETEXT_ID = pkeyid), null);
  vt_batch_feed (vtb, text_to_index, 0);
  vt_batch_feed_offband ( vtb, serialize (vector (oid)), 0);
  return 1;
}

create procedure
LEADS_SUBJECT_UNINDEX_HOOK (inout vtb any, inout pkeyid integer)
{
  declare text_to_index varchar;
  declare oid any;
  text_to_index := coalesce (
    (select concat (
      coalesce (SUBJECT, ''), ' ',
      coalesce (TITLE, ''),' ',
      coalesce (NAME_FIRST, '') ) from LEADS
  where FREETEXT_ID = pkeyid), null);
  if (text_to_index is null)
    return 0;
  oid := coalesce ((select ORG_ID from LEADS where FREETEXT_ID = pkeyid), null);
  vt_batch_feed (vtb, text_to_index, 1);
  vt_batch_feed_offband ( vtb, serialize (vector (oid)), 1);
  return 1;
}

create text index on LEADS (SUBJECT) with key FREETEXT_ID
clustered with (ORG_ID) using function;
```

</div>

</div>

  

</div>

<div>

## See Also

<a href="fn_vt_drop_ftt.html" class="link"
title="VT_DROP_FTT">vt_drop_ftt</a>

<a href="fn_vt_batch.html" class="link" title="vt_batch">vt_batch</a>

<a href="fn_vt_batch_feed.html" class="link"
title="vt_batch_feed">vt_batch_feed</a>

<a href="fn_vt_batch_update.html" class="link"
title="VT_BATCH_UPDATE">vt_batch_update</a>

<a href="fn_vt_create_text_index.html" class="link"
title="vt_create_text_index">vt_create_text_index</a>

</div>

</div>
