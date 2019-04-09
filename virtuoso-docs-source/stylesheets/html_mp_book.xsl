<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

<xsl:output method="html"
  doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"
  doctype-system="http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd" />

<!-- ==================================================================== -->

			<!-- Parameters -->
	<xsl:param name="imgroot">../images/</xsl:param>
	<xsl:param name="chap">overview</xsl:param>
			<!-- Parameters -->

<!-- ==================================================================== -->

<xsl:include href="html_chapter.xsl"/>

<xsl:template match="/">
<html>
  <head>
    <link rel="stylesheet" type="text/css" href="virtdoc.css"/>
    <title><xsl:value-of select="/book/chapter[@id = $chap]/title"/></title>
  <meta name="author"><xsl:attribute name="content"><xsl:apply-templates select="/book/bookinfo/authorgroup/author/firstname" /></xsl:attribute></meta>
  <meta name="copyright"><xsl:attribute name="content"><xsl:value-of select="/book/bookinfo/copyright/holder" /><xsl:text>, </xsl:text><xsl:value-of select="year-from-date(xs:date(substring(string(current-dateTime()),1,10)))" /></xsl:attribute></meta>
  <meta name="keywords" content="Virtuoso;OpenLink;Database;UDA;Web Server" />
  <meta name="generator" content="OpenLink designed XSLT sheets and XT" />
  </head>

  <body bgcolor="#FFFFFF">
<a><xsl:attribute name="name"><xsl:value-of select="/book/chapter[@id = $chap]/@id" /></xsl:attribute></a>
<div class="chaphead"><h1><xsl:value-of select="/book/chapter[@id = $chap]/title" /></h1></div>

  <xsl:apply-templates select="/book/chapter[@id = $chap]"/>

<div class="vtabfoot"> - Copyright <xsl:value-of select="year-from-date(xs:date(substring(string(current-dateTime()),1,10)))"/>, <xsl:value-of select="/book/bookinfo/copyright/holder"/> - </div>
  </body></html>
</xsl:template>

</xsl:stylesheet>
