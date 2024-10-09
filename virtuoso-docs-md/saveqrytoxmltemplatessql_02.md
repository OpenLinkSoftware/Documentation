<div>

<div>

<div>

<div>

### 15.6.4. Saving XPATH Queries to XML Template

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

<div>

<div>

**Figure 15.12. Creating a new directory (collection) in WebDAV**

<div>

<div>

![Creating a new directory (collection) in
WebDAV](images/xmltemplate001.png)

</div>

</div>

</div>

  

</div>

Next we need to configure a virtual directory mapping to this so that
XML Templates can be executed later. Go to Web Application Server -\>
Virtual Domains & Directories and for your {Default Web Site} click the
link "New Directory". In the shown form click "Next":

<div>

<div>

**Figure 15.13. Configuring a Virtual Directory to respond to XML
Template requests from our Dav**

<div>

<div>

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

Now we set our sights on the XML files in WebDAV. We will perform a very
simple XPATH query on an XML source file from this documentation. We
will search for the existence of `<title>` tags in
`http://host:port/DAV/docsrc/adminui.xml` :

<div>

<div>

**Figure 15.14. XPATH query on a file in WebDAV**

<div>

<div>

![XPATH query on a file in WebDAV](images/xmltemplate009.png)

</div>

</div>

</div>

  

</div>

Make a quick mental note of the trivial result. Now we will save our
query as an XML template to be executed over HTTP. Pressing the Save
button takes us to the save XML Template page. We ensure that the file
to save is set to `/DAV/xmlt/xpath-template.xml` :

<div>

<div>

**Figure 15.15. **

<div>

<div>

![](images/xmltemplate010.png)

</div>

</div>

</div>

  

</div>

Once our query has been saved in an XML template we can test it by
pointing a web browser at the URL for the file as we configured our
virtual directory for, which will be similar to:
`http://example.com/DAV/xmlt/xpath-template.xml` :

<div>

<div>

**Figure 15.16. **

<div>

<div>

![](images/xmltemplate011.png)

</div>

</div>

</div>

  

</div>

<div>

|                            |                                          |
|:--------------------------:|:-----------------------------------------|
| ![\[Tip\]](images/tip.png) | See Also:                                |
|                            | Exposing XML Templates as Web Services . |

</div>

</div>
