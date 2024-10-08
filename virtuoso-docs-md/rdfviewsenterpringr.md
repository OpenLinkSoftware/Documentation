<div>

<div>

<div>

<div>

### 16.8.15. Ingres using demonstration 'Tutorial' database

</div>

</div>

</div>

``` programlisting
-- Setup script for Linked Data Views of Ingres R3 Tutorial Sample Database --

DB..vd_remote_data_source ('ingiima-tut', '', '<uid>','<pwd>');

ATTACH TABLE  "ingres"."book_list"      PRIMARY KEY ("book_no")              AS "TUT"."ingiima"."book_list"      FROM 'ingiima-tut';
ATTACH TABLE  "ingres"."book_orders"      PRIMARY KEY ("order_no")              AS "TUT"."ingiima"."book_orders"      FROM 'ingiima-tut';
ATTACH TABLE  "ingres"."cust_info"      PRIMARY KEY ("cust_no")              AS "TUT"."ingiima"."cust_info"      FROM 'ingiima-tut';
ATTACH TABLE  "ingres"."cust_orders"      PRIMARY KEY ("order_no")              AS "TUT"."ingiima"."cust_orders"      FROM 'ingiima-tut';

COMMIT WORK;

GRANT SELECT ON TUT.ingiima.book_list TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON TUT.ingiima.book_orders TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON TUT.ingiima.cust_info TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON TUT.ingiima.cust_orders TO "SPARQL", "SPARQL_UPDATE";

-------------------------------------------------------------------

-------- Create rdfs:Class definitions ----------------------------

ttlp (
'
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

@prefix tut: <http://example.com/schemas/ingrestut/> .

tut:book_list a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/ingrestut> ;
    rdfs:label "book_list" ;
    rdfs:comment "Ingres Tutorial Database book_list table" .

tut:book_no a rdf:Property ;
    rdfs:domain tut:book_list ;
    rdfs:range xsd:integer ;
    rdfs:label "Book No" .

tut:title a rdf:Property ;
    rdfs:domain tut:book_list ;
    rdfs:range xsd:string ;
    rdfs:label "Title" .

tut:author a rdf:Property ;
    rdfs:domain tut:book_list ;
    rdfs:range xsd:string ;
    rdfs:label "Author" .

tut:price a rdf:Property ;
    rdfs:domain tut:book_list ;
    rdfs:range xsd:money;
    rdfs:label "Price" .

tut:category a rdf:Property ;
    rdfs:domain tut:book_list ;
    rdfs:range xsd:string ;
    rdfs:label "Category" .

tut:stock a rdf:Property ;
    rdfs:domain tut:book_list ;
    rdfs:range xsd:integer ;
    rdfs:label "Stock" .

tut:dist_no a rdf:Property ;
    rdfs:domain tut:book_list ;
    rdfs:range xsd:integer ;
    rdfs:label "Dist No" .

tut:book_orders a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/ingrestut> ;
    rdfs:label "Book Orders" ;
    rdfs:comment "Ingres Tutorial Database book_orders table" .

tut:order_no a rdf:Property ;
    rdfs:domain tut:book_orders ;
    rdfs:range xsd:integer ;
         rdfs:label "Order No" .

tut:book_no_no a rdf:Property ;
    rdfs:domain tut:book_orders ;
    rdfs:range tut:book_list ;
         rdfs:label "Book No" .

tut:sale_price a rdf:Property ;
    rdfs:domain tut:book_orders ;
    rdfs:range xsd:money ;
         rdfs:label "Sale Price" .

tut:quantity a rdf:Property ;
    rdfs:domain tut:book_orders ;
    rdfs:range xsd:integer ;
         rdfs:label "Quantity" .

tut:extension a rdf:Property ;
    rdfs:domain tut:book_orders ;
    rdfs:range xsd:money ;
         rdfs:label "Extension" .

tut:cust_info a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/ingrestut> ;
    rdfs:label "Customer Information" ;
    rdfs:comment "Ingres Tutorial Database cust_info table" .

tut:cust_no a rdf:Property ;
    rdfs:domain tut:cust_info ;
    rdfs:range xsd:integer ;
         rdfs:label "Customer No" .

tut:name a rdf:Property ;
    rdfs:domain tut:cust_info ;
    rdfs:range xsd:string ;
         rdfs:label "Name" .

tut:company a rdf:Property ;
    rdfs:domain tut:cust_info ;
    rdfs:range xsd:string ;
         rdfs:label "Company" .

tut:street a rdf:Property ;
    rdfs:domain tut:cust_info ;
    rdfs:range xsd:string;
         rdfs:label "Street" .

tut:city a rdf:Property ;
    rdfs:domain tut:cust_info ;
    rdfs:range xsd:string;
         rdfs:label "City" .

tut:state a rdf:Property ;
    rdfs:domain tut:cust_info ;
    rdfs:range xsd:string;
         rdfs:label "State" .

tut:city a rdf:Property ;
    rdfs:domain tut:cust_info ;
    rdfs:range xsd:string;
         rdfs:label "City" .

tut:state a rdf:Property ;
    rdfs:domain tut:cust_info ;
    rdfs:range xsd:string;
         rdfs:label "State" .

tut:zip a rdf:Property ;
    rdfs:domain tut:cust_info ;
    rdfs:range xsd:string;
         rdfs:label "Zip Code" .

tut:card_no a rdf:Property ;
    rdfs:domain tut:cust_info ;
    rdfs:range xsd:string;
         rdfs:label "Card No" .

tut:exp_date a rdf:Property ;
    rdfs:domain tut:cust_info ;
    rdfs:range xsd:date;
         rdfs:label "Expire Date" .

tut:ship_to a rdf:Property ;
    rdfs:domain tut:cust_info ;
    rdfs:range xsd:string;
         rdfs:label "Ship To" .

tut:cust_orders a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/ingrestut> ;
    rdfs:label "Customer Orders" ;
    rdfs:comment "Ingres Tutorial Database cust_orders table" .

tut:order_no a rdf:Property ;
    rdfs:domain tut:cust_orders ;
    rdfs:range tut:book_orders ;
         rdfs:label "Order No" .

tut:book_no a rdf:Property ;
    rdfs:domain tut:cust_orders ;
    rdfs:range tut:cust_info ;
         rdfs:label "Book No" .

tut:order_date a rdf:Property ;
    rdfs:domain tut:cust_orders ;
    rdfs:range xsd:date ;
         rdfs:label "Order Date" .

tut:status a rdf:Property ;
    rdfs:domain tut:cust_orders ;
    rdfs:range xsd:string ;
         rdfs:label "Status" .

tut:order_total a rdf:Property ;
    rdfs:domain tut:cust_orders ;
    rdfs:range xsd:money ;
         rdfs:label "Order Total" .
', '', 'http://example.com/schemas/ingrestut', 0);

---------------------------------------------------------------

----------- Create IRI Classes -------------

SPARQL

    create iri class <http://example.com/schemas/ingrestut/book_list_iri>
    "http://^{URIQADefaultHost}^/ingrestut/book_list/%d#this"
        (in book_no integer not null) .

    create iri class <http://example.com/schemas/ingrestut/book_orders_iri>
    "http://^{URIQADefaultHost}^/ingrestut/book_orders/%d_%d#this"
     (in order_no integer not null, in book_no integer not null ) .

    create iri class <http://example.com/schemas/ingrestut/cust_info_iri>
    "http://^{URIQADefaultHost}^/ingrestut/cust_info/%d#this"
        (in cust_no integer not null) .

    create iri class <http://example.com/schemas/ingrestut/cust_orders_iri>
    "http://^{URIQADefaultHost}^/ingrestut/cust_orders/%d#this"
        (in order_no integer not null) .

    ;

--------------------------------------------------------------------

------------- Create Quad Store ------------------------------------

SPARQL

prefix tut: <http://example.com/schemas/ingrestut/>

alter quad storage virtrdf:DefaultQuadStorage
  from TUT.ingiima.book_list as book_list_tbl
  from TUT.ingiima.book_orders as book_orders_tbl
  from TUT.ingiima.cust_info as cust_info_tbl
  from TUT.ingiima.cust_orders as cust_orders_tbl
{
  create virtrdf:ingrestut as
      graph <http://example.com/ingrestut>
  {
        tut:book_list_iri(book_list_tbl.book_no) a tut:book_list
               as virtrdf:book_list_book_no ;
        tut:title book_list_tbl.title
         as virtrdf:book_list_title;
        tut:author book_list_tbl.author
              as virtrdf:book_list_author;
        tut:price book_list_tbl.price
              as virtrdf:book_list_price;
        tut:category book_list_tbl.category
              as virtrdf:book_list_category;
        tut:stock book_list_tbl.stock
              as virtrdf:book_list_stock;
        tut:dist_no book_list_tbl.dist_no
              as virtrdf:book_list_dist_no .

    tut:book_orders_iri(book_orders_tbl.order_no, book_orders_tbl.book_no) a tut:book_orders
        as virtrdf:book_orders_pk;
    tut:order_no book_orders_tbl.order_no
        as virtrdf:book_orders_order_no;
    tut:book_no tut:book_list_iri(book_list_tbl.book_no)
        where(^{book_orders_tbl.}^.book_no = ^{book_list_tbl.}^.book_no)
        as virtrdf:book_orders_book_no;
    tut:sale_price book_orders_tbl.sale_price
        as virtrdf:book_orders_sale_price;
    tut:quantity book_orders_tbl.quantity
        as virtrdf:book_orders_quantity;
    tut:extension book_orders_tbl.extension
        as virtrdf:book_orders_extension .

    tut:cust_info_iri(cust_info_tbl.cust_no) a tut:cust_info
        as virtrdf:cust_info_cust_no;
    tut:name cust_info_tbl.name
        as virtrdf:cust_info_name;
    tut:company cust_info_tbl.company
        as virtrdf:cust_info_company;
    tut:street cust_info_tbl.street
        as virtrdf:cust_info_street;
    tut:city cust_info_tbl.city
        as virtrdf:cust_info_city;
    tut:state cust_info_tbl.state
        as virtrdf:cust_info_state;
    tut:zip cust_info_tbl.zip
        as virtrdf:cust_info_zip;
    tut:card_no cust_info_tbl.card_no
        as virtrdf:cust_info_card_no;
    tut:exp_date cust_info_tbl.exp_date
        as virtrdf:cust_info_exp_date;
    tut:ship_to cust_info_tbl.ship_to
        as virtrdf:cust_info_ship_to .

    tut:cust_orders_iri(cust_orders_tbl.order_no) a tut:cust_orders
        as virtrdf:cust_orders_order_no;

    tut:cust_no tut:cust_info_iri(cust_info_tbl.cust_no)
        where (^{cust_orders_tbl.}^.cust_no = ^{cust_info_tbl.}^.cust_no)
        as virtrdf:cust_orders_cust_no;
    tut:order_date cust_orders_tbl.order_date
        as virtrdf:cust_orders_order_date;
    tut:status cust_orders_tbl.status
        as virtrdf:cust_orders_status;
    tut:order_total cust_orders_tbl.order_total
        as virtrdf:cust_orders_order_total   .
  } .
} .
;

delete from db.dba.url_rewrite_rule_list where urrl_list like 'ingrestut_rule%';
delete from db.dba.url_rewrite_rule where urr_rule like 'ingrestut_rule%';

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ingrestut_rule1',
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
    'ingrestut_rule2',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/sparql?query=DESCRIBE+%%3Chttp%%3A//localhost%%3A8890%U%%23this%%3E+%%3Chttp%%3A//localhost%%3A8890%U%%23this%%3E+FROM+%%3Chttp%%3A//localhost%%3A8890/ingrestut%%3E&format=%U',
    vector('path', 'path', '*accept*'),
    null,
    '(text/rdf.n3)|(application/rdf.xml)',
    0,
    null
    );

DB.DBA.URLREWRITE_CREATE_RULELIST (
    'ingrestut_rule_list1',
    1,
    vector (
        'ingrestut_rule1',
        'ingrestut_rule2'
      ));

-- ensure a VD for the IRIs which begins with /
VHOST_REMOVE (lpath=>'/ingrestut');

VHOST_DEFINE (
    lpath=>'/ingrestut',
    ppath=>'/DAV/ingrestut/',
        is_dav=>1,
    vsp_user=>'dba',
    is_brws=>0,
    opts=>vector ('url_rewrite', 'ingrestut_rule_list1')
    );

delete from db.dba.url_rewrite_rule_list where urrl_list like 'ingres_schemas_rule%';
delete from db.dba.url_rewrite_rule where urr_rule like 'ingres_schemas_rule%';

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'ingres_schemas_rule1',
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
    'ingres_schemas_rule2',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/sparql?query=CONSTRUCT+{+%%3Chttp%%3A//localhost%%3A8890%U%%3E+%%3Fp+%%3Fo+}%%0D%%0AFROM+%%3Chttp%%3A//localhost%%3A8890/schemas/ingrestut%%3E+%%0D%%0AWHERE+{+%%3Chttp%%3A//localhost%%3A8890%U%%3E+%%3Fp+%%3Fo+}&format=%U',
    vector('path','path','*accept*'),
    null,
    '(text/rdf.n3)|(application/rdf.xml)',
    0,
    null
    );

DB.DBA.URLREWRITE_CREATE_RULELIST (
    'ingres_schemas_rule_list1',
    1,
    vector (
        'ingres_schemas_rule1',
        'ingres_schemas_rule2'
      ));

-- ensure a VD for the IRIs which begins with /
VHOST_REMOVE (lpath=>'/schema/ingrestut');

VHOST_DEFINE (
    lpath=>'/schemas/ingrestut',
    ppath=>'/DAV/schemas/ingrestut/',
        is_dav=>1,
    vsp_user=>'dba',
    is_brws=>0,
    opts=>vector ('url_rewrite', 'ingres_schemas_rule_list1')
    );

DB.DBA.XML_SET_NS_DECL ('tut', 'http://^{URIQADefaultHost}^/schemas/ingrestut/', 2);
```

</div>
