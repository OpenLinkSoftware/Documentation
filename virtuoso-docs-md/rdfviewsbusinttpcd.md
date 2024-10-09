<div>

<div>

<div>

<div>

### 16.8.4. TPCD to RDF

</div>

</div>

</div>

Please load ~\binsrc\dav\DET_RDFData.sql before loadding this script
(tpc-d has no vad to do this automatic)

``` programlisting
use DB;

create procedure DB.DBA.exec_no_error (in expr varchar) {
  declare state, message, meta, result any;
  exec(expr, state, message, vector(), 0, meta, result);
}
;

DB.DBA.exec_no_error('GRANT \"SPARQL_UPDATE\" TO \"SPARQL\"')
;
GRANT SELECT ON tpcd.DBA.partsupp  TO "SPARQL";
GRANT SELECT ON tpcd.DBA.supplier  TO "SPARQL";
GRANT SELECT ON tpcd.DBA.customer  TO "SPARQL";
GRANT SELECT ON tpcd.DBA.history   TO "SPARQL";
GRANT SELECT ON tpcd.DBA.part      TO "SPARQL";
GRANT SELECT ON tpcd.DBA.lineitem  TO "SPARQL";
GRANT SELECT ON tpcd.DBA.orders    TO "SPARQL";
GRANT SELECT ON tpcd.DBA.nation    TO "SPARQL";
GRANT SELECT ON tpcd.DBA.region    TO "SPARQL";

--SPARQL
--prefix tpcd: <http://demo.openlinksw.com/schemas/tpcd#>
--prefix sioc: <http://rdfs.org/sioc/ns#>
--prefix foaf: <http://xmlns.com/foaf/0.1/>
--prefix wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
--drop quad map graph iri("http://^{URIQADefaultHost}^/tpcd") .
--;

SPARQL
prefix tpcd: <http://demo.openlinksw.com/schemas/tpcd#>
prefix sioc: <http://rdfs.org/sioc/ns#>
prefix foaf: <http://xmlns.com/foaf/0.1/>
prefix wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
drop silent quad map virtrdf:TpcdDemo .
;

SPARQL
prefix tpcd: <http://demo.openlinksw.com/schemas/tpcd#>
prefix sioc: <http://rdfs.org/sioc/ns#>
prefix foaf: <http://xmlns.com/foaf/0.1/>
prefix wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
create iri class tpcd:customer "http://^{URIQADefaultHost}^/tpcd/customer/%d#this" (in c_custkey integer not null) .
create iri class tpcd:lineitem "http://^{URIQADefaultHost}^/tpcd/lineitem/%d/%d#this" (in l_orderkey integer not null, in l_linenumber integer not null) .
create iri class tpcd:nation "http://^{URIQADefaultHost}^/tpcd/nation/%d#this" (in l_nationkey integer not null) .
create iri class tpcd:order "http://^{URIQADefaultHost}^/tpcd/order/%d#this" (in o_orderkey integer not null) .
create iri class tpcd:part "http://^{URIQADefaultHost}^/tpcd/part/%d#this" (in p_partkey integer not null) .
create iri class tpcd:partsupp "http://^{URIQADefaultHost}^/tpcd/partsupp/%d/%d#this" (in ps_partkey integer not null, in ps_suppkey integer not null) .
create iri class tpcd:region "http://^{URIQADefaultHost}^/tpcd/region/%d#this" (in r_regionkey integer not null) .
create iri class tpcd:supplier "http://^{URIQADefaultHost}^/tpcd/supplier/%d#this" (in s_supplierkey integer not null) .
;

SPARQL
prefix tpcd: <http://demo.openlinksw.com/schemas/tpcd#>
prefix sioc: <http://rdfs.org/sioc/ns#>
prefix foaf: <http://xmlns.com/foaf/0.1/>
prefix wgs: <http://www.w3.org/2003/01/geo/wgs84_pos#>
alter quad storage virtrdf:DefaultQuadStorage
from tpcd.DBA.lineitem as lineitems
from tpcd.DBA.customer as customers
from tpcd.DBA.nation as nations
from tpcd.DBA.orders as orders
from tpcd.DBA.part as parts
from tpcd.DBA.partsupp as partsupps
from tpcd.DBA.region as regions
from tpcd.DBA.supplier as suppliers
where (^{suppliers.}^.s_nationkey = ^{nations.}^.n_nationkey)
where (^{customers.}^.c_nationkey = ^{nations.}^.n_nationkey)
{
    create virtrdf:TpcdDemo as graph iri ("http://^{URIQADefaultHost}^/tpcd") option (exclusive)
    {
# Customers
        tpcd:customer (customers.c_custkey)
            a  tpcd:customer
                as virtrdf:tpcdcustomer-type ;
            a  foaf:Organization
                as virtrdf:tpcdcustomer-foaf-type ;
            tpcd:custkey customers.c_custkey
                as virtrdf:tpcdcustomer-c_custkey ;
            foaf:name customers.c_name
                as virtrdf:tpcdcustomer-foaf_name ;
            tpcd:companyName customers.c_name
                as virtrdf:tpcdcustomer-c_name ;
            tpcd:has_nation tpcd:nation (customers.c_nationkey)
                as virtrdf:tpcdcustomer-c_nationkey ;
            tpcd:address customers.c_address
                as virtrdf:tpcdcustomer-c_address ;
            foaf:phone customers.c_phone
                as virtrdf:tpcdcustomer-foaf_phone ;
            tpcd:phone customers.c_phone
                as virtrdf:tpcdcustomer-phone ;
            tpcd:acctbal customers.c_acctbal
                as virtrdf:tpcdcustomer-acctbal ;
            tpcd:mktsegment customers.c_mktsegment
                as virtrdf:tpcdcustomer-c_mktsegment ;
            tpcd:comment customers.c_comment
                as virtrdf:tpcdcustomer-c_comment .

# Nations
        tpcd:nation (customers.c_nationkey)
            tpcd:nation_of tpcd:customer (customers.c_custkey) as virtrdf:tpcdcustomer-nation_of .

# Lineitems
        tpcd:lineitem (lineitems.l_orderkey, lineitems.l_linenumber)
            a tpcd:lineitem
                as virtrdf:tpcdlineitem-lineitems ;
            tpcd:has_order tpcd:order (lineitems.l_orderkey)
                as virtrdf:tpcdlineitem-l_orderkey ;
            tpcd:has_part tpcd:part (lineitems.l_partkey)
                as virtrdf:tpcdlineitem-l_partkey ;
            tpcd:has_supplier tpcd:supplier (lineitems.l_suppkey)
                as virtrdf:tpcdlineitem-l_suppkey ;
            tpcd:linenumber lineitems.l_linenumber
                as virtrdf:tpcdlineitem-l_linenumber ;
            tpcd:linequantity lineitems.l_quantity
                as virtrdf:tpcdlineitem-l_linequantity ;
            tpcd:lineextendedprice lineitems.l_extendedprice
                as virtrdf:tpcdlineitem-l_lineextendedprice ;
            tpcd:linediscount lineitems.l_discount
                as virtrdf:tpcdlineitem-l_linediscount ;
            tpcd:linetax lineitems.l_tax
                as virtrdf:tpcdlineitem-l_linetax ;
            tpcd:returnflag lineitems.l_returnflag
                as virtrdf:tpcdlineitem-l_returnflag ;
            tpcd:linestatus lineitems.l_linestatus
                as virtrdf:tpcdlineitem-l_linestatus ;
            tpcd:shipdate lineitems.l_shipdate
                as virtrdf:tpcdlineitem-l_shipdate ;
            tpcd:commitdate lineitems.l_commitdate
                as virtrdf:tpcdlineitem-l_commitdate ;
            tpcd:receiptdate lineitems.l_receiptdate
                as virtrdf:tpcdlineitem-l_receiptdate ;
            tpcd:shipinstruct lineitems.l_shipinstruct
                as virtrdf:tpcdlineitem-l_shipinstruct ;
            tpcd:shipmode lineitems.l_shipmode
                as virtrdf:tpcdlineitem-l_shipmode ;
            tpcd:comment lineitems.l_comment
                as virtrdf:tpcdlineitem-l_comment .

        tpcd:part (lineitems.l_partkey)
            tpcd:part_of tpcd:lineitem (lineitems.l_orderkey, lineitems.l_linenumber) as virtrdf:tpcdlineitem-part_of .

        tpcd:order (lineitems.l_orderkey)
            tpcd:order_of tpcd:lineitem (lineitems.l_orderkey, lineitems.l_linenumber) as virtrdf:tpcdlineitem-order_of .

        tpcd:supplier (lineitems.l_suppkey)
            tpcd:supplier_of tpcd:lineitem (lineitems.l_orderkey, lineitems.l_linenumber) as virtrdf:tpcdlineitem-supplier_of .

# Nation
        tpcd:nation (nations.n_nationkey)
            a tpcd:nation
                as virtrdf:tpcdnation-nations ;
            tpcd:name nations.n_name
                as virtrdf:tpcdnation-n_name ;
            tpcd:has_region tpcd:region (nations.n_regionkey)
                as virtrdf:tpcdnation-n_regionkey ;
            tpcd:comment nations.n_comment
                as virtrdf:tpcdnation-n_comment .

        tpcd:region (nations.n_regionkey)
            tpcd:region_of tpcd:nation (nations.n_nationkey) as virtrdf:tpcdnation-region_of .

# Order
        tpcd:order (orders.o_orderkey)
            a tpcd:order
                as virtrdf:tpcdorder-orders ;
            tpcd:orderkey orders.o_orderkey
                as virtrdf:tpcdorder-o_orderkey ;
            tpcd:has_customer tpcd:customer (orders.o_custkey)
                as virtrdf:tpcdorder-o_custkey ;
            tpcd:orderstatus orders.o_orderstatus
                as virtrdf:tpcdorder-o_orderstatus ;
            tpcd:ordertotalprice orders.o_totalprice
                as virtrdf:tpcdorder-o_totalprice ;
            tpcd:orderdate orders.o_orderdate
                as virtrdf:tpcdorder-o_orderdate ;
            tpcd:orderpriority orders.o_orderpriority
                as virtrdf:tpcdorder-o_orderpriority ;
            tpcd:clerk orders.o_clerk
                as virtrdf:tpcdorder-o_clerk ;
            tpcd:shippriority orders.o_shippriority
                as virtrdf:tpcdorder-o_shippriority ;
            tpcd:comment orders.o_comment
                as virtrdf:tpcdorder-o_comment .

        tpcd:customer (orders.o_custkey)
            tpcd:customer_of tpcd:order (orders.o_orderkey) as virtrdf:tpcdorder-customer_of .

# Part
        tpcd:part (parts.p_partkey)
            a tpcd:part
                as virtrdf:tpcdpart-parts ;
            tpcd:partkey parts.p_partkey
                as virtrdf:tpcdpart-p_partkey ;
            tpcd:name parts.p_name
                as virtrdf:tpcdpart-p_name ;
            tpcd:mfgr parts.p_mfgr
                as virtrdf:tpcdpart-p_mfgr ;
            tpcd:brand parts.p_brand
                as virtrdf:tpcdpart-p_brand ;
            tpcd:type parts.p_type
                as virtrdf:tpcdpart-p_type ;
            tpcd:size parts.p_size
                as virtrdf:tpcdpart-p_size ;
            tpcd:container parts.p_container
                as virtrdf:tpcdpart-p_container ;
            tpcd:comment parts.p_comment
                as virtrdf:tpcdpart-p_comment .

# Partsupp
        tpcd:partsupp (partsupps.ps_partkey, partsupps.ps_suppkey)
            a tpcd:partsupp
                as virtrdf:tpcdpartsupp-partsupps ;
            tpcd:has_part tpcd:part (partsupps.ps_partkey)
                as virtrdf:tpcdpartsupp-ps_partkey ;
            tpcd:has_supplier tpcd:supplier (partsupps.ps_suppkey)
                as virtrdf:tpcdpartsupp-ps_suppkey ;
            tpcd:availqty partsupps.ps_availqty
                as virtrdf:tpcdpartsupp-ps_availqty ;
            tpcd:supplycost partsupps.ps_supplycost
                as virtrdf:tpcdpartsupp-ps_supplycost ;
            tpcd:comment partsupps.ps_comment
                as virtrdf:tpcdpartsupp-ps_comment .

        tpcd:part (partsupps.ps_partkey)
            tpcd:part_of tpcd:partsupp (partsupps.ps_partkey, partsupps.ps_suppkey) as virtrdf:tpcdpartsupp-part_of .

        tpcd:supplier (partsupps.ps_suppkey)
            tpcd:supplier_of tpcd:partsupp (partsupps.ps_partkey, partsupps.ps_suppkey) as virtrdf:tpcdpartsupp-supplier_of .

# Region
        tpcd:region (regions.r_regionkey)
            a tpcd:region
                as virtrdf:tpcdregion-regions ;
            tpcd:name regions.r_name
                as virtrdf:tpcdregion-r_name ;
            tpcd:comment regions.r_comment
                as virtrdf:tpcdregion-r_comment .

# Supplier
        tpcd:supplier (suppliers.s_suppkey)
            a tpcd:supplier
                as virtrdf:tpcdsupplier-suppliers ;
            tpcd:name suppliers.s_name
                as virtrdf:tpcdsupplier-s_name ;
            tpcd:address suppliers.s_address
                as virtrdf:tpcdsupplier-s_address ;
            tpcd:has_nation tpcd:nation (suppliers.s_nationkey)
                as virtrdf:tpcdsupplier-s_nationkey ;
            foaf:phone suppliers.s_phone
                as virtrdf:tpcdsupplier-foaf_phone ;
            tpcd:phone suppliers.s_phone
                as virtrdf:tpcdsupplier-s_phone ;
            tpcd:acctbal suppliers.s_acctbal
                as virtrdf:tpcdsupplier-s_acctbal ;
            tpcd:comment suppliers.s_comment
                as virtrdf:tpcdsupplier-s_comment .

        tpcd:nation (suppliers.s_nationkey)
            tpcd:nation_of tpcd:supplier (suppliers.s_suppkey) as virtrdf:tpcdsupplier-nation_of .
    }
}
;

create procedure tcpd_rdf_doc (in path varchar)
{
  declare r any;
  r := regexp_match ('[^/]*\x24', path);
  return r||'#this';
};

create procedure tcpd_html_doc (in path varchar)
{
  declare r any;
  r := regexp_match ('[^/]*#', path);
  return subseq (r, 0, length (r)-1);
};

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'tcpd_rule2',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/sparql?query=CONSTRUCT+{+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%23this%%3E+%%3Fp+%%3Fo+}+FROM+%%3Chttp%%3A//^{URIQADefaultHost}^/tpcd%%3E+WHERE+{+%%3Chttp%%3A//^{URIQADefaultHost}^%U%%23this%%3E+%%3Fp+%%3Fo+}&format=%U',
    vector('path', 'path', '*accept*'),
    null,
    '(text/rdf.n3)|(application/rdf.xml)',
    0,
    null
    );

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'tcpd_rule1',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/rdfbrowser/index.html?uri=http%%3A//^{URIQADefaultHost}^%U%%23this',
    vector('path'),
    null,
    '(text/html)|(\\*/\\*)',
    0,
    303
    );

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'tcpd_rule3',
    1,
    '(/[^#]*)/\x24',
    vector('path'),
    1,
    '%s',
    vector('path'),
    null,
    null,
    0,
    null
    );

DB.DBA."RDFData_MAKE_DET_COL" ('/DAV/home/tpcd/RDFData/', 'http://^{URIQADefaultHost}^/tpcd', NULL);
VHOST_REMOVE (lpath=>'/tpcd/data/rdf');
DB.DBA.VHOST_DEFINE (lpath=>'/tpcd/data/rdf', ppath=>'/DAV/home/tpcd/RDFData/All/', is_dav=>1, vsp_user=>'dba');

-- procedure to convert path to DET resource name
create procedure DB.DBA.TPCD_DET_REF (in par varchar, in fmt varchar, in val varchar)
{
  declare res, iri any;
  iri := 'http://^{URIQADefaultHost}^/tpcd' || val;
  res := sprintf ('iid (%d).rdf', iri_id_num (iri_to_id (iri)));
  return sprintf (fmt, res);
}
;

DB.DBA.URLREWRITE_CREATE_REGEX_RULE ('tpcd_rdf', 1,
    '/tpcd/(.*)', vector('path'), 1,
    '/tpcd/data/rdf/%U', vector('path'),
    'DB.DBA.TPCD_DET_REF',
    'application/rdf.xml',
    2,
    303);

DB.DBA.URLREWRITE_CREATE_RULELIST (
    'tpcd_rule_list1',
    1,
    vector (
                'tcpd_rule1',
                'tcpd_rule2',
                'tcpd_rule3',
                'tpcd_rdf'
          ));

VHOST_REMOVE (lpath=>'/tpcd');
DB.DBA.VHOST_DEFINE (lpath=>'/tpcd', ppath=>'/DAV/home/', vsp_user=>'dba', is_dav=>1, def_page=>'sfront.vspx',
    is_brws=>0, opts=>vector ('url_rewrite', 'tpcd_rule_list1'));

create procedure DB.DBA.LOAD_TPCD_ONTOLOGY_FROM_DAV()
{
    declare content, urihost varchar;
    select cast (RES_CONTENT as varchar) into content from WS.WS.SYS_DAV_RES where RES_FULL_PATH = '/DAV/VAD/tpcd/tpcd.owl';
    DB.DBA.RDF_LOAD_RDFXML (content, 'http://demo.openlinksw.com/schemas/tpcd#', 'http://demo.openlinksw.com/schemas/TPCDOntology/1.0/');
    urihost := cfg_item_value(virtuoso_ini_path(), 'URIQA','DefaultHost');
    if (urihost = 'demo.openlinksw.com')
    {
        DB.DBA.VHOST_REMOVE (lpath=>'/schemas/tpcd');
        DB.DBA.VHOST_DEFINE (lpath=>'/schemas/tpcd', ppath=>'/DAV/VAD/tpcd/tpcd.owl', vsp_user=>'dba', is_dav=>1, is_brws=>0);
    }
}
;
DB.DBA.LOAD_TPCD_ONTOLOGY_FROM_DAV()
;
drop procedure DB.DBA.LOAD_TPCD_ONTOLOGY_FROM_DAV
;

XML_SET_NS_DECL ('virt-tpcd', 'http://demo.openlinksw.com/schemas/tpcd#', 2)
;
```

</div>
