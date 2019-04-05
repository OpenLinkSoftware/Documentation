<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
                xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                xmlns:saxon="http://icl.com/saxon"
                exclude-result-prefixes="xsl fo saxon">

  <xsl:output method="text" indent="no" />

  <xsl:template match="/">
    <xsl:apply-templates />
  </xsl:template>


  <xsl:template match="docbook">
    <xsl:apply-templates />
  </xsl:template>


  <xsl:template match="section">
    <xsl:apply-templates />

----
  </xsl:template>

  <xsl:template match="title">
<xsl:text>
= </xsl:text><xsl:value-of select="." />
<xsl:text>
</xsl:text>
%TOC%

  </xsl:template>


  <xsl:template match="para">
<xsl:text>
</xsl:text>
<xsl:apply-templates />
<xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template match="orderedlist">
<xsl:apply-templates />
  </xsl:template>

  <xsl:template match="itemizedlist">
<xsl:apply-templates />
  </xsl:template>

<xsl:template match="orderedlist/listitem">
#<xsl:apply-templates />
</xsl:template>


<xsl:template match="itemizedlist/listitem">
*<xsl:apply-templates />
</xsl:template>

  <xsl:template match="para/text()">
<xsl:value-of select="." /><xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="listitem/text()">
<xsl:value-of select="normalize-space(.)" />
  </xsl:template>

  <xsl:template match="*/text()"><xsl:value-of select="normalize-space(.)" /><xsl:text> </xsl:text></xsl:template>


  <xsl:template match="emphasis">**<xsl:apply-templates />** </xsl:template>


  <xsl:template match="bridgehead[contains(@class,'h2')]">

== <xsl:apply-templates /><xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template match="bridgehead[contains(@class,'h3')]">

=== <xsl:apply-templates /><xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template match="bridgehead[contains(@class,'h4')]">

==== <xsl:apply-templates /><xsl:text>
</xsl:text>
  </xsl:template>

  <xsl:template match="bridgehead[contains(@class,'h5')]">

===== <xsl:apply-templates /><xsl:text>
</xsl:text>
  </xsl:template>

<xsl:template match="computeroutput/ulink" priority="5">[[<xsl:value-of select="@url" />|{{{<xsl:value-of select="." />}}}]]</xsl:template>

  <xsl:template match="ulink[@url=./text()]" priority="1">[[<xsl:value-of select="@url" />]]  </xsl:template>

  <xsl:template match="ulink" priority="1">[[<xsl:value-of select="@url" />|<xsl:value-of select="normalize-space(./text())" />]] </xsl:template>


<xsl:template match="figure">
{{<xsl:value-of select="graphic/@fileref" />|<xsl:value-of select="./text()" />}}
</xsl:template>

<xsl:template match="table">
<xsl:text>
</xsl:text><xsl:apply-templates  /><xsl:text>
</xsl:text>
</xsl:template>

<xsl:template match="table/title">**<xsl:apply-templates  />**</xsl:template>

<xsl:template match="tgroup|thead|tbody">
<xsl:text>
</xsl:text><xsl:apply-templates  />
</xsl:template>

<xsl:template match="row">
<xsl:apply-templates  /> |
</xsl:template>

<xsl:template match="thead/row/entry">|= <xsl:apply-templates  /></xsl:template>

<xsl:template match="entry">|  <xsl:apply-templates  /></xsl:template>

<xsl:template match="table">
<xsl:apply-templates  />
</xsl:template>

<xsl:template match="programlisting">
{{{
<xsl:apply-templates />
}}}
</xsl:template>

<xsl:template match="*[normalize-space(./text())='' and count(*)=0]" />

<xsl:template match="computeroutput[count(ulink)=0]" priority="1">{{{<xsl:apply-templates />}}}</xsl:template>

<xsl:template match="computeroutput"><xsl:apply-templates /></xsl:template>

<xsl:template match="blockquote">{{{<xsl:apply-templates />}}}</xsl:template>


  <xsl:template match="*">
    UNKNOWN TAG [<xsl:value-of select="name(.)" />], call for help
    <xsl:copy-of select="." />
  </xsl:template>


</xsl:stylesheet>
