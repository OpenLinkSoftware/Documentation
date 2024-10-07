<div id="wxmlextentrefinxml" class="section">

<div class="titlepage">

<div>

<div>

### 15.4.3. External Entity References in Stored XML

</div>

</div>

</div>

When an XML document is stored as either text or in persistent XML
format it can contain references to external parsed entities with the
\<!entity ...\> declaration and the &xx; syntax. These are stored as
references and not expanded at storage time if the entity is external.
Such references are transparently followed by XPath and XSLT. A run-time
error occurs if the referenced resource cannot be accessed when needed.
The reference is only followed if the actual subtree is selected by
XPath or XSLT. The resource is retrieved at most once for each XPath or
XSLT operation referencing it, regardless of the number of times the
link is traversed. This is transparent, so that the document node of the
referenced entity appears as if it were in the place of the reference.

External entity references have an associated URI, which is either
absolute, with protocol identifier and full path, or relative. Virtuoso
resolves relative references with respect to the base URI of the
referencing document. If the document is stored as a column value in a
table it does not have a natural base URI; therefore, the application
must supply one if relative references are to be supported. This is done
by specifying an extra column of the same table to contain a path, in
the form of collections delimited by slashes, like the path of a DAV
resource or a Unix file system path. This base URI is associated with an
XML column with the IDENTIFIED BY declaration:

``` programlisting
create table XML_TEXT (
    XT_ID integer,
    XT_FILE varchar,
    XT_TEXT long varchar identified by xt_file,
        primary key (XT_ID)
    );

create index XT_FILE on XML_TEXT (XT_FILE);
```

Thus, each time the value of *`xt_text`* is retrieved for XML processing
by `xpath_contains()` or `xcontains()` the base URI is taken from
*`xt_file`* . The complete URI for the *`xt_text`* of a column of the
sample table would be:

``` programlisting
virt://<qualified table name>.<uri column>.<text column>:<uri column value>
```

An example would be:

``` programlisting
"virt://DB.DBA.XML_TEXT.XT_FILE.XT_TEXT:sqlreference.xml"
```

The '..' and '.' in relative paths are treated like file names when
combining relative references to base URIs. A relative reference without
a path just replaces the last part of the path in the base URI.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                      |
|:--------------------------:|:---------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                            |
|                            | <a href="fn_xml_uri_get.html" class="link" title="xml_uri_get"><code 
                              class="function">xml_uri_get()</code> and <code                       
                              class="function">xml_uri_merge()</code></a> for more details.         |

</div>

</div>
