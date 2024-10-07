<div id="qstxmlqtemplates_01" class="section">

<div class="titlepage">

<div>

<div>

### 17.13.2. XML Query Templates

</div>

</div>

</div>

Virtuoso XML templates allow execution of SQL/XML queries over HTTP to
obtain an XML document in response and/or perform some operation in the
database using <a href="updategrams.html" class="link"
title="15.5. Using UpdateGrams to Modify Data">updategrams</a> . XML
templates can be executed from within Virtuoso procedure language using
the
<a href="fn_xml_template.html" class="link" title="xml_template"><code
class="function">xml_template()</code></a> function. XML templates
support two types of action: SQL based or updategram based. SQL query
based templates must contain the FOR XML clause used in a SELECT
statement and hence cannot update the database. Updates to the database
can only occur from an updategram. The XML document returned from
calling an XML template can be served either raw, or transformed using
XSLT.

XML templates provide quick easy access to results from a SQL query as
usual, but now this can be saved to a file. The results are not saved,
just the query definition. You can use this feature to rapidly produce
dynamic reports that can potentially be rendered in different ways by
providing an alternate stylesheet. The report can be refined on the fly
by providing parameters for the query. The output is reachable via HTTP
directly by providing the URL to the template.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                              |
|:--------------------------:|:-----------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                    |
|                            | The <a href="xmltemplates.html" class="link" title="15.6. XML Templates">XML 
                              Templates</a> Section                                                         |

</div>

XML Templates can also be published just like normal store procedures.
This is achieved by using a PL wrapper around the XML template. Then the
store procedure is published in the normal way.

Stylesheets transformations with be inactive for published XML templates
invoked from SOAP.

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                                                                                       |
|:--------------------------:|:------------------------------------------------------------------------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                                                                             |
|                            | The Publishing Stored Procedures Section above for a further description of publishing XML Templates. |

</div>

</div>
