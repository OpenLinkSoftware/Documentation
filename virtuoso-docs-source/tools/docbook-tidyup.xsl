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
  
  <xsl:output encoding="UTF-8" indent="yes" method="xml"
              omit-xml-declaration="no" doctype-public="-//OASIS//DTD DocBook XML V5.0//EN"
              doctype-system="../DocBook/docbook.dtd"
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
                                       xfn xfnv xhv xn xsd xsi xsl10
                                       xsl1999 xsl xslwd y yago
                                       yahoo_weather yca yql yt yweather
                                       zem zillow "
              cdata-section-elements="programlisting screen"
              version="1.0"/>
  <!-- Primary template -->

  <xsl:template match="/">
    <xsl:apply-templates mode="copy" select="/"/>
  </xsl:template>

  <!-- Copy-mode templates -->

  <!-- Pattern exclusions -->
  <!-- Pattern replacements -->
  <!-- insert missing para within listitem -->
  <!--
      <xsl:template match="*[name(.)='listitem' and normalize-space(./text())!='']" mode="copy" priority="10">
      <xsl:element name="listitem">
      <para>
      <xsl:value-of select="."/>
      </para>
      </xsl:element>
      <xsl:text>

</xsl:text>
</xsl:template> -->

  <!-- Fix listitems consisting of just a link element -->
  <!--
      <xsl:template match="*[name(.)='listitem' and count(./*)=1 and name(./*)='link']" mode="copy" priority="10">
      <xsl:element name="listitem">
      <para>
      <xsl:apply-templates mode="copy" />
      </para>
      </xsl:element>
      <xsl:text>

</xsl:text>
</xsl:template> -->

  <!-- insert missing remark within important -->
  <!--
      <xsl:template match="*[name(.)='important' and normalize-space(./text())!='']"  mode="copy" priority="10">
      <xsl:element name="important">
      <remark>
      <xsl:value-of select="."/>
      </remark>
      </xsl:element>
      </xsl:template> -->

  <!-- Do not want info between table and title -->
  <!--
      <xsl:template match="*[name(.)='info' and title and ./table]"  mode="copy" priority="10">
      <xsl:value-of select="."/>
      </xsl:template>
  -->

  <!-- Replace graphic with imageobject -->

  <!-- <xsl:template match="*[name(.)='graphic']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="mediaobject"> -->
  <!--     <imageobject> -->
  <!--       <imagedata fileref="{@fileref}"> -->
  <!--         <xsl:copy-of select="@width|@height|@depth"/> -->
  <!--         <xsl:apply-templates select="title" mode="copygraphic"/> -->
  <!--       </imagedata> -->
  <!--     </imageobject> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->


  <!-- <xsl:template match="title" mode="copygraphic"> -->
  <!--   <xsl:element name="label"> -->
  <!--     <xsl:value-of select="."/> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- Replace ulink with link@xhtml:href as per DTD change docs -->

  <!-- <xsl:template match="*[name(.)='ulink']"  mode="copy" priority="10"> -->
  <!--     <xsl:element name="link"> -->
  <!--         <xsl:apply-templates select="@*" mode="ulink" /> -->
  <!--         <xsl:apply-templates mode="copy" /> -->
  <!--     </xsl:element> -->
  <!--   </xsl:template> -->

  <!-- <xsl:template match="@*[name(.)='url']" mode="ulink" priority="10"> -->
  <!--     <xsl:attribute name="xlink:href"> -->
  <!--       <xsl:value-of select="." /> -->
  <!--     </xsl:attribute> -->
  <!--   </xsl:template> -->

  <!-- <xsl:template match="@*" mode="ulink" priority="5"> -->
  <!--     <xsl:copy /> -->
  <!--   </xsl:template> -->

  <!-- Rewrite common pattern of msgtext/{errorcode,errortype,errorname} -->
  <!-- errorname is best replaced with errortext in docbook v5 DTD -->
  <!-- <xsl:template match="*[name(.)='msgtext']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="msgtext"> -->
  <!--     <xsl:element name="para"> -->
  <!--       <xsl:apply-templates mode="copy" /> -->
  <!--     </xsl:element> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='errorname']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="errortext"> -->
  <!--     <xsl:apply-templates mode="copy" /> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!--   <xsl:template match="*[name(.)='attribute']" mode="copy" priority="10"> -->
  <!--     <xsl:element name="paramdef"> -->
  <!--       <xsl:attribute name="choice"> -->
  <!--         <xsl:choose> -->
  <!--           <xsl:when test="contains(./text(), 'required')">req</xsl:when> -->
  <!--           <xsl:otherwise>opt</xsl:otherwise> -->
  <!--         </xsl:choose> -->
  <!--       </xsl:attribute> -->
  <!--       <xsl:apply-templates mode="copy" /> -->
  <!--     </xsl:element> -->
  <!--     <xsl:text> -->
  <!-- </xsl:text> -->
  <!--   </xsl:template> -->

  <!-- <xsl:template match="text()[normalize-space(.)='(required)' or normalize-space(.)='(optional)']" mode="copy" priority="15" /> -->


  <!-- Move paramdef outwith funcdef -->
  <!-- <xsl:template match="*[name(.)='funcdef']" mode="copy" priority="20"> -->
  <!--   <xsl:element name="{name(.)}"> -->
  <!--     <xsl:apply-templates select="@*" mode="copy"/> -->
  <!--     <xsl:apply-templates mode="copy" /> -->
  <!--   </xsl:element> -->
  <!--   <xsl:copy-of select="*[name(.)='paramdef']" /> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='paramdef' and name(..)='funcdef']" mode="copy" priority="50" /> -->

  <!-- <xsl:template match="*[name(.)='optional' and name(..)='paramdef']" mode="copy" priority="10"> -->
  <!--   <xsl:apply-templates mode="copy" /> -->
  <!-- </xsl:template> -->


  <!-- Move trailing para within otherwise-lacking formalpara  -->

  <!-- <xsl:template match="*[name(.)='formalpara' and count(*[name(.)='para'])=0 and name(following-sibling::*[1])='para']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="{name(.)}"> -->
  <!--     <xsl:apply-templates select="@*" mode="copy" /> -->
  <!--     <xsl:apply-templates select="*|text()" mode="copy" /> -->
  <!--     <xsl:copy-of select="following-sibling::*[1]" /> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='para' and  preceding-sibling::*[1][name(.)='formalpara' and count(*[name(.)='para'])=0]]" -->
  <!--               mode="copy" priority="10"> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="@*[name(.)='moreinfo' and name(..)='parameter']" mode="copy" priority="20" /> -->


  <!-- <xsl:template match="*[name(.)='formalpara' and count(./*[name(.)='para']) &gt; 1 ]" mode="copy" priority="10"> -->
  <!--   <xsl:element name="formalpara"> -->
  <!--     <xsl:apply-templates mode="fpcopy1" /> -->
  <!--   </xsl:element> -->
  <!--   <xsl:apply-templates select="./*[name(.)='para']" mode="fpcopy" /> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='para'][1]" mode="fpcopy" priority="10" /> -->

  <!-- <xsl:template match="*" mode="fpcopy"> -->
  <!--   <xsl:copy-of select="." /> -->
  <!-- </xsl:template> -->


  <!-- <xsl:template match="*[name(.)!='para']|text()|*[name(.)='para'][1]" mode="fpcopy1" priority="10"> -->
  <!--   <xsl:copy-of select="." /> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='para']" mode="fpcopy1" /> -->

  <!-- member does not take para, just straight to CDATA -->
  <!-- <xsl:template match="*[name(.)='member']/*[name(.)='para']" mode="copy" priority="10"> -->
  <!--   <xsl:apply-templates mode="copy" /> -->
  <!-- </xsl:template> -->

  <!-- Restrict formalpara to DTD-permitted elements *only* -->
  <!-- <xsl:template match="*[name(.)='formalpara'][
       *[name(.)='screen'] or
       *[name(.)='example'] or
       *[name(.)='funcsynopsis'] or
       *[name(.)='note'] or
       *[name(.)='simplelist'] or
       *[name(.)='itemizedlist'] or
       *[name(.)='programlisting']
       ]" mode="copy" priority="10">
       <xsl:element name="formalpara">
       <xsl:apply-templates select="*[name(.)!='screen' and name(.)!='example' and name(.)!='funcsynopsis' and name(.)!='note' and name(.)!='simplelist' and name(.)!='itemizedlist' and name(.)!='programlisting']" mode="copy" />
       </xsl:element>
       <xsl:apply-templates select="*[name(.)='screen']|*[name(.)='example']|*[name(.)='funcsynopsis']|*[name(.)='note']|*[name(.)='simplelist']|*[name(.)='itemizedlist']|*[name(.)='programlisting']" mode="copy" />
       </xsl:template> -->

  <!-- Rewrite the pattern emphasis/title+para -->
  <!-- <xsl:template match="*[name(.)='emphasis'][*[name(.)='title'] and name(following-sibling::*[1])='para']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="formalpara"> -->
  <!--     <xsl:copy-of select="*[name(.)='title']" /> -->
  <!--     <xsl:copy-of select="following-sibling::*[1]" /> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->
  
       <!-- <xsl:template match="*[name(.)='para'][name(preceding-sibling::*[1])='emphasis' and preceding-sibling::*[1][*[name(.)='title']]]" -->
       <!--        mode="copy" priority="10" /> -->

  <!-- An entry that starts with "define input:" is actually a programlisting -->
  <!-- <xsl:template match="*[name(.)='entry'][starts-with(normalize-space(./text()), 'define input:')]" mode="copy" priority="10">
       <xsl:element name="entry">
       <xsl:element name="programlisting">
       <xsl:apply-templates mode="copy" />
       </xsl:element>
       </xsl:element>
       </xsl:template> -->

  <!-- Remove all br tags -->
  <!-- <xsl:template match="*[name(.)='br']" mode="copy" priority="10">
       <xsl:if test="name(..)!='programlisting'">
       <xsl:comment>AUTOFIX: this used to be a br element here</xsl:comment>
       </xsl:if><xsl:text>
       </xsl:text>
       </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='function'][*[name(.)='parameter']]" mode="copy" priority="10"> -->
  <!--      <xsl:element name="code"> -->
  <!--      <xsl:apply-templates select="@*" mode="copy" /> -->
  <!--      <xsl:apply-templates mode="copy" /> -->
  <!--      </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[starts-with(name(.), 'sect')]" mode="copy" priority="10">
       <xsl:element name="section">
       <xsl:apply-templates select="@*" mode="copy" />
       <xsl:apply-templates mode="copy" />
       </xsl:element>
       </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='para']/*[name(.)='para']" mode="copy" priority="10">
       <xsl:apply-templates mode="copy" />
       </xsl:template> -->


  <!--  <xsl:template match="*[name(.)='abstract' and name(..)!='info']"
       mode="copy" priority="10">
       <xsl:element name="info">
       <xsl:copy-of select="." />
       </xsl:element>
       </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='p']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="para"> -->
  <!--     <xsl:apply-templates mode="copy"/> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='i']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="emphasis"> -->
  <!--     <xsl:apply-templates mode="copy"/> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->


  <!-- <xsl:template match="*[name(.)='optional' and name(..)='parameter']" -->
  <!--               mode="copy" priority="10" > -->
  <!--   <xsl:apply-templates mode="copy" /> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='formalpara' and ./*[name(.)='table'] and count(./*)=2]" -->
  <!--               mode="copy" priority="10"> -->
  <!--   <xsl:element name="para"> -->
  <!--     <bridgehead><xsl:value-of select="*[name(.)='title']" /></bridgehead> -->
  <!--     <xsl:apply-templates select="*[name(.)='table']" mode="copy" /> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- Add title to tables lacking -->
  <!-- <xsl:template match="//*[name(.)='table' and count(./*[name(.)='title'])=0]" mode="copy" priority="10"> -->
  <!--   <xsl:element name="table"> -->
  <!--     <xsl:apply-templates select="@*" mode="copy" /> -->
  <!--     <xsl:element name="title"><xsl:text> -->
  <!-- </xsl:text> -->
  <!--     </xsl:element> -->
  <!--     <xsl:apply-templates select="*" mode="copy" /> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='link']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="link"> -->
  <!--     <xsl:apply-templates select="@*" mode="copy" /> -->
  <!--     <xsl:apply-templates select="*|text()" mode="copy" /> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="@*[name(.)='linkend']" mode="copy" priority="10"> -->
  <!--   <xsl:attribute name="linkend"> -->
  <!--     <xsl:choose> -->
  <!--       <xsl:when test="contains(., '(')"> -->
  <!--         <xsl:value-of select="substring-before(., '(')" /> -->
  <!--       </xsl:when> -->
  <!--       <xsl:otherwise> -->
  <!--         <xsl:value-of select="." /> -->
  <!--       </xsl:otherwise> -->
  <!--     </xsl:choose> -->
  <!--   </xsl:attribute> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='link' and contains(@linkend,'http://')]" mode="copy" priority="10"> -->
  <!--   <xsl:element name="link"> -->
  <!--     <xsl:attribute name="href" namespace="http://www.w3.org/1999/xhtml"> -->
  <!--       <xsl:value-of select="@linkend"/> -->
  <!--     </xsl:attribute> -->
  <!--     <xsl:apply-templates select="*|text()" mode="copy"/> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->
  
  <!-- <xsl:template match="*[name(.)='link' and -->
  <!--                      (@linkend='xpathcontainspredicate' -->
  <!-- or @linkend='count' -->
  <!-- or @linkend='adminuireplicationandsynchronization' -->
  <!-- or @linkend='bif_funcs' -->
  <!-- or @linkend='bloggersystables' -->
  <!-- or @linkend='checkpointAuditTrail' -->
  <!-- or @linkend='GNxxx' -->
  <!-- or @linkend='httphandleclidisconnect' -->
  <!-- or @linkend='RExxx' -->
  <!-- or @linkend='tpccintro' -->
  <!-- or @linkend='VirtFacetUsage6' -->
  <!-- or @linkend='vseiplugins' -->
  <!-- or @linkend='webdataimportsexports' -->
  <!-- or @linkend='WST_SERVER_ISSUER_TOKENS' -->
  <!-- or @linkend='xmltypeudt' -->
  <!-- or @linkend='davuseradm' -->
  <!-- or @linkend='expspublishbtn' -->
  <!-- or @linkend='parameters' -->
  <!-- or @linkend='x509odbcclient' -->
  <!-- or @linkend='adminui' -->
  <!-- or @linkend='xmlqtemplates')]" mode="copy" -->
  <!--               priority="10"> -->
  <!--   <xsl:apply-templates mode="copy" /> -->
  <!-- <xsl:text> </xsl:text> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='link' and -->
  <!--                      ( @linkend='fn_aq_request' -->
  <!--                      or @linkend='fn_aq_requests' -->
  <!--                      or @linkend='fn_async_queue' -->
  <!--                      or @linkend='fn_blogger.deletePost' -->
  <!--                      or @linkend='fn_blogger.editPost' -->
  <!--                      or @linkend='fn_blogger.getRecentPosts' -->
  <!--                      or @linkend='fn_blogger.getTemplate' -->
  <!--                      or @linkend='fn_blogger.getUserInfo' -->
  <!--                      or @linkend='fn_blogger.getUsersBlogs' -->
  <!--                      or @linkend='fn_blogger.newPost' -->
  <!--                      or @linkend='fn_blogger.setTemplate' -->
  <!--                      or @linkend='fn_metaWeblog.editPost' -->
  <!--                      or @linkend='fn_metaWeblog.getPost' -->
  <!--                      or @linkend='fn_metaWeblog.getRecentPosts' -->
  <!--                      or @linkend='fn_metaWeblog.newPost' -->
  <!--                      or @linkend='fn_mt.getCategoryList' -->
  <!--                      or @linkend='fn_mt.getPostCategories' -->
  <!--                      or @linkend='fn_mt.getRecentPostTitles' -->
  <!--                      or @linkend='fn_mt.getTrackbackPings' -->
  <!--                      or @linkend='fn_mt.publishPost' -->
  <!--                      or @linkend='fn_mt.setPostCategories' -->
  <!--                      or @linkend='fn_mt.supportedMethods' -->
  <!--                      or @linkend='fn_sys_connected_server_address' -->
  <!--                      or @linkend='fn_ws_proc_def' -->
  <!--                      or @linkend='fn_xml_remove_ns_by_prefix' -->
  <!--                      or @linkend='fn_xmlStorageSystem.requestNotification' -->
  <!--                      or @linkend='fn_xpath_contains' -->
  <!--                      )]" mode="copy" -->
  <!--               priority="10"> -->
  <!--   <xsl:apply-templates mode="copy" /> -->
  <!--   <xsl:text> </xsl:text> -->
  <!-- </xsl:template> -->

  <!-- Second attempt at fixing listitem with direct text() nodes -->

  <!-- <xsl:template match="//*[name(.)='listitem'][./text() and count(.//*[name(.)='para'])=0]" mode="copy" priority="10"> -->
  <!--   <xsl:comment>TDH: fixed listitem/text()</xsl:comment> -->
  <!--   <xsl:element name="listitem"> -->
  <!--     <xsl:apply-templates select="@*" mode="copy" /> -->
  <!--     <xsl:element name="para"> -->
  <!--       <xsl:apply-templates mode="copy" /> -->
  <!--     </xsl:element> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- Make id attributes lowercase -->
  <!-- <xsl:template match="@*[name(.)='id' or local-name(.)='id' or -->
  <!--                      name(.)='xml:id' or name(.)='linkend' or local-name(.)='linkend']" mode="copy" priority="100"> -->
  <!--   <xsl:attribute name="{name(.)}"> -->
  <!--     <xsl:value-of select="translate(., 'ABCDEFGHIJKLMNOPQRSTUVWXYZ','abcdefghijklmnopqrstuvwxyz')" /> -->
  <!--   </xsl:attribute> -->
  <!-- </xsl:template> -->


  <!-- <xsl:template match="*[name(.)='link'][name(..)='listitem' and count(../*)=1]" mode="copy" priority="10"> -->
  <!--   <xsl:element name="para"> -->
  <!--     <xsl:copy-of select="."/> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->


  <!-- Flatten para/title to emphasis -->
  <!-- <xsl:template match="*[name(.)='title' and name(..)='para' and count(../*)=1]" mode="copy" priority="10"> -->
  <!--   <xsl:element name="emphasis"><xsl:apply-templates mode="copy"/> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- Flatten para/para -->
  <!-- <xsl:template match="*[name(.)='para' and name(..)='para']" mode="copy" priority="10"> -->
  <!--  <xsl:text> </xsl:text> <xsl:apply-templates mode="copy"/>   <xsl:text> </xsl:text> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='formalpara' and count(./*)=1 and *[name(.)='title']]" mode="copy" priority="10"> -->
  <!--   <xsl:element name="bridgehead"> -->
  <!--     <xsl:apply-templates select="*[name(.)='title']/text()" mode="copy"/> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- Fix listitem/emphasis -->
  <!-- <xsl:template match="*[name(.)='listitem']/*[name(.)='emphasis']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="para"> -->
  <!--     <xsl:copy-of select="."/> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  
  <!-- Fix nested simplelists -->
  <!-- <xsl:template match="*[name(.)='simplelist' and */*[name(.)='simplelist']]" mode="copy" priority="10"> -->
  <!--   <xsl:element name="orderedlist"> -->
  <!--     <xsl:apply-templates mode="copy"/> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='simplelist' and */*[name(.)='simplelist']]/*[name(.)='member']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="listitem"> -->
  <!--     <xsl:apply-templates mode="copy"/> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->


  <!--
</para>[ \n\r]*<link(.*?)</link>[ \r\n]*<para>
-->

  <!-- <xsl:template match="*[name(.)='parameter' and name(..)='function' and -->
  <!--                      name(../..)='para']" mode="copy" priority="10"> -->
  <!--   <xsl:apply-templates mode="copy" /> -->
  <!--   , -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='function' and name(..)='link' and -->
  <!--                      *[name(.)='paramdef'] and -->
  <!--                      string-length(normalize-space(./text()))&lt;35]" -->
  <!--               mode="copy" -->
  <!--               priority="10"> -->
  <!--   <xsl:element name="code"> -->
  <!--     <xsl:value-of select="./text()" /> (<xsl:apply-templates select="*" mode="copy2" /> -->
  <!--     ) -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='paramdef']" mode="copy2" priority="10"> -->
  <!--     <xsl:value-of select="." /><xsl:text>, </xsl:text> -->
  <!-- </xsl:template> -->


  <!-- <xsl:template match="*[name(.)='simplelist'][*[name(.)='member']/*[name(.)='programlisting']]" mode="copy" priority="10"> -->
  <!--   <xsl:element name="orderedlist"> -->
  <!--     <xsl:apply-templates select="*" mode="copy2"/> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='member']" mode="copy2" priority="10"> -->
  <!--   <xsl:element name="listitem"> -->
  <!--     <xsl:element name="para"> -->
  <!--       <xsl:apply-templates mode="copy"/> -->
  <!--     </xsl:element> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*|text()" mode="copy2" priority="1"> -->
  <!--   <xsl:comment>OOPS!!!</xsl:comment> -->
  <!--   <xsl:apply-templates mode="copy"/> -->
  <!-- </xsl:template> -->


  <!-- <xsl:template match="*[name(.)='table' and name(..)='formalpara']" -->
  <!--               mode="copy" priority="10"> -->
  <!--   <xsl:element name="para"> -->
  <!--     <xsl:copy-of select="."/> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->


  <!-- <xsl:template match="*[name(.)='p']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="para"> -->
  <!--     <xsl:apply-templates mode="copy"/> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- Rewrite things that shouldn't be a refsect1 -->
  <!-- <xsl:template match="*[name(.)='refsect1' and @fixme='fixme']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="variablelist"> -->
  <!--     <xsl:apply-templates select="@*" mode="copy"/> -->
  <!--     <xsl:for-each select="*[name(.)='refsect2']"> -->
  <!--       <xsl:element name="varlistentry"> -->
  <!--         <xsl:element name="term"> -->
  <!--           <xsl:value-of select="*[name(.)='title']"/> -->
  <!--         </xsl:element> -->
  <!--       <xsl:element name="listitem"> -->
  <!--         <xsl:apply-templates select="*[name(.)!='title']" mode="copy"/> -->
  <!--         </xsl:element> -->
  <!--     </xsl:element> -->
  <!--     </xsl:for-each> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='funcprototype' and count(*[name(.)='paramdef'])=0]" mode="copy" priority="10"> -->
  <!--   <xsl:element name="funcprototype"> -->
  <!--     <xsl:apply-templates select="@*" mode="copy"/> -->
  <!--     <xsl:apply-templates select="*" mode="copy" /> -->
  <!--     <xsl:element name="paramdef"> -->
  <!--     </xsl:element> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='funcdef' and name(..)!='funcprototype']" mode="copy" priority="10"> -->
  <!--   <xsl:element name="funcprototype"> -->
  <!--     <xsl:element name="funcdef"> -->
  <!--       <xsl:apply-templates mode="copy" select="@*"/> -->
  <!--       <xsl:apply-templates mode="copy" select="*|text()"/> -->
  <!--     </xsl:element> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->


  <!-- <xsl:variable name="allids"><xsl:copy-of select="//*[@xml:id]"/></xsl:variable> -->
  
  <!-- <xsl:template match="*[name(.)='link' and @linkend and count(//*[@xml:id=./@linkend])=0]" mode="copy" priority="10"> -->
  <!--   <xsl:comment>Eliding link with missing linkend <xsl:value-of select="@linkend"/> </xsl:comment> -->
  <!--   <xsl:comment>All IDs: <xsl:value-of select="@allids" /></xsl:comment> -->

  <!--   <xsl:apply-templates select="*|text()" mode="copy"/> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="*[name(.)='link' and @linkend='FIXME_']" mode="copy" priority="10"> -->
  <!--    <xsl:apply-templates select="*|text()" mode="copy"/>  -->
  <!-- </xsl:template> -->

  <!-- Replace duplicate ID things -->

  <!-- <xsl:template match="*[ -->
  <!--               @xml:id='fn_bpel_compile_script' or -->
  <!--               @xml:id='fn_bpel_copy_script' or -->
  <!--               @xml:id='fn_bpel_get_partner_links' or -->
  <!--               @xml:id='fn_bpel_get_var' or -->
  <!--               @xml:id='fn_bpel_import_script' or -->
  <!--               @xml:id='fn_bpel_instance_delete' or -->
  <!--               @xml:id='fn_bpel_purge' or -->
  <!--               @xml:id='fn_bpel_script_delete' or -->
  <!--               @xml:id='fn_bpel_script_obsolete' or -->
  <!--               @xml:id='fn_bpel_script_source_update' or -->
  <!--               @xml:id='fn_bpel_script_upload' or -->
  <!--               @xml:id='fn_bpel_set_var' or -->
  <!--               @xml:id='fn_bpel_wsdl_upload' or -->
  <!--               @xml:id='fn_mime_tree' or -->
  <!--               @xml:id='fn_nntp_get' or -->
  <!--               @xml:id='fn_plink_get_option' or -->
  <!--               @xml:id='fn_plink_set_option' or -->
  <!--               @xml:id='fn_pop3_get' or -->
  <!--               @xml:id='fn_smtp_send' or -->
  <!--               @xml:id='fn_vt_batch' or -->
  <!--               @xml:id='fn_vt_batch_d_id' or -->
  <!--               @xml:id='fn_vt_batch_feed' or -->
  <!--               @xml:id='fn_vt_batch_feed_offband' or -->
  <!--               @xml:id='fn_vt_batch_update' or -->
  <!--               @xml:id='fn_vt_drop_ftt' or -->
  <!--               @xml:id='fn_vt_is_noise' or -->
  <!--               @xml:id='me_uddi_delete_binding' or -->
  <!--               @xml:id='me_uddi_delete_business' or -->
  <!--               @xml:id='me_uddi_delete_service' or -->
  <!--               @xml:id='me_uddi_delete_tmodel' or -->
  <!--               @xml:id='me_uddi_discard_authtoken' or -->
  <!--               @xml:id='me_uddi_find_binding' or -->
  <!--               @xml:id='me_uddi_find_business' or -->
  <!--               @xml:id='me_uddi_find_service' or -->
  <!--               @xml:id='me_uddi_find_tmodel' or -->
  <!--               @xml:id='me_uddi_get_authtoken' or -->
  <!--               @xml:id='me_uddi_get_bindingdetail' or -->
  <!--               @xml:id='me_uddi_get_businessdetail' or -->
  <!--               @xml:id='me_uddi_get_businessdetailext' or -->
  <!--               @xml:id='me_uddi_get_registeredinfo' or -->
  <!--               @xml:id='me_uddi_get_servicedetail' or -->
  <!--               @xml:id='me_uddi_get_tmodeldetail' or -->
  <!--               @xml:id='me_uddi_save_binding' or -->
  <!--               @xml:id='me_uddi_save_business' or -->
  <!--               @xml:id='me_uddi_save_service' or -->
  <!--               @xml:id='me_uddi_save_tmodel' or -->
  <!--               @xml:id='xpf_processxquery' or -->
  <!--               @xml:id='xpf_processxslt' or -->
  <!--               @xml:id='xpf_processxsql' ]" mode="copy" priority="10"> -->
  <!--   <xsl:element name="section"> -->
  <!--     <xsl:attribute name="xml:id"><xsl:value-of select="concat(@xml:id, '_dedup')"/></xsl:attribute> -->
  <!--     <para>For detailed description and example use of the function, see -->
  <!--     <link linkend="{@xml:id}"> -->
  <!--       <xsl:choose> -->
  <!--         <xsl:when test="refmeta/refentrytitle[1]"> -->
  <!--           <xsl:value-of select="refmeta/refentrytitle[1]"/> -->
  <!--         </xsl:when> -->
  <!--         <xsl:otherwise><xsl:value-of select="@xml:id"/></xsl:otherwise> -->
  <!--       </xsl:choose> -->
  <!--     </link> -->
  <!--     in the <link linkend="ch-functions">Functions Reference Guide</link>. -->
  <!--     </para> -->
  <!--   </xsl:element> -->
  <!-- </xsl:template> -->

  
  <!-- Generic loop -->


  
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
    <xsl:copy-of select="." />
  </xsl:template> 

  <!-- <xsl:template match="*[count(*)=0 and name(.)!='programlisting' and name(.)!='screen']/text()" mode="copy" priority="5"> -->
  <!--   <xsl:value-of select="normalize-space(.)"/> -->
  <!-- </xsl:template> -->

  <!-- <xsl:template match="text()[following-sibling::*]" mode="copy"> -->
  <!--   <xsl:value-of select="normalize-space(.)"/> -->
  <!--   <xsl:text> </xsl:text> -->
  <!-- </xsl:template> -->

  <xsl:template match="text()" mode="copy">
    <xsl:copy />
  </xsl:template>

</xsl:stylesheet>
