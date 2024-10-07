<div id="saveqrytoxmltemplatessql" class="section">

<div class="titlepage">

<div>

<div>

### 15.6.2. Saving SQL Queries to XML Template

</div>

</div>

</div>

Using the Conductor Administration Interface, we are going to make and
save a query to an XML template in WebDav, and then demonstration its
use from a browser.

First we will make a new WebDAV directory. From Web Application Server
-\> Content Management -\> Repository click the "New folder" icon and in
the shown form enter for "Folder Name": xmlt. Choose for "Owner" dav and
click the "Create" button.

<div class="figure-float">

<div id="xmltemplate001" class="figure">

**Figure 15.2. Creating a new directory (collection) in WebDAV**

<div class="figure-contents">

<div class="mediaobject">

![Creating a new directory (collection) in
WebDAV](images/xmltemplate001.png)

</div>

</div>

</div>

  

</div>

Next we need to configure a virtual directory mapping to this so that
XML Templates can be executed later. Go to Web Application Server /
Virtual Domains & Directories and for your {Default Web Site} click the
link "New Directory". In the shown form click "Next".

<div class="figure-float">

<div id="xmltemplate004" class="figure">

**Figure 15.3. Configuring a Virtual Directory to respond to XML
Template requests from our Dav**

<div class="figure-contents">

<div class="mediaobject">

![Configuring a Virtual Directory to respond to XML Template requests
from our Dav](images/xmltemplate004.png)

</div>

</div>

</div>

  

</div>

The programmatic equivalent for creating a virtual directory is the
command in iSQL:

``` programlisting
SQL>vhost_define(lpath=>'/DAV/xmlt',
                 ppath=>'/DAV/xmlt/',
                 is_dav=>1,
                 vsp_user=>'demo',
                 opts=>vector('xml_templates', 'yes'));
```

Now we go to Database/Interactive SQL and will use a simple query. Here
we are assuming that the Demo database is being used, so we will query
the Customers table:

<div class="figure-float">

<div id="xmltemplate002" class="figure">

**Figure 15.4. A SQL Query**

<div class="figure-contents">

<div class="mediaobject">

![A SQL Query](images/xmltemplate002.png)

</div>

</div>

</div>

  

</div>

<div class="figure-float">

<div id="xmltemplate002a" class="figure">

**Figure 15.5. Results**

<div class="figure-contents">

<div class="mediaobject">

![Results](images/xmltemplate002a.png)

</div>

</div>

</div>

  

</div>

Now go to XML -\> SQL-XML and enter in the query area the sql statement
from above. Here we can supply some "FOR XML" clause, "FOR XML AUTO"
being the simplest. Enter in the field "WebDAV resource path for the
result" the directory we created earlier, i.e. it should be /DAV/xmlt
and add the name of the xmltemplate to which the result will be saved,
for example: sql-template.xml So finally the value should be
`/DAV/xmlt/sql-template.xml` .

<div class="figure-float">

<div id="xmltemplate005" class="figure">

**Figure 15.6. The Save XML Template page and settings**

<div class="figure-contents">

<div class="mediaobject">

![The Save XML Template page and settings](images/xmltemplate005.png)

</div>

</div>

</div>

  

</div>

Once the template has been saved we can test it. Point your browser at
you newly created file, a URL similar to:
`http://host:port/DAV/xmlt/sql-template.xml` :

<div class="figure-float">

<div id="xmltemplate006" class="figure">

**Figure 15.7. The test results:
http://host:port/DAV/xmlt/sql-template.xml**

<div class="figure-contents">

<div class="mediaobject">

![The test results:
http://host:port/DAV/xmlt/sql-template.xml](images/xmltemplate006.png)

</div>

</div>

</div>

  

</div>

<div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">

|                            |                                          |
|:--------------------------:|:-----------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                |
|                            | Exposing XML Templates as Web Services . |

</div>

</div>
