<div id="preprocessingandext" class="section">

<div class="titlepage">

<div>

<div>

### 20.2.5. Pre-processing and Extending the Content Being Indexed

</div>

</div>

</div>

Let us consider the news application. Assume now a many to many
relationship between articles and numbered news channels.

``` programlisting
create table article_channel (
    a_id integer references article,
    c_id integer,
    primary key (a_id, c_id);
    
```

Assume further that free text search criteria be combined to channel
membership tests.

This could be expressed as follows

``` programlisting
select * from article
    where contains (description, 'sample')
    and exists
        (select 1 from article_channel
        where a_id = id and c_id = ?);
    
```

We have a random access per each hit to a table with at least the
population of the article table for each hit. The situation is yet worse
if there is an OR of multiple channel id's to which the article may
belong.

To optimize this, we may choose to add an extra word for each channel in
which the article appears. Likewise, we may add the text of the title of
the article to the text being index.

This can be done with the index hook feature.

``` programlisting
create text index on article (description)
    with key dtid clustered with (pub_date, author_name)
    using function ;
    
```

We then define the hook functions

``` programlisting
create procedure
    article_description_index_hook (inout vtb any, inout d_id any)
{
  for (select c_id from article_channel
    where a_id = composite_ref (d_id, 0))
  do
    {
      vt_batch_feed (vtb, sprintf ('ch%d', c_id), 0);
    }
  vt_batch_feed (vtb, coalesce ((select title from article
    where dtid = d_id), ''), 0);
  return 0;
}
    
```

This function gets all channel id's where the article appears and adds
the word ch\<nnnn\> where \<nnnnn\> is the channel id. Thus to look for
'xx' on channel 1 or 10 one can use the text expression xx and (ch1 or
ch10). Additionally, the text of the title is added to the text being
indexed. Note that the d_id supplied is the free text document id and
that the second part of it is the article id.

To reverse the effect, the unindex function works as follows:

``` programlisting
create procedure
    article_description_unindex_hook (inout vtb any, inout d_id any)
{
  for (select c_id from article_channel
    where a_id = composite_ref (d_id, 0))
  do
    {
      vt_batch_feed (vtb, sprintf ('ch%d', c_id), 1);
    }
  vt_batch_feed (vtb, coalesce ((select title
    from article where dtid = d_id), ''), 1);
  return 0;
}
    
```

These hooks accept 2 inout parameters, the so called vt batch and the
free text document ID of the row at hand.

The function returns 1 to indicate that it has processed all words of
the row to be indexed and 0 to indicate that it expects the default text
to be processed by the caller as normally. Returning 1 is useful for
example if extra word normalization is applied by the hook.

If the resulting index is used by `xcontains()` special predicate then
hook functions should not alter the indexing of XML documents.
`xcontains()` reads both free-text index and the actual document in
order to locate particular fragments and it may miss search hits or get
false hits if free-text index of a column does not match to the actual
content of the column. It is still safe to call `vt_batch_feed` more
than once during a single call of a hook function: first call for an
unmodified XML document in the column plus calls for additional data.

If offband columns are declared then any call of a hook function should
either return 0 or call `vt_batch_feed_offband()` before returning a
non-zero value. If this condition is violated for a document then NULL
is returned instead of correct offband value for the document without
signalling any error.

The vt batch is an opaque data structure that accumulates words that
will be added to the text index entry for a given row. The
`vt_batch_feed` function adds words to the batch, the first argument is
the vt batch, the second is the text and the third is a flag 0 for
insert and 1 for delete. The text to be associated to the d_id in the
index is the concatenation of all the text supplied by successive calls
to `vt_batch_feed` . Word proximity is defined as if all text were a
single string in the order of calling `vt_batch_feed` .

It is possible to partially alter the rtext associated with an existing
document. This could be done when adding channels to an article which
already exists. This could be done with the procedure:

``` programlisting
create procedure
    ch_add_article (in cid integer, in aid integer)
{
  declare vtb, _dtid, cname any;
  if (exists (select 1 from article_channel
    where c_id = cid and a_id = aid))
    return;

  insert into article_channel (c_id, a_id) values (cid, aid);
  select dtid into _dtid from article where id = aid;

  vtb := vt_batch (1);
  vt_batch_d_id (vtb, _dtid);
  vt_batch_feed (vtb, sprintf ('ch%d', cid), 0);
  vt_batch_process_db_dba_article (vtb);
}
    
```

This first checks if the article is already on the channel, and if not,
it makes a vt batch, gets the free text document id of the article,
associates it to the vt batch and then adds a single word, ch\<nnnn\>.
The vt batch is applied by calling the generated procedure
vt_batch_process\_\<table\>\_\<column\> with the vt batch as only
argument.

If multiple documents should be processed in one batch, it is possible
to call vt_batch_d_id multiple times to feed data about multiple
documents. In this case the successive document ids must be given in
ascending order. The batch can be processed (applied to the words table)
by calling T_BATCH_PROCESS\_\<table\>\_\<column\>, generated by the
index creation.

The sensitive columns of the UPDATE trigger generated are the free text
document id, the CLUSTERED WITH columns and the main text column. If
more columns are needed for hook functions etc., the triggers should be
manually edited.

If an explicit integer document ID column is specified, its value may
not be 0 or negative.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                                      |
|:--------------------------:|:---------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also                                                                                                             |
|                            | <a href="fn_vt_batch.html" class="link" title="vt_batch">vt_batch</a> , <a href="fn_vt_batch_feed.html" class="link" 
                              title="vt_batch_feed">vt_batch_feed</a> , <a href="fn_vt_batch_feed_offband.html" class="link"                        
                              title="vt_batch_feed_offband">vt_batch_feed_offband</a> , <a href="fn_vt_batch_d_id.html" class="link"                
                              title="vt_batch_d_id">vt_batch_d_id</a> .                                                                             |

</div>

</div>
