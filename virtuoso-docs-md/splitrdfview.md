<div>

<div>

<div>

<div>

### 16.5.12. Split Linked Data View

</div>

</div>

</div>

Linked Data View can be created by two or more "sparql alter storage"
statements. In each statement can be created one quad map that contains
mappings for half or a third of all tables. Quad maps created should
have distinct names but may mention same graph. The important fact is
that if the Linked Data View in question is exclusive for a graph then
only the last quad map should be exclusive but all previous should not
have this option. This is because if a map is exclusive on a graph the
rest of maps on that graph will be silently ignored.

The example below shows a sample part of the Virtuoso eCRM Views code,
where the Linked Data View is split in two parts: with quad map
virtrdf:ecrmDemo1 and with quad map virtrdf:ecrmDemo2:

``` programlisting
SPARQL
prefix ecrm: <http://demo.openlinksw.com/schemas/ecrm#>
prefix oplsioc: <http://www.openlinksw.com/schemas/oplsioc#>
prefix sioc: <http://rdfs.org/sioc/ns#>
prefix foaf: <http://xmlns.com/foaf/0.1/>
prefix cal: <http://www.w3.org/2002/12/cal/ical#>
prefix geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>
prefix product: <http://www.swop-project.eu/ontologies/pmo/product.owl#>
prefix owl: <http://www.w3.org/2002/07/owl#>
drop quad map virtrdf:ecrmDemo1 .
;

SPARQL
prefix ecrm: <http://demo.openlinksw.com/schemas/ecrm#>
prefix oplsioc: <http://www.openlinksw.com/schemas/oplsioc#>
prefix sioc: <http://rdfs.org/sioc/ns#>
prefix foaf: <http://xmlns.com/foaf/0.1/>
prefix cal: <http://www.w3.org/2002/12/cal/ical#>
prefix geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>
prefix product: <http://www.swop-project.eu/ontologies/pmo/product.owl#>
prefix owl: <http://www.w3.org/2002/07/owl#>
drop quad map virtrdf:ecrmDemo2 .
;

...

SPARQL
prefix ecrm: <http://demo.openlinksw.com/schemas/ecrm#>
prefix oplsioc: <http://www.openlinksw.com/schemas/oplsioc#>
prefix sioc: <http://rdfs.org/sioc/ns#>
prefix foaf: <http://xmlns.com/foaf/0.1/>
prefix cal: <http://www.w3.org/2002/12/cal/ical#>
prefix geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>
prefix product: <http://www.swop-project.eu/ontologies/pmo/product.owl#>
prefix owl: <http://www.w3.org/2002/07/owl#>
alter quad storage virtrdf:DefaultQuadStorage
FROM eCRM.DBA.SFA_SALES_QUOTA_VIEW2 as sales_quotas
FROM eCRM.DBA.SFA_COMPANIES_VIEW2 as companies
FROM eCRM.DBA.SFA_COMPANIES as companies_table text literal companies_table.DESCRIPTION of (companies.DESCRIPTION)
FROM eCRM.DBA.SFA_CONTACTS_VIEW2 as contacts
FROM eCRM.DBA.SFA_CONTACTS as contacts_table text literal contacts_table.NAME_FIRST of (contacts.NAME_FIRST)
FROM eCRM.DBA.SFA_EMPLOYMENTS_VIEW2 as employments
FROM eCRM.DBA.SFA_LEADS_VIEW2 as leads
FROM eCRM.DBA.SFA_LEADS as leads_table text literal leads_table.SUBJECT of (leads.SUBJECT)
FROM eCRM.DBA.SFA_OPPORTUNITIES_VIEW2 as opportunities
FROM eCRM.DBA.SFA_OPPORTUNITIES as opportunities_table text literal opportunities_table.OPPORTUNITY_NAME of (opportunities.OPPORTUNITY_NAME)
FROM eCRM.DBA.SFA_ACTIVITIES as activities
FROM eCRM.DBA.SFA_MAIL_MESSAGES as messages
FROM eCRM.DBA.SFA_DOCUMENTS_VIEW2 as documents
FROM eCRM.DBA.SFA_INFLUENCERS_VIEW2 as influencers
FROM eCRM.DBA.SFA_TEAMS_VIEW2 as teams
FROM eCRM.DBA.SFA_NOTES_VIEW2 as notes
FROM eCRM.DBA.SFA_NOTES as notes_table text literal notes_table.DESCRIPTION of (notes.DESCRIPTION)
FROM eCRM.DBA.SFA_COMPETITORS_VIEW2 as competitors
FROM eCRM.DBA.SFA_ISSUES_VIEW2 as issues
FROM eCRM.DBA.SFA_CUSTOM_FIELD_DEFS_VIEW2 as custom_field_defs
FROM eCRM.DBA.SFA_CUSTOM_FIELDS_VIEW2 as custom_fields
FROM eCRM.DBA.SFA_CASES_VIEW2 as cases
FROM eCRM.DBA.SFA_CASES as cases_table text literal cases_table.SUMMARY of (cases.SUMMARY)
FROM eCRM.DBA.SFA_ORDERS_VIEW2 as orders
FROM eCRM.DBA.SFA_ORDERS as orders_table text literal orders_table.EMAIL of (orders.EMAIL)
FROM eCRM.DBA.SFA_ORDER_ITEMS_VIEW2 as order_items
FROM eCRM.DBA.PM_CATEGORIES_VIEW2 as categories
FROM eCRM.DBA.PM_PRODUCT_ATTRIBUTE_DEFS_VIEW2 as product_attribute_defs
FROM eCRM.DBA.PM_PRODUCTS_VIEW2 as products
FROM eCRM.DBA.PM_PRODUCTS as products_table text literal products_table.DESCRIPTION of (products.DESCRIPTION)
FROM eCRM.DBA.PM_PRODUCT_ATTRIBUTES_VIEW2 as product_attributes
FROM eCRM.DBA.PM_CATALOGS_VIEW2 as catalogs
FROM eCRM.DBA.PM_CATALOG_PRODUCTS_VIEW2 as catalog_products
FROM eCRM.DBA.XSYS_MODULES as modules
FROM eCRM.DBA.XSYS_REGISTRY as registries
FROM eCRM.DBA.XSYS_ORGANIZATIONS_DATA as organizations_data
FROM eCRM.DBA.XSYS_MESSAGES as xsysmessages
FROM eCRM.DBA.XSYS_COUNTRIES_VIEW2 as countries
FROM eCRM.DBA.XSYS_PROVINCES_VIEW2 as provinces
FROM eCRM.DBA.XSYS_TIMEZONES as timezones
FROM eCRM.DBA.XSYS_MIME_TYPES as mimetypes
FROM eCRM.DBA.XSYS_MIME_EXTENSIONS as mimeexts
FROM eCRM.DBA.XSYS_CNAMES as cnames
FROM eCRM.DBA.XSYS_QUOTAS as quotas
FROM eCRM.DBA.XSYS_ROLES as roles
FROM eCRM.DBA.XSYS_ACCOUNTS as accounts
FROM eCRM.DBA.XSYS_USERDATA as userdatas
FROM eCRM.DBA.XSYS_GROUPDATA as groupdatas
FROM eCRM.DBA.XSYS_MEMBERS as members
FROM eCRM.DBA.XSYS_SESSIONS_DATA as sessionsdatas
FROM eCRM.DBA.XSYS_SESSION_DATA as sessiondatas
FROM eCRM.DBA.XSYS_LIST_MEMBERS_DEFS as list_members_defs
FROM eCRM.DBA.XSYS_CLASSES as classes
FROM eCRM.DBA.XSYS_ORG_CLASSES as org_classes
FROM eCRM.DBA.XSYS_CLASS_METHODS as class_methods
FROM eCRM.DBA.XSYS_CLASS_VIEWS as class_views
FROM eCRM.DBA.XSYS_ROLE_PRIVILEGES as role_priveleges
FROM eCRM.DBA.XSYS_USER_PRIVILEGES as user_priveleges
FROM eCRM.DBA.XSYS_HISTORY as history
FROM eCRM.DBA.XSYS_USERS as xsys_users
FROM eCRM.DBA.AP_PROCESSES_VIEW2 as ap_processes
FROM eCRM.DBA.AP_RULES_VIEW2 as ap_rules
FROM eCRM.DBA.AP_QUEUE as ap_queues
WHERE (^{companies.}^.COUNTRY_NAME = ^{countries.}^.COUNTRY_NAME)
WHERE (^{contacts.}^.COUNTRY_NAME = ^{countries.}^.COUNTRY_NAME)
WHERE (^{leads.}^.COUNTRY_NAME = ^{countries.}^.COUNTRY_NAME)
WHERE (^{products.}^.COUNTRY_NAME = ^{countries.}^.COUNTRY_NAME)
WHERE (^{orders.}^.SHIP_COUNTRY_NAME = ^{countries.}^.COUNTRY_NAME)
WHERE (^{leads_table.}^.FREETEXT_ID = ^{leads.}^.FREETEXT_ID)
WHERE (^{contacts_table.}^.FREETEXT_ID = ^{contacts.}^.FREETEXT_ID)
WHERE (^{companies_table.}^.FREETEXT_ID = ^{companies.}^.FREETEXT_ID)
WHERE (^{opportunities_table.}^.FREETEXT_ID = ^{opportunities.}^.FREETEXT_ID)
WHERE (^{cases_table.}^.FREETEXT_ID = ^{cases.}^.FREETEXT_ID)
WHERE (^{notes_table.}^.FREETEXT_ID = ^{notes.}^.FREETEXT_ID)
WHERE (^{orders_table.}^.FREETEXT_ID = ^{orders.}^.FREETEXT_ID)
WHERE (^{products_table.}^.FREETEXT_ID = ^{products.}^.FREETEXT_ID)
{
        create virtrdf:ecrmDemo1 as graph iri ("http://^{URIQADefaultHost}^/ecrm") option (order 1501)
        {
            ecrm:Country (countries.COUNTRY_NAME)
                a ecrm:Country
                    as virtrdf:Country-Countrys2 ;
                a geo:SpatialThing
                    as virtrdf:Country-Countrys ;
                owl:sameAs ecrm:dbpedia_iri (countries.COUNTRY_NAME) ;
                ecrm:countryID countries.COUNTRY_ID
                        as virtrdf:Country-COUNTRY_ID ;
                ecrm:countryID3 countries.COUNTRY_ID3
                        as virtrdf:Country-COUNTRY_ID3 ;
                ecrm:isoCode countries.ISO_CODE
                        as virtrdf:Country-ISO_CODE ;
                ecrm:countryName countries.COUNTRY_NAME
                        as virtrdf:Country-COUNTRY_NAME .

            ecrm:Country (countries.COUNTRY_NAME)
                        ecrm:has_province
            ecrm:Province (provinces.COUNTRY_ID, provinces.PROVINCE_NAME) where
                        (^{provinces.}^.COUNTRY_ID = ^{countries.}^.COUNTRY_ID) as virtrdf:ecrmCountry-has_province .

...
  } .
} .
;
SPARQL
prefix ecrm: <http://demo.openlinksw.com/schemas/ecrm#>
prefix oplsioc: <http://www.openlinksw.com/schemas/oplsioc#>
prefix sioc: <http://rdfs.org/sioc/ns#>
prefix foaf: <http://xmlns.com/foaf/0.1/>
prefix geo: <http://www.w3.org/2003/01/geo/wgs84_pos#>
prefix cal: <http://www.w3.org/2002/12/cal/ical#>
prefix product: <http://www.swop-project.eu/ontologies/pmo/product.owl#>
prefix owl: <http://www.w3.org/2002/07/owl#>
alter quad storage virtrdf:DefaultQuadStorage
FROM eCRM.DBA.SFA_SALES_QUOTA_VIEW2 as sales_quotas
FROM eCRM.DBA.SFA_COMPANIES_VIEW2 as companies
FROM eCRM.DBA.SFA_COMPANIES as companies_table text literal companies_table.DESCRIPTION of (companies.DESCRIPTION)
FROM eCRM.DBA.SFA_CONTACTS_VIEW2 as contacts
FROM eCRM.DBA.SFA_CONTACTS as contacts_table text literal contacts_table.NAME_FIRST of (contacts.NAME_FIRST)
FROM eCRM.DBA.SFA_EMPLOYMENTS_VIEW2 as employments
FROM eCRM.DBA.SFA_LEADS_VIEW2 as leads
FROM eCRM.DBA.SFA_LEADS as leads_table text literal leads_table.SUBJECT of (leads.SUBJECT)
FROM eCRM.DBA.SFA_OPPORTUNITIES_VIEW2 as opportunities
FROM eCRM.DBA.SFA_OPPORTUNITIES as opportunities_table text literal opportunities_table.OPPORTUNITY_NAME of (opportunities.OPPORTUNITY_NAME)
FROM eCRM.DBA.SFA_ACTIVITIES as activities
FROM eCRM.DBA.SFA_MAIL_MESSAGES as messages
FROM eCRM.DBA.SFA_DOCUMENTS_VIEW2 as documents
FROM eCRM.DBA.SFA_INFLUENCERS_VIEW2 as influencers
FROM eCRM.DBA.SFA_TEAMS_VIEW2 as teams
FROM eCRM.DBA.SFA_NOTES_VIEW2 as notes
FROM eCRM.DBA.SFA_NOTES as notes_table text literal notes_table.DESCRIPTION of (notes.DESCRIPTION)
FROM eCRM.DBA.SFA_COMPETITORS_VIEW2 as competitors
FROM eCRM.DBA.SFA_ISSUES_VIEW2 as issues
FROM eCRM.DBA.SFA_CUSTOM_FIELD_DEFS_VIEW2 as custom_field_defs
FROM eCRM.DBA.SFA_CUSTOM_FIELDS_VIEW2 as custom_fields
FROM eCRM.DBA.SFA_CASES_VIEW2 as cases
FROM eCRM.DBA.SFA_CASES as cases_table text literal cases_table.SUMMARY of (cases.SUMMARY)
FROM eCRM.DBA.SFA_ORDERS_VIEW2 as orders
FROM eCRM.DBA.SFA_ORDERS as orders_table text literal orders_table.EMAIL of (orders.EMAIL)
FROM eCRM.DBA.SFA_ORDER_ITEMS_VIEW2 as order_items
FROM eCRM.DBA.PM_CATEGORIES_VIEW2 as categories
FROM eCRM.DBA.PM_PRODUCT_ATTRIBUTE_DEFS_VIEW2 as product_attribute_defs
FROM eCRM.DBA.PM_PRODUCTS_VIEW2 as products
FROM eCRM.DBA.PM_PRODUCTS as products_table text literal products_table.DESCRIPTION of (products.DESCRIPTION)
FROM eCRM.DBA.PM_PRODUCT_ATTRIBUTES_VIEW2 as product_attributes
FROM eCRM.DBA.PM_CATALOGS_VIEW2 as catalogs
FROM eCRM.DBA.PM_CATALOG_PRODUCTS_VIEW2 as catalog_products
FROM eCRM.DBA.XSYS_MODULES as modules
FROM eCRM.DBA.XSYS_REGISTRY as registries
FROM eCRM.DBA.XSYS_ORGANIZATIONS_DATA as organizations_data
FROM eCRM.DBA.XSYS_MESSAGES as xsysmessages
FROM eCRM.DBA.XSYS_COUNTRIES_VIEW2 as countries
FROM eCRM.DBA.XSYS_PROVINCES_VIEW2 as provinces
FROM eCRM.DBA.XSYS_TIMEZONES as timezones
FROM eCRM.DBA.XSYS_MIME_TYPES as mimetypes
FROM eCRM.DBA.XSYS_MIME_EXTENSIONS as mimeexts
FROM eCRM.DBA.XSYS_CNAMES as cnames
FROM eCRM.DBA.XSYS_QUOTAS as quotas
FROM eCRM.DBA.XSYS_ROLES as roles
FROM eCRM.DBA.XSYS_ACCOUNTS as accounts
FROM eCRM.DBA.XSYS_USERDATA as userdatas
FROM eCRM.DBA.XSYS_GROUPDATA as groupdatas
FROM eCRM.DBA.XSYS_MEMBERS as members
FROM eCRM.DBA.XSYS_SESSIONS_DATA as sessionsdatas
FROM eCRM.DBA.XSYS_SESSION_DATA as sessiondatas
FROM eCRM.DBA.XSYS_LIST_MEMBERS_DEFS as list_members_defs
FROM eCRM.DBA.XSYS_CLASSES as classes
FROM eCRM.DBA.XSYS_ORG_CLASSES as org_classes
FROM eCRM.DBA.XSYS_CLASS_METHODS as class_methods
FROM eCRM.DBA.XSYS_CLASS_VIEWS as class_views
FROM eCRM.DBA.XSYS_ROLE_PRIVILEGES as role_priveleges
FROM eCRM.DBA.XSYS_USER_PRIVILEGES as user_priveleges
FROM eCRM.DBA.XSYS_HISTORY as history
FROM eCRM.DBA.XSYS_USERS as xsys_users
FROM eCRM.DBA.AP_PROCESSES_VIEW2 as ap_processes
FROM eCRM.DBA.AP_RULES_VIEW2 as ap_rules
FROM eCRM.DBA.AP_QUEUE as ap_queues
WHERE (^{companies.}^.COUNTRY_NAME = ^{countries.}^.COUNTRY_NAME)
WHERE (^{contacts.}^.COUNTRY_NAME = ^{countries.}^.COUNTRY_NAME)
WHERE (^{leads.}^.COUNTRY_NAME = ^{countries.}^.COUNTRY_NAME)
WHERE (^{products.}^.COUNTRY_NAME = ^{countries.}^.COUNTRY_NAME)
WHERE (^{orders.}^.SHIP_COUNTRY_NAME = ^{countries.}^.COUNTRY_NAME)
WHERE (^{leads_table.}^.FREETEXT_ID = ^{leads.}^.FREETEXT_ID)
WHERE (^{contacts_table.}^.FREETEXT_ID = ^{contacts.}^.FREETEXT_ID)
WHERE (^{companies_table.}^.FREETEXT_ID = ^{companies.}^.FREETEXT_ID)
WHERE (^{opportunities_table.}^.FREETEXT_ID = ^{opportunities.}^.FREETEXT_ID)
WHERE (^{cases_table.}^.FREETEXT_ID = ^{cases.}^.FREETEXT_ID)
WHERE (^{notes_table.}^.FREETEXT_ID = ^{notes.}^.FREETEXT_ID)
WHERE (^{orders_table.}^.FREETEXT_ID = ^{orders.}^.FREETEXT_ID)
WHERE (^{products_table.}^.FREETEXT_ID = ^{products.}^.FREETEXT_ID)
{
        create virtrdf:ecrmDemo2 as graph iri ("http://^{URIQADefaultHost}^/ecrm") option (exclusive, order 1502)
        {
            ecrm:Order (orders.ORG_ID, orders.ORDER_ID)
                a ecrm:Order
                    as virtrdf:Order-Orders ;
                ecrm:has_ecrm_organization ecrm:OrganizationsData(orders.ORG_ID, organizations_data.DNS_ZONE) where (^{orders.}^.ORG_ID = ^{organizations_data.}^.ORG_ID)
                        as virtrdf:Order-ORG_ID ;
                ecrm:owner ecrm:XSys_User(orders.ORG_ID, xsys_users.ACCOUNT_NAME, orders.OWNER_ID)
                        where (^{orders.}^.OWNER_ID = ^{xsys_users.}^.ACCOUNT_ID and ^{orders.}^.ORG_ID = ^{xsys_users.}^.ORG_ID)
                        as virtrdf:Order-OWNER_ID ;
                ecrm:FREETEXT_ID orders.FREETEXT_ID
                        as virtrdf:Order-FREETEXT_ID ;
                ecrm:has_company ecrm:Company(orders.COMPANY_NAME, orders.COMPANY_ID, orders.ORG_ID)
                        as virtrdf:Order-COMPANY_ID ;
                ecrm:companyName orders.COMPANY_NAME
                        as virtrdf:Order-COMPANY_NAME ;
                ecrm:has_contact ecrm:Contact(contacts.NAME_FIRST, contacts.NAME_MIDDLE, contacts.NAME_LAST, orders.CONTACT_ID, orders.ORG_ID)
                        where (^{orders.}^.CONTACT_ID = ^{contacts.}^.CONTACT_ID and ^{orders.}^.ORG_ID = ^{contacts.}^.ORG_ID)
                        as virtrdf:Order-CONTACT_ID ;
                ecrm:contactName orders.CONTACT_NAME
                        as virtrdf:Order-CONTACT_NAME ;
                ecrm:orderNo orders.ORDER_NO
                        as virtrdf:Order-ORDER_NO ;
                ecrm:shipFirstName orders.SHIP_FNAME
                        as virtrdf:Order-SHIP_FNAME ;
                ecrm:shipSecondName orders.SHIP_SNAME
                        as virtrdf:Order-SHIP_SNAME ;
                ecrm:phoneNumber orders.PHONE_NUMBER
                        as virtrdf:Order-PHONE_NUMBER ;
                ecrm:phoneExtension orders.PHONE_EXTENSION
                        as virtrdf:Order-PHONE_EXTENSION ;
                ecrm:email orders.EMAIL
                        as virtrdf:Order-EMAIL ;
                ecrm:shipCountry ecrm:Country(orders.SHIP_COUNTRY_NAME)
                        as virtrdf:Order-SHIP_COUNTRY_NAME ;
                ecrm:shipCountryCode ecrm:Country (countries.COUNTRY_NAME) where  (^{countries.}^.COUNTRY_NAME = ^{orders.}^.SHIP_COUNTRY_NAME)
                        as virtrdf:Order-SHIP_COUNTRY_CODE ;
                ecrm:shipProvince orders.SHIP_PROVINCE
                        as virtrdf:Order-SHIP_PROVINCE ;
                ecrm:shipCity orders.SHIP_CITY
                        as virtrdf:Order-SHIP_CITY ;
                ecrm:dbpedia_shipCity ecrm:dbpedia_iri (orders.SHIP_CITY)
                        as virtrdf:Order-SHIP_dbpedia_CITY ;
                ecrm:shipPostalCode orders.SHIP_POSTAL_CODE
                        as virtrdf:Order-SHIP_POSTAL_CODE ;
                ecrm:shipAddress1 orders.SHIP_ADDRESS1
                        as virtrdf:Order-SHIP_ADDRESS1 ;
                ecrm:shipAddress2 orders.SHIP_ADDRESS2
                        as virtrdf:Order-SHIP_ADDRESS2 ;
                ecrm:salesRep orders.SALESREP
                        as virtrdf:Order-SALESREP ;
                ecrm:orderDate orders.ORDER_DATE
                        as virtrdf:Order-ORDER_DATE ;
                ecrm:orderValue orders.ORDER_VALUE
                        as virtrdf:Order-ORDER_VALUE ;
                ecrm:refund orders.REFUND
                        as virtrdf:Order-REFUND ;
                ecrm:year orders.YEAR
                        as virtrdf:Order-YEAR ;
                ecrm:month orders.MONTH
                        as virtrdf:Order-MONTH ;
                ecrm:quarter orders.QUARTER
                        as virtrdf:Order-QUARTER ;
                ecrm:financialYear orders.FINANCIAL_YEAR
                        as virtrdf:Order-FINANCIAL_YEAR ;
                ecrm:CONTACT_REL_ID orders.CONTACT_REL_ID
                        as virtrdf:Order-CONTACT_REL_ID ;
                ecrm:COMPANY_REL_ID orders.COMPANY_REL_ID
                        as virtrdf:Order-COMPANY_REL_ID .

...
        } .
} .
;
```

</div>
