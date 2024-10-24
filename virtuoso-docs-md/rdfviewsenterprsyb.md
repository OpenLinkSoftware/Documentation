<div>

<div>

<div>

<div>

### 16.8.8. Sybase using demonstration 'pubs2' database

</div>

</div>

</div>

``` programlisting
-- Setup script for Linked Data Views of Sybase 15 PUBS2 Sample Database --

DB..vd_remote_data_source ('syb15ma-pubs2', '', '<uid>','<pwd>');

ATTACH TABLE  "pubs2.dbo.au_pix"  PRIMARY KEY ("au_id")                  AS "pubs2"."syb"."au_pix"  FROM 'syb15ma-pubs2';
ATTACH TABLE  "pubs2.dbo.authors"  PRIMARY KEY ("au_id")                  AS "pubs2"."syb"."authors"  FROM 'syb15ma-pubs2';
ATTACH TABLE  "pubs2.dbo.discounts"  PRIMARY KEY ("stor_id")                  AS "pubs2"."syb"."discounts"  FROM 'syb15ma-pubs2';
ATTACH TABLE  "pubs2.dbo.publishers"  PRIMARY KEY ("pub_id")                  AS "pubs2"."syb"."publishers"  FROM 'syb15ma-pubs2';
ATTACH TABLE  "pubs2.dbo.roysched"  PRIMARY KEY ("title_id")                  AS "pubs2"."syb"."roysched"  FROM 'syb15ma-pubs2';
ATTACH TABLE  "pubs2.dbo.sales"  PRIMARY KEY ("stor_id", "ord_num")                  AS "pubs2"."syb"."sales"  FROM 'syb15ma-pubs2';
ATTACH TABLE  "pubs2.dbo.salesdetail"  PRIMARY KEY ("stor_id", "ord_num", "title_id")                   AS "pubs2"."syb"."salesdetail"  FROM 'syb15ma-pubs2';
ATTACH TABLE  "pubs2.dbo.stores"  PRIMARY KEY ("stor_id")                  AS "pubs2"."syb"."stores"  FROM 'syb15ma-pubs2';
ATTACH TABLE  "pubs2.dbo.titleauthor"  PRIMARY KEY ("au_id", "title_id")                  AS "pubs2"."syb"."titleauthor"  FROM 'syb15ma-pubs2';
ATTACH TABLE  "pubs2.dbo.titles"  PRIMARY KEY ("title_id", "pub_id")                  AS "pubs2"."syb"."titles"  FROM 'syb15ma-pubs2';

COMMIT WORK;

GRANT SELECT ON pubs2.syb.au_pix TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON pubs2.syb.authors TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON pubs2.syb.discounts TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON pubs2.syb.publishers TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON pubs2.syb.roysched TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON pubs2.syb.sales TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON pubs2.syb.salesdetail TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON pubs2.syb.stores TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON pubs2.syb.titleauthor TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON pubs2.syb.titles TO "SPARQL", "SPARQL_UPDATE";

-------------------------------------------------------------------

-------- Create rdfs:Class definitions ----------------------------

ttlp (
'
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

@prefix syb: <http://example.com/schemas/sybasepubs2/> .

syb:titles a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/sybasepubs2> ;
    rdfs:label "titles" ;
    rdfs:comment "Sybase Pubs2 titles table" .

syb:title_id a rdf:Property ;
    rdfs:domain syb:titles ;
    rdfs:range xsd:string ;
    rdfs:label "title id" .

syb:title a rdf:Property ;
    rdfs:domain syb:titles ;
    rdfs:range xsd:string ;
    rdfs:label "title" .

syb:type a rdf:Property ;
    rdfs:domain syb:titles ;
    rdfs:range xsd:string ;
    rdfs:label "type" .

syb:pub_id a rdf:Property ;
    rdfs:domain syb:titles ;
    rdfs:range syb:publishers ;
    rdfs:label "pub_id" .

syb:advance a rdf:Property ;
    rdfs:domain syb:titles ;
    rdfs:range xsd:decimal ;
    rdfs:label "advance" .

syb:price a rdf:Property ;
    rdfs:domain syb:titles ;
    rdfs:range xsd:decimal ;
    rdfs:label "price" .

syb:total_sales a rdf:Property ;
    rdfs:domain syb:titles ;
    rdfs:range xsd:integer ;
    rdfs:label "total_sales" .

syb:notes a rdf:Property ;
    rdfs:domain syb:titles ;
    rdfs:range xsd:string ;
    rdfs:label "notes" .

syb:contract a rdf:Property ;
    rdfs:domain syb:titles ;
    rdfs:range xsd:integer ;
    rdfs:label "contract" .

syb:pubdate a rdf:Property ;
    rdfs:domain syb:titles ;
    rdfs:range xsd:dateTime ;
    rdfs:label "publish date" .

syb:authors a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/sybasepubs2> ;
    rdfs:label "authors" ;
    rdfs:comment "Sybase Pubs2 authors table" .

syb:au_id a rdf:Property ;
    rdfs:domain syb:authors ;
    rdfs:range xsd:string ;
    rdfs:label "author id" .

syb:au_lname a rdf:Property ;
    rdfs:domain syb:authors ;
    rdfs:range xsd:string ;
    rdfs:label "author last name" .

syb:au_fname a rdf:Property ;
    rdfs:domain syb:authors ;
    rdfs:range xsd:string ;
    rdfs:label "author first name" .

syb:phone a rdf:Property ;
    rdfs:domain syb:authors ;
    rdfs:range xsd:string ;
    rdfs:label "phone number" .

syb:address a rdf:Property ;
    rdfs:domain syb:authors ;
    rdfs:range xsd:string ;
    rdfs:label "address" .

syb:city a rdf:Property ;
    rdfs:domain syb:authors ;
    rdfs:range xsd:string ;
    rdfs:label "city" .

syb:state a rdf:Property ;
    rdfs:domain syb:authors ;
    rdfs:range xsd:string ;
    rdfs:label "state" .

syb:country a rdf:Property ;
    rdfs:domain syb:authors ;
    rdfs:range xsd:string ;
    rdfs:label "country" .

syb:postalcode a rdf:Property ;
    rdfs:domain syb:authors ;
    rdfs:range xsd:string ;
    rdfs:label "postalcode" .

syb:stores a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/sybasepubs2> ;
    rdfs:label "stores" ;
    rdfs:comment "Sybase Pubs2 stores table" .

syb:stor_id a rdf:Property ;
    rdfs:domain syb:stores ;
    rdfs:range xsd:string ;
    rdfs:label "store id" .

syb:stor_name a rdf:Property ;
    rdfs:domain syb:stores ;
    rdfs:range xsd:string ;
    rdfs:label "store name" .

syb:stor_address a rdf:Property ;
    rdfs:domain syb:stores ;
    rdfs:range xsd:string ;
    rdfs:label "store address" .

syb:city a rdf:Property ;
    rdfs:domain syb:stores ;
    rdfs:range xsd:string ;
    rdfs:label "city" .

syb:state a rdf:Property ;
    rdfs:domain syb:stores ;
    rdfs:range xsd:string ;
    rdfs:label "state" .

syb:country a rdf:Property ;
    rdfs:domain syb:stores ;
    rdfs:range xsd:string ;
    rdfs:label "country" .

syb:postalcode a rdf:Property ;
    rdfs:domain syb:stores ;
    rdfs:range xsd:string ;
    rdfs:label "postal code" .

syb:payterms a rdf:Property ;
    rdfs:domain syb:stores ;
    rdfs:range xsd:string ;
    rdfs:label "payment terms" .

syb:au_pix a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/sybasepubs2> ;
    rdfs:label "authors pictures" ;
    rdfs:comment "Sybase Pubs2 au_pix table" .

syb:au_id a rdf:Property ;
    rdfs:domain syb:au_pix ;
    rdfs:range syb:authors ;
    rdfs:label "author id" .

syb:format_type a rdf:Property ;
    rdfs:domain syb:au_pix ;
    rdfs:range xsd:string ;
    rdfs:label "format type" .

syb:bytesize a rdf:Property ;
    rdfs:domain syb:au_pix ;
    rdfs:range xsd:integer ;
    rdfs:label "byte size" .

syb:pixwidth_hor a rdf:Property ;
    rdfs:domain syb:au_pix ;
    rdfs:range xsd:string ;
    rdfs:label "picture horizontal width" .

syb:pixwidth_vert a rdf:Property ;
    rdfs:domain syb:au_pix ;
    rdfs:range xsd:string ;
    rdfs:label "picture vertical width" .

syb:discounts a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/sybasepubs2> ;
    rdfs:label "discounts" ;
    rdfs:comment "Sybase Pubs2 discount table" .

syb:discounttype a rdf:Property ;
    rdfs:domain syb:discounts ;
    rdfs:range xsd:string ;
    rdfs:label "discounttype" .

syb:stor_id a rdf:Property ;
    rdfs:domain syb:discounts ;
    rdfs:range syb:stores ;
    rdfs:label "store id" .

syb:lowqty a rdf:Property ;
    rdfs:domain syb:discounts ;
    rdfs:range xsd:integer ;
    rdfs:label "min quantity" .

syb:highqty a rdf:Property ;
    rdfs:domain syb:discounts ;
    rdfs:range xsd:integer ;
    rdfs:label "max quantity" .

syb:discount a rdf:Property ;
    rdfs:domain syb:discounts ;
    rdfs:range xsd:decimal ;
    rdfs:label "min quantity" .

syb:salesdetail a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/sybasepubs2> ;
    rdfs:label "sales details" ;
    rdfs:comment "Sybase Pubs2 sales detail table" .

syb:store_id a rdf:Property ;
    rdfs:domain syb:salesdetail ;
    rdfs:range syb:stores ;
    rdfs:label "store id" .

syb:ord_num a rdf:Property ;
    rdfs:domain syb:salesdetail ;
    rdfs:range syb:sales ;
    rdfs:label "order number" .

syb:title_id a rdf:Property ;
    rdfs:domain syb:salesdetail ;
    rdfs:range syb:titles ;
    rdfs:label "title id" .

syb:qty a rdf:Property ;
    rdfs:domain syb:salesdetail ;
    rdfs:range xsd:integer ;
    rdfs:label "quantity" .

syb:discount a rdf:Property ;
    rdfs:domain syb:salesdetail ;
    rdfs:range xsd:decimal ;
    rdfs:label "discount" .

syb:publishers a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/sybasepubs2> ;
    rdfs:label "Publishers" ;
    rdfs:comment "Sybase Pubs2 publishers table" .

syb:pub_id a rdf:Property ;
    rdfs:domain syb:publishers ;
    rdfs:range xsd:string ;
    rdfs:label "publisher id" .

syb:pub_name a rdf:Property ;
    rdfs:domain syb:publishers ;
    rdfs:range xsd:string ;
    rdfs:label "publisher name" .

syb:city a rdf:Property ;
    rdfs:domain syb:publishers ;
    rdfs:range xsd:string ;
    rdfs:label "city" .

syb:state a rdf:Property ;
    rdfs:domain syb:publishers ;
    rdfs:range xsd:string ;
    rdfs:label "state" .

syb:titleauthor a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/sybasepubs2> ;
    rdfs:label "title author" ;
    rdfs:comment "Sybase Pubs2 titleauthor table" .

syb:au_id a rdf:Property ;
    rdfs:domain syb:titleauthor ;
    rdfs:range syb:authors ;
    rdfs:label "author id" .

syb:title_id a rdf:Property ;
    rdfs:domain syb:titleauthor ;
    rdfs:range syb:titles ;
    rdfs:label "title id" .

syb:au_ord a rdf:Property ;
    rdfs:domain syb:titleauthor ;
    rdfs:range xsd:integer ;
    rdfs:label "author order" .

syb:royaltyper a rdf:Property ;
    rdfs:domain syb:titleauthor ;
    rdfs:range xsd:integer ;
    rdfs:label "royalty per book" .

syb:roysched a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/sybasepubs2> ;
    rdfs:label "Royalty Schedule" ;
    rdfs:comment "Sybase Pubs2 roysched table" .

syb:title_id a rdf:Property ;
    rdfs:domain syb:roysched ;
    rdfs:range syb:titles ;
    rdfs:label "title id" .

syb:lorange a rdf:Property ;
    rdfs:domain syb:roysched ;
    rdfs:range xsd:integer ;
    rdfs:label "low range" .

syb:hirange a rdf:Property ;
    rdfs:domain syb:roysched ;
    rdfs:range xsd:integer ;
    rdfs:label "high range" .

syb:royalty a rdf:Property ;
    rdfs:domain syb:roysched ;
    rdfs:range xsd:integer ;
    rdfs:label "royalty" .

syb:sales a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/sybasepubs2> ;
    rdfs:label "Sales" ;
    rdfs:comment "Sybase Pubs2 sales table" .

syb:stor_id a rdf:Property ;
    rdfs:domain syb:sales ;
    rdfs:range xsd:string ;
    rdfs:label "store id" .

syb:ord_num a rdf:Property ;
    rdfs:domain syb:sales ;
    rdfs:range xsd:string ;
    rdfs:label "order number" .

syb:date a rdf:Property ;
    rdfs:domain syb:sales ;
    rdfs:range xsd:dateTime ;
    rdfs:label "date" .
', '', 'http://example.com/schemas/sybasepubs2', 0);

---------------------------------------------------------------

----------- Create IRI Classes -------------

SPARQL

    create iri class <http://example.com/schemas/sybasepubs2/titles_iri>
    "http://^{URIQADefaultHost}^/sybasepubs2/titles/%s_%s#this"
        (in title_id varchar not null, in title varchar not null) .

    create iri class <http://example.com/schemas/sybasepubs2/authors_iri>
    "http://^{URIQADefaultHost}^/sybasepubs2/authors/%s#this"
        (in au_id varchar not null) .

    create iri class <http://example.com/schemas/sybasepubs2/stores_iri>
    "http://^{URIQADefaultHost}^/sybasepubs2/stores/%s#this"
        (in stor_id varchar not null) .

    create iri class <http://example.com/schemas/sybasepubs2/au_pix_iri>
    "http://^{URIQADefaultHost}^/sybasepubs2/au_pix/%s#this"
        (in au_id varchar not null) .

    create iri class <http://example.com/schemas/sybasepubs2/discounts_iri>
    "http://^{URIQADefaultHost}^/sybasepubs2/discounts/%s#this"
        (in discounttype varchar not null) .

    create iri class <http://example.com/schemas/sybasepubs2/salesdetail_iri>
    "http://^{URIQADefaultHost}^/sybasepubs2/salesdetail/%s_%s_%s#this"
        (in stor_id varchar not null, in ord_num varchar not null, in title_id varchar not null) .

    create iri class <http://example.com/schemas/sybasepubs2/publishers_iri>
    "http://^{URIQADefaultHost}^/sybasepubs2/publishers/%s#this"
        (in pub_id varchar not null) .

    create iri class <http://example.com/schemas/sybasepubs2/titleauthor_iri>
    "http://^{URIQADefaultHost}^/sybasepubs2/titleauthor/%s_%s#this"
        (in au_id varchar not null, in title_id varchar not null) .

    create iri class <http://example.com/schemas/sybasepubs2/roysched_iri>
    "http://^{URIQADefaultHost}^/sybasepubs2/roysched/%s#this"
        (in title_id varchar not null) .

    create iri class <http://example.com/schemas/sybasepubs2/sales_iri>
    "http://^{URIQADefaultHost}^/sybasepubs2/sales/%s_%s#this"
        (in stor_id varchar not null, in ord_num varchar not null) .

;

--------------------------------------------------------------------

------------- Create Quad Store ------------------------------------

SPARQL

prefix syb: <http://example.com/schemas/sybasepubs2/>

alter quad storage virtrdf:DefaultQuadStorage
  from pubs2.syb.au_pix as au_pix_tbl
  from pubs2.syb.authors as authors_tbl
  from pubs2.syb.discounts as discounts_tbl
  from pubs2.syb.publishers as publishers_tbl
  from pubs2.syb.roysched as roysched_tbl
  from pubs2.syb.sales as sales_tbl
  from pubs2.syb.salesdetail as salesdetail_tbl
  from pubs2.syb.stores as stores_tbl
  from pubs2.syb.titleauthor as titleauthor_tbl
  from pubs2.syb.titles as titles_tbl
{
  create virtrdf:sybasepubs2 as
      graph <http://example.com/sybasepubs2>
  {
    syb:au_pix_iri (au_pix_tbl.au_id) a syb:au_pix as virtrdf:au_pix_id;
    syb:au_id au_pix_tbl.au_id as virtrdf:au_pix_au_id;
    syb:format_type au_pix_tbl.format_type as virtrdf:au_pix_format_type;
    syb:bytesize au_pix_tbl.bytesize as virtrdf:au_pix_bytesize;
    syb:pixwidth_hor au_pix_tbl.pixwidth_hor as virtrdf:au_pix_pixwidth_hor;
    syb:pixwidth_vert au_pix_tbl.pixwidth_vert as virtrdf:au_pix_pixwidth_vert ;
        syb:has_author syb:authors_iri(authors_tbl.au_id) where (^{authors_tbl.}^.au_id = ^{au_pix_tbl.}^.au_id) as virtrdf:au_pix_has_author .

        syb:authors_iri (authors_tbl.au_id) a syb:authors as virtrdf:authors_pk ;
    syb:au_id authors_tbl.au_id as virtrdf:authors_au_id;
        syb:au_lname authors_tbl.au_lname as virtrdf:authors_au_lname;
        syb:au_fname authors_tbl.au_fname as virtrdf:authors_au_fname;
        syb:phone authors_tbl.phone  as virtrdf:authors_phone;
        syb:address authors_tbl.address  as virtrdf:authors_address;
        syb:city authors_tbl.city as virtrdf:authors_city;
        syb:state authors_tbl.state  as virtrdf:authors_state;
        syb:country authors_tbl.country as virtrdf:authors_country;
        syb:postalcode authors_tbl.postalcode as virtrdf:authors_postalcode;
        syb:has_title syb:titleauthor_iri(titleauthor_tbl.au_id, titleauthor_tbl.title_id) where (^{titleauthor_tbl.}^.au_id = ^{authors_tbl.}^.au_id) as virtrdf:authors_has_title;
        syb:has_pix syb:au_pix_iri(au_pix_tbl.au_id) where (^{au_pix_tbl.}^.au_id = ^{authors_tbl.}^.au_id) as virtrdf:authors_has_pix .

    syb:discounts_iri (discounts_tbl.stor_id) a syb:discounts as virtrdf:discounts_pk;
    syb:discounttype discounts_tbl.discounttype as virtrdf:discounts_discounttype;
    syb:stor_id syb:stores_iri(stores_tbl.stor_id) where (^{stores_tbl.}^.stor_id = ^{stores_tbl.}^.stor_id) as virtrdf:discounts_stor_id;
    syb:lowqty discounts_tbl.lowqty as virtrdf:discounts_lowqty;
    syb:highqty discounts_tbl.highqty as virtrdf:discounts_highqty;
    syb:discount discounts_tbl.discount as virtrdf:discounts_discount .

    syb:publishers_iri (publishers_tbl.pub_id) a syb:publishers as virtrdf:publishers_pk;
    syb:pub_id syb:titles_iri(titles_tbl.title_id, titles_tbl.pub_id) where (^{titles_tbl.}^.pub_id = ^{titles_tbl.}^.pub_id) as virtrdf:publisherss_pub_id;
    syb:pub_name publishers_tbl.pub_name as virtrdf:publisherss_pub_name;
    syb:city publishers_tbl.city as virtrdf:publisherss_city;
    syb:state publishers_tbl.state as virtrdf:publisherss_state .

    syb:roysched_iri (roysched_tbl.title_id) a syb:roysched as virtrdf:roysched_pk;
        syb:title_id syb:titleauthor_iri(titleauthor_tbl.au_id, titleauthor_tbl.title_id) where (^{titleauthor_tbl.}^.title_id = ^{roysched_tbl.}^.title_id) as virtrdf:roysched_title_id;
    syb:lorange roysched_tbl.lorange as virtrdf:roysched_lorange;
    syb:hirange roysched_tbl.hirange as virtrdf:roysched_hirange;
    syb:royalty roysched_tbl.royalty as virtrdf:roysched_royalty .

    syb:sales_iri (sales_tbl.stor_id, sales_tbl.ord_num) a syb:sales as virtrdf:sales_pk;
    syb:stor_id sales_tbl.stor_id as virtrdf:sales_stor_id;
    syb:ord_num sales_tbl.ord_num as virtrdf:sales_ord_num;
    syb:date sales_tbl.date as virtrdf:sales_date;
        syb:has_salesdetail syb:salesdetail_iri(salesdetail_tbl.stor_id, salesdetail_tbl.ord_num, salesdetail_tbl.title_id) where (^{salesdetail_tbl.}^.stor_id = ^{sales_tbl.}^.stor_id and ^{salesdetail_tbl.}^.ord_num = ^{sales_tbl.}^.ord_num)  as virtrdf:sales_has_salesdetail;
        syb:has_stores syb:stores_iri(stores_tbl.stor_id) where (^{stores_tbl.}^.stor_id = ^{sales_tbl.}^.stor_id)  as virtrdf:sales_has_stores .

    syb:salesdetail_iri (salesdetail_tbl.stor_id, salesdetail_tbl.ord_num, salesdetail_tbl.title_id) a syb:salesdetail as virtrdf:salesdetail_pk;
    syb:stor_id salesdetail_tbl.stor_id as virtrdf:salesdetail_stor_id;
    syb:ord_num salesdetail_tbl.ord_num as virtrdf:salesdetail_ord_num;
    syb:title_id salesdetail_tbl.title_id as virtrdf:salesdetail_title_id;
    syb:qty salesdetail_tbl.qty as virtrdf:salesdeail_qty;
    syb:discount salesdetail_tbl.discount as virtrdf:salesdetail_discount;
    syb:has_title  syb:titles_iri (titles_tbl.title_id, titles_tbl.pub_id) where (^{titles_tbl.}^.title_id = ^{salesdetail_tbl.}^.title_id) as virtrdf:salesdetail_has_title;
        syb:has_sales syb:sales_iri(sales_tbl.stor_id, sales_tbl.ord_num) where (^{salesdetail_tbl.}^.stor_id = ^{sales_tbl.}^.stor_id and ^{salesdetail_tbl.}^.ord_num = ^{sales_tbl.}^.ord_num ) as virtrdf:salesdetail_has_sales .

    syb:stores_iri (stores_tbl.stor_id) a syb:stores as virtrdf:stores_pk;
        syb:stor_id stores_tbl.stor_id as virtrdf:stores_stor_id;
    syb:stor_name stores_tbl.stor_name as virtrdf:stores_stor_name;
    syb:stor_address stores_tbl.stor_address as virtrdf:stores_stor_address;
    syb:city stores_tbl.city as virtrdf:stores_city;
    syb:state stores_tbl.state as virtrdf:stores_state;
    syb:country stores_tbl.country as virtrdf:stores_country;
    syb:postalcode stores_tbl.postalcode as virtrdf:stores_postalcode;
    syb:payterms stores_tbl.payterms as virtrdf:stores_payterms;
        syb:has_sales syb:sales_iri(sales_tbl.stor_id, sales_tbl.ord_num) where (^{sales_tbl.}^.stor_id = ^{stores_tbl.}^.stor_id) as virtrdf:stores_has_sales .

    syb:titleauthor_iri (titleauthor_tbl.au_id, titleauthor_tbl.title_id) a syb:titleauthor as virtrdf:titleauthor_pk;
    syb:au_id titleauthor_tbl.au_id as virtrdf:titleauthor_au_id;
    syb:title_id titleauthor_tbl.title_id as virtrdf:titleauthor_title_id;
    syb:au_ord titleauthor_tbl.au_ord as virtrdf:titleauthor_au_ord;
    syb:royaltyper titleauthor_tbl.royaltyper as virtrdf:titleauthor_royaltyper;
    syb:has_author syb:authors_iri(authors_tbl.au_id) where (^{authors_tbl.}^.au_id = ^{titleauthor_tbl.}^.au_id) as virtrdf:titleauthor_has_author;
    syb:has_titles syb:titles_iri(titles_tbl.title_id, titles_tbl.pub_id) where (^{titles_tbl.}^.title_id = ^{titleauthor_tbl.}^.title_id) as virtrdf:titleauthor_has_titles .

    syb:titles_iri (titles_tbl.title_id, titles_tbl.pub_id) a syb:titles as virtrdf:titles_pk;
    syb:title_id titles_tbl.title_id as virtrdf:titles_title_idd;
    syb:title titles_tbl.title as virtrdf:titles_title;
    syb:type titles_tbl.type as virtrdf:titles_type;
    syb:pub_id titles_tbl.pub_id as virtrdf:titles_pub_id;
    syb:price titles_tbl.price as virtrdf:titles_price;
    syb:advance titles_tbl.advance as virtrdf:titles_advance;
    syb:total_sales titles_tbl.total_sales as virtrdf:titles_total_sales;
    syb:notes titles_tbl.notes as virtrdf:titles_notes;
    syb:pubdate titles_tbl.pubdate as virtrdf:titles_pubdate;
    syb:contract titles_tbl.contract as virtrdf:titles_contract;
        syb:has_titleauthor syb:titleauthor_iri(titleauthor_tbl.au_id, titleauthor_tbl.title_id) where (^{titleauthor_tbl.}^.title_id = ^{titles_tbl.}^.title_id) as virtrdf:titles_has_titleauthor;
        syb:has_salesdetail syb:salesdetail_iri (salesdetail_tbl.stor_id, salesdetail_tbl.ord_num, salesdetail_tbl.title_id) where (^{salesdetail_tbl.}^.title_id = ^{titles_tbl.}^.title_id) as virtrdf:titles_has_salesdetail .

  } .
} .
;

delete from db.dba.url_rewrite_rule_list where urrl_list like 'sybasepubs2_rule%';
delete from db.dba.url_rewrite_rule where urr_rule like 'sybasepubs2_rule%';

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'sybasepubs2_rule1',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/about/html/http/^{URIQADefaultHost}^%s',
    vector('path'),
    null,
    '(text/html)|(\\*/\\*)',
    0,
    303
    );

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'sybasepubs2_rule2',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/sparql?query=DESCRIBE+%%3Chttp%%3A//localhost%%3A8890%U%%23this%%3E+%%3Chttp%%3A//localhost%%3A8890%U%%23this%%3E+FROM+%%3Chttp%%3A//localhost%%3A8890/sybasepubs2%%3E&format=%U',
    vector('path', 'path', '*accept*'),
    null,
    '(text/rdf.n3)|(application/rdf.xml)',
    0,
    null
    );

DB.DBA.URLREWRITE_CREATE_RULELIST (
    'sybasepubs2_rule_list1',
    1,
    vector (
        'sybasepubs2_rule1',
        'sybasepubs2_rule2'
      ));

-- ensure a VD for the IRIs which begins with /
VHOST_REMOVE (lpath=>'/sybasepubs2');

VHOST_DEFINE (
    lpath=>'/sybasepubs2',
    ppath=>'/DAV/sybasepubs2/',
        is_dav=>1,
    vsp_user=>'dba',
    is_brws=>0,
    opts=>vector ('url_rewrite', 'sybasepubs2_rule_list1')
    );

delete from db.dba.url_rewrite_rule_list where urrl_list like 'sybase_schemas_rule%';
delete from db.dba.url_rewrite_rule where urr_rule like 'sybase_schemas_rule%';

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'sybase_schemas_rule1',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/about/html/http/^{URIQADefaultHost}^%s',
    vector('path'),
    null,
    '(text/html)|(\\*/\\*)',
    0,
    303
    );

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'sybase_schemas_rule2',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/sparql?query=CONSTRUCT+{+%%3Chttp%%3A//localhost%%3A8890%U%%3E+%%3Fp+%%3Fo+}%%0D%%0AFROM+%%3Chttp%%3A//localhost%%3A8890/schemas/sybasepubs2%%3E+%%0D%%0AWHERE+{+%%3Chttp%%3A//localhost%%3A8890%U%%3E+%%3Fp+%%3Fo+}&format=%U',
    vector('path','path','*accept*'),
    null,
    '(text/rdf.n3)|(application/rdf.xml)',
    0,
    null
    );

DB.DBA.URLREWRITE_CREATE_RULELIST (
    'sybase_schemas_rule_list1',
    1,
    vector (
        'sybase_schemas_rule1',
        'sybase_schemas_rule2'
      ));

-- ensure a VD for the IRIs which begins with /
VHOST_REMOVE (lpath=>'/schema/sybasepubs2');

VHOST_DEFINE (
    lpath=>'/schemas/sybasepubs2',
    ppath=>'/DAV/schemas/sybasepubs2/',
        is_dav=>1,
    vsp_user=>'dba',
    is_brws=>0,
    opts=>vector ('url_rewrite', 'sybase_schemas_rule_list1')
    );

DB.DBA.XML_SET_NS_DECL ('hr', 'http://^{URIQADefaultHost}^/schemas/sybasepubs2', 2);
```

</div>
