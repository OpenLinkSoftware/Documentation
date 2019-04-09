<?xml version='1.0'?>
<!--
 -
 -  $Id$
 -
 -  This file is part of the OpenLink Software Virtuoso Open-Source (VOS)
 -  project.
 -
 -  Copyright (C) 1998-2018 OpenLink Software
 -
 -  This project is free software; you can redistribute it and/or modify it
 -  under the terms of the GNU General Public License as published by the
 -  Free Software Foundation; only version 2 of the License, dated June 1991.
 -
 -  This program is distributed in the hope that it will be useful, but
 -  WITHOUT ANY WARRANTY; without even the implied warranty of
 -  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
 -  General Public License for more details.
 -
 -  You should have received a copy of the GNU General Public License along
 -  with this program; if not, write to the Free Software Foundation, Inc.,
 -  51 Franklin St, Fifth Floor, Boston, MA 02110-1301 USA
 -
 -
-->
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
  xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:content="http://purl.org/rss/1.0/modules/content/"
  xmlns:oplfea="http://www.openlinksw.com/ontology/features#"
  xmlns:schema="http://schema.org/"
  xmlns:cc="http://creativecommons.org/ns#"
  xmlns:sioc="http://rdfs.org/sioc/ns#"
  version='1.0'>
<xsl:include href="html_plain.xsl"/>
<xsl:output method="xml" indent="yes" encoding="UTF-8"/>
<!-- ==================================================================== -->
<xsl:param name="imgroot">../images/</xsl:param>
<xsl:param name="chap">overview</xsl:param>
<xsl:param name="serveraddr">http://localhost:8890/doc/html</xsl:param>
<xsl:param name="thedate">not specified</xsl:param>
<!-- ==================================================================== -->
<xsl:template match="/" priority="10">
<rdf:RDF xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
  xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
  xmlns:dc="http://purl.org/dc/elements/1.1/"
  xmlns:dcterms="http://purl.org/dc/terms/"
  xmlns:foaf="http://xmlns.com/foaf/0.1/"
  xmlns:content="http://purl.org/rss/1.0/modules/content/"
  xmlns:oplfea="http://www.openlinksw.com/ontology/features#"
  xmlns:cc="http://creativecommons.org/ns#"
  xmlns:schema="http://schema.org/"
  xmlns:sioc="http://rdfs.org/sioc/ns#">
    <!--schema:WebPage>
    	<xsl:element name="schema:url">
    		<xsl:attribute name="rdf:resource"><xsl:value-of select="$serveraddr"/></xsl:attribute>
    	</xsl:element>
      <dc:title><xsl:value-of select="/book/title"/></dc:title>
      <dcterms:format>text/html</dcterms:format>
      <rdfs:seeAlso>
        <xsl:attribute name="rdf:resource"><xsl:value-of select="$serveraddr"/>/<xsl:value-of select="/book/@id" />.ttl</xsl:attribute>
      </rdfs:seeAlso>
      <xsl:element name="schema:about">
        <xsl:attribute name="rdf:resource"><xsl:value-of select="$serveraddr"/>/<xsl:value-of select="/book/chapter[sect1/@id = $chap]/@id" />.html</xsl:attribute>
      </xsl:element>
    </schema:WebPage>
    <schema:WebPage>
    	<xsl:element name="schema:url">
    		<xsl:attribute name="rdf:resource"><xsl:value-of select="$serveraddr"/>/<xsl:value-of select="/book/chapter[sect1/@id = $chap]/@id" />.html</xsl:attribute>
    	</xsl:element>
      <dc:title><xsl:value-of select="/book/chapter[sect1/@id = $chap]/title" /></dc:title>
      <dcterms:format>text/html</dcterms:format>
      <rdfs:seeAlso>
        <xsl:attribute name="rdf:resource"><xsl:value-of select="$serveraddr"/>/<xsl:value-of select="/book/chapter[sect1/@id = $chap]/@id" />.ttl</xsl:attribute>
      </rdfs:seeAlso>
      <dcterms:isPartOf>
        <xsl:attribute name="rdf:resource"><xsl:value-of select="$serveraddr"/></xsl:attribute>
      </dcterms:isPartOf>
      <xsl:for-each select="sect1">
        <xsl:element name="schema:about">
          <xsl:attribute name="rdf:resource"><xsl:value-of select="$serveraddr"/>/<xsl:value-of select="@id" />.html</xsl:attribute>
        </xsl:element>
      </xsl:for-each>
    </schema:WebPage-->
    <xsl:apply-templates select="/book/chapter/sect1[@id = $chap]"/>
</rdf:RDF>
</xsl:template>

<xsl:template match="sect1" priority="10">
	<!--xsl:element name="schema:about">
      <xsl:attribute name="rdf:resource"><xsl:value-of select="$serveraddr"/>/<xsl:value-of select="@id" />.html#this</xsl:attribute>
    </xsl:element-->
  <xsl:element name="schema:TechArticle">
  	<xsl:attribute name="rdf:about"><xsl:value-of select="$serveraddr"/>/<xsl:value-of select="@id" />.html#this</xsl:attribute>
  	<xsl:element name="schema:url">
  		<xsl:attribute name="rdf:resource"><xsl:value-of select="$serveraddr"/>/<xsl:value-of select="@id" />.html</xsl:attribute>
  	</xsl:element>
  	<xsl:call-template name="company-items"/>
  	<dcterms:isPartOf>
      <xsl:attribute name="rdf:resource"><xsl:value-of select="$serveraddr"/>/<xsl:value-of select="parent::chapter/@id" />.html</xsl:attribute>
    </dcterms:isPartOf>
    <rdfs:label><xsl:value-of select="title"/></rdfs:label>
    <xsl:choose>
     <xsl:when test="@id != 'vspx' and @id != 'fttfuncs'">
     	  <sioc:content>
          <xsl:apply-templates select="*" mode="strip"/>
       </sioc:content>
     </xsl:when>
     <xsl:otherwise>
       <xsl:for-each select="refentry">
         <xsl:element name="schema:about">
           <xsl:attribute name="rdf:resource"><xsl:value-of select="$serveraddr"/>/<xsl:value-of select="@id" />.html#this</xsl:attribute>
        </xsl:element>
       </xsl:for-each>
     </xsl:otherwise>
    </xsl:choose>
  </xsl:element>
  <xsl:apply-templates select="/book/chapter/sect1[@id = $chap]/refentry"/>
</xsl:template>


<xsl:template match="refentry" priority="10">
  <xsl:element name="oplfea:VirtuosoProductFunctionalityRealm">
  	<xsl:attribute name="rdf:about"><xsl:value-of select="$serveraddr"/>/<xsl:value-of select="@id" />.html#this</xsl:attribute>
  	<xsl:element name="schema:url">
  		<xsl:attribute name="rdf:resource"><xsl:value-of select="$serveraddr"/>/<xsl:value-of select="@id" />.html</xsl:attribute>
  	</xsl:element>
  	<xsl:call-template name="company-items"/>
  	<dcterms:isPartOf>
      <xsl:attribute name="rdf:resource"><xsl:value-of select="$serveraddr"/>/<xsl:value-of select="parent::chapter/sect1/@id" />.html</xsl:attribute>
    </dcterms:isPartOf>
    <rdfs:label><xsl:value-of select="refnamediv/refname"/></rdfs:label>
    <dcterms:description>
      <xsl:apply-templates select="*" mode="strip"/>
    </dcterms:description>
  </xsl:element>
</xsl:template>

<xsl:template match="*" priority="20" mode="strip">
  <xsl:apply-templates mode="strip" />
</xsl:template>


<xsl:template name="company-items">
	<dcterms:created><xsl:value-of select="$thedate"/></dcterms:created>
  <dcterms:format>text/html</dcterms:format>
  <xsl:element name="schema:author">
  	<xsl:attribute name="rdf:resource">http://www.openlinksw.com/dataspace/organization/openlink#this</xsl:attribute>
  </xsl:element>
  <xsl:element name="cc:license">
  	<xsl:attribute name="rdf:resource">http://creativecommons.org/licenses/by/4.0/deed.en_US</xsl:attribute>
  </xsl:element>
  <cc:attributionName>OpenLink Software</cc:attributionName>
  <xsl:element name="cc:attributionURL">
  	<xsl:attribute name="rdf:resource">http://www.openlinksw.com/dataspace/organization/openlink#this</xsl:attribute>
  </xsl:element>
</xsl:template>

</xsl:stylesheet>
