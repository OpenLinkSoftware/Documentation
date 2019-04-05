<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:fo="http://www.w3.org/1999/XSL/Format"
    xmlns:saxon="http://icl.com/saxon"
    exclude-result-prefixes="xsl fo saxon">

  <xsl:output
      method="text"
      indent="no"
      omit-xml-declaration="yes"/>

  <xsl:template match="/">
---+ <xsl:value-of select="//head/title"/>
    <xsl:text>
    
    </xsl:text>
    <xsl:apply-templates select="/html/body"/>
  </xsl:template>


  <xsl:template match="div[@class='search']"></xsl:template>

  <xsl:template match="body">
    <xsl:apply-templates select="*" />
  </xsl:template>

  <xsl:template match="h1">
    <xsl:text>
---+
  </xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>
    
  </xsl:text>
  </xsl:template>

  <xsl:template match="h2">
    <xsl:text>
---++ </xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>
    
  </xsl:text>
  </xsl:template>

  <xsl:template match="h3">
    <xsl:text>
---+++ </xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>
    
  </xsl:text>
  </xsl:template>

  <xsl:template match="h4">
    <xsl:text>
---++++ </xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>
    
  </xsl:text>
  </xsl:template>

  <xsl:template match="h5">
    <xsl:text>
---+++++ </xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>
    
  </xsl:text>
  </xsl:template>

  <xsl:template match="h6">
    <xsl:text>
---++++++ </xsl:text>
    <xsl:value-of select="."/>
    <xsl:text>
    
  </xsl:text>
  </xsl:template>

  <xsl:template match="p">
    <xsl:value-of select="normalize-space(.)" />
    <xsl:text>
    
    </xsl:text>
  </xsl:template>

  <xsl:template match="div">
    <xsl:apply-templates select="*" />
    <xsl:text>
    
    </xsl:text>
  </xsl:template>

  <xsl:template match="/html/head/title">
    <xsl:value-of select="."/>
  </xsl:template>


  <xsl:template match="/html/head//*" />

  <xsl:template match="//form" />

  <xsl:template match="br">

  </xsl:template>

  <xsl:template match="ul|ol">
    <xsl:apply-templates select="li" />
    <xsl:text>

</xsl:text>
  </xsl:template>

  <xsl:template match="li">
    <xsl:text>   
   * </xsl:text>
    <xsl:apply-templates />
  </xsl:template>

  <xsl:template match="li/text()">
    <xsl:value-of select="normalize-space(.)"/>
  </xsl:template>

  <xsl:template match="div[@id='header']" />
  <xsl:template match="div[@id='navbartop']" />
  <xsl:template match="div[@id='currenttoc']" />

  <xsl:template match="a[@href='']" />

  <xsl:template match="a[@name!='']" />

  <xsl:template match="a">
  [[<xsl:value-of select="@href"/>][<xsl:apply-templates />]]
  </xsl:template>
  
  <xsl:template match="a/text()">
    <xsl:value-of select="normalize-space(.)"/>
  </xsl:template>

  <xsl:template match="span">
    <xsl:apply-templates />
  </xsl:template>
  
  <xsl:template match="hr">
  <xsl:text>
-----
</xsl:text>
  </xsl:template>
  
  <xsl:template match="pre|code">
    &lt;verbatim&gt;
    <xsl:value-of select="."/>
    &lt;/verbatim&gt;
  </xsl:template>

  <xsl:template match="bold|emphasis|em">
  *<xsl:value-of select="."/>*<xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="i|italic|em">
  /<xsl:value-of select="."/>/<xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="u|underscore|underline">
  _<xsl:value-of select="."/>_<xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="table">
    <xsl:text>
  
    
  </xsl:text>

    <xsl:value-of select="normalize-space(caption)"/>
    <xsl:text>
    
  </xsl:text>
    <xsl:apply-templates select="thead|tbody|tr" />
    <xsl:text>
    
  </xsl:text>
  </xsl:template>

  <xsl:template match="thead">
    ||<xsl:apply-templates />
  </xsl:template>

  <xsl:template match="th">
    <xsl:value-of select="normalize-space(.)" />||
  </xsl:template>

  <xsl:template match="tbody">
    <xsl:apply-templates select="tr" />
  </xsl:template>

  <xsl:template match="tr">
    <xsl:text>|</xsl:text>
    <xsl:apply-templates select="td" />
    <xsl:text>
    </xsl:text>
  </xsl:template>

  <xsl:template match="td">
    <xsl:text></xsl:text>
    <xsl:apply-templates />
    <xsl:text>|</xsl:text>
  </xsl:template>

  <xsl:template match="td/text()">
    <xsl:value-of select="normalize-space(.)"/>
  </xsl:template>

  <xsl:template match="img">
    <xsl:text>&lt;img src="%ATTACHURLPATH%/</xsl:text>
    <xsl:value-of select="@src" /><xsl:text>" alt="</xsl:text>
    <xsl:value-of select="@alt" /><xsl:text>"&gt;</xsl:text>
  </xsl:template>

  <xsl:template match="*">
      UNKNOWN tag: <xsl:value-of select="name(.)" />
    <xsl:value-of select="." />
  </xsl:template>

</xsl:stylesheet> 
 
