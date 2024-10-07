<div id="rdfviewsenterohr" class="section">

<div class="titlepage">

<div>

<div>

### 16.8.11. Oracle Demonstration 'HR' Database

</div>

</div>

</div>

<span class="emphasis">*Live links to a sample instance*</span>

<div class="itemizedlist">

- <a
  href="http://demo.openlinksw.com/sparql?default-graph-uri=&amp;should-sponge=&amp;query=%20prefix%20hr%3A%20%3Chttp%3A%2F%2Fdemo.openlinksw.com%2Fschemas%2Foraclehr%2F%3E%20select%20*%20from%20%3Chttp%3A%2F%2Fdemo.openlinksw.com%2Foraclehr%3E%20WHERE%20%7B%3Fs%20a%20hr%3Aemployees%7D&amp;format=text%2Fhtml&amp;debug=on"
  class="ulink" target="_top">list all employee URIs</a>

- <a
  href="http://demo.openlinksw.com/about/html/http/demo.openlinksw.com/oraclehr/employees/105"
  class="ulink" target="_top">description of employee 105</a>

</div>

<span class="emphasis">*Script to set up your own instance*</span>

``` programlisting
-- Setup script for Linked Data Views of Oracle 10 Human Resources Sample Database --

GRANT SELECT ON HR.orama.COUNTRIES TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON HR.orama.REGIONS TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON HR.orama.DEPARTMENTS TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON HR.orama.LOCATIONS TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON HR.orama.EMPLOYEES TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON HR.orama.JOBS TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON HR.orama.JOB_HISTORY TO "SPARQL", "SPARQL_UPDATE";

-------------------------------------------------------------------

-------- Create rdfs:Class definitions ----------------------------

ttlp (
'
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

@prefix hr: <http://example.com/schemas/oraclehr/> .

hr:countries a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/oraclehr> ;
    rdfs:label "COUNTRIES" ;
    rdfs:comment "Oracle HR COUNTRIES table" .

hr:country_id a rdf:Property ;
    rdfs:domain hr:countries ;
    rdfs:range xsd:string ;
    rdfs:label "COUNTRY ID" .

hr:country_name a rdf:Property ;
    rdfs:domain hr:countries ;
    rdfs:range xsd:string ;
    rdfs:label "COUNTRY NAME" .

hr:region_id a rdf:Property ;
    rdfs:domain hr:countries ;
    rdfs:range hr:regions ;
    rdfs:label "REGION ID" .

hr:regions a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/oraclehr> ;
    rdfs:label "REGIONS" ;
    rdfs:comment "Oracle HR REGIONS table" .

hr:region_id a rdf:Property ;
    rdfs:domain hr:regions ;
    rdfs:range xsd:integer ;
        rdfs:label "REGION ID" .

hr:region_name a rdf:Property ;
    rdfs:domain hr:regions ;
    rdfs:range xsd:string ;
    rdfs:label "REGION NAME" .

hr:departments a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/oraclehr> ;
    rdfs:label "DEPARTMENTS" ;
    rdfs:comment "Oracle HR DEPARTMENT table" .

hr:department_id a rdf:Property ;
    rdfs:domain hr:departments ;
    rdfs:range xsd:integer ;
    rdfs:label "DEPARTMENT ID" .

hr:department_name a rdf:Property ;
    rdfs:domain hr:departments ;
    rdfs:range xsd:string ;
    rdfs:comment "DEPARTMENT NAME" .

hr:manager_id a rdf:Property ;
    rdfs:domain hr:departments ;
    rdfs:range hr:employees ;
    rdfs:comment "MANAGER ID" .

hr:location_id a rdf:Property ;
    rdfs:domain hr:departments ;
    rdfs:range hr:locations ;
    rdfs:comment "LOCATION ID" .

hr:employees a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/oraclehr> ;
    rdfs:label "employees" ;
    rdfs:comment "Oracle HR EMPLOYEES table" .

hr:employee_id a rdf:Property ;
    rdfs:domain hr:employees;
    rdfs:range xsd:integer ;
    rdfs:label "EMPLOYEE ID" .

hr:first_name a rdf:Property ;
    rdfs:domain hr:employees;
    rdfs:range xsd:string ;
    rdfs:label "FIRST NAME" .

hr:last_name a rdf:Property ;
    rdfs:domain hr:employees ;
    rdfs:range xsd:string ;
    rdfs:label "LAST NAME" .

hr:email a rdf:Property ;
    rdfs:domain hr:employees;
    rdfs:range xsd:string ;
    rdfs:label "EMAIL" .

hr:phone_number a rdf:Property ;
    rdfs:domain hr:employees ;
    rdfs:range xsd:string ;
    rdfs:label "PHONE NUMBER" .

hr:hire_date a rdf:Property ;
    rdfs:domain hr:employees ;
    rdfs:range xsd:date ;
    rdfs:label "HIRE DATE" .

hr:job_id a rdf:Property ;
    rdfs:domain hr:employees;
    rdfs:range hr:jobs ;
    rdfs:label "JOB ID" .

hr:salary a rdf:Property ;
    rdfs:domain hr:employees ;
    rdfs:range xsd:integer ;
    rdfs:label "SALARY" .

hr:commission_pct a rdf:Property ;
    rdfs:domain hr:employees ;
    rdfs:range xsd:integer ;
    rdfs:label "COMMISSION PCT" .

hr:manager_id a rdf:Property ;
    rdfs:domain hr:employees ;
    rdfs:range xsd:string ;
    rdfs:label "MANAGER ID" .

hr:department_id a rdf:Property ;
    rdfs:domain hr:employees ;
    rdfs:range hr:departments ;
    rdfs:label "DEPARTMENT ID" .

hr:jobs a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/oraclehr> ;
    rdfs:label "JOBS" ;
    rdfs:comment "Oracle HR JOBS table" .

hr:job_id a rdf:Property ;

    rdfs:domain hr:jobs ;
    rdfs:range xsd:string ;
    rdfs:label "JOB ID" .

hr:job_title a rdf:Property ;
    rdfs:domain hr:jobs ;
    rdfs:range xsd:string ;
    rdfs:label "JOB TITLE" .

hr:min_salary a rdf:Property ;
    rdfs:domain hr:jobs ;
    rdfs:range xsd:number;
    rdfs:label "MIN SALARY" .

hr:max_salary a rdf:Property ;
    rdfs:domain hr:jobs ;
    rdfs:range xsd:number;
    rdfs:label "MAXSALARY" .

hr:job_history a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/oraclehr> ;
    rdfs:label "JOB HISTORY" ;
    rdfs:comment "Oracle HR JOB HISTORY table" .

hr:employee_id a rdf:Property ;
    rdfs:domain hr:job_history ;
    rdfs:range hr:employees ;
    rdfs:label "EMPLOYEE ID" .

hr:start_date a rdf:Property ;
    rdfs:domain hr:job_history ;
    rdfs:range xsd:date ;
    rdfs:label "START DATE" .

hr:end_date a rdf:Property ;
    rdfs:domain hr:job_history ;
    rdfs:range xsd:date ;
    rdfs:label "END DATE" .

hr:job_id a rdf:Property ;
    rdfs:domain hr:job_history ;
    rdfs:range hr:jobs ;
    rdfs:label "JOB ID" .

hr:department_id a rdf:Property ;
    rdfs:domain hr:job_history ;
    rdfs:range hr:departments ;
    rdfs:label "DEPARTMENT ID" .

hr:locations a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/oraclehr> ;
    rdfs:label "LOCATIONS" ;
    rdfs:comment "Oracle HR JOB LOCATIONS table" .

hr:location_id a rdf:Property ;
    rdfs:domain hr:locations ;
    rdfs:range xsd:number ;
    rdfs:label "LOCATION ID" .

hr:street_address a rdf:Property ;
    rdfs:domain hr:locations ;
    rdfs:range xsd:string ;
    rdfs:label "STREET ADDRESS" .

hr:postal_code a rdf:Property ;
    rdfs:domain hr:locations ;
    rdfs:range xsd:string ;
    rdfs:label "POSTAL CODE" .

hr:city a rdf:Property ;
    rdfs:domain hr:locations ;
    rdfs:range xsd:string ;
    rdfs:label "CITY" .

hr:state_province a rdf:Property ;
    rdfs:domain hr:locations ;
    rdfs:range xsd:string ;
    rdfs:label "STATE PROVINCE" .

hr:country_id a rdf:Property ;
    rdfs:domain hr:locations ;
    rdfs:range hr:countries ;
    rdfs:label "COUNTRY" .
', '', 'http://example.com/schemas/oraclehr', 0);

---------------------------------------------------------------

----------- Create IRI Classes -------------

create function DB.DBA.JOB_HISTORY (in EMPLOYEE_ID integer, in
START_DATE date) returns varchar
{
  return sprintf_or_null
('http://example.com/oraclehr/job_history/%d_%s#this',
  EMPLOYEE_ID, cast (START_DATE as varchar) );
}
;

create function DB.DBA.JOB_HISTORY_INV_1 (in id varchar) returns integer
{
  return sprintf_inverse (id,
'http://example.com/oraclehr/job_history/%d_%s#this',
2)[0];
}
;

create function DB.DBA.JOB_HISTORY_INV_2 (in id varchar) returns date
{
  declare exit handler for sqlstate '*' { return NULL; };
  return cast (sprintf_inverse (id,
'http://example.com/oraclehr/job_history/%d_%s#this',
2)[1] as date);
}
;

GRANT EXECUTE ON DB.DBA.JOB_HISTORY TO "SPARQL", "SPARQL_UPDATE";
GRANT EXECUTE ON DB.DBA.JOB_HISTORY_URI_INV_1 TO "SPARQL", "SPARQL_UPDATE";
GRANT EXECUTE ON DB.DBA.JOB_HISTORY_URI_INV_2 TO "SPARQL", "SPARQL_UPDATE";

SPARQL

    create iri class <http://example.com/schemas/oraclehr/countries_iri>
    "http://^{URIQADefaultHost}^/oraclehr/countries/%s#this"
        (in COUNTRY_ID varchar not null) .

    create iri class <http://example.com/schemas/oraclehr/regions_iri>
    "http://^{URIQADefaultHost}^/oraclehr/regions/%d#this"
        (in REGION_ID integer not null) .

    create iri class <http://example.com/schemas/oraclehr/departments_iri>
    "http://^{URIQADefaultHost}^/oraclehr/departments/%d#this"
        (in DEPARTMENT_ID integer not null) .

    create iri class <http://example.com/schemas/oraclehr/employees_iri>
    "http://^{URIQADefaultHost}^/oraclehr/employees/%d#this"
        (in EMPLOYEE_ID integer not null) .

    create iri class <http://example.com/schemas/oraclehr/jobs_iri>
    "http://^{URIQADefaultHost}^/oraclehr/jobs/%s#this"
        (in JOB_ID varchar not null) .

    create iri class <http://example.com/schemas/oraclehr/job_history_iri>
        using function DB.DBA.JOB_HISTORY (in EMPLOYEE_ID integer not null, in
        START_DATE date not null) returns varchar not null,
        function DB.DBA.JOB_HISTORY_INV_1 (in id varchar) returns integer,
        function DB.DBA.JOB_HISTORY_INV_2 (in id varchar) returns date
        option (bijection, returns
        "http://example.com/oraclehr/job_history/%d_%s#this") .

    create iri class <http://example.com/schemas/oraclehr/locations_iri>
    "http://^{URIQADefaultHost}^/oraclehr/locations/%d#this"
        (in LOCATION_ID integer not null) .
;

--------------------------------------------------------------------

------------- Create Quad Store ------------------------------------

SPARQL

prefix hr: <http://example.com/schemas/oraclehr/>

alter quad storage virtrdf:DefaultQuadStorage
  FROM HR.orama.COUNTRIES as countries_tbl
  FROM HR.orama.REGIONS as regions_tbl
  FROM HR.orama.DEPARTMENTS as departments_tbl
  FROM HR.orama.EMPLOYEES as employees_tbl
  FROM HR.orama.EMPLOYEES as employees_tbl_1        ### alias required to represent recursive FK relationship (hr: has_manager ) below.
  FROM HR.orama.JOBS as jobs_tbl
  FROM HR.orama.JOB_HISTORY as job_history_tbl
  FROM HR.orama.LOCATIONS as locations_tbl
{
  create virtrdf:oraclehr as
      graph <http://example.com/oraclehr>
  {
        hr:countries_iri(countries_tbl.COUNTRY_ID) a hr:countries  as virtrdf:countires_country_id ;
        hr:country_name countries_tbl.COUNTRY_NAME  as virtrdf:countries_country_name ;
        hr:region_id hr:regions_iri(regions_tbl.REGION_ID) where (^{countries_tbl.}^.REGION_ID = ^{regions_tbl.}^.REGION_ID)  as virtrdf:countries_region_id .

    hr:regions_iri(regions_tbl.REGION_ID) a hr:regions as virtrdf:regions_region_id ;
    hr:region_name regions_tbl.REGION_NAME  as virtrdf:regions_region_name .

    hr:departments_iri(departments_tbl.DEPARTMENT_ID) a hr:departments as virtrdf:departments_department_id ;
    hr:department_name departments_tbl.DEPARTMENT_NAME as virtrdf:departments_department_name ;
    hr:location_id hr:locations_iri(locations_tbl.LOCATION_ID) where (^{departments_tbl.}^.LOCATION_ID = ^{locations_tbl.}^.LOCATION_ID) as virtrdf:departments_location_id ;
    hr:manager_id hr:employees_iri(employees_tbl.EMPLOYEE_ID) where (^{departments_tbl.}^.MANAGER_ID = ^{employees_tbl.}^.EMPLOYEE_ID) as virtrdf:departments_manager_id .

    hr:employees_iri(employees_tbl.EMPLOYEE_ID) a hr:employees as virtrdf:employees_employee_id ;
    hr:department_id hr:departments_iri(departments_tbl.DEPARTMENT_ID) where (^{employees_tbl.}^.DEPARTMENT_ID = ^{departments_tbl.}^.DEPARTMENT_ID) as virtrdf:employees_department_id ;
    hr:job_id hr:jobs_iri(jobs_tbl.JOB_ID) where (^{employees_tbl.}^.JOB_ID = ^{jobs_tbl.}^.JOB_ID) as virtrdf:employees_job_id ;
    hr:manager_id employees_tbl.MANAGER_ID as virtrdf:employees_manager_id ;
    hr:commissin_pct employees_tbl.COMMISSION_PCT as virtrdf:employees_commission_pct ;
    hr:email employees_tbl.EMAIL as virtrdf:employees_email ;
    hr:first_name employees_tbl.FIRST_NAME as virtrdf:employees_first_name ;
    hr:hire_date employees_tbl.HIRE_DATE as virtrdf:employees_hire_date ;
    hr:last_name employees_tbl.LAST_NAME as virtrdf:employees_last_name ;
    hr:phone_number employees_tbl.PHONE_NUMBER as virtrdf:employees_phone_number ;
    hr:salary employees_tbl.SALARY as virtrdf:employees_salary ;
    hr:has_job_history hr:job_history_iri(job_history_tbl.EMPLOYEE_ID, job_history_tbl.START_DATE) where (^{employees_tbl.}^.EMPLOYEE_ID = ^{job_history_tbl.}^.EMPLOYEE_ID) as virtrdf:employees_has_job_history;
    hr:has_manager hr:employees_iri(employees_tbl_1.EMPLOYEE_ID) where (^{employees_tbl.}^.MANAGER_ID = ^{employees_tbl_1.}^.EMPLOYEE_ID) as virtrdf:employees_has_manager.

    hr:locations_iri(locations_tbl.LOCATION_ID) a hr:locations as virtrdf:locations_location_id ;
    hr:country_id hr:countries_iri(countries_tbl.COUNTRY_ID) where (^{locations_tbl.}^.COUNTRY_ID = ^{countries_tbl.}^.COUNTRY_ID) as virtrdf:locations_country_id ;
    hr:city locations_tbl.CITY as virtrdf:locations_city ;
    hr:postal_code locations_tbl.POSTAL_CODE as virtrdf:locations_postal_code ;
    hr:state_province locations_tbl.STATE_PROVINCE as virtrdf:locations_state_province ;
    hr:street_address locations_tbl.STREET_ADDRESS as virtrdf:locations_street_address .

    hr:jobs_iri(jobs_tbl.JOB_ID) a hr:jobs as virtrdf:jobs_job_id ;
    hr:job_title jobs_tbl.JOB_TITLE as virtrdf:jobs_job_title ;
    hr:max_salary jobs_tbl.MAX_SALARY as virtrdf:jobs_max_salary ;
    hr:min_salary jobs_tbl.MIN_SALARY as virtrdf:jobs_min_salary .

    hr:job_history_iri(job_history_tbl.EMPLOYEE_ID, job_history_tbl.START_DATE) a hr:job_history as virtrdf:job_history_pk ;
    hr:employee_id hr:employees_iri(employees_tbl.EMPLOYEE_ID) where (^{job_history_tbl.}^.EMPLOYEE_ID = ^{employees_tbl.}^.EMPLOYEE_ID) as virtrdf:job_history_employee_id ;
    hr:department_id hr:departments_iri(departments_tbl.DEPARTMENT_ID) where (^{job_history_tbl.}^.DEPARTMENT_ID = ^{departments_tbl.}^.DEPARTMENT_ID) as virtrdf:job_history_department_id ;
    hr:job_id hr:jobs_iri(jobs_tbl.JOB_ID) where (^{job_history_tbl.}^.JOB_ID = ^{jobs_tbl.}^.JOB_ID) as virtrdf:job_history_job_id ;
    hr:start_date job_history_tbl.START_DATE as virtrdf:job_history_start_date ;
    hr:end_date job_history_tbl.END_DATE as virtrdf:job_history_end_date .

  } .
} .
;

delete from db.dba.url_rewrite_rule_list where urrl_list like 'oraclehr_rule%';
delete from db.dba.url_rewrite_rule where urr_rule like 'oraclehr_rule%';

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'oraclehr_rule1',
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
    'oraclehr_rule2',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/sparql?query=DESCRIBE+%%3Chttp%%3A//localhost%%3A8890%U%%23this%%3E+%%3Chttp%%3A//localhost%%3A8890%U%%23this%%3E+FROM+%%3Chttp%%3A//localhost%%3A8890/oraclehr%%3E&format=%U',
    vector('path', 'path', '*accept*'),
    null,
    '(text/rdf.n3)|(application/rdf.xml)',
    0,
    null
    );

DB.DBA.URLREWRITE_CREATE_RULELIST (
    'oraclehr_rule_list1',
    1,
    vector (
        'oraclehr_rule1',
        'oraclehr_rule2'
      ));

-- ensure a VD for the IRIs which begins with /
VHOST_REMOVE (lpath=>'/oraclehr');

VHOST_DEFINE (
    lpath=>'/oraclehr',
    ppath=>'/DAV/oraclehr/',
        is_dav=>1,
    vsp_user=>'dba',
    is_brws=>0,
    opts=>vector ('url_rewrite', 'oraclehr_rule_list1')
    );

delete from db.dba.url_rewrite_rule_list where urrl_list like 'oracle_schemas_rule%';
delete from db.dba.url_rewrite_rule where urr_rule like 'oracle_schemas_rule%';

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'oracle_schemas_rule1',
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
    'oracle_schemas_rule2',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/sparql?query=CONSTRUCT+{+%%3Chttp%%3A//localhost%%3A8890%U%%3E+%%3Fp+%%3Fo+}%%0D%%0AFROM+%%3Chttp%%3A//localhost%%3A8890/schemas/oraclehr%%3E+%%0D%%0AWHERE+{+%%3Chttp%%3A//localhost%%3A8890%U%%3E+%%3Fp+%%3Fo+}&format=%U',
    vector('path','path','*accept*'),
    null,
    '(text/rdf.n3)|(application/rdf.xml)',
    0,
    null
    );

DB.DBA.URLREWRITE_CREATE_RULELIST (
    'oracle_schemas_rule_list1',
    1,
    vector (
        'oracle_schemas_rule1',
        'oracle_schemas_rule2'
      ));

-- ensure a VD for the IRIs which begins with /
VHOST_REMOVE (lpath=>'/schema/oraclehr');

VHOST_DEFINE (
    lpath=>'/schemas/oraclehr',
    ppath=>'/DAV/schemas/oraclehr/',
        is_dav=>1,
    vsp_user=>'dba',
    is_brws=>0,
    opts=>vector ('url_rewrite', 'oracle_schemas_rule_list1')
    );

DB.DBA.XML_SET_NS_DECL ('hr', 'http://^{URIQADefaultHost}^/schemas/oraclehr/', 2);
```

</div>
