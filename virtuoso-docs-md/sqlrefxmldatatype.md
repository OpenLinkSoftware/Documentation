<div>

<div>

<div>

<div>

## 9.3. XML Column Type

</div>

</div>

</div>

Virtuoso allows for native XML storage in a database table column using
the `LONG XML` type. This data type is a variation of `LONG VARCHAR`
that can have plain text or XML entities, persistent or non-persistent
values, but will always return an XML entity when selected.

Since ODBC does not support an XML entity type this column will appear
as a LONG VARCHAR when selected from ODBC based clients.

<div>

**Example 9.15. Using LONG XML Columns**

<div>

``` programlisting
CREATE TABLE xml_col_test (
  id INTEGER,
  txt VARCHAR,
  xmltxt LONG XML
  )
  ;

  INSERT INTO xml_col_test (id, txt, xmltxt)
    VALUES (1, 'test', '<xml><test>test</test><test>test2</test></xml>');

  INSERT INTO xml_col_test (id, txt, xmltxt)
    VALUES (2, 'test', xml_tree_doc('<xml><test>test</test><test>test2</test></xml>'));

  select * from xml_col_test;
id          txt               xmltxt
INTEGER     VARCHAR           LONG VARCHAR
____________________________________________________________________________

1           test              <xml><test>test</test><test>test2</test></xml>
2           test              <xml><test>test</test><test>test2</test></xml>
```

</div>

</div>

  

<div>

|                            |                                                                                                                        |
|:--------------------------:|:-----------------------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                                              |
|                            | The <a href="fn_xml_tree_doc.html" class="link" title="xml_tree_doc"><code                                             
                              class="function">xml_tree_doc()</code></a> also returns an XML entity and describes other functions that work with it.  |

</div>

</div>
