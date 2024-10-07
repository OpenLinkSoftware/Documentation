<div id="xmlforproducingvsp" class="section">

<div class="titlepage">

<div>

<div>

### 14.3.11. XML & XSLT Generated VSP Pages

</div>

</div>

</div>

The Virtuoso HTTP server provides a special case for producing VSP
pages. For this purpose the extensions .vxml and .vxsl are reserved. If
the requested document is named dummy.vxml then the HTTP server will try
to locate dummy.vxsl. If the dummy.vxsl exists then it will perform an
XSLT transformation using .vxml as a target XML document and .vxsl as a
XSLT stylesheet. After successful transformation it will compile a
result from it in the usual way and then perform execute.

The requirements are: XML document with extension .vxml, XSLT sheet with
the same name, location but extension .vxsl. The location of these files
must be set to allow execution (see
<a href="ch-webappdevelopment.html#virtdir" class="link"
title="14.1.2. Virtual Directories">Virtual Directories Support and
Execution Privileges</a> ).

<div id="ex_vxsl1" class="example">

**Example 14.14. Executable (V)XSL**

<div class="example-contents">

Source of portfolio.vxml

``` programlisting
<?xml version="1.0"?>
<?xml-stylesheet type="text/xsl" href="portfolio.xsl"?>
<portfolio xmlns:dt="urn:schemas-microsoft-com:datatypes" xml:space="preserve">
<stock exchange="nyse">
<name>zacx corp</name>
<symbol>ZCXM</symbol>
<price dt:dt="number">28.875</price>
</stock>
<stock exchange="nasdaq">
<name>zaffymat inc</name>
<symbol>ZFFX</symbol>
<price dt:dt="number">92.250</price>
</stock>
<stock exchange="nasdaq">
<name>zysmergy inc</name>
<symbol>ZYSZ</symbol>
<price dt:dt="number">20.313</price>
</stock>
</portfolio>
```

Source of portfolio.vxsl

``` programlisting
<?xml version='1.0'?>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/TR/WD-xsl">

  <xsl:template match="/">
<HTML>
<BODY>
<TABLE BORDER="2">
<TR>
<TD>Symbol</TD>
<TD>Name</TD>
<TD>Price</TD>
</TR>
<xsl:for-each select="portfolio/stock">
<TR>
<TD><xsl:value-of select="symbol"/></TD>
<TD><xsl:value-of select="name"/></TD>
<TD><xsl:value-of select="price"/></TD>
</TR>
</xsl:for-each>
</TABLE>
</BODY>
</HTML>
</xsl:template>
</xsl:stylesheet>
```

The result of retrieving portfolio.vxml

``` programlisting
<HTML>
<BODY>
<TABLE BORDER="2">
<TR><TD>Symbol</TD><TD>Name</TD><TD>Price</TD></TR>
<TR><TD>ZCXM</TD><TD>zacx corp</TD><TD>28.875</TD></TR>
<TR><TD>ZFFX</TD><TD>zaffymat inc</TD><TD>92.250</TD></TR>
<TR><TD>ZYSZ</TD><TD>zysmergy inc</TD><TD>20.313</TD></TR>
</TABLE>
</BODY>
</HTML>
```

</div>

</div>

  

</div>
