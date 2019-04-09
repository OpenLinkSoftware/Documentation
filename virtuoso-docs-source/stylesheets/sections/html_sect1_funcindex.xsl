<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>

<xsl:output method="html"
  doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"
  doctype-system="http://www.w3.org/TR/1999/REC-html401-19991224/loose.dtd" />

<xsl:include href="html_sect1.xsl"/>
<!-- ==================================================================== -->
<!-- Parameters -->
<xsl:param name="imgroot">../images/</xsl:param>
<xsl:param name="chap">overview</xsl:param>
<!-- Parameters -->

<!-- ==================================================================== -->
<xsl:template match="refnamediv/refname"><xsl:if test="not(name(.)=name(../../refmeta/refentrytitle))"><xsl:apply-templates /></xsl:if></xsl:template>

<xsl:template match="refnamediv/refpurpose"><DIV class="refpurpose"><xsl:apply-templates /></div></xsl:template>

<xsl:template match="/">
<html>
<head>
  <link rel="stylesheet" type="text/css" href="doc.css"/>
  <title><xsl:value-of select="/book/chapter[@id='functions']/title"/> Index</title>
  <meta name="author"><xsl:attribute name="content"><xsl:value-of select="/book/bookinfo/authorgroup/author/firstname" /></xsl:attribute></meta>
  <meta name="copyright"><xsl:attribute name="content"><xsl:value-of select="/book/bookinfo/copyright/holder" /><xsl:text>, </xsl:text><xsl:value-of select="year-from-date(xs:date(substring(string(current-dateTime()),1,10)))" /></xsl:attribute></meta>
  <meta name="keywords" content="Virtuoso;OpenLink;Database;UDA;Web Server" />
  <meta name="generator" content="OpenLink XSLT Team" />
</head>
<body>

<xsl:variable name="cat" select="refmeta/refmiscinfo"/>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td id="leftlogo"><xsl:attribute name="nowrap">nowrap</xsl:attribute>
    <img src="{$imgroot}misc/logo.jpg" alt="" />
    </td>
    <td id="header">
    <a><xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute></a>
    <h1><xsl:value-of select="/book/chapter[@id='functions']/title" /> Index</h1>
    </td>
  </tr>
  <tr>
    <td id="lefttoc">
      <xsl:call-template name="full-toc"/>
    </td>
    <td id="main">
	<br/>
	<table class="data">
	<tr>
	<th class="data">Function</th>
	<th class="data">Syntax</th>
	</tr>
	<xsl:for-each select="/book/chapter[./@id='functions']//refentry/refnamediv/refname">
	<xsl:sort select="." data-type="text"/>
		<xsl:variable name="currentfn"><xsl:value-of select="../../@id" /></xsl:variable>

	<tr><td class="data">
	<br/>
	<div><A href="{../../@id}.html"><xsl:value-of select="." /></a></div>
	<br/>
	<div><xsl:value-of select="../refpurpose" /></div></td>
	<td class="data"><xsl:apply-templates select="../../refsynopsisdiv/funcsynopsis"/></td>
	</tr>
	</xsl:for-each>
	</table>
    </td>
  </tr>
  <tr>
    <td id="copyright"><xsl:attribute name="nowrap">nowrap</xsl:attribute>Copyright <xsl:value-of select="year-from-date(xs:date(substring(string(current-dateTime()),1,10)))"/>, <xsl:value-of select="/book/bookinfo/copyright/holder"/></td>
    <td id="footer">
    </td></tr></table>
</body>
</html>
</xsl:template>

</xsl:stylesheet>
