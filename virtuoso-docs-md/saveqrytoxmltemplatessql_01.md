<div id="saveqrytoxmltemplatessql_01" class="section">

<div class="titlepage">

<div>

<div>

### 15.6.3. Saving XQUERY Queries to XML Template

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

<div id="xmltemplate001x" class="figure">

**Figure 15.8. Creating a new directory (collection) in WebDAV**

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

<div id="xmltemplate004x" class="figure">

**Figure 15.9. Configuring a Virtual Directory to respond to XML
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

Now we go to XML -\> XQuery -\> XQuery Advanced.

We will start by testing the following query against the Demo database

``` programlisting
<bib>
   {
   for $b in document("bib.xml")/bib/book
   where $b/publisher = "Addison-Wesley" and $b/@year > 1991
   return
      <book year = {$b/@year}>
         {$b/title}
      </book>
   }
</bib>
```

<div class="figure-float">

<div id="xmltemplate007" class="figure">

**Figure 15.10. XQUERY query against the Demo database**

<div class="figure-contents">

<div class="mediaobject">

![XQUERY query against the Demo database](images/xmltemplate007.png)

</div>

</div>

</div>

  

</div>

Now we will save this as an XML template by pressing the Save button.
The query we used will be copied to the save XML template page. We will
ensure that the name of the file is `/DAV/xmlt/xquery-template.xml` :

<div class="figure-float">

<div id="xmltemplate008" class="figure">

**Figure 15.11. Saving the XML template for the Xquery query**

<div class="figure-contents">

<div class="mediaobject">

![Saving the XML template for the Xquery
query](images/xmltemplate008.png)

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
