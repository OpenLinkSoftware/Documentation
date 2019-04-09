<?xml version="1.0"?>
<!DOCTYPE stylesheet [
<!ENTITY db "http://docbook.org/ns/docbook">
]>

<xsl:stylesheet
    xmlns="http://docbook.org/ns/docbook"
    xmlns:db="http://docbook.org/ns/docbook"
    xmlns:xf="http://www.w3.org/2004/07/xpath-functions"
    xmlns:xfn="http://gmpg.org/xfn/11#"
    xmlns:xfnv="http://vocab.sindice.com/xfn#"
    xmlns:xhtml="http://www.w3.org/1999/xhtml"
    xmlns:xhv="http://www.w3.org/1999/xhtml/vocab#"
    xmlns:xlink="http://www.w3.org/1999/xlink"
    xmlns:xn="http://www.ning.com/atom/1.0"
    xmlns:xsd="http://www.w3.org/2001/XMLSchema#"
    xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
    xmlns:xsl10="http://www.w3.org/XSL/Transform/1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xslwd="http://www.w3.org/TR/WD-xsl"
    version="1.0">
  <!-- doctype-public="-//OASIS//DTD DocBook XML V5.0//EN"  -->


  <xsl:output 
      encoding="UTF-8" 
      indent="yes" 
      method="xml" 
      omit-xml-declaration="no" 
      doctype-public="-//OASIS//DTD DocBook XML V5.0//EN" 
      doctype-system="../DocBook/docbook.dtd" 
      exclude-result-prefixes="db xsl"
      cdata-section-elements="programlisting screen code"
      version="1.0"/>

  <!-- Primary template -->

  <xsl:template match="/">
    <xsl:apply-templates mode="copy" select="/"/>
  </xsl:template>

  <xsl:template match="@id" mode="copy">
    <xsl:attribute name="xml:id">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="//*[name(.)='figure']/@float" mode="copy">
    <xsl:attribute name="floatstyle">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="*[local-name(.)='graphic']" mode="copy" priority="25">
    <xsl:element name="mediaobject">
      <xsl:element name="imageobject">
        <xsl:element name="imagedata">
          <xsl:attribute name="fileref">
            <xsl:value-of select="@fileref"/>
          </xsl:attribute>
        </xsl:element>
      </xsl:element>
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[local-name(.)='br']" mode="copy" priority="25">
   <xsl:text> </xsl:text>
  </xsl:template>

  <xsl:template match="//*[name(.)='listitem']/text()[normalize-space(.)!='']" mode="copy">
    <xsl:element name="para">
      <xsl:value-of select="."/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="*[name(.)='ulink']" mode="copy" priority="25">
    <xsl:element name="link">
      <xsl:attribute name="xlink:href">
        <xsl:value-of select="@url"/>
      </xsl:attribute>
      <xsl:apply-templates mode="copy"/>
    </xsl:element>
  </xsl:template>

  <!-- Generic loop -->

  <!-- <xsl:template match="*[name(.)='para' or name(.)='title'][normalize-space(.)='']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="{name(.)}"> -->
  <!--     <xsl:text>  -->
  <!-- </xsl:text> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <xsl:template match="*" mode="copy" priority="5">
    <xsl:element name="{name(.)}">
      <xsl:apply-templates select="@*" mode="copy"/>
      <xsl:apply-templates mode="copy"/>
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*" mode="copy">
    <xsl:attribute name="{name(.)}">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="processing-instruction()" mode="copy" priority="10">
    <xsl:copy-of select="."/>
    <xsl:text>
    </xsl:text>
  </xsl:template>

  <xsl:template match="comment()" mode="copy" priority="10">
    <xsl:copy/>
    <xsl:text>
    </xsl:text>
  </xsl:template>

  <xsl:template match="*[name(.)='programlisting' or name(.)='screen']" mode="copy" priority="50">
    <xsl:copy-of select="."/>
  </xsl:template>

  <xsl:template match="text()" mode="copy">
    <xsl:copy/>
  </xsl:template>
</xsl:stylesheet>
