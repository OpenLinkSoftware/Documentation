<div>

<div>

<div>

<div>

### 15.6.5. Programmatic Examples

</div>

</div>

</div>

<div>

**Example 15.19. Executing an XML template from the file system**

<div>

First step is to setup the /xmlt directory on file system. The function
<a href="fn_vhost_define.html" class="link" title="VHOST_DEFINE"><code
class="function">vhost_define()</code></a> will be used to enable
execution of XML templates. DBA privileges are required to use this
function:

``` programlisting
SQL> vhost_define (lpath=>'/xmlt', ppath=>'/xmlt/',
  vsp_user=>'demo', opts=>vector('xml_templates', 'yes'));
```

Now the following files must be stored as: \<www-root\>/xmlt/file1.xml

``` programlisting
<?xml version ='1.0' encoding='UTF-8'?>
 <root xmlns:sql='urn:schemas-openlink-com:xml-sql' sql:xsl='shippers.xsl'>
   <!-- XML template example -->

   <!-- parameters declaration -->

    <sql:header>
      <sql:param name=":ShipperID">2</sql:param>
      <sql:param name=":CompanyName">United Package (you should see me)</sql:param>
      <sql:param name=":Phone">(503) 555-3199</sql:param>
    </sql:header>
   <!-- XML updategram , this will update the second record -->

    <sql:sync>
        <sql:before>
            <Shippers sql:id="1" ShipperID=":ShipperID"/>
        </sql:before>
        <sql:after>
            <Shippers sql:id="1" ShipperID=":ShipperID" CompanyName=":CompanyName" Phone=":Phone"/>
        </sql:after>
    </sql:sync>
   <!-- make a parametrized query -->

   <sql:query>
      SELECT ShipperID, CompanyName,Phone FROM Shippers where ShipperID = :ShipperID FOR XML AUTO
   </sql:query>
   <!-- make an error to see what happens -->

   <sql:query>
      select * from NotExist for xml auto
   </sql:query>
</root>
```

Now we want an XSL stylesheet stored as: \<www-root\>/xmlt/shippers.xslt
containing the following:

``` programlisting
<?xml version="1.0"?>

<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    <xsl:output method="html" indent="yes" />

  <xsl:template match="/">
    <html>
        <head>
        <title>Shippers list</title>
        </head>
        <body>
        <xsl:apply-templates/>
        </body>
    </html>
    </xsl:template>

  <xsl:template match="root">
    <table>
        <tr><td>ID</td><td>Name</td><td>Phone</td></tr>
        <xsl:apply-templates/>
    </table>
    </xsl:template>

  <xsl:template match="Shippers">
    <tr>
        <td><xsl:value-of select="@ShipperID"/></td>
        <td><xsl:value-of select="@CompanyName"/></td>
        <td><xsl:value-of select="@Phone"/></td>
    </tr>
    </xsl:template>
</xsl:stylesheet>
```

Point your web browser to:

``` programlisting
http://[host:port]/xmlt/file1.xml
```

and then at:

``` programlisting
http://[host:port]/xmlt/file1.xml?:ShipperID=3
```

for the results.

</div>

</div>

  

<div>

**Example 15.20. Executing an XML template from WebDAV**

<div>

The first step is to create a new DAV collection and configure it to
allow XML template execution. DBA privileges are required for these
operations. To create a DAV collection the function
<a href="fn_dav_api_add.html" class="link"
title="DAV add &amp; update functions"><code
class="function">dav_col_create()</code></a> can be used, followed by
the
<a href="fn_vhost_define.html" class="link" title="VHOST_DEFINE"><code
class="function">vhost_define()</code></a> function to allow XML
template execution:

``` programlisting
SQL> dav_col_create ('/DAV/xmlt/', '110100100', 'dav', 'dav', 'dav', 'dav');
```

``` programlisting
SQL> vhost_define (lpath=>'/DAV/xmlt', ppath=>'/DAV/xmlt/',
  is_dav=>1, vsp_user=>'demo', opts=>vector('xml_templates', 'yes'));
```

Now, the file can be uploaded. The same file as in the previous example
will be used, copied from the file system location to the DAV location:
\<www-root\>/DAV/xmlt/file1.xml

``` programlisting
SQL> dav_res_upload ('/DAV/xmlt/file1.xml',
  file_to_string (concat (http_root(), '/xmlt/file1.xml')), 'text/xml',
  '111101101N', 'dav', 'dav', 'dav', 'dav');
```

Likewise the XSLT stylesheet from the previous example will also be used
in the same way, placing into the DAV location:
\<www-root\>/DAV/xmlt/shippers.xslt

``` programlisting
SQL> dav_res_upload ('/DAV/xmlt/shippers.xsl',
  file_to_string (concat (http_root(), '/xmlt/shippers.xsl')),
  'text/xsl', '110100100N', 'dav', 'dav', 'dav', 'dav');
```

This example can now be demonstrated by trying the following URLs in
your web browser:

``` programlisting
http://[host:port]/DAV/xmlt/file1.xml
```

and

``` programlisting
http://[host:port]/DAV/xmlt/file1.xml?:ShipperID=3
```

</div>

</div>

  

</div>
