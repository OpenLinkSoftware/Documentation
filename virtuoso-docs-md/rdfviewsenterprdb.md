<div>

<div>

<div>

<div>

### 16.8.13. DB2 using the demonstration 'Sample' database

</div>

</div>

</div>

<span class="emphasis">*Version defined using explicit host -
example.com*</span>

``` programlisting
-- $Id$
-- Setup script for Linked Data Views of portions of DB2 SAMPLE database included
-- in DB2 Express Edition v9.5
--
-- The script assumes external DB2 tables are linked into Virtuoso using
-- local schema name db2sample.

DB..vd_remote_data_source ('db2ma-smpl', '', '<uid>','<pwd>);

ATTACH TABLE  "DB2ADMIN"."ACT"      PRIMARY KEY ("ACTNO")              AS "DB"."db2sample"."ACT"      FROM 'db2ma-smpl';
ATTACH TABLE  "DB2ADMIN"."DEPARTMENT"      PRIMARY KEY ("DEPTNO")              AS "DB"."db2sample"."DEPARTMENT"      FROM 'db2ma-smpl';
ATTACH TABLE  "DB2ADMIN"."EMPLOYEE"      PRIMARY KEY ("EMPNO")              AS "DB"."db2sample"."EMPLOYEE"      FROM 'db2ma-smpl';
ATTACH TABLE  "DB2ADMIN"."EMPPROJACT"      PRIMARY KEY ("EMPNO", "PROJNO", "ACTNO", "EMSTDATE")              AS "DB"."db2sample"."EMPPROJACT"      FROM 'db2ma-smpl';
ATTACH TABLE  "DB2ADMIN"."EMP_RESUME"      PRIMARY KEY ("EMPNO", "RESUME_FORMAT)              AS "DB"."db2sample"."EMP_RESUME"      FROM 'db2ma-smpl';
ATTACH TABLE  "DB2ADMIN"."PROJACT"      PRIMARY KEY ("PROJNO", "ACTNO", "ACSTDATE")              AS "DB"."db2sample"."PROJACT"      FROM 'db2ma-smpl';
ATTACH TABLE  "DB2ADMIN"."PROJECT"      PRIMARY KEY ("PROJNO")              AS "DB"."db2sample"."PROJECT"      FROM 'db2ma-smpl';

COMMIT WORK;

GRANT SELECT ON DB.db2sample.ACT TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON DB.db2sample.DEPARTMENT TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON DB.db2sample.EMPLOYEE TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON DB.db2sample.EMPPROJACT TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON DB.db2sample.EMP_RESUME TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON DB.db2sample.PROJACT TO "SPARQL", "SPARQL_UPDATE";
GRANT SELECT ON DB.db2sample.PROJECT TO "SPARQL", "SPARQL_UPDATE";

create function DB.DBA.PROJ_ACT_IRI (
  in proj_no varchar,
  in act_no integer,
  in ac_st_date date
  ) returns varchar
{
  declare _act_no, _datetime, _date any;
  _act_no := cast(act_no as varchar);
  _datetime := cast(ac_st_date as varchar);
  _date := left(_datetime, 10);
  return sprintf('http://example.com/db2sample/proj_act/%s_%s_%s#this',
    proj_no, _act_no, _date);
};

create function
DB.DBA.PROJ_ACT_IRI_INV_1 (in proj_act_iri varchar) returns varchar
{
  declare exit handler for sqlstate '*' { return NULL; };
  declare parts any;
  parts := sprintf_inverse (proj_act_iri,
   'http://example.com/db2sample/proj_act/%s_%s_%s#this', 1);
  if (parts is not null)
  {
    return parts[0];
  }
  return NULL;
};

create function
DB.DBA.PROJ_ACT_IRI_INV_2 (in proj_act_iri varchar) returns integer
{
  declare exit handler for sqlstate '*' { return NULL; };
  declare parts any;
  parts := sprintf_inverse (proj_act_iri,
   'http://example.com/db2sample/proj_act/%s_%s_%s#this', 1);
  if (parts is not null)
  {
    return cast(parts[1] as integer);
  }
  return NULL;
};

create function
DB.DBA.PROJ_ACT_IRI_INV_3 (in proj_act_iri varchar) returns date
{
  declare exit handler for sqlstate '*' { return NULL; };
  declare parts any;
  parts := sprintf_inverse (proj_act_iri,
   'http://example.com/db2sample/proj_act/%s_%s_%s#this', 1);
  if (parts is not null)
  {
    return cast(parts[2] as date);
  }
  return NULL;
};

create function DB.DBA.EMP_PROJ_ACT_IRI (
  in emp_no varchar,
  in proj_no varchar,
  in act_no integer,
  in emp_start_date date
  ) returns varchar
{
  declare _act_no, _datetime, _date any;
  _act_no := cast(act_no as varchar);
  _datetime := cast(emp_start_date as varchar);
  _date := left(_datetime, 10);
  return sprintf(
      'http://example.com/db2sample/emp_proj_act/%s_%s_%s_%s#this',
    emp_no, proj_no, _act_no, _date);
};

create function
DB.DBA.EMP_PROJ_ACT_IRI_INV_1 (in emp_proj_act_iri varchar) returns varchar
{
  declare exit handler for sqlstate '*' { return NULL; };
  declare parts any;
  parts := sprintf_inverse (emp_proj_act_iri,
   'http://example.com/db2sample/emp_proj_act/%s_%s_%s_%s#this', 1);
  if (parts is not null)
  {
    return parts[0];
  }
  return NULL;
};

create function
DB.DBA.EMP_PROJ_ACT_IRI_INV_2 (in emp_proj_act_iri varchar) returns varchar
{
  declare exit handler for sqlstate '*' { return NULL; };
  declare parts any;
  parts := sprintf_inverse (emp_proj_act_iri,
   'http://example.com/db2sample/emp_proj_act/%s_%s_%s_%s#this', 1);
  if (parts is not null)
  {
    return parts[1];
  }
  return NULL;
};

create function
DB.DBA.EMP_PROJ_ACT_IRI_INV_3 (in emp_proj_act_iri varchar) returns integer
{
  declare exit handler for sqlstate '*' { return NULL; };
  declare parts any;
  parts := sprintf_inverse (emp_proj_act_iri,
   'http://example.com/db2sample/emp_proj_act/%s_%s_%s_%s#this', 1);
  if (parts is not null)
  {
    return cast(parts[2] as integer);
  }
  return NULL;
};

create function
DB.DBA.EMP_PROJ_ACT_IRI_INV_4 (in emp_proj_act_iri varchar) returns date
{
  declare exit handler for sqlstate '*' { return NULL; };
  declare parts any;
  parts := sprintf_inverse (emp_proj_act_iri,
   'http://example.com/db2sample/emp_proj_act/%s_%s_%s_%s#this', 1);
  if (parts is not null)
  {
    return cast(parts[3] as date);
  }
  return NULL;
};

grant execute on DB.DBA.PROJ_ACT_IRI to "SPARQL", "SPARQL_UPDATE";
grant execute on DB.DBA.PROJ_ACT_IRI_INV_1 to "SPARQL", "SPARQL_UPDATE";
grant execute on DB.DBA.PROJ_ACT_IRI_INV_2 to "SPARQL", "SPARQL_UPDATE";
grant execute on DB.DBA.PROJ_ACT_IRI_INV_3 to "SPARQL", "SPARQL_UPDATE";

grant execute on DB.DBA.EMP_PROJ_ACT_IRI to "SPARQL", "SPARQL_UPDATE";
grant execute on DB.DBA.EMP_PROJ_ACT_IRI_INV_1 to "SPARQL", "SPARQL_UPDATE";
grant execute on DB.DBA.EMP_PROJ_ACT_IRI_INV_2 to "SPARQL", "SPARQL_UPDATE";
grant execute on DB.DBA.EMP_PROJ_ACT_IRI_INV_3 to "SPARQL", "SPARQL_UPDATE";
grant execute on DB.DBA.EMP_PROJ_ACT_IRI_INV_4 to "SPARQL", "SPARQL_UPDATE";

SPARQL drop graph <http://example.com/schemas/db2sample> ;
SPARQL drop graph <http://example.com/db2sample> ;

SPARQL drop quad map virtrdf:db2sample ;

--------------------------
-- RDFS class definitions
ttlp (
'
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

@prefix opl: <http://example.com/schemas/db2sample/> .

opl:Act a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/db2sample> ;
    rdfs:label "Act" ;
    rdfs:comment "Activity" .

# ACTNO SMALLINT PRIMARY KEY
opl:act_no a rdf:Property ;
    rdfs:domain opl:Act ;
    rdfs:range xsd:integer ;
    rdfs:label "Activity number" .

# ACTKWD VARCHAR(6)
opl:act_kwd a rdf:Property ;
    rdfs:domain opl:Act ;
    rdfs:range xsd:string ;
    rdfs:label "Activity keyword" .

# ACTDESC VARCHAR(20)
opl:act_desc a rdf:Property ;
    rdfs:domain opl:Act ;
    rdfs:range xsd:string ;
    rdfs:label "Activity description" .

#####
opl:Department a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/db2sample> ;
    rdfs:label "Department" ;
    rdfs:comment "Department" .

# DEPTNO VARCHAR(3) PRIMARY KEY
opl:dept_no a rdf:Property ;
    rdfs:domain opl:Department ;
    rdfs:range xsd:string ;
    rdfs:label "Department number" .

# DEPTNAME VARCHAR(36)
opl:dept_name a rdf:Property ;
    rdfs:domain opl:Department ;
    rdfs:range xsd:string ;
    rdfs:label "Department name" .

# MGRNO CHAR(6)
opl:dept_manager a rdf:Property ;
    rdfs:domain opl:Department ;
    rdfs:range xsd:Employee ;
    rdfs:label "Department manager" .

# ADMRDEPT CHAR(3)
opl:supervising_dept a rdf:Property ;
    rdfs:domain opl:Department ;
    rdfs:range opl:Department ;
    rdfs:label "Department reported to" .

# LOCATION CHAR(6)
opl:location a rdf:Property ;
    rdfs:domain opl:Department ;
    rdfs:range xsd:string ;
    rdfs:label "Location" .

opl:employee_collection a rdf:Property ;
    rdfs:domain opl:Department ;
    rdfs:range opl:Employee ;
    rdfs:label "Department employees" .

opl:dept_project_collection a rdf:Property ;
    rdfs:domain opl:Department ;
    rdfs:range opl:Project ;
    rdfs:label "Department projects" .

#####
opl:Employee a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/db2sample> ;
    rdfs:label "Employee" ;
    rdfs:comment "Employee" .

# EMPNO VARCHAR(6) PRIMARY KEY
opl:emp_no a rdf:Property ;
    rdfs:domain opl:Employee;
    rdfs:range xsd:string ;
    rdfs:label "Employee number" .

# FIRSTNME VARCHAR(12)
opl:first_name a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range xsd:string ;
    rdfs:label "First name" .

# MIDINIT VARCHAR(1)
opl:middle_initial a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range xsd:string ;
    rdfs:label "Middle initial" .

# LASTNAME VARCHAR(15)
opl:last_name a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range xsd:string ;
    rdfs:label "Last name" .

# WORKDEPT VARCHAR(3)
opl:work_dept a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range opl:Department ;
    rdfs:label "Work department" .

# PHONENO VARCHAR(4)
opl:phone_no a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range xsd:string ;
    rdfs:label "Phone number" .

# HIREDATE DATE
opl:hire_date a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range xsd:date;
    rdfs:label "Hire date" .

# JOB VARCHAR(8)
opl:job a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range xsd:string ;
    rdfs:label "Job" .

# EDLEVEL SMALLINT
opl:education_level a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range xsd:integer ;
    rdfs:label "Education level" .

# SEX VARCHAR(1)
opl:gender a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range xsd:string ;
    rdfs:label "Gender" .

# BIRTHDATE DATE
opl:date_of_birth a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range xsd:date ;
    rdfs:label "Date of birth" .

# SALARY DECIMAL(9,2)
opl:salary a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range xsd:decimal ;
    rdfs:label "Salary" .

# BONUS DECIMAL(9,2)
opl:bonus a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range xsd:decimal ;
    rdfs:label "Bonus" .

# COMM DECIMAL(9,2)
opl:commission a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range xsd:decimal ;
    rdfs:label "Commission" .

opl:resume_collection a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range opl:EmployeeResume ;
    rdfs:label "Employee resumes" .

opl:projects_responsible_for_collection a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range opl:Project ;
    rdfs:label "responsible for project" .

opl:activity_collection a rdf:Property ;
    rdfs:domain opl:Employee ;
    rdfs:range opl:EmpProjAct ;
    rdfs:label "project activities" .

#####
opl:EmpProjAct a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/db2sample> ;
    rdfs:label "EmpProjAct" ;
    rdfs:comment "Employee project activity" .

# EMPNO VARCHAR(6) PRIMARY KEY
opl:epa_emp_no a rdf:Property ;
    rdfs:domain opl:EmpProjAct ;
    rdfs:range xsd:string ;
    rdfs:label "Employee number" .

# PROJNO VARCHAR(6) PRIMARY KEY
opl:epa_proj_no a rdf:Property ;
    rdfs:domain opl:EmpProjAct ;
    rdfs:range xsd:string ;
    rdfs:label "Project number" .

# ACTNO SMALLINT PRIMARY KEY
opl:epa_act_no a rdf:Property ;
    rdfs:domain opl:EmpProjAct ;
    rdfs:range xsd:string ;
    rdfs:label "Activity number" .

# EMSTDATE DATE PRIMARY KEY
opl:emp_start_date a rdf:Property ;
    rdfs:domain opl:EmpProjAct ;
    rdfs:range xsd:date ;
    rdfs:label "Employee activity start date" .

# EMPTIME DECIMAL(5,2)
opl:emp_time a rdf:Property ;
    rdfs:domain opl:EmpProjAct ;
    rdfs:range xsd:decimal ;
    rdfs:label "Employee time" .

# EMENDATE DATE PRIMARY KEY
opl:emp_end_date a rdf:Property ;
    rdfs:domain opl:EmpProjAct ;
    rdfs:range xsd:date ;
    rdfs:label "Employee activity end date" .

opl:assigned_to a rdf:Property ;
    rdfs:domain opl:EmpProjAct ;
    rdfs:range opl:Employee ;
    rdfs:label "Assigned to" .

opl:project_activity a rdf:Property ;
    rdfs:domain opl:EmpProjAct ;
    rdfs:range opl:ProjAct ;
    rdfs:label "Project activity" .

#####
opl:EmployeeResume a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/db2sample> ;
    rdfs:label "EmployeeResume" ;
    rdfs:comment "Employee resume" .

# EMPNO VARCHAR(6) PRIMARY KEY
opl:er_emp_no a rdf:Property ;
    rdfs:domain opl:EmployeeResume ;
    rdfs:range xsd:string ;
    rdfs:label "Employee number" .

# RESUME_FORMAT VARCHAR(10) PRIMARY KEY
opl:resume_format a rdf:Property ;
    rdfs:domain opl:EmployeeResume ;
    rdfs:range xsd:string ;
    rdfs:label "Resume format" .

# RESUME VARCHAR(5120)
opl:resume a rdf:Property ;
    rdfs:domain opl:EmployeeResume ;
    rdfs:range xsd:string ;
    rdfs:label "Resume" .

opl:resume_of a rdf:Property ;
    rdfs:domain opl:EmployeeResume ;
    rdfs:range opl:Employee ;
    rdfs:label "Resume subject" .

#####
opl:ProjAct a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/db2sample> ;
    rdfs:label "ProjAct" ;
    rdfs:comment "Project activity" .

# PROJNO VARCHAR(6) PRIMARY KEY
opl:pa_proj_no a rdf:Property ;
    rdfs:domain opl:ProjAct ;
    rdfs:range xsd:string ;
    rdfs:label "Project number" .

# ACTNO SMALLINT PRIMARY KEY
opl:pa_act_no a rdf:Property ;
    rdfs:domain opl:ProjAct ;
    rdfs:range xsd:string ;
    rdfs:label "Activity number" .

# ACSTDATE DATE PRIMARY KEY
opl:ac_st_date a rdf:Property ;
    rdfs:domain opl:ProjAct ;
    rdfs:range xsd:date ;
    rdfs:label "Activity start date" .

# ACSTAFF DECIMAL(5,2)
opl:ac_staff a rdf:Property ;
    rdfs:domain opl:ProjAct ;
    rdfs:range xsd:decimal ;
    rdfs:label "Acstaff" .

# ACENDATE DATE
opl:ac_en_date a rdf:Property ;
    rdfs:domain opl:ProjAct ;
    rdfs:range xsd:date ;
    rdfs:label "Activity end date" .

opl:project a rdf:Property ;
    rdfs:domain opl:ProjAct ;
    rdfs:range opl:Project ;
    rdfs:label "Project" .

opl:activity a rdf:Property ;
    rdfs:domain opl:ProjAct ;
    rdfs:range opl:Act ;
    rdfs:label "Activity" .

opl:employee_activity_collection a rdf:Property ;
    rdfs:domain opl:ProjAct ;
    rdfs:range opl:EmpProjAct ;
    rdfs:label "Employee activity collection" .

#####
opl:Project a rdfs:Class ;
    rdfs:isDefinedBy <http://example.com/schemas/db2sample> ;
    rdfs:label "Project" ;
    rdfs:comment "Project" .

# PROJNO VARCHAR(6) PRIMARY KEY
opl:proj_no a rdf:Property ;
    rdfs:domain opl:Project ;
    rdfs:range xsd:string ;
    rdfs:label "Project number" .

# PROJNAME VARCHAR(24)
opl:proj_name a rdf:Property ;
    rdfs:domain opl:Project ;
    rdfs:range xsd:string ;
    rdfs:label "Project name" .

# DEPTNO CHAR(3)
opl:is_project_of_department a rdf:Property ;
    rdfs:domain opl:Project ;
    rdfs:range opl:Department ;
    rdfs:label "is project of department" .

# RESPEMP VARCHAR(6)
opl:resp_emp a rdf:Property ;
    rdfs:domain opl:Project ;
    rdfs:range opl:Employee ;
    rdfs:label "Employee responsible" .

# PRSTAFF DECIMAL(5,2)
opl:pr_staff a rdf:Property ;
    rdfs:domain opl:Project ;
    rdfs:range xsd:decimal ;
    rdfs:label "PrStaff" .

# PRSTDATE DATE
opl:pr_st_date a rdf:Property ;
    rdfs:domain opl:Project ;
    rdfs:range xsd:date ;
    rdfs:label "Project start date" .

# PRENDATE DATE
opl:pr_en_date a rdf:Property ;
    rdfs:domain opl:Project ;
    rdfs:range xsd:date ;
    rdfs:label "Project end date" .

# MAJPROJ VARCHAR(6)
opl:maj_proj a rdf:Property ;
    rdfs:domain opl:Project ;
    rdfs:range xsd:string ;
    rdfs:label "MajProj" .

opl:proj_activity_collection a rdf:Property ;
    rdfs:domain opl:Project ;
    rdfs:range opl:ProjAct ;
    rdfs:label "Project activities" .

', '', 'http://example.com/schemas/db2sample', 0);

--------------------------

SPARQL
prefix opl: <http://example.com/schemas/db2sample/>

create iri class
<http://example.com/schemas/db2sample/act_iri>
    "http://example.com/db2sample/act/%d#this"
    (
     in act_no integer not null
    ) .

create iri class
<http://example.com/schemas/db2sample/department_iri>
    "http://example.com/db2sample/department/%s#this"
    (
     in dept_no varchar not null
    ) .

create iri class
<http://example.com/schemas/db2sample/employee_iri>
    "http://example.com/db2sample/employee/%s#this"
    (
     in emp_no varchar not null
    ) .

create iri class opl:emp_proj_act_iri using
    function DB.DBA.EMP_PROJ_ACT_IRI (
        in emp_no varchar,
        in proj_no varchar,
        in act_no integer,
        in emp_start_date date
        ) returns varchar,
    function DB.DBA.EMP_PROJ_ACT_IRI_INV_1 (in emp_proj_act_iri varchar)
        returns varchar ,
    function DB.DBA.EMP_PROJ_ACT_IRI_INV_2 (in emp_proj_act_iri varchar)
        returns varchar ,
    function DB.DBA.EMP_PROJ_ACT_IRI_INV_3 (in emp_proj_act_iri varchar)
        returns integer ,
    function DB.DBA.EMP_PROJ_ACT_IRI_INV_4 (in emp_proj_act_iri varchar)
        returns date
    option (bijection, returns
      "http://example.com/db2sample/emp_proj_act/%s_%s_%s_%s#this")
    .

create iri class
<http://example.com/schemas/db2sample/employee_resume_iri>
    "http://example.com/db2sample/employee_resume/%s_%s#this"
    (
     in emp_no varchar not null,
     in resume_format varchar not null
    ) .

create iri class opl:proj_act_iri using
    function DB.DBA.PROJ_ACT_IRI (
        in proj_no varchar,
        in act_no integer,
        in ac_st_date date
        ) returns varchar,
    function DB.DBA.PROJ_ACT_IRI_INV_1 (in proj_act_iri varchar)
        returns varchar ,
    function DB.DBA.PROJ_ACT_IRI_INV_2 (in proj_act_iri varchar)
        returns integer ,
    function DB.DBA.PROJ_ACT_IRI_INV_3 (in proj_act_iri varchar)
        returns date
    option (bijection, returns
        "http://example.com/db2sample/proj_act/%s_%s_%s#this")
    .

create iri class
<http://example.com/schemas/db2sample/project_iri>
    "http://example.com/db2sample/project/%s#this"
    (
     in proj_no varchar not null
    ) .
;

SPARQL
prefix opl: <http://example.com/schemas/db2sample/>

alter quad storage virtrdf:DefaultQuadStorage
from DB.db2sample.ACT as act_tbl
from DB.db2sample.DEPARTMENT as dept_tbl
from DB.db2sample.EMPLOYEE as emp_tbl
from DB.db2sample.EMPPROJACT as emp_proj_act_tbl
from DB.db2sample.EMP_RESUME as emp_resume_tbl
from DB.db2sample.PROJACT as proj_act_tbl
from DB.db2sample.PROJECT as project_tbl
{
    create virtrdf:db2sample as
        graph <http://example.com/db2sample>
    {
    opl:act_iri(act_tbl.ACTNO) a opl:Act
        as virtrdf:act_id ;
    opl:act_no act_tbl.ACTNO
        as virtrdf:act_act_no ;
    opl:act_kwd act_tbl.ACTKWD
        as virtrdf:act_act_kwd ;
    opl:act_desc act_tbl.ACTDESC
        as virtrdf:act_act_desc .

    opl:department_iri(dept_tbl.DEPTNO) a opl:Department
        as virtrdf:dept_id ;
    opl:dept_no dept_tbl.DEPTNO
        as virtrdf:dept_dept_no ;
    opl:dept_name dept_tbl.DEPTNAME
        as virtrdf:dept_dept_name ;
    opl:dept_manager opl:employee_iri(dept_tbl.MGRNO)
        as virtrdf:dept_mgr_no ;
    opl:supervising_dept opl:department_iri(dept_tbl.ADMRDEPT)
        as virtrdf:dept_supervising_dept ;
    opl:location dept_tbl.LOCATION
        as virtrdf:dept_location ;
    opl:employee_collection opl:employee_iri(emp_tbl.EMPNO)
        where (^{emp_tbl.}^.WORKDEPT = ^{dept_tbl.}^.DEPTNO)
        as virtrdf:dept_employee_collection ;
    opl:dept_project_collection opl:project_iri(project_tbl.PROJNO)
        where (^{project_tbl.}^.DEPTNO = ^{dept_tbl.}^.DEPTNO)
        as virtrdf:dept_project_collection .

    opl:employee_iri(emp_tbl.EMPNO) a opl:Employee
        as virtrdf:employee_id ;
    opl:emp_no emp_tbl.EMPNO
        as virtrdf:employee_emp_no ;
    opl:first_name emp_tbl.FIRSTNME
        as virtrdf:employee_first_name ;
    opl:middle_initial emp_tbl.MIDINIT
        as virtrdf:employee_middle_initial ;
    opl:last_name emp_tbl.LASTNAME
        as virtrdf:employee_last_name ;
    opl:work_dept opl:department_iri(emp_tbl.WORKDEPT)
        as virtrdf:employee_work_dept ;
    opl:phone_no emp_tbl.PHONENO
        as virtrdf:employee_phone_no ;
    opl:hire_date emp_tbl.HIREDATE
        as virtrdf:employee_hire_date ;
    opl:job emp_tbl.JOB
        as virtrdf:employee_job ;
    opl:education_level emp_tbl.EDLEVEL
        as virtrdf:employee_education_level ;
    opl:gender emp_tbl.SEX
        as virtrdf:employee_gender ;
    opl:date_of_birth emp_tbl.BIRTHDATE
        as virtrdf:employee_date_of_birth ;
    opl:salary emp_tbl.SALARY
        as virtrdf:employee_salary ;
    opl:bonus emp_tbl.BONUS
        as virtrdf:employee_bonus ;
    opl:commission emp_tbl.COMM
        as virtrdf:employee_commission ;
    opl:resume_collection opl:employee_resume_iri(
        emp_resume_tbl.EMPNO,
        emp_resume_tbl.RESUME_FORMAT
        )
        where (^{emp_tbl.}^.EMPNO = ^{emp_resume_tbl.}^.EMPNO)
        as virtrdf:employee_resume_collection ;
    opl:projects_responsible_for_collection
        opl:project_iri(project_tbl.PROJNO)
        where (^{project_tbl.}^.RESPEMP = ^{emp_tbl.}^.EMPNO)
        as virtrdf:employee_projects_responsible_for_collection ;
    opl:activity_collection opl:emp_proj_act_iri(
        emp_proj_act_tbl.EMPNO,
        emp_proj_act_tbl.PROJNO,
        emp_proj_act_tbl.ACTNO,
        emp_proj_act_tbl.EMSTDATE
        )
        where (^{emp_tbl.}^.EMPNO = ^{emp_proj_act_tbl.}^.EMPNO)
        as virtrdf:employee_activity_collection .

    opl:emp_proj_act_iri(
        emp_proj_act_tbl.EMPNO,
        emp_proj_act_tbl.PROJNO,
        emp_proj_act_tbl.ACTNO,
        emp_proj_act_tbl.EMSTDATE
        ) a opl:EmpProjAct
        as virtrdf:empprojact_id ;
    opl:epa_emp_no emp_proj_act_tbl.EMPNO
        as virtrdf:empprojact_emp_no ;
    opl:epa_proj_no emp_proj_act_tbl.PROJNO
        as virtrdf:empprojact_proj_no ;
    opl:epa_act_no emp_proj_act_tbl.ACTNO
        as virtrdf:empprojact_act_no ;
    opl:emp_start_date emp_proj_act_tbl.EMSTDATE
        as virtrdf:empprojact_emp_start_date ;
    opl:emp_time emp_proj_act_tbl.EMPTIME
        as virtrdf:empprojact_emp_time ;
    opl:emp_end_date emp_proj_act_tbl.EMENDATE
        as virtrdf:empprojact_emp_end_date ;
    opl:assigned_to opl:employee_iri(emp_proj_act_tbl.EMPNO)
        as virtrdf:empprojact_assigned_to ;
    opl:project_activity opl:proj_act_iri(
        emp_proj_act_tbl.PROJNO,
        emp_proj_act_tbl.ACTNO,
        emp_proj_act_tbl.EMSTDATE
        )
        as virtrdf:empprojact_project_activity .

    opl:employee_resume_iri(
        emp_resume_tbl.EMPNO,
        emp_resume_tbl.RESUME_FORMAT
        ) a opl:EmployeeResume
        as virtrdf:employee_resume_id ;
    opl:er_emp_no emp_resume_tbl.EMPNO
        as virtrdf:employee_resume_emp_no ;
    opl:resume_format emp_resume_tbl.RESUME_FORMAT
        as virtrdf:employee_resume_resume_format ;
    opl:resume emp_resume_tbl.RESUME
        as virtrdf:employee_resume_resume ;
    opl:resume_of opl:employee_iri(emp_resume_tbl.EMPNO)
        as virtrdf:employee_resume_resume_of .

    opl:proj_act_iri(
        proj_act_tbl.PROJNO,
        proj_act_tbl.ACTNO,
        proj_act_tbl.ACSTDATE
        ) a opl:ProjAct
        as virtrdf:projact_id;
    opl:pa_proj_no proj_act_tbl.PROJNO
        as virtrdf:projact_proj_no ;
    opl:pa_act_no proj_act_tbl.ACTNO
        as virtrdf:projact_act_no ;
    opl:ac_st_date proj_act_tbl.ACSTDATE
        as virtrdf:projact_ac_st_date ;
    opl:ac_staff proj_act_tbl.ACSTAFF
        as virtrdf:projact_ac_staff ;
    opl:ac_en_date proj_act_tbl.ACENDATE
        as virtrdf:projact_ac_en_date ;
    opl:project opl:project_iri(proj_act_tbl.PROJNO)
        as virtrdf:projact_project ;
    opl:activity opl:act_iri(proj_act_tbl.ACTNO)
        as virtrdf:projact_activity ;
    opl:employee_activity_collection opl:emp_proj_act_iri(
        emp_proj_act_tbl.EMPNO,
        emp_proj_act_tbl.PROJNO,
        emp_proj_act_tbl.ACTNO,
        emp_proj_act_tbl.EMSTDATE
        )
        where (
        ^{proj_act_tbl.}^.PROJNO = ^{emp_proj_act_tbl.}^.PROJNO AND
            ^{proj_act_tbl.}^.ACTNO = ^{emp_proj_act_tbl.}^.ACTNO AND
            ^{proj_act_tbl.}^.ACSTDATE = ^{emp_proj_act_tbl.}^.EMSTDATE
            )
        as virtrdf:project_employee_activity_collection .

    opl:project_iri(project_tbl.PROJNO) a opl:Project
        as virtrdf:project_id ;
    opl:proj_no project_tbl.PROJNO
        as virtrdf:project_proj_no ;
    opl:proj_name project_tbl.PROJNAME
        as virtrdf:project_proj_name ;
    opl:is_project_of_department opl:department_iri(project_tbl.DEPTNO)
        as virtrdf:project_is_project_of_department ;
    opl:resp_emp opl:employee_iri(project_tbl.RESPEMP)
        as virtrdf:project_resp_emp ;
    opl:pr_staff project_tbl.PRSTAFF
        as virtrdf:project_pr_staff ;
    opl:pr_st_date project_tbl.PRSTDATE
        as virtrdf:project_pr_st_date ;
    opl:pr_en_date project_tbl.PRENDATE
        as virtrdf:project_pr_en_date ;
    opl:maj_proj project_tbl.MAJPROJ
        as virtrdf:project_maj_proj ;
    opl:proj_activity_collection opl:proj_act_iri(
        proj_act_tbl.PROJNO,
        proj_act_tbl.ACTNO,
        proj_act_tbl.ACSTDATE
        )
        where (^{project_tbl.}^.PROJNO = ^{proj_act_tbl.}^.PROJNO)
        as virtrdf:project_activity_collection .
    } .
} .
;

delete from db.dba.url_rewrite_rule_list where urrl_list like 'db2sample_rule%';
delete from db.dba.url_rewrite_rule where urr_rule like 'db2sample_rule%';

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'db2sample_rule1',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/about/html/http/example.com%s',
    vector('path'),
    null,
    '(text/html)|(\\*/\\*)',
    0,
    303
    );

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'db2sample_rule2',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/sparql?query=DESCRIBE+%%3Chttp%%3A//localhost%%3A8890%U%%23this%%3E+%%3Chttp%%3A//localhost%%3A8890%U%%23this%%3E+FROM+%%3Chttp%%3A//localhost%%3A8890/db2sample%%3E&format=%U',

    vector('path','path','*accept*'),
    null,
    '(text/rdf.n3)|(application/rdf.xml)',
    0,
    null
    );

DB.DBA.URLREWRITE_CREATE_RULELIST (
    'db2sample_rule_list1',
    1,
    vector (
        'db2sample_rule1',
        'db2sample_rule2'
      ));

-- ensure a VD for the IRIs which begins with /
VHOST_REMOVE (lpath=>'/db2sample');

VHOST_DEFINE (
    lpath=>'/db2sample',
    ppath=>'/DAV/db2sample/',
    vsp_user=>'dba',
        is_dav=>1,
    is_brws=>0,
    opts=>vector ('url_rewrite', 'db2sample_rule_list1')
    );
delete from db.dba.url_rewrite_rule_list where urrl_list like 'db2sample_schema_rule%';
delete from db.dba.url_rewrite_rule where urr_rule like 'db2sample_schema_rule%';

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'db2sample_schema_rule1',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/about/html/http/example.com%U',
    vector('path'),
    null,
    '(text/html)|(\\*/\\*)',
    0,
    303
    );

DB.DBA.URLREWRITE_CREATE_REGEX_RULE (
    'db2sample_schema_rule2',
    1,
    '(/[^#]*)',
    vector('path'),
    1,
    '/sparql?query=CONSTRUCT+{+%%3Chttp%%3A//localhost%%3A8890%U%%3E+%%3Fp+%%3Fo+}%%0D%%0AFROM+%%3Chttp%%3A//localhost%%3A8890/schemas/db2sample%%3E+%%0D%%0AWHERE+{+%%3Chttp%%3A//localhost%%3A8890%U%%3E+%%3Fp+%%3Fo+}&format=%U',
    vector('path','path','*accept*'),
    null,
    '(text/rdf.n3)|(application/rdf.xml)',
    0,
    null
    );

DB.DBA.URLREWRITE_CREATE_RULELIST (
    'db2sample_schema_rule_list1',
    1,
    vector (
        'db2sample_schema_rule1',
        'db2sample_schema_rule2'
      ));

-- ensure a VD for the IRIs which begins with /
VHOST_REMOVE (lpath=>'/schemas/db2sample');

VHOST_DEFINE (
    lpath=>'/schemas/db2sample',
    ppath=>'/DAV/schemas_db2sample/',
    vsp_user=>'dba',
        is_dav=>1,
    is_brws=>0,
    opts=>vector ('url_rewrite', 'db2sample_schema_rule_list1')
    );
```

</div>
