#!/bin/bash

# Stamp-out mdata templates

OUTDIR="../../virtuoso/content"

urlbase="$1"
[ -z "$urlbase" ] && urlbase="http://docs.openlinksw.com/virtuoso/"

now=$(date "+%Y-%m-%d %H:%M:%S")
copyrightYear=$(date "+%Y")
author="OpenLink Software"
authorURL="http://www.openlinksw.com/dataspace/organization/openlink#this"
publisher="OpenLink Software"
publisherURL="http://www.openlinksw.com/#this"
licenseURL="http://creativecommons.org/licenses/by/4.0/deed.en_US"
basekeywords="OpenLink,Virtuoso,database,RDBMS,relational,SQL,RDF,triple store,linked data,linked open data,Big Data"
class="http://schema.org/TechArticle"

#Prefix
cat <<EOF
@prefix bibo:	<http://purl.org/ontology/bibo/> .
@prefix category:	<http://dbpedia.org/resource/Category:> .
@prefix dbpedia:	<http://dbpedia.org/resource/> .
@prefix dbpprop:	<http://dbpedia.org/property/> .
@prefix dc:	<http://purl.org/dc/elements/1.1/> .
@prefix dcterms:	<http://purl.org/dc/terms/> .
@prefix dt:	<http://www.w3.org/2001/XMLSchema#> .
@prefix opl:	<http://www.openlinksw.com/schema/attribution#> .
@prefix opltable:	<http://www.openlinksw.com/schemas/opltable#> .
@prefix owl:	<http://www.w3.org/2002/07/owl#> .
@prefix prvTypes:	<http://purl.org/net/provenance/types#> .
@prefix rdfg:	<http://www.w3.org/2004/03/trix/rdfg-1/> .
@prefix rdfs:	<http://www.w3.org/2000/01/rdf-schema#> .
@prefix schema:	<http://schema.org/> .
@prefix skos:	<http://www.w3.org/2004/02/skos/core#> .
@prefix wdrs:	<http://www.w3.org/2007/05/powder-s#> .
@prefix xhv:	<http://www.w3.org/1999/xhtml/vocab#> .
@prefix yago:	<http://dbpedia.org/class/yago/> .

EOF

(cd $OUTDIR && ls -1 *.html) | while read f
do
    url="$urlbase$f"
    title=$(xmlstarlet sel -t -m "//*[name(.)='title']" -v . -n "$OUTDIR/$f" 2> /dev/null)
    descr=$(xmlstarlet sel -t -m "//*[name(.)='meta' and @name='description'][1]" -v "@content" -n "$OUTDIR/$f" 2> /dev/null)
    keywords="$basekeywords"
    fn=$(echo "$f" | sed -E 's/.*fn_//; s/.html$//')
    echo "$f" | grep -Eq "fn_" && class="http://schema.org/APIReference"
    echo "$f" | grep -Eq "fn_" && keywords="$keywords,function,API,reference,$fn"
    xmlstarlet sel -t -m "//body" -v . -n < "$OUTDIR/$f" | grep -Eiq '\<odbc\>' && keywords="$keywords,ODBC"
    xmlstarlet sel -t -m "//body" -v . -n < "$OUTDIR/$f" | grep -Eiq '\<jdbc\>' && keywords="$keywords,JDBC"
    xmlstarlet sel -t -m "//body" -v . -n < "$OUTDIR/$f" | grep -Eiq '\<ado.net\>' && keywords="$keywords,ADO.NET"
    xmlstarlet sel -t -m "//body" -v . -n < "$OUTDIR/$f" | grep -Eiq '\<sparql\>' && keywords="$keywords,SPARQL"
    cat <<EOF
<$url> 
    a <$class> ;
    schema:name """$title""" ;
    schema:headline """$title""" ;
    schema:datePublished "$now";
    schema:keywords "$keywords";
    schema:license <$licenseURL>;
    schema:url <$url> ;
    schema:description """$descr""";
    schema:publisher [
schema:name "$publisher" ; schema:url <$publisherURL> 
] ;
    schema:copyrightHolder [
schema:name "$publisher" ; schema:url <$publisherURL> 
] .


EOF

done


