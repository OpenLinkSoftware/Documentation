<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                version='1.0'>

<xsl:output method="html"
  doctype-public="-//W3C//DTD HTML 3.2 Final//EN" />

<xsl:include href="html_xt_common.xsl"/>
<xsl:include href="html_functions.xsl"/>

<xsl:strip-space elements="para listitem itemizedlist orderedlist" />

<!-- ==================================================================== -->

			<!-- Variables -->
	<xsl:param name="imgroot">../images/</xsl:param>
			<!-- Variables -->

<!-- ==================================================================== -->

<xsl:template match="/">
  <html><head>
  <!-- LINK REL="stylesheet" TYPE="text/css" HREF="virtdoc.css"/ not allowed for htmldoc -->
  <title><xsl:value-of select="/book/title"/></title>
  <meta name="author"><xsl:attribute name="content"><xsl:value-of select="/book/bookinfo/authorgroup/author/firstname" /></xsl:attribute></meta>
  <meta name="copyright"><xsl:attribute name="content"><xsl:value-of select="/book/bookinfo/copyright/holder" /><xsl:text>, </xsl:text><xsl:value-of select="year-from-date(xs:date(substring(string(current-dateTime()),1,10)))" /></xsl:attribute></meta>
  <meta name="keywords" content="Virtuoso;OpenLink;Database;UDA;Web Server" />
  <meta name="generator" content="OpenLink designed XSLT sheets and XT" />
  </head>

  <body>

  <xsl:apply-templates select="/book/chapter"/>

<!-- Apendix sections -->

<xsl:if test="/book/chapter[@id='functions']">

<a name="functionindex" />

<h1>Function Index</h1>

<table class="data" border="1" cellspacing="1" cellpadding="2">
<tr>
<td bgcolor="#eeeeee"><b>Function Name</b></td>
<td bgcolor="#eeeeee"><b>Description</b></td>
<td bgcolor="#eeeeee"><b>Function Syntax</b></td>
</tr>
<xsl:for-each select="/book/chapter[./@id='functions']//refentry">
<xsl:sort select="@id" data-type="text"/>
	<xsl:variable name="currentfn"><xsl:value-of select="@id" /></xsl:variable>

<tr><td>
<a><xsl:attribute name="href">#<xsl:value-of select="./@id" /></xsl:attribute>
	<xsl:value-of select="./refmeta/refentrytitle" /></a>
</td>
<td><xsl:value-of select="./refnamediv/refpurpose" /></td>
<td><xsl:apply-templates select="refsynopsisdiv/funcsynopsis"/></td>
</tr>
</xsl:for-each>
</table>
</xsl:if>

<!-- Normal Doc Content -->

<div class="vtabfoot"> - Copyright <xsl:value-of select="year-from-date(xs:date(substring(string(current-dateTime()),1,10)))"/>, <xsl:value-of select="/book/bookinfo/copyright/holder"/> - </div>
  </body></html>
</xsl:template>

<xsl:template match="chapter[./@id!='functions']">
  <h1><a name="{@id}"><xsl:value-of select="./title" /></a></h1>

<div class="abstract">
<div class="abstracttxt">
   <xsl:apply-templates select="abstract/*" />
</div>
</div>

  <xsl:apply-templates />

</xsl:template>

<xsl:template match="chapter[./@id='functions']">
  <h1><a name="{@id}"><xsl:value-of select="./title" /></a></h1>

<div class="abstract">
<div class="abstracttxt">
   <xsl:apply-templates select="abstract/*" />
</div>
</div>

<xsl:for-each select="docinfo/keywordset/keyword" ><xsl:sort select="." data-type="text"/>
  <h2><xsl:value-of select="." /></h2>
  <xsl:variable name="funccat" select="@id"/>
  <xsl:for-each select="/book/chapter[@id = 'functions']/refentry[refmeta/refmiscinfo = $funccat]"><xsl:sort select="@id" />
    <xsl:apply-templates select="."/>
  </xsl:for-each>
</xsl:for-each>

</xsl:template>

<!-- <xsl:template match="para"><P class="para"><xsl:apply-templates /></P></xsl:template> -->

<!-- <xsl:template match="refentry">
<a><xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute></a>
<table border="0" cellpadding="2" cellspacing="2" width="95%" class="refentry">
<tr class="refentry">
<td><img width="10px" HEIGHT="10px"><xsl:attribute name="src"><xsl:value-of select="$imgroot"/>misc/1x1.gif</xsl:attribute></img></td>
<td align="right">
<table border="0" cellpadding="5" cellspacing="2"><tr>
<td class="refentrytitle"><xsl:value-of select="refmeta/refentrytitle"/></td>
<td width="300px" class="refpurpose" align="left"><xsl:apply-templates select="refnamediv/refpurpose"/></td>
</tr>
</table></td></tr>
	<xsl:for-each select="refsynopsisdiv/funcsynopsis">
	<xsl:sort select="funcdef/function" data-type="text"/>
<tr><td><img width="10px" HEIGHT="10px"><xsl:attribute name="src"><xsl:value-of select="$imgroot"/>misc/1x1.gif</xsl:attribute></img></td>
<td class="funcsynopsis"><xsl:apply-templates/></td></tr>
	</xsl:for-each>
<tr><td colspan="2" class="refdesc">
<xsl:apply-templates select="refsect1"/>
</td></tr>
</table>
<br/>
</xsl:template>
-->
<xsl:template match="table">
<xsl:comment> NEED 15 </xsl:comment>
  <br/>
   <table border="0" cellspacing="0" cellpadding="2">
   <tr><td><table border="1" cellspacing="1" cellpadding="2">
   <xsl:if test="./tgroup/thead">
     <tr><xsl:for-each select="./tgroup/thead/row/entry"><td bgcolor="#eeeeee"><b><xsl:value-of select="." /></b></td></xsl:for-each></tr>
   </xsl:if>

   <xsl:for-each select="./tgroup/tbody/row" >
     <tr>
     <xsl:for-each select="entry" >
       <td>
       <xsl:choose>
         <xsl:when test="./para"><xsl:apply-templates /></xsl:when>
         <xsl:when test="not(child::node())">&#160;</xsl:when>
         <xsl:otherwise><div class="para"><xsl:value-of select="." /></div></xsl:otherwise>
       </xsl:choose>
         <!-- <xsl:apply-templates /> -->
       </td>
     </xsl:for-each>
     </tr>
   </xsl:for-each>
   </table></td></tr>

   <xsl:if test="./title">
     <tr>
   	<td>
   	<xsl:attribute name="colspan"><xsl:value-of select="./tgroup/@cols" /></xsl:attribute>
   	<i><xsl:value-of select="./title"/></i>
     	</td></tr>
   </xsl:if>
   </table>
   <BR/>
</xsl:template>

<xsl:template match="screen|programlisting">
<table border="0" width="99%"><tr><td bgcolor="#f0f0f0"><pre><xsl:value-of select="." /></pre></td></tr></table>
<BR/>
</xsl:template>

<xsl:template match="computeroutput"><font style="TT" face="Courier"><xsl:value-of select="." /></font></xsl:template>

<xsl:template match="figure">
<table border="0" cellpadding="0" cellspacing="0"><tr>
<td><img>
	<xsl:attribute name="title"><xsl:value-of select="title" /></xsl:attribute>
	<xsl:attribute name="src"><xsl:value-of select="$imgroot"/><xsl:value-of select="graphic/@fileref"/></xsl:attribute>
  </img></td></tr>
<tr><td><i><xsl:value-of select="./title"/></i></td></tr>
</table><br/>
</xsl:template>

<xsl:template match="note|tip">
<table border="1" width="610" cellpadding="5"><tr><td align="left">
<table border="0" cellpadding="0" cellspacing="5" width="600">
<tr><td width="70" align="right" valign="top"><strong><xsl:value-of select="./title" /></strong></td>
<td align="left" width="500"><xsl:apply-templates /></td>
</tr></table>
</td></tr></table>
<br/>
</xsl:template>

<xsl:template match="refsect1/title|refsect2/title|refsect3/title"><div><strong><xsl:apply-templates/></strong></div></xsl:template>

<xsl:template match="note/title|tip/title" />

<xsl:template match="refentry">
<br/>
<a><xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute></a>
<xsl:choose>
 <xsl:when test="../@id='functions' and name(..)='chapter'"><h3><xsl:value-of select="refmeta/refentrytitle" /></h3></xsl:when>
 <xsl:otherwise><div class="refentrytitle"><font SIZE="4"><strong><xsl:value-of select="refmeta/refentrytitle" /></strong></font></div></xsl:otherwise>
</xsl:choose>
<div class="refpurpose"><xsl:apply-templates select="refnamediv/refpurpose"/></div>
	<xsl:for-each select="refsynopsisdiv/funcsynopsis/funcprototype">
	<xsl:sort select="funcdef/function" data-type="text"/>
<div><font face="monospace"><xsl:apply-templates/></font></div>
	</xsl:for-each>
<xsl:apply-templates />
</xsl:template>

<xsl:template match="link">
  <xsl:variable name="targets" select="id(@linkend)"/>
  <xsl:variable name="target" select="$targets[1]"/>
<a>
  <xsl:for-each select="$target">
    <xsl:variable name="currentid" select="$target/@id"/>
    <xsl:param name="node" select="."/>
    <xsl:attribute name="href">
      <xsl:choose>
        <xsl:when test="name($node)='formalpara'">#fp_<xsl:value-of select="./@id"/></xsl:when>
        <xsl:when test="name($node)='chapter'">#<xsl:value-of select="@id"/></xsl:when>
        <xsl:when test="name($node)='sect1'">#<xsl:value-of select="./@id"/></xsl:when>
        <xsl:when test="name($node)='sect2'">#<xsl:value-of select="./@id"/></xsl:when>
        <xsl:when test="name($node)='sect3'">#<xsl:value-of select="./@id"/></xsl:when>
        <xsl:when test="name($node)='sect4'">#<xsl:value-of select="./@id"/></xsl:when>
        <xsl:when test="name($node)='sect5'">#<xsl:value-of select="./@id"/></xsl:when>
        <xsl:when test="name($node)='refentry'">#<xsl:value-of select="./@id"/></xsl:when>
      </xsl:choose>
    </xsl:attribute>
  </xsl:for-each>
  <xsl:apply-templates/>
</a>
</xsl:template>

<xsl:template match="refsect1[starts-with(@id, 'errors')]">
  <xsl:apply-templates />
  <p>
  <xsl:for-each select="errorcode" order-by="+.">
  <a href="#err{.}"><xsl:apply-templates/></a>
  <xsl:choose>
    <xsl:when test="following-sibling::errorcode">
      <xsl:text>, </xsl:text>
    </xsl:when>
    <xsl:otherwise>
      <xsl:text>.</xsl:text>
    </xsl:otherwise>
  </xsl:choose>
  </xsl:for-each>
  </p>
</xsl:template>

</xsl:stylesheet>
