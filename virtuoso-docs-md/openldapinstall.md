<div id="openldapinstall" class="section">

<div class="titlepage">

<div>

<div>

### 19.9.2. LDAP Server

</div>

</div>

</div>

Virtuoso is not an LDAP server but can easily provide a data back-end to
one, such as OpenLDAP. This section explains how to incorporate OpenLDAP
with Virtuoso on the Linux platform. For other platforms the
installation of OpenLDAP and configuration of the ODBC data source may
differ.

<div class="orderedlist">

1.  download the OpenLDAP distribution from
    <a href="http://www.openldap.org" class="ulink"
    target="_top">OpenLDAP.org</a> .

2.  Build OpenLDAP with the --enable-sql option.

3.  You may need the iODBC library installed, which can be obtained from
    <a href="http://www.iodbc.org" class="ulink" target="_top">iODBC.org</a>
    .

4.  install the LDAP server using: make install

5.  copy the following text into the slapd.conf

    ``` programlisting
    >>>>
    include         /usr/local/etc/openldap/schema/core.schema

    pidfile         /usr/local/var/slapd.pid
    argsfile        /usr/local/var/slapd.args

    database        sql
    suffix          "c=BG"
    rootdn          "cn=root,o=opl,c=US"
    rootpw          secret
    dbname          1111
    dbuser          dba
    dbpasswd        dba
    subtree_cond    "UPPER(ldap_entries.dn) LIKE CONCAT('%',UPPER(?))"
    upper_func      UPPER

    access to attr=userPassword
      by self write
      by anonymous auth
      by dn="cn=root,o=opl,c=BG" write
      by * none

    access to *
      by self write
      by anonymous auth
      by * read
    <<<<
    ```

6.  Configure the ODBC data source named '1111' for your running
    Virtuoso server.

7.  Apply the virt_back.sql script against a running virtuoso server,
    for example with isql.

8.  If you can also apply the virt_testdb.sql to insert some demo schema
    and entries into the DB.

9.  Export ODBCINI variable: export ODBCINI=\<location of your
    odbc.ini\>.

10. Start the slapd executable with debug option: 'slapd -d5' to ensure
    that all settings are correct.

</div>

<div id="virtbacksql" class="section">

<div class="titlepage">

<div>

<div>

#### The virt_back.sql Script

</div>

</div>

</div>

``` programlisting
create table ldap_oc_mappings (
    id      integer identity primary key,
    name        varchar (64) not null,
    keytbl      varchar (64) not null,
    keycol      varchar (64) not null,
    create_proc     varchar (255),
    delete_proc     varchar (255),
    expect_return   integer not null
);

create unique index ldap_oc_mappings_name on ldap_oc_mappings (name);

create table ldap_attr_mappings (
    id      integer identity primary key,
    oc_map_id   integer not null references ldap_oc_mappings(id),
    name        varchar (255) not null,
    sel_expr    varchar (255) not null,
    from_tbls   varchar (255) not null,
    join_where  varchar (255),
    add_proc    varchar (255),
    modify_proc     varchar (255),
    delete_proc     varchar (255),
    param_order     integer not null,
    expect_return   integer not null
);

create table ldap_entries (
    id      integer identity primary key,
    dn      varchar (255) not null ,
    oc_map_id   integer not null references ldap_oc_mappings(id),
    parent      integer not null ,
    keyval      integer not null
);

create unique index ldap_entries_oc_map_id_keyval on ldap_entries (oc_map_id, keyval);

create unique index ldap_entries_dn on ldap_entries (dn);

create table ldap_referrals
(
    entry_id    integer not null references ldap_entries(id),
    url         varchar not null
);

create index entry_idx on ldap_referrals(entry_id);

create table ldap_entry_objclasses
(
    entry_id    integer not null references ldap_entries(id),
    oc_name     varchar(64)
);

create index entry_idx_entry_id on ldap_entry_objclasses(entry_id);
```

</div>

<div id="virttestdbsql" class="section">

<div class="titlepage">

<div>

<div>

#### The virt_testdb.sql Script

</div>

</div>

</div>

``` programlisting
create table authors_docs (
    pers_id integer not null ,
    doc_id integer not null,
    primary key  (pers_id, doc_id)
);

create table documents (
    id integer identity not null ,
    abstract varchar (255) null ,
    title varchar (255) null ,
    body binary (255) null,
    primary key  (id)
);

create table institutes (
    id integer identity  not null ,
    name varchar (255) not null,
    primary key  (id)
);

create table persons (
    id integer identity  not null ,
    name varchar (255) null,
    sname varchar (255) null,
    email varchar (255) null,
    passw varchar (255) null,
    primary key  (id)

);

create table phones (
    id integer identity  not null ,
    phone varchar (255) not null ,
    pers_id integer not null,
    primary key  (id)

);

insert into institutes (id,name) values (1,'');
insert into institutes (id,name) values (2,'opl');

insert into persons (id,name,sname,email,passw)
  values (1,'Mitko Iliev', 'Iliev', 'imitko@openlinksw.com', 'abc');
insert into persons (id,name,sname,email,passw)
  values (2,'George Kodinov', 'Kodinov', 'gkodinov@openlinksw.com', 'cde');
insert into persons (id,name,sname,email,passw)
  values (3,'Zdravko Tashev', 'Tashev', 'ztashev@openlinksw.com', 'efg');

insert into phones (id,phone,pers_id) values (1,'032-947020',1);
insert into phones (id,phone,pers_id) values (2,'032-633710',1);
insert into phones (id,phone,pers_id) values (3,'032-947020',2);

insert into documents (id,abstract,title) values (1,'abstract1','book1');
insert into documents (id,abstract,title) values (2,'abstract2','book2');

insert into authors_docs (pers_id,doc_id) values (1,1);
insert into authors_docs (pers_id,doc_id) values (1,2);
insert into authors_docs (pers_id,doc_id) values (2,1);

-- LDAP mappings
insert into ldap_oc_mappings (id,name,keytbl,keycol,create_proc,delete_proc,expect_return)
  values (1,'inetorgperson','persons','id','{call create_person(?)}','{call delete_person(?)}',0);

insert into ldap_oc_mappings (id,name,keytbl,keycol,create_proc,delete_proc,expect_return)
  values (2,'document','documents','id','{call create_document(?)}','{call delete_document(?)}',0);

insert into ldap_oc_mappings (id,name,keytbl,keycol,create_proc,delete_proc,expect_return)
  values (3,'organization','institutes','id','{call create_org(?)}','{call delete_org(?)}',0);

insert into ldap_attr_mappings
    (id, oc_map_id, name, sel_expr, from_tbls, join_where, add_proc,
        modify_proc, delete_proc, param_order, expect_return)
  values (1,1,'cn','persons.name','persons',NULL,'{call set_person_name(?,?)}', NULL,NULL,0,0);

insert into ldap_attr_mappings
    (id, oc_map_id, name, sel_expr, from_tbls, join_where, add_proc,
    modify_proc, delete_proc, param_order, expect_return)
  values (2,1,'telephoneNumber','phones.phone','persons,phones', 'phones.pers_id=persons.id',
      '{call add_phone(?,?)}', NULL,'{call delete_phone(?,?)}',0,0);

insert into ldap_attr_mappings
    (id,oc_map_id,name,sel_expr,from_tbls,join_where,add_proc,modify_proc,
    delete_proc,param_order,expect_return)
  values (3,1,'sn','persons.sname','persons',NULL,
      '{call set_person_sname(?,?)}', NULL,NULL,0,0);

insert into ldap_attr_mappings
    (id,oc_map_id,name,sel_expr,from_tbls,join_where,add_proc,modify_proc,
    delete_proc,param_order,expect_return)
  values (10,1,'mail','persons.email','persons',NULL,
      '{call set_email(?,?)}', NULL,NULL,0,0);

insert into ldap_attr_mappings
    (id,oc_map_id,name,sel_expr,from_tbls,join_where,add_proc,modify_proc,
    delete_proc,param_order,expect_return)
  values (10,1,'userPassword','persons.passw','persons',NULL,
      '{call set_pwd (?,?)}', NULL,NULL,0,0);

insert into ldap_attr_mappings
    (id,oc_map_id,name,sel_expr,from_tbls,join_where,add_proc,modify_proc,
    delete_proc,param_order,expect_return)
  values (4,2,'description','documents.abstract','documents',NULL,
      '{call set_doc_abstract(?,?)}', NULL,NULL,0,0);

insert into ldap_attr_mappings
    (id,oc_map_id,name,sel_expr,from_tbls,join_where,add_proc,modify_proc,
    delete_proc,param_order,expect_return)
  values (5,2,'documentTitle','documents.title','documents',NULL,
      '{call set_doc_title(?,?)}', NULL,NULL,0,0);

insert into ldap_attr_mappings
    (id,oc_map_id,name,sel_expr,from_tbls,join_where,add_proc,modify_proc,
    delete_proc,param_order,expect_return)
  values (7,3,'o','institutes.name','institutes',NULL,
      '{call set_org_name(?,?)}', NULL,NULL,0,0);

insert into ldap_attr_mappings
    (id,oc_map_id,name,sel_expr,from_tbls,join_where,add_proc,modify_proc,
    delete_proc,param_order,expect_return)
  values (8,1,'documentDN','ldap_entries.dn','ldap_entries,documents,authors_docs,persons',
      'ldap_entries.keyval=documents.id AND ldap_entries.oc_map_id=2 AND
        authors_docs.doc_id=documents.id AND authors_docs.pers_id=persons.id',
        '{call make_doc_link(?,?)}',NULL,'{call del_doc_link(?,?)}',0,0);

insert into ldap_attr_mappings
    (id,oc_map_id,name,sel_expr,from_tbls,join_where,add_proc,modify_proc,
    delete_proc,param_order,expect_return)
  values (9,2,'documentAuthor','ldap_entries.dn','ldap_entries,documents,
      authors_docs,persons','ldap_entries.keyval=persons.id AND ldap_entries.oc_map_id=1
        AND authors_docs.doc_id=documents.id AND authors_docs.pers_id=persons.id',
        '{call make_author_link(?,?)}',NULL,'{call del_author_link(?,?)}',0,0);

-- entries
insert into ldap_entries (id,dn,oc_map_id,parent,keyval)
values (1,'c=US',3,0,1);

insert into ldap_entries (id,dn,oc_map_id,parent,keyval)
values (2,'o=opl,c=US',3,1,2);

insert into ldap_entries (id,dn,oc_map_id,parent,keyval)
values (3,'cn=Mitko Iliev,o=opl,c=US',1,2,1);

insert into ldap_entries (id,dn,oc_map_id,parent,keyval)
values (4,'cn=George Kodinov,o=opl,c=US',1,2,2);

insert into ldap_entries (id,dn,oc_map_id,parent,keyval)
values (5,'cn=Zdravko Tashev,o=opl,c=US',1,2,3);

insert into ldap_entries (id,dn,oc_map_id,parent,keyval)
values (6,'documentTitle=book1,o=opl,c=US',2,2,1);

insert into ldap_entries (id,dn,oc_map_id,parent,keyval)
values (7,'documentTitle=book2,o=opl,c=US',2,2,2);

-- testDB support procedures

CREATE PROCEDURE add_phone (in _pers_id int, in _phone varchar(255))
{
  INSERT INTO phones (pers_id,phone) VALUES (_pers_id,_phone);
};

CREATE PROCEDURE create_person (inout _keyval integer)
{
  INSERT INTO persons (name) VALUES ('');
  _keyval := (SELECT MAX(id) FROM persons);
};

CREATE PROCEDURE delete_person (in _keyval integer)
{
  DELETE FROM phones WHERE pers_id=_keyval;
  DELETE FROM authors_docs WHERE pers_id=_keyval;
  DELETE FROM persons WHERE id=_keyval;
};

CREATE PROCEDURE create_org (out _keyval integer)
{
  INSERT INTO institutes (name) VALUES ('');
  _keyval:=(SELECT MAX(id) FROM institutes);
};

CREATE PROCEDURE create_document (out _keyval integer)
{
  INSERT INTO documents (title) VALUES ('');
  _keyval:=(SELECT MAX(id) FROM documents);
};

CREATE PROCEDURE delete_org (in _keyval integer)
{
  DELETE FROM institutes WHERE id=_keyval;
};

CREATE PROCEDURE delete_document (in _keyval integer)
{
  DELETE FROM authors_docs WHERE doc_id=_keyval;
  DELETE FROM documents WHERE id=_keyval;
};

CREATE PROCEDURE delete_phone (in _keyval integer, in _phone varchar(64) )
{
  DELETE FROM phones WHERE pers_id=_keyval AND phone=_phone;
};

CREATE PROCEDURE set_person_name (in _keyval integer, in _new_name varchar(255))
{
  UPDATE persons SET name=_new_name WHERE id=_keyval;
};

CREATE PROCEDURE set_person_sname (in _keyval integer, in _new_name varchar(255))
{
  UPDATE persons SET sname=_new_name WHERE id=_keyval;
};

CREATE PROCEDURE set_email (in _keyval integer, in _mail varchar(255))
{
  UPDATE persons SET email=_mail WHERE id=_keyval;
};

CREATE PROCEDURE set_pwd (in _keyval integer, in _mail varchar(255))
{
  UPDATE persons SET passw=_mail WHERE id=_keyval;
};

CREATE PROCEDURE set_org_name (in _keyval integer, in _new_name varchar(255))
{
  UPDATE institutes SET name=_new_name WHERE id=_keyval;
};

CREATE PROCEDURE set_doc_title ( in _keyval integer, in _new_title varchar(255)  )
{
  UPDATE documents SET title=_new_title WHERE id=_keyval;
};

CREATE PROCEDURE set_doc_abstract (in _keyval integer, in _new_abstract varchar(255)  )
{
  UPDATE documents SET abstract=_new_abstract WHERE id=_keyval;
};

CREATE PROCEDURE make_author_link (in _keyval integer, in _author_dn varchar(255)  )
{
  DECLARE _per_id integer;
  _per_id := (SELECT keyval FROM ldap_entries
      WHERE oc_map_id=1 AND dn=_author_dn);
  IF (_per_id IS NOT NULL)
      INSERT INTO authors_docs (doc_id,pers_id) VALUES (_keyval,_per_id);
};

CREATE PROCEDURE make_doc_link (in _keyval integer, in _doc_dn varchar(255)  )
{
  DECLARE _doc_id integer;
  _doc_id := (SELECT keyval FROM ldap_entries
      WHERE oc_map_id=2 AND dn=_doc_dn);
  IF (_doc_id IS NOT NULL)
      INSERT INTO authors_docs (pers_id,doc_id) VALUES (_keyval,_doc_id);
};

CREATE PROCEDURE del_doc_link (in _keyval integer, in _doc_dn varchar(255)  )
{
  DECLARE _doc_id integer;
_doc_id := (SELECT keyval FROM ldap_entries
      WHERE oc_map_id=2 AND dn=_doc_dn);
  IF (_doc_id IS  NOT NULL)
      DELETE FROM authors_docs WHERE pers_id=_keyval AND doc_id=_doc_id;
};

CREATE PROCEDURE del_author_link (in _keyval integer, in _author_dn varchar(255)  )
{
  DECLARE _per_id integer;
  _per_id := (SELECT keyval FROM ldap_entries
      WHERE oc_map_id=1 AND dn=_author_dn);
  IF (_per_id IS NOT NULL)
      DELETE FROM authors_docs WHERE doc_id=_keyval AND pers_id=_per_id;
};
```

</div>

</div>
