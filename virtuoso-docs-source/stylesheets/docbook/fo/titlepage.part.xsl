<?xml version='1.0'?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
                xmlns:fo="http://www.w3.org/1999/XSL/Format"
                version='1.0'>

<!-- ********************************************************************
     $Id$
     ********************************************************************

     This file is part of the XSL DocBook Stylesheet distribution.
     See ../README or http://nwalsh.com/docbook/xsl/ for copyright
     and other information.

     ******************************************************************** -->

<xsl:template name="part.titlepage.recto">
  <xsl:variable name="ptitle" select="./title"/>
  <xsl:variable name="ititle" select="./docinfo/title"/>

  <!-- handle the title -->
  <xsl:choose>
    <xsl:when test="$ptitle">
      <xsl:apply-templates mode="part.titlepage.recto.mode"
       select="$ptitle"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="$ititle">
        <xsl:apply-templates mode="part.titlepage.recto.mode"
         select="$ititle"/>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>

  <xsl:variable name="psubtitle" select="./subtitle"/>
  <xsl:variable name="isubtitle" select="./docinfo/subtitle"/>

  <!-- handle the subtitle -->
  <xsl:choose>
    <xsl:when test="$psubtitle">
      <xsl:apply-templates mode="part.titlepage.recto.mode"
       select="$psubtitle"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="$isubtitle">
        <xsl:apply-templates mode="part.titlepage.recto.mode"
         select="$isubtitle"/>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>

  <xsl:apply-templates mode="part.titlepage.recto.mode"
   select="./docinfo/corpauthor"/>

  <xsl:apply-templates mode="part.titlepage.recto.mode"
   select="./docinfo/authorgroup"/>

  <xsl:apply-templates mode="part.titlepage.recto.mode"
   select="./docinfo/author"/>

  <xsl:apply-templates mode="part.titlepage.recto.mode"
   select="./docinfo/releaseinfo"/>

  <xsl:apply-templates mode="part.titlepage.recto.mode"
   select="./docinfo/copyright"/>

  <xsl:apply-templates mode="part.titlepage.recto.mode"
   select="./docinfo/pubdate"/>

  <xsl:apply-templates mode="part.titlepage.recto.mode"
   select="./docinfo/revhistory"/>

  <xsl:apply-templates mode="part.titlepage.recto.mode"
   select="./docinfo/abstract"/>
</xsl:template>

<xsl:template name="part.titlepage.verso">
  <xsl:variable name="ptitle" select="./title"/>
  <xsl:variable name="ititle" select="./docinfo/title"/>

  <!-- handle the title -->
  <!--
  <xsl:choose>
    <xsl:when test="$ptitle">
      <xsl:apply-templates mode="part.titlepage.verso.mode"
       select="$ptitle"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="$ititle">
        <xsl:apply-templates mode="part.titlepage.verso.mode"
         select="$ititle"/>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>
  -->

  <xsl:variable name="psubtitle" select="./subtitle"/>
  <xsl:variable name="isubtitle" select="./docinfo/subtitle"/>

  <!-- handle the subtitle -->
  <!--
  <xsl:choose>
    <xsl:when test="$psubtitle">
      <xsl:apply-templates mode="part.titlepage.verso.mode"
       select="$psubtitle"/>
    </xsl:when>
    <xsl:otherwise>
      <xsl:if test="$isubtitle">
        <xsl:apply-templates mode="part.titlepage.verso.mode"
         select="$isubtitle"/>
      </xsl:if>
    </xsl:otherwise>
  </xsl:choose>
  -->

  <!--
  <xsl:apply-templates mode="part.titlepage.verso.mode"
   select="./docinfo/authorgroup"/>
  -->
</xsl:template>

<xsl:template name="part.titlepage">
  <fo:block>
    <xsl:call-template name="part.titlepage.before">
       <xsl:with-param name="side">recto</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="part.titlepage.recto"/>
    <xsl:call-template name="part.titlepage.before">
       <xsl:with-param name="side">verso</xsl:with-param>
    </xsl:call-template>
    <xsl:call-template name="part.titlepage.verso"/>
    <xsl:call-template name="part.titlepage.separator"/>
  </fo:block>
</xsl:template>

<xsl:template name="part.titlepage.separator">
</xsl:template>

<xsl:template name="part.titlepage.before">
  <xsl:param name="side" select="recto"/>
</xsl:template>

<!-- part titlepage recto mode ======================================== -->

<xsl:template match="*" mode="part.titlepage.recto.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<!-- /part titlepage recto mode ======================================= -->

<!-- part titlepage verso mode ======================================== -->

<xsl:template match="*" mode="part.titlepage.verso.mode">
  <!-- if an element isn't found in this mode, -->
  <!-- try the generic titlepage.mode -->
  <xsl:apply-templates select="." mode="titlepage.mode"/>
</xsl:template>

<!-- /part titlepage verso mode ======================================= -->

</xsl:stylesheet>
