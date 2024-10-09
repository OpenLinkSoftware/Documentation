<div>

<div>

<div>

<div>

### 6.2.6. XML Services

</div>

</div>

</div>

<div>

<div>

<div>

<div>

#### SQL-XML Statements

</div>

</div>

</div>

Go to XML/SQL-XML and enter a SQL to XML statement in the
<span class="emphasis">*SQLX or SQL-XML Query*</span> text-area:

<div>

**Example 6.15. For example:**

<div>

``` programlisting
SELECT "product".ProductID AS "id",
  "product".ProductName AS "name"
FROM
  "Demo"."demo"."Products" as "product"
FOR XML AUTO ELEMENT
```

</div>

</div>

  

<div>

<div>

**Figure 6.92. SQL-XML Statements**

<div>

<div>

![SQL-XML Statements](images/ui/sql_xml_mng_01.png)

</div>

</div>

</div>

  

</div>

Type the root XML element name into the <span class="emphasis">*Root
Element*</span> field. The results of the query will be contained within
this root element.

Type the full path and resource name where you want your XML resource to
reside under WebDAV in the <span class="emphasis">*WebDAV Resource path
for the result*</span> field. Collection(s) described in the full path
must already exist.

You may use the <span class="emphasis">*Browse*</span> button next to
the <span class="emphasis">*WebDAV Resource path for the result*</span>
field to navigate existing WebDAV collections (folders) or resources to
store the result of query.

From the "Stored Queries" tab if you choose a resource that already
exists as a query in WebDAV resource, after click the "Edit" link, the
form will automatically acquire the details from the query.

If an XSLT transformation should be performed on retrieval time then you
may either type the location of the stylesheet in the
<span class="emphasis">*Stylesheet*</span> field or press the
<span class="emphasis">*Browse*</span> button next to it to search for a
valid XSLT stylesheet from the WebDAV repository.

Provide the appropriate <span class="emphasis">*WebDAV owner*</span> and
<span class="emphasis">*group*</span> of stored result using the drop
downs provided.

Select appropriate <span class="emphasis">*permissions*</span> for the
stored result.

The query can be set to update itself at specific intervals of time or
execute every time the resource is retrieved. If
<span class="emphasis">*Persist XML*</span> is checked the query will be
executed on <span class="emphasis">*Update every*</span> 10 minutes by
default.

Press the <span class="emphasis">*Execute*</span> button to execute the
statement and store as a WebDAV resource. Use
<span class="emphasis">*Reset*</span> to clear the form

If you want to build a schema definition for the result then press the
<span class="emphasis">*Create XML Schema*</span> radio-button.

Virtuoso can provide the generated XML output with a full DTD for the
data. Press <span class="emphasis">*Create External DTD*</span> to
enable this option for the query.

</div>

<div>

<div>

<div>

<div>

#### XQuery Search

</div>

</div>

</div>

Go to XML / XQuery /Xquery Basic.

XQuery Document Search applies the XPATH expression to every realized
XML contained within the Query Scope to qualify search hit results. Note
that this does not include XML Views unless persistent.

<div>

<div>

**Figure 6.93. XPATH Query of DAV**

<div>

<div>

![XPATH Query of DAV](images/ui/dav_xpath_01.png)

</div>

</div>

</div>

  

</div>

Choose the <span class="emphasis">*Scope of Query*</span> from within
the WebDAV repository. You may define the scope as either No Context,
DAV Resource (file), DAV Collection (folder), External Document URL,
External Collection URL or Database Table. Use the
<span class="emphasis">*Browse*</span> button to browse the contents of
WebDAV to make a selection. The query will then be confined to the
selected resource or collection and its children. Then Click the button
"Next" in order to continue.

<div>

<div>

**Figure 6.94. XPATH Query of DAV**

<div>

<div>

![XPATH Query of DAV](images/ui/dav_xpath_02.png)

</div>

</div>

</div>

  

</div>

Enter that XPATH query expression into the text area that you wish to
interrogate your WebDAV XML documents with. e.g.
<span class="emphasis">*//\**</span> or
<span class="emphasis">*//title*</span>

The <span class="emphasis">*Root Element*</span> field allows you
specify the name of the root element to contain document element matches
for each document found. This aids stylesheet design.

Choose an <span class="emphasis">*Output Style Sheet*</span> by either
typing its URL or using <span class="emphasis">*Browse*</span> to select
an XSL resource from WebDAV. You only need to specify a style sheet if
you want to transform your XML results using XSLT.

Click the button "Next" in order to continue.

Choose an <span class="emphasis">*Store into*</span> location by either
typing its URL or using <span class="emphasis">*Browse*</span> to select
a DAV resource from WebDAV

Set <span class="emphasis">*Permissions*</span> for the output result.
Check "r" for read rights for Group and Users in order to view later the
saved xml file.

You may want to <span class="emphasis">*Replace the existing
resource*</span> by checking the shown check-box with this label.

Choose <span class="emphasis">*Output Type*</span> that you wish to
obtain. <span class="emphasis">*Persist XML*</span> should be selected
with Update interval im minutes or if you want to be created as XML
Template, fill in the "Create as XML Template Description" field.

Click the button "Save".

<div>

<div>

**Figure 6.95. XPATH Query of DAV**

<div>

<div>

![XPATH Query of DAV](images/ui/dav_xpath_03.png)

</div>

</div>

</div>

  

</div>

<div>

<div>

**Figure 6.96. XPATH Query of DAV**

<div>

<div>

![XPATH Query of DAV](images/ui/dav_xpath_04.png)

</div>

</div>

</div>

  

</div>

If for location you have chosen /DAV/xmlsql/xquery.xml, you can view the
saved file accessing the url: http://host:port/DAV/xmlsql/xquery.xml

<div>

<div>

**Figure 6.97. XPATH Query of DAV**

<div>

<div>

![XPATH Query of DAV](images/ui/dav_xpath_05.png)

</div>

</div>

</div>

  

</div>

</div>

</div>
