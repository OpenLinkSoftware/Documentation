<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version='1.0'>
<xsl:output method="html" doctype-public="-//W3C//DTD HTML 3.2 Final//EN" />

<xsl:include href="html_functions.xsl"/>
<xsl:strip-space elements="para listitem itemizedlist orderedlist" />
<!-- ==================================================================== -->
<!-- Variables -->
<xsl:param name="imgroot">../images/</xsl:param>
<!-- Variables -->

<!-- ==================================================================== -->
<xsl:template match="/">
  <html>
    <head>
      <!-- LINK REL="stylesheet" TYPE="text/css" HREF="virtdoc.css"/ not allowed for htmldoc -->
      <title><xsl:value-of select="/book/title"/></title>
      <meta name="author"><xsl:attribute name="content"><xsl:value-of select="/book/bookinfo/authorgroup/author/firstname" /></xsl:attribute></meta>
      <meta name="copyright"><xsl:attribute name="content"><xsl:value-of select="/book/bookinfo/copyright/holder" /><xsl:text>, </xsl:text><xsl:value-of select="year-from-date(xs:date(substring(string(current-dateTime()),1,10)))" /></xsl:attribute></meta>
      <meta name="keywords" content="Virtuoso;OpenLink;Database;UDA;Web Server" />
      <meta name="generator" content="OpenLink designed XSLT sheets" />
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

<xsl:template match="chapter/abstract" />
<xsl:template match="chapter/title" />
<xsl:template match="chapter/bridgehead" />

<xsl:template match="sect1">
<xsl:comment> NEED 15 </xsl:comment> <!-- Added for PDF formatting -->
   <xsl:apply-templates />
<br/>
</xsl:template>

<xsl:template match="sect2|sect3|sect4|sect5|section">
<xsl:comment> NEED 15 </xsl:comment> <!-- Added for PDF formatting -->
   <xsl:apply-templates />
</xsl:template>

<xsl:template match="sect1/title"><h2 class="sect1head"><a><xsl:attribute name="name"><xsl:value-of select="../@id" /></xsl:attribute><xsl:apply-templates /></a></h2></xsl:template>
<xsl:template match="sect2/title"><h3 class="sect2head"><a><xsl:attribute name="name"><xsl:value-of select="../@id" /></xsl:attribute><xsl:apply-templates /></a></h3></xsl:template>
<xsl:template match="sect3/title"><h4 class="sect3head"><a><xsl:attribute name="name"><xsl:value-of select="../@id" /></xsl:attribute><xsl:apply-templates /></a></h4></xsl:template>
<xsl:template match="sect4/title"><h5 class="sect4head"><a><xsl:attribute name="name"><xsl:value-of select="../@id" /></xsl:attribute><xsl:apply-templates /></a></h5></xsl:template>
<xsl:template match="sect5/title"><h6 class="sect5head"><a><xsl:attribute name="name"><xsl:value-of select="../@id" /></xsl:attribute><xsl:apply-templates /></a></h6></xsl:template>

<xsl:template match="screen|programlisting">
  <table border="0" width="90%"><tr><td bgcolor="#f0f0f0"><pre><xsl:value-of select="." /></pre></td></tr></table><br/></xsl:template>

<xsl:template match="constant|literal|type|computeroutput|para/parameter|para/function|para/programlisting|para/screen|member/parameter|member/function|member/programlisting|member/screen">
  <code><xsl:apply-templates /></code></xsl:template>

<xsl:template match="para"><P><xsl:apply-templates /></P></xsl:template>
<xsl:template match="example/title"><div class="exampletitle"><xsl:apply-templates /></div></xsl:template>
<xsl:template match="example"><div class="example"><xsl:apply-templates /></div></xsl:template>

<xsl:template match="formalpara">
<xsl:if test="@id"><a><xsl:attribute name="name">fp_<xsl:value-of select="@id" /></xsl:attribute></a></xsl:if>
<P><xsl:apply-templates /></P>
</xsl:template>

<xsl:template match="formalpara/title"><strong><xsl:apply-templates /></strong></xsl:template>

<xsl:template match="emphasis"><strong><xsl:apply-templates/></strong></xsl:template>

<xsl:template match="quote">&quot;<xsl:apply-templates/>&quot;</xsl:template>

<xsl:template match="ulink">
  <a>
    <xsl:attribute name="href"><xsl:value-of select="@url"/></xsl:attribute>
    <xsl:apply-templates/>
  </a>
</xsl:template>

<xsl:template match="refsect1[starts-with(@id, 'errors')]/errorcode" />

<xsl:template match="cmdsynopsis">
<PRE class="programlisting">
  <xsl:for-each select="command" >
    <xsl:value-of select="." />
  </xsl:for-each>
  <xsl:for-each select="arg" >
		<xsl:apply-templates />
  </xsl:for-each>
</PRE>
</xsl:template>

<xsl:template match="important">
<span class="important"><strong>Important:</strong><xsl:text> </xsl:text><xsl:apply-templates/></span>
</xsl:template>

<xsl:template match="variablelist">
<table class="varlist">
<xsl:for-each select="varlistentry">
<tr><td align="right" valign="top" class="varterm"><xsl:attribute name="nowrap">nowrap</xsl:attribute><xsl:value-of select="term" />:</td>
<td>
  <xsl:for-each select="listitem" >
    <xsl:apply-templates />
  </xsl:for-each>
</td></tr>
</xsl:for-each>
</table>
</xsl:template>

<xsl:template match="simplelist">
<!-- no support for multiple columns -->
<ul><xsl:apply-templates select="member" /></ul>
</xsl:template>

<xsl:template match="orderedlist">
<!-- no support for multiple columns -->
<ol><xsl:apply-templates select="listitem" /></ol></xsl:template>

<xsl:template match="itemizedlist"><ul><xsl:apply-templates /></ul></xsl:template>

<xsl:template match="listitem|member"><li><xsl:apply-templates /></li></xsl:template>

<xsl:template match="author"><xsl:value-of select="./firstname" /><xsl:text> </xsl:text><xsl:value-of select="./surname" />;</xsl:template>

<xsl:template match="author/firstname|author/surname|docinfo" />

<xsl:template match="msg|msgmain|msgtext"><xsl:apply-templates /></xsl:template>
<xsl:template match="msgset|msgentry|msg|msgexplain">
  <div class="{name(.)}"><xsl:apply-templates><xsl:sort select="msgentry/msg/msgmain/msgtext/errorcode"/></xsl:apply-templates></div></xsl:template>
<xsl:template match="msgset/title"><a name="{../@id}" /><div class="msgsettitle"><xsl:apply-templates /></div></xsl:template>
<xsl:template match="errorcode"><a name="err{.}" /><span class="{name(.)}"><xsl:apply-templates /></span></xsl:template>
<xsl:template match="errortype|errorname"><span class="{name(.)}"><xsl:apply-templates /></span></xsl:template>

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
<TR class="refentry">
<td><IMG width="10px" HEIGHT="10px"><xsl:attribute name="SRC"><xsl:value-of select="$imgroot"/>misc/1x1.gif</xsl:attribute></img></td>
<td align="right">
<table border="0" cellpadding="5" cellspacing="2"><tr>
<td class="refentrytitle"><xsl:value-of select="refmeta/refentrytitle"/></td>
<td width="300px" class="refpurpose" align="left"><xsl:apply-templates select="refnamediv/refpurpose"/></td>
</tr>
</table></td></tr>
	<xsl:for-each select="refsynopsisdiv/funcsynopsis">
	<xsl:sort select="funcdef/function" data-type="text"/>
<tr><td><IMG width="10px" HEIGHT="10px"><xsl:attribute name="SRC"><xsl:value-of select="$imgroot"/>misc/1x1.gif</xsl:attribute></img></td>
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
   <br/>
</xsl:template>

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

<xsl:template match="refsect1|refsect2|refsect3"><div><xsl:apply-templates/></div></xsl:template>
<xsl:template match="refsect1/title|refsect2/title|refsect3/title"><strong><xsl:apply-templates/></strong><br /></xsl:template>

<xsl:template match="note/title|tip/title" />

<xsl:template match="refentry">
<xsl:comment> NEED 30 </xsl:comment>
<br />
<a><xsl:attribute name="name"><xsl:value-of select="@id"/></xsl:attribute></a>
<xsl:choose>
 <xsl:when test="../@id='functions' and name(..)='chapter'"><h3><xsl:value-of select="refmeta/refentrytitle" /></h3></xsl:when>
 <xsl:otherwise><div class="refentrytitle"><font size="4"><strong><xsl:value-of select="refmeta/refentrytitle" /></strong></font></div></xsl:otherwise>
</xsl:choose>
<div class="refpurpose"><xsl:apply-templates select="refnamediv/refpurpose"/></div>
	<xsl:for-each select="refsynopsisdiv/funcsynopsis/funcprototype">
	<xsl:sort select="funcdef/function" data-type="text"/>
<div><code><xsl:apply-templates/></code></div>
<br />
	</xsl:for-each>
<xsl:apply-templates />
</xsl:template>

<xsl:template match="refsect2"><div class="refsect2"><xsl:apply-templates/></div></xsl:template>

<xsl:template match="refsect1[starts-with(@id, 'errors')]">
  <xsl:apply-templates />
  <p>
  <xsl:for-each select="errorcode">
  <xsl:sort select="." />
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


<xsl:template match="link">
  <xsl:variable name="targets" select="id(@linkend)"/>
  <xsl:variable name="target" select="$targets[1]"/>
<a>
  <xsl:for-each select="$target">
    <xsl:variable name="currentid" select="$target/@id"/>
    <xsl:variable name="node" select="."/>
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

</xsl:stylesheet>
