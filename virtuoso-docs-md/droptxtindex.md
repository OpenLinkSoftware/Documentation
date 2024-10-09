<div>

<div>

<div>

<div>

## 20.6. Removing A Text Index

</div>

</div>

</div>

A text index is dropped by dropping the words table with DROP TABLE.
This will drop all triggers, procedures and auxiliary tables. The words
table is in the qualifier and owner of the indexed table and is named
\<table\>\_\<column\>\_WORDS.

<div>

**Example 20.6. Example**

<div>

``` programlisting
drop table DB.DBA.XML_TEXT_XT_TEXT_WORDS;
```

-- drops the text index created in the vt_create_text_index example

</div>

</div>

  

</div>
