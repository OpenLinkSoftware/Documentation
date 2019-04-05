#!/bin/bash

#
# Split a file by elements that have an id, replacing with entity declaration
#

# TODO:


fname="$1"
[ -z "$fname" ] && fname="virtdocs.xml"
elname="$2"
[ -z "$elname" ] && elname="*"

ids=$(xmlstarlet sel -t -m '/*/*[@xml:id]' -v '@xml:id' -n < "$fname" | grep -Evi 'alldocs|virtdocs')

for i in $ids
do
    echo "Extracting id=$i"
    node=$(xmlstarlet sel -t -m "//*[@xml:id='$i']" -v "name(.)" -n < "$fname")
    ofname="$i.xml"
    echo "$node" |grep -Eiq chapter && ofname="$ofname"
    (echo '<?xml version="1.0" encoding="ISO-8859-1"?>';  xmlstarlet sel -t -m "/*/$elname[@xml:id='$i']" -c . -n < "$fname" ) > "$ofname" &
done
wait

echo "Rewriting source with entity reference"
allids=$(echo "$ids" | xargs echo )
allids=$(echo "$allids" | sed -E "s/ /' or @xml:id='/g; s/^/@xml:id='/; s/$/'/")
echo "allids=[$allids]"

echo "Building temporary XSLT"
cat <<EOF > docbook-replace-ids-entities.xsl
<?xml version="1.0"?>
<!DOCTYPE stylesheet [
<!ENTITY db "http://docbook.org/ns/docbook">
]>

<xsl:stylesheet
    xmlns="http://docbook.org/ns/docbook"
    xmlns:db="http://docbook.org/ns/docbook"
    xmlns:Comps="http://www.zillow.com/static/xsd/Comps.xsd"
    xmlns:Demographics="http://www.zillow.com/static/xsd/Demographics.xsd"
    xmlns:SearchResults="http://www.zillow.com/static/xsd/SearchResults.xsd"
    xmlns:UpdatedPropertyDetails="http://www.zillow.com/static/xsd/UpdatedPropertyDetails.xsd"
    xmlns:a="http://www.w3.org/2005/Atom"
    xmlns:aapi="http://rdf.alchemyapi.com/rdf/v1/s/aapi-schema#"
    xmlns:accom="http://purl.org/acco/ns#"
    xmlns:activity="http://activitystrea.ms/spec/1.0/"
    xmlns:address="http://schemas.talis.com/2005/address/schema#"
    xmlns:admin="http://webns.net/mvcb/"
    xmlns:amz="http://webservices.amazon.com/AWSECommerceService/2011-08-01"
    xmlns:app="http://purl.org/net/app#"
    xmlns:atom="http://atomowl.org/ontologies/atomrdf#"
    xmlns:audio="http://purl.org/media/audio#"
    xmlns:awol="http://bblfish.net/work/atom-owl/2006-06-06/#"
    xmlns:aws="http://soap.amazon.com/"
    xmlns:b3s="http://b3s.openlinksw.com/"
    xmlns:batch="http://schemas.google.com/gdata/batch"
    xmlns:bestbuy="http://remix.bestbuy.com/"
    xmlns:bibo="http://purl.org/ontology/bibo/"
    xmlns:bif="bif:"
    xmlns:bio="http://purl.org/vocab/bio/0.1/"
    xmlns:book="http://purl.org/NET/book/vocab#"
    xmlns:bookmark="http://www.w3.org/2002/01/bookmark#"
    xmlns:bugzilla="http://www.openlinksw.com/schemas/bugzilla#"
    xmlns:buzz="http://schemas.google.com/buzz/2010"
    xmlns:c="http://www.w3.org/2002/12/cal/icaltzd#"
    xmlns:calais="http://s.opencalais.com/1/pred/"
    xmlns:category="http://dbpedia.org/resource/Category:"
    xmlns:cb="http://www.crunchbase.com/"
    xmlns:cc="http://web.resource.org/cc/"
    xmlns:cert="http://www.w3.org/ns/auth/cert#"
    xmlns:cl="http://www.ebusiness-unibw.org/ontologies/consumerelectronics/v1#"
    xmlns:cnet="http://api.cnet.com/restApi/v1.0/ns"
    xmlns:contact="http://www.w3.org/2000/10/swap/pim/contact#"
    xmlns:content="http://purl.org/rss/1.0/modules/content/"
    xmlns:cp="http://schemas.openxmlformats.org/package/2006/metadata/core-properties"
    xmlns:cpe-lang="http://cpe.mitre.org/language/2.0"
    xmlns:crosspost="http://purl.org/syndication/cross-posting"
    xmlns:ctag="http://commontag.org/ns#"
    xmlns:cv="http://purl.org/captsolo/resume-rdf/0.2/cv#"
    xmlns:cvbase="http://purl.org/captsolo/resume-rdf/0.2/base#"
    xmlns:cve="http://www.openlinksw.com/schemas/cve#"
    xmlns:cvss="http://scap.nist.gov/schema/cvss-v2/0.2"
    xmlns:d="http://schemas.microsoft.com/ado/2007/08/dataservices"
    xmlns:dawgt="http://www.w3.org/2001/sw/DataAccess/tests/test-dawg#"
    xmlns:dbpedia-owl="http://dbpedia.org/ontology/"
    xmlns:dbpedia="http://dbpedia.org/resource/"
    xmlns:dbpprop="http://dbpedia.org/property/"
    xmlns:dbps="http://www.openlinksw.com/schemas/dbpedia-spotlight#"
    xmlns:dc="http://purl.org/dc/elements/1.1/"
    xmlns:dcat="http://www.w3.org/ns/dcat#"
    xmlns:dcmitype="http://purl.org/dc/dcmitype/"
    xmlns:dcterms="http://purl.org/dc/terms/"
    xmlns:digg="http://digg.com/docs/diggrss/"
    xmlns:doap="http://usefulinc.com/ns/doap#"
    xmlns:dv="http://rdf.data-vocabulary.org/"
    xmlns:dwc="http://rs.tdwg.org/dwc/terms/"
    xmlns:e="tag:extractiv.com,2010:rdf#"
    xmlns:ebay="urn:ebay:apis:eBLBaseComponents"
    xmlns:enc="http://purl.oclc.org/net/rss_2.0/enc#"
    xmlns:ep="http://schemas.openxmlformats.org/officeDocument/2006/extended-properties"
    xmlns:etsy="http://www.etsy.com/"
    xmlns:event="http://purl.org/NET/c4dm/event.owl#"
    xmlns:evri="http://www.openlinksw.com/schemas/evri#"
    xmlns:exif="http://www.w3.org/2003/12/exif/ns/"
    xmlns:fam="http://vocab.fusepool.info/fam#"
    xmlns:fb="http://api.facebook.com/1.0/"
    xmlns:fbase="http://rdf.freebase.com/ns/"
    xmlns:fct="http://openlinksw.com/services/facets/1.0/"
    xmlns:ff="http://api.friendfeed.com/2008/03"
    xmlns:fn="http://www.w3.org/2005/xpath-functions/#"
    xmlns:foaf="http://xmlns.com/foaf/0.1/"
    xmlns:formats="http://www.w3.org/ns/formats/"
    xmlns:g="http://base.google.com/ns/1.0"
    xmlns:gb="http://www.openlinksw.com/schemas/google-base#"
    xmlns:gbs="http://schemas.google.com/books/2008"
    xmlns:gd="http://schemas.google.com/g/2005"
    xmlns:geo="http://www.w3.org/2003/01/geo/wgs84_pos#"
    xmlns:georss="http://www.georss.org/georss"
    xmlns:geospecies="http://rdf.geospecies.org/ont/geospecies#"
    xmlns:getglue="http://getglue.com#"
    xmlns:gh="http://www.openlinksw.com/schemas/github#"
    xmlns:gm="http://base.google.com/ns-metadata/1.0"
    xmlns:gml="http://www.opengis.net/gml"
    xmlns:gn="http://www.geonames.org/ontology#"
    xmlns:go="http://purl.org/obo/owl/GO#"
    xmlns:gphoto="http://schemas.google.com/photos/2007"
    xmlns:gr="http://purl.org/goodrelations/v1#"
    xmlns:grs="http://www.georss.org/georss/"
    xmlns:gs="http://schemas.google.com/spreadsheets/2006"
    xmlns:guardian="http://www.openlinksw.com/schemas/guardian#"
    xmlns:hlisting="http://www.openlinksw.com/schemas/hlisting/"
    xmlns:hnews="http://ontologi.es/hnews#"
    xmlns:hoovers="http://www.hoovers.com/"
    xmlns:hrev="http://www.purl.org/stuff/hrev#"
    xmlns:http-voc="http://www.w3.org/2006/http#"
    xmlns:ical="http://www.w3.org/2002/12/cal/ical#"
    xmlns:ir="http://web-semantics.org/ns/image-regions"
    xmlns:issues="http://schemas.google.com/projecthosting/issues/2009"
    xmlns:itunes="http://www.itunes.com/DTDs/Podcast-1.0.dtd"
    xmlns:kml="http://www.opengis.net/kml/2.2/"
    xmlns:ldp="http://www.w3.org/ns/ldp#"
    xmlns:lfm="http://last.fm/"
    xmlns:lgv="http://linkedgeodata.org/ontology/"
    xmlns:lod="http://lod.openlinksw.com/"
    xmlns:lu="http://lookupws.ontotext.com"
    xmlns:m="http://schemas.microsoft.com/ado/2007/08/dataservices/metadata"
    xmlns:math="http://www.w3.org/2000/10/swap/math#"
    xmlns:md="http://www.w3.org/1999/xhtml/microdata#"
    xmlns:media="http://search.yahoo.com/mrss/"
    xmlns:mesh="http://purl.org/commons/record/mesh/"
    xmlns:meta="tag:extractiv.com,2010:rdf/documentMetadata#"
    xmlns:mf="http://www.w3.org/2001/sw/DataAccess/tests/test-manifest#"
    xmlns:mmd="http://musicbrainz.org/ns/mmd-1.0#"
    xmlns:mo="http://purl.org/ontology/mo/"
    xmlns:moat="http://moat-project.org/ns#"
    xmlns:mql="http://www.freebase.com/"
    xmlns:nci="http://ncicb.nci.nih.gov/xml/owl/EVS/Thesaurus.owl#"
    xmlns:ndfd_weather="http://www.openlinksw.com/schema/ndfd#"
    xmlns:nfo="http://www.semanticdesktop.org/ontologies/nfo/#"
    xmlns:ng="http://www.openlinksw.com/schemas/ning#"
    xmlns:nif="http://persistence.uni-leipzig.org/nlp2rdf/ontologies/nif-core#"
    xmlns:nyt="http://www.nytimes.com/"
    xmlns:o="urn:schemas-microsoft-com:office:office"
    xmlns:oa="http://www.w3.org/ns/oa#"
    xmlns:oai="http://www.openarchives.org/OAI/2.0/"
    xmlns:oai_dc="http://www.openarchives.org/OAI/2.0/oai_dc/"
    xmlns:obo="http://www.geneontology.org/formats/oboInOwl#"
    xmlns:office="urn:oasis:names:tc:opendocument:xmlns:office:1.0"
    xmlns:ogc="http://www.opengis.net/"
    xmlns:ogcgml="http://www.opengis.net/ont/gml#"
    xmlns:ogcgs="http://www.opengis.net/ont/geosparql#"
    xmlns:ogcgsf="http://www.opengis.net/def/function/geosparql/"
    xmlns:ogcgsr="http://www.opengis.net/def/rule/geosparql/"
    xmlns:ogcsf="http://www.opengis.net/ont/sf#"
    xmlns:oo="urn:oasis:names:tc:opendocument:xmlns:meta:1.0:"
    xmlns:openSearch="http://a9.com/-/spec/opensearchrss/1.0/"
    xmlns:opencyc="http://sw.opencyc.org/2008/06/10/concept/"
    xmlns:openstreetmap="http://openstreetmap.org/elements/"
    xmlns:opl-gs="http://www.openlinksw.com/schemas/getsatisfaction/"
    xmlns:opl-meetup="http://www.openlinksw.com/schemas/meetup/"
    xmlns:opl-xbrl="http://www.openlinksw.com/schemas/xbrl/"
    xmlns:opl="http://www.openlinksw.com/schema/attribution#"
    xmlns:oplamz="http://www.openlinksw.com/schemas/amazon#"
    xmlns:oplangel="http://www.openlinksw.com/schemas/angel#"
    xmlns:oplbase="http://www.openlinksw.com/schemas/oplbase#"
    xmlns:oplbb="http://www.openlinksw.com/schemas/bestbuy#"
    xmlns:oplbsbm="http://www.openlinksw.com/schemas/bsbm#"
    xmlns:oplcars="http://www.openlinksw.com/schemas/cars#"
    xmlns:oplcb="http://www.openlinksw.com/schemas/crunchbase#"
    xmlns:oplcert="http://www.openlinksw.com/schemas/cert#"
    xmlns:oplcn="http://www.openlinksw.com/schemas/cnet#"
    xmlns:oplcorporates="http://www.openlinksw.com/schemas/corporates#"
    xmlns:oplcv="http://www.openlinksw.com/schemas/cv#"
    xmlns:opldeezer="http://www.openlinksw.com/schemas/deezer#"
    xmlns:oplebay="http://www.openlinksw.com/schemas/ebay#"
    xmlns:oplevri="http://www.openlinksw.com/schemas/oplevri#"
    xmlns:oplfactual="http://www.openlinksw.com/schemas/factual#"
    xmlns:oplflattr="http://www.openlinksw.com/schemas/flattr#"
    xmlns:oplfq="http://www.openlinksw.com/schemas/foursquare#"
    xmlns:oplfr="http://www.openlinksw.com/schemas/federal_register#"
    xmlns:oplgovt="http://www.openlinksw.com/schemas/govtrack#"
    xmlns:oplgp="http://www.openlinksw.com/schemas/glasspockets#"
    xmlns:oplgw="http://www.openlinksw.com/schemas/gowalla#"
    xmlns:oplhp="http://www.openlinksw.com/schemas/hyperpublic#"
    xmlns:oplie="http://www.openlinksw.com/schemas/influence#"
    xmlns:opljg="http://www.openlinksw.com/schemas/jigsaw#"
    xmlns:oplklout="http://www.openlinksw.com/schemas/klout#"
    xmlns:oplli="http://www.openlinksw.com/schemas/linkedin#"
    xmlns:opllinkedjazz="http://www.openlinksw.com/schemas/linkedjazz#"
    xmlns:oplmarvel="http://www.openlinksw.com/schemas/marvel#"
    xmlns:oplmetamind="http://www.openlinksw.com/schemas/metamind#"
    xmlns:oplmisc="http://www.openlinksw.com/schemas/oplmisc#"
    xmlns:oplmny="http://www.openlinksw.com/schemas/money#"
    xmlns:oplnerd="http://www.openlinksw.com/schemas/nerd#"
    xmlns:oplnutritionix="http://www.openlinksw.com/schemas/nutritionix#"
    xmlns:oplnyt="http://www.openlinksw.com/schemas/nyt#"
    xmlns:oplog="http://www.openlinksw.com/schemas/opengraph#"
    xmlns:oplomim="http://www.openlinksw.com/schemas/omim#"
    xmlns:oplosm="http://www.openlinksw.com/schemas/openstreetmap#"
    xmlns:oplpingar="http://www.openlinksw.com/schemas/pingar#"
    xmlns:oplpolice="http://www.openlinksw.com/schemas/police#"
    xmlns:oplredlink="http://www.openlinksw.com/schemas/redlink#"
    xmlns:oplsc="http://www.openlinksw.com/schemas/soundcloud#"
    xmlns:oplsecxbrl="http://www.openlinksw.com/schemas/secxbrl#"
    xmlns:oplseevl="http://www.openlinksw.com/schemas/seevl#"
    xmlns:oplsg="http://www.openlinksw.com/schemas/simplegeo#"
    xmlns:oplshodan="http://www.openlinksw.com/schemas/shodan#"
    xmlns:oplslideshare="http://www.openlinksw.com/schemas/slideshare#"
    xmlns:oplso="http://www.openlinksw.com/schemas/stackoverflow#"
    xmlns:oplsourceforge="http://www.openlinksw.com/schemas/oplsourceforge#"
    xmlns:oplsparqles="http://www.openlinksw.com/schemas/sparqles#"
    xmlns:oplstocks="http://www.openlinksw.com/schemas/stocks#"
    xmlns:opltable="http://www.openlinksw.com/schemas/opltable#"
    xmlns:opltesco="http://www.openlinksw.com/schemas/tesco#"
    xmlns:opltransport="http://www.openlinksw.com/schemas/transport#"
    xmlns:opltw="http://www.openlinksw.com/schemas/twitter#"
    xmlns:oplustream="http://www.openlinksw.com/schemas/ustream#"
    xmlns:oplweb="http://www.openlinksw.com/schemas/oplweb#"
    xmlns:oplwebservices="http://www.openlinksw.com/ontology/webservices#"
    xmlns:oplwsdl="http://www.openlinksw.com/schemas/wsdl#"
    xmlns:oplwthr="http://www.openlinksw.com/schemas/weatherreport#"
    xmlns:oplwtp="http://www.openlinksw.com/schemas/wtp#"
    xmlns:oplxg="http://www.openlinksw.com/schemas/xing#"
    xmlns:oplyls="http://www.openlinksw.com/schemas/yahoo_local_search#"
    xmlns:oplzllw="http://www.openlinksw.com/schemas/zillow#"
    xmlns:ore="http://www.openarchives.org/ore/terms/"
    xmlns:owl="http://www.w3.org/2002/07/owl#"
    xmlns:p="http://schemas.openxmlformats.org/presentationml/2006/main"
    xmlns:pd="http://api.polldaddy.com/pdapi.xsd"
    xmlns:pdo="http://ontologies.smile.deri.ie/pdo#"
    xmlns:ping="http://prodapi.pingar.com/"
    xmlns:pingns="http://prodapi.pingar.com"
    xmlns:plancast="http://www.openlinksw.com/schema/plancast#"
    xmlns:po="http://purl.org/ontology/po/"
    xmlns:poco="http://portablecontacts.net/ns/1.0"
    xmlns:primal="http://api.primal.com/primal#"
    xmlns:product="http://www.buy.com/rss/module/productV2/"
    xmlns:protseq="http://purl.org/science/protein/bysequence/"
    xmlns:proxy="http://vbv7.pigsty:8889/about/id/"
    xmlns:prv="http://purl.org/net/provenance/ns#"
    xmlns:prvTypes="http://purl.org/net/provenance/types#"
    xmlns:pto="http://www.productontology.org/id/"
    xmlns:pw="http://www.programmableweb.com/api/opensearch/1.0/"
    xmlns:r="http://backend.userland.com/rss2"
    xmlns:radio="http://www.radiopop.co.uk/"
    xmlns:rdf="http://www.w3.org/1999/02/22-rdf-syntax-ns#"
    xmlns:rdfa="http://www.w3.org/ns/rdfa#"
    xmlns:rdfdf="http://www.openlinksw.com/virtrdf-data-formats#"
    xmlns:rdfg="http://www.w3.org/2004/03/trix/rdfg-1/"
    xmlns:rdfs="http://www.w3.org/2000/01/rdf-schema#"
    xmlns:realdf="http://gr8c.org/realdf/ns#"
    xmlns:redwood-tags="http://www.holygoat.co.uk/owl/redwood/0.1/tags/"
    xmlns:rev="http://purl.org/stuff/rev#"
    xmlns:review="http://maps.google.com#"
    xmlns:rnews="http://iptc.org/std/rnews/20110202/rnews.owl#"
    xmlns:rsa="http://www.w3.org/ns/auth/rsa#"
    xmlns:rss="http://purl.org/rss/1.0/"
    xmlns:s="http://www.google.com/shopping/api/schemas/2010"
    xmlns:sc="http://purl.org/science/owl/sciencecommons/"
    xmlns:schema="http://schema.org/"
    xmlns:schemavideo="http://schema.org/VideoObject#"
    xmlns:scot="http://scot-project.org/scot/ns#"
    xmlns:scovo="http://purl.org/NET/scovo#"
    xmlns:sd="http://www.w3.org/ns/sparql-service-description#"
    xmlns:sf="urn:sobject.enterprise.soap.sforce.com"
    xmlns:sg="http://www.seatgeek.com#"
    xmlns:sioc="http://rdfs.org/sioc/ns#"
    xmlns:sioct="http://rdfs.org/sioc/types#"
    xmlns:sitemap="http://www.sitemaps.org/schemas/sitemap/0.9"
    xmlns:skos="http://www.w3.org/2004/02/skos/core#"
    xmlns:slash="http://purl.org/rss/1.0/modules/slash/"
    xmlns:soap="http://schemas.xmlsoap.org/wsdl/soap/"
    xmlns:spo="http://www.openlinksw.com/schemas/sponger/"
    xmlns:sql="sql:"
    xmlns:ss="urn:schemas-microsoft-com:office:spreadsheet"
    xmlns:stock="http://xbrlontology.com/ontology/finance/stock_market#"
    xmlns:taxconcept="http://www.taxonconcept.org/ont/se_v01/seo.owl#"
    xmlns:tesco="http://www.tesco.com/"
    xmlns:thr="http://purl.org/syndication/thread/1.0"
    xmlns:time="http://www.w3.org/2006/time#"
    xmlns:tio="http://purl.org/tio/ns#"
    xmlns:tk="http://www.trueknowledge.com/ns/kengine"
    xmlns:tl="http://purl.org/NET/c4dm/timeline.owl#"
    xmlns:twfy="http://www.openlinksw.com/schemas/twfy#"
    xmlns:twitter="http://www.openlinksw.com/schemas/twitter/"
    xmlns:uc="http://api.uclassify.com/1/ResponseSchema#"
    xmlns:umbel-ac="http://umbel.org/umbel/ac/"
    xmlns:umbel-sc="http://umbel.org/umbel/sc/"
    xmlns:umbel="http://umbel.org/umbel#"
    xmlns:usc="http://www.rdfabout.com/rdf/schema/uscensus/details/100pct/"
    xmlns:v="http://www.openlinksw.com/xsltext/"
    xmlns:vcard2006="http://www.w3.org/2006/vcard/ns#"
    xmlns:vcard="http://www.w3.org/2001/vcard-rdf/3.0#"
    xmlns:vi="http://www.openlinksw.com/virtuoso/xslt/"
    xmlns:video="http://purl.org/media/video#"
    xmlns:vimeo="http://vimeo.com/"
    xmlns:virt="http://www.openlinksw.com/virtuoso/xslt"
    xmlns:virtcxml="http://www.openlinksw.com/schemas/virtcxml#"
    xmlns:virtrdf="http://www.openlinksw.com/schemas/virtrdf#"
    xmlns:virtrdfmec="http://www.openlinksw.com/schemas/virtrdf-meta-entity-class#"
    xmlns:void="http://rdfs.org/ns/void#"
    xmlns:vso="http://purl.org/vso/ns#"
    xmlns:vt="http://schemas.openxmlformats.org/officeDocument/2006/docPropsVTypes"
    xmlns:vuln-20="http://scap.nist.gov/schema/feed/vulnerability/2.0"
    xmlns:vuln="http://scap.nist.gov/schema/vulnerability/0.4"
    xmlns:w="http://schemas.microsoft.com/office/word/2003/wordml"
    xmlns:wa="http://www.openlinksw.com/schemas/wolframalpha#"
    xmlns:wb="http://www.worldbank.org"
    xmlns:wdrs="http://www.w3.org/2007/05/powder-s#"
    xmlns:web="http://schemas.microsoft.com/LiveSearch/2008/04/XML/web"
    xmlns:wf="http://www.w3.org/2005/01/wf/flow#"
    xmlns:wfw="http://wellformedweb.org/CommentAPI/"
    xmlns:wsaw="http://www.w3.org/2006/05/addressing/wsdl"
    xmlns:wsdl="http://schemas.xmlsoap.org/wsdl/"
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
    xmlns:xsl1999="http://www.w3.org/1999/XSL/Transform"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
    xmlns:xslwd="http://www.w3.org/TR/WD-xsl"
    xmlns:y="urn:yahoo:maps"
    xmlns:yago="http://dbpedia.org/class/yago/"
    xmlns:yahoo_weather="http://www.openlinksw.com/schema/yweather#"
    xmlns:yca="urn:yahoo:cap"
    xmlns:yql="http://www.openlinksw.com/schemas/yql#"
    xmlns:yt="http://gdata.youtube.com/schemas/2007"
    xmlns:yweather="http://xml.weather.yahoo.com/ns/rss/1.0"
    xmlns:zem="http://s.zemanta.com/ns#"
    xmlns:zillow="http://www.zillow.com/"
    version="1.0">
  <!-- doctype-public="-//OASIS//DTD DocBook XML V5.0//EN"  -->

  <xsl:param name="replid" /> <!-- name of an item's @xml:id to replace with entity ref -->

  <!-- doctype-public="-//OASIS//DTD DocBook XML V5.0//EN" doctype-system="DocBook/docbook.dtd" -->
  
  <xsl:output encoding="UTF-8" indent="yes" method="xml"
              omit-xml-declaration="no" 
              exclude-result-prefixes="db Comps Demographics SearchResults
                                       UpdatedPropertyDetails a aapi accom
                                       activity address admin amz app atom
                                       audio awol aws b3s batch bestbuy
                                       bibo bif bio book bookmark bugzilla
                                       buzz c calais category cb cc cert cl
                                       cnet contact content cp cpe-lang
                                       crosspost ctag cv cvbase cve cvss d
                                       dawgt dbpedia-owl dbpedia dbpprop
                                       dbps dc dcat dcmitype dcterms digg
                                       doap dv dwc e ebay enc ep etsy event
                                       evri exif fam fb fbase fct ff fn
                                       foaf formats g gb gbs gd geo georss
                                       geospecies getglue gh gm gml gn go
                                       gphoto gr grs gs guardian hlisting
                                       hnews hoovers hrev http-voc ical ir
                                       issues itunes kml ldp lfm lgv lod lu
                                       m math md media mesh meta mf mmd mo
                                       moat mql nci ndfd_weather nfo ng nif
                                       nyt o oa oai oai_dc obo office ogc
                                       ogcgml ogcgs ogcgsf ogcgsr ogcsf oo
                                       openSearch opencyc openstreetmap
                                       opl-gs opl-meetup opl-xbrl opl
                                       oplamz oplangel oplbase oplbb
                                       oplbsbm oplcars oplcb oplcert oplcn
                                       oplcorporates oplcv opldeezer
                                       oplebay oplevri oplfactual oplflattr
                                       oplfq oplfr oplgovt oplgp oplgw
                                       oplhp oplie opljg oplklout oplli
                                       opllinkedjazz oplmarvel oplmetamind
                                       oplmisc oplmny oplnerd
                                       oplnutritionix oplnyt oplog oplomim
                                       oplosm oplpingar oplpolice
                                       oplredlink oplsc oplsecxbrl oplseevl
                                       oplsg oplshodan oplslideshare oplso
                                       oplsourceforge oplsparqles oplstocks
                                       opltable opltesco opltransport opltw
                                       oplustream oplweb oplwebservices
                                       oplwsdl oplwthr oplwtp oplxg oplyls
                                       oplzllw ore owl p pd pdo ping pingns
                                       plancast po poco primal product
                                       protseq proxy prv prvTypes pto pw r
                                       radio rdf rdfa rdfdf rdfg rdfs
                                       realdf redwood-tags rev review rnews
                                       rsa rss s sc schema schemavideo scot
                                       scovo sd sf sg sioc sioct sitemap
                                       skos slash soap spo sql ss stock
                                       taxconcept tesco thr time tio tk tl
                                       twfy twitter uc umbel-ac umbel-sc
                                       umbel usc v vcard2006 vcard vi video
                                       vimeo virt virtcxml virtrdf
                                       virtrdfmec void vso vt vuln-20 vuln
                                       w wa wb wdrs web wf wfw wsaw wsdl xf
                                       xfn xfnv xhtml xhv xn xsd xsi xsl10
                                       xsl1999 xsl xslwd y yago
                                       yahoo_weather yca yql yt yweather
                                       zem zillow "
              version="1.0"/>


  <xsl:preserve-space elements="*"/>
  
  <!-- Primary template -->

  <xsl:template match="/">
    <xsl:apply-templates mode="copy" select="/" />
  </xsl:template>

  <xsl:template match="*" mode="copy">
    <xsl:choose>
      <xsl:when test="$allids">
        <xsl:text disable-output-escaping="yes">&amp;</xsl:text><xsl:value-of select="@xml:id"/>;
      </xsl:when>
      <xsl:otherwise>
        <xsl:element name="{name(.)}">
          <xsl:apply-templates select="@*" mode="copy"/>
          <xsl:apply-templates mode="copy"/>
        </xsl:element>
      </xsl:otherwise>
    </xsl:choose>
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

</xsl:stylesheet>
EOF

sync
sleep 1
sync

echo "Invoking XSLT"
xsltproc --stringparam replid "$allids" docbook-replace-ids-entities.xsl "$fname" > foo && mv foo "$fname"

echo "Re-add missing doctypes"
echo "/\?>
.a
<!DOCTYPE book PUBLIC \"-//OASIS//DTD DocBook XML V5.0//EN\" \"DocBook/docbook.dtd\" [
<!ENTITY dummyentity SYSTEM \"dummyentity.xml\">
]>
.
w
q
" | ex "$fname"

echo "Fixing entity declarations"
for i in $ids
do
    ofname="$i.xml"
    [ -f "$ofname" ] || ofname="ch-$i.xml"
    echo "/\dummy
.a
<!ENTITY $i SYSTEM \"$ofname\">
.
w
q" | ex "$fname"
done
wait
