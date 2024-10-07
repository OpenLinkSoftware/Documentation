<div id="txttrig" class="section">

<div class="titlepage">

<div>

<div>

## 20.4. Text Triggers

</div>

</div>

</div>

The text trigger mechanism allows implementing a broad range of content
tracking functionality. The idea is storing free text or XPATH queries
in association to a text indexed column of a table. When the content of
the table changes through inserts or updates, the new data is matched
against a base of stored queries and hits are marked into a separate
table. The data being tracked may either be plain text or XML. In the
event of XML, both free text and XPATH queries can be stored.

The benefit of the text trigger system as opposed to other forms of
periodic content tracking is that the incoming data itself indexes a
base of stored queries instead of a base of stored queries repeatedly
indexing the database. This means that only the changes are compared to
the stored queries and that queries that could not even in principle
match will not be tried. This results in a qualitatively better
performance and scalability than repeatedly running a batch of queries
over updated data and thus makes possible personalized information
filtering applications that would be impractical with other approaches.

<div id="createtxttrg" class="section">

<div class="titlepage">

<div>

<div>

### 20.4.1. Creating Text Triggers

</div>

</div>

</div>

The <span class="command">**CREATE TEXT TRIGGER**</span> statement
creates a set of tables and procedures named after the table and column
being watched. The <span class="command">**TT_QUERY\_\<xx\>**</span>
table contains the set of queries, the
<span class="command">**TT_HIT\_\<xx\>**</span> table records the
matches and the TT_USER\_\<xx\> table can be used to map stored queries
to specific users that should be notified.

Syntax:

``` programlisting
CREATE TEXT TRIGGER ON <table> [(<data_column>)]
DROP TEXT TRIGGER ON <table> [(<data_column>)]
```

The \<data_column\> is optional and must be a text indexed column.

The table to be watched by a text trigger should have a free text
indexed column. This may or may not be XML data.

The \<table\> must be text indexed before creating text trigger on it.

<div id="ex_txttrg" class="example">

**Example 20.5. Creating a Text Trigger**

<div class="example-contents">

``` programlisting
create table ftt (id integer not null primary key, dt long varchar);
create text xml index on ftt (dt);
create text trigger on ftt;
```

Adding queries to the text trigger

``` programlisting
TT_QUERY_ftt ('virtuoso and server and international',
  1, 'Virtuoso international support', 'iam@foo.bar');
```

this adds a query which will filter only documents matching words
'virtuoso', 'server' and 'international', named 'Virtuoso international
support' of the user with Id equal to 1 with e-mail notification.

``` programlisting
TT_XPATH_QUERY_ftt ('/chapter[@label = ''XI'']',
  2, 'Chapter XI changes', '');
```

this will add an XPATH query which will filter only XML documents
matching Chapter XI, named 'Chapter XI changes' of the user with Id
equal to 2 without e-mail notification.

``` programlisting
insert into ftt values (1, 'virtuoso server international');
insert into ftt values (2, 'virtuoso international');

select TTH_D_ID, TTH_T_ID, TTH_U_ID, TTH_TS from ftt_dt_HIT;
```

will produce

``` screen
TTH_U_ID    TTH_D_ID         TTH_T_ID    TTH_TS
_____________________________________________

1           1                1           2001-01-17 12:35:30
```

Meaning that row from 'ftt' with id equal to 1 matches query with TT_ID
equal to 1 defined for user with ID equal to 1. Also the hit is
registered on '2001-01-17 12:35:30'.

</div>

</div>

  

</div>

</div>
