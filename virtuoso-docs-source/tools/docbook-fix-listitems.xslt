<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE xsl:stylesheet [
<!ENTITY bibo "http://purl.org/ontology/bibo/">
<!ENTITY book "http://purl.org/NET/book/vocab#">
<!ENTITY cl "http://www.ebusiness-unibw.org/ontologies/consumerelectronics/v1#">
<!ENTITY foaf "http://xmlns.com/foaf/0.1/">
<!ENTITY dbpedia "http://dbpedia.org/ontology/">
<!ENTITY dc "http://purl.org/dc/elements/1.1/">
<!ENTITY dcterms "http://purl.org/dc/terms/">
<!ENTITY gr "http://purl.org/goodrelations/v1#">
<!ENTITY opl "http://www.openlinksw.com/schema/attribution#">
<!ENTITY owl "http://www.w3.org/2002/07/owl#">
<!ENTITY rdf "http://www.w3.org/1999/02/22-rdf-syntax-ns#">
<!ENTITY rdfs "http://www.w3.org/2000/01/rdf-schema#">
<!ENTITY sioc "http://rdfs.org/sioc/ns#">
<!ENTITY xsd "http://www.w3.org/2001/XMLSchema#">
<!ENTITY review "http://purl.org/stuff/rev#">
<!ENTITY pto "http://www.productontology.org/id/">
<!ENTITY amz "http://webservices.amazon.com/AWSECommerceService/2011-08-01">
<!ENTITY oplamz "http://www.openlinksw.com/schemas/amazon#">
<!ENTITY docbook "http://docbook.org/ns/docbook">
<!ENTITY xml "http://www.w3.org/XML/1998/namespace/">
<!ENTITY xlink "http://www.w3.org/1999/xlink">
]>

<xsl:stylesheet
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:vi="http://www.openlinksw.com/virtuoso/xslt/"
    xmlns:docbook="&docbook;"
    xmlns:rdf="&rdf;"
    xmlns:rdfs="&rdfs;"
    xmlns:foaf="&foaf;"
    xmlns:bibo="&bibo;"
    xmlns:sioc="&sioc;"
    xmlns:gr="&gr;"
    xmlns:pto="&pto;"
    xmlns:book="&book;"
    xmlns:dbpedia="&dbpedia;"
    xmlns:dc="&dc;"
    xmlns:dcterms="&dcterms;"
    xmlns:review="&review;"
    xmlns:opl="&opl;"
    xmlns:owl="&owl;"
    xmlns:cl="&cl;"
    xmlns:amz="&amz;"
    xmlns:oplamz="&oplamz;"
    xmlns:xlink="&xlink;"
    version="1.0">

  <xsl:output method="xml" indent="no"
              doctype-public="-//OASIS//DTD DocBook XML V5.0//EN"
              doctype-system="DocBook/docbook.dtd"
              cdata-section-elements="programlisting screen computeroutput"
              />

  <xsl:preserve-space elements="*" /> 
  
  <xsl:template match="/">
    <xsl:apply-templates mode="copy" />
  </xsl:template>

  <!-- Recognize specific elements -->
  <xsl:template match="*[name(.)='listitem' and
                       .//*[name(.)='programlisting' or name(.)='screen' or name(.)='computeroutput'] ]" mode="copy"
                priority="10">
    <xsl:element name="{local-name(.)}">
      <xsl:apply-templates select="@*" mode="copy"/>
      <xsl:value-of select="vi:tdh_fix_block(count(ancestor::*),
                            local-name(.), string(.), .)" />
    </xsl:element> 
  </xsl:template>

  <!-- Generic Loop -->
  
  <xsl:template match="*" mode="copy">
    <xsl:element name="{local-name(.)}">
      <xsl:apply-templates select="@*" mode="copy" />
      <xsl:apply-templates mode="copy" />
    </xsl:element>
  </xsl:template>

  <xsl:template match="@*[local-name(.)='id']" mode="copy" priority="10">
    <xsl:attribute name="{local-name(.)}" namespace="&xml;">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@*[local-name(.)='href']" mode="copy" priority="10">
    <xsl:attribute name="{local-name(.)}" namespace="&xlink;">
      <xsl:value-of select="."/>
    </xsl:attribute>
  </xsl:template>

  <xsl:template match="@*" mode="copy">
    <xsl:attribute name="{local-name(.)}">
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

</xsl:stylesheet>
