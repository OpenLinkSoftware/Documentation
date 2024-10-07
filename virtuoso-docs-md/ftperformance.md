<div id="ftperformance" class="section">

<div class="titlepage">

<div>

<div>

## 20.9. Performance

</div>

</div>

</div>

For indexing large volumes it is critical to run the indexing process
over large volumes of data. This is accomplished by using the batch
update mode. This is activated with the VT_BATCH_UPDATE procedure.

When this mode is on the index will be updated after a settable
interval, doing all the updates accumulated since the last batch in a
single go. The size of a single batch is configurable in the
virtuoso.ini file using the FreeTextBatchSize option. This is the number
of bytes of text which will be processed as one sweep over the index. A
value of 1MB is often suitable. Even All changes are processed in a
batch at the set interval. If there are more characters of text to index
/ unindex than the batch size, the operation is broken into several
transactions, each processing about FreeTextBatchSize bytes worth of
text. This improves concurrency and cuts down on locking.

The command

``` programlisting
DB.DBA.vt_batch_update ('DB.DBA.ARTICLE', 'ON', 1);
    
```

turns on the batch mode for the article table with a 1 minute delay
between index refreshes. The table name must be fully qualified and is
case sensitive. The correct case is seen in the administration interface
tables list of the isql tables command etc.

<div id="restrictions" class="section">

<div class="titlepage">

<div>

<div>

### 20.9.1. Restrictions

</div>

</div>

</div>

If the free text document ID is an integer, which is encouraged for
compactness, the values 0 and negative are reserved.

</div>

</div>
