<div id="determinedatausagetip" class="section">

<div class="titlepage">

<div>

<div>

### 1.5.74. How can I Determine the data usage across a Virtuoso instance?

</div>

</div>

</div>

<div id="determinedatausagetipwhat" class="section">

<div class="titlepage">

<div>

<div>

#### What?

</div>

</div>

</div>

How to determine the data usage across a Virtuoso instance.

</div>

<div id="determinedatausagetipwhy" class="section">

<div class="titlepage">

<div>

<div>

#### Why?

</div>

</div>

</div>

There are times when a variety of DBMS activities (e.g., automated
content crawling) can lead to increase in database size, without the
instance operator being fully aware of such activities and their
consequences.

</div>

<div id="determinedatausagetiphow" class="section">

<div class="titlepage">

<div>

<div>

#### How?

</div>

</div>

</div>

Run the following statement:

``` programlisting
    SELECT TOP 20 * FROM sys_index_space_stats ORDER BY iss_pages DESC;

Query result:
ISS_KEY_TABLE ISS_KEY_NAME ISS_KEY_ID            ISS_NROWS       ISS_ROW_BYTES ISS_BLOB_PAGES ISS_ROW_PAGES ISS_PAGES
 WS.WS.SYS_DAV_RES         WS.WS.SYS_DAV_RE..    492   630627      437635794     501049         57521         558570
 DB.DBA.RDF_QUAD           DB.DBA.RDF_QUAD       487   25134153  321502272     0                49779         49779
 DB.DBA.RDF_QUAD           RDF_QUAD_POGS         489   14749814  307163163     0                47191         47191
 WS.WS.SYS_DAV_RES....     DB.DBA.RDF_OBJ        501   1139934   160445830     10748          21478         32226
 WS.WS.SYS_DAV_RES         WS.WS.SYS_DAV_RE..    729   432       307124        28840          97            28937
 DB.DBA.RDF_IRI            DB.DBA.RDF_IRI        485   4378779   138542078     0                22479         22479
 DB.DBA.RDF_IRI            DB_DBA_RDF_IRI_UN..   486   4259557   139496730     0                20187         20187
......
```

</div>

</div>
