<div>

<div>

<div>

<div>

### 23.6.2. System Tables

</div>

</div>

</div>

DB objects related to the User and Role objects are created as follows.
The terms group and role are used interchangeably.

``` programlisting
create table
  SYS_USERS (
    U_ID        integer unique,   -- unique id identifying the security object
    U_NAME      char (128),   -- unique name identifying the security object
    U_IS_ROLE       integer     default 0, -- if true it's a group
    U_FULL_NAME     char (128), -- for information only, name of that user or group
    U_E_MAIL        char (128)  default '', -- e-mail for contact
    U_PASSWORD      char (128),     -- encrypted password
    U_GROUP         integer,    /* the primary group references SYS_USERS (U_ID), */
    U_LOGIN_TIME    datetime,       -- last login time, can be set in login hooks,
        -- otherwise is set when login in webDAV repository
    U_ACCOUNT_DISABLED integer  default 1, -- if true the account is not functional
    U_DAV_ENABLE    integer     default 0, -- true if DAV login allowed
    U_SQL_ENABLE    integer     default 1, -- true if  SQL/(ODBC/JDBC/OLE/DB etc)  login allowed.
    U_DATA      varchar,    /* reserved */
    U_METHODS       integer,        /* reserved */
    U_DEF_PERMS     char (10)   default '110100000R', -- see PERMISSIONS option value
    U_HOME      varchar (128),  -- see HOME option value
    U_PASSWORD_HOOK     varchar,    -- see PASSWORD_MODE option value
    U_PASSWORD_HOOK_DATA varchar,   -- see PASSWORD_MODE_DATA option value
    U_GET_PASSWORD  varchar,    -- see GET_PASSWORD option data
    U_DEF_QUAL      varchar,        -- default qualifier for SQL/ODBC login
    U_OPTS      long varchar,   -- extensibility options for user&group objects
    primary key (U_NAME)
 )
```

``` programlisting
create table
SYS_ROLE_GRANTS (
   GI_SUPER     integer references SYS_USERS (U_ID), -- user object id
     GI_SUB     integer references SYS_USERS (U_ID), -- granted role object id
     GI_DIRECT      integer default 1,      -- false if indirect, i.e.
         -- true by inheritance, not direct grant.
     GI_GRANT       integer,                -- who has granted this role
     GI_ADMIN       integer default 0,           -- true if granted with admin option
     primary key (GI_SUPER, GI_SUB, GI_DIRECT));
```

For Backwards compatibility the system tables SYS_DAV_USER,
SYS_DAV_GROUP, SYS_DAV_USER_GROUP and SYS_USER_GROUP are re-defined as
views:

``` programlisting
-- WebDAV Users
create view WS.WS.SYS_DAV_USER (U_ID, U_NAME, U_FULL_NAME, U_E_MAIL, U_PWD,
    U_GROUP, U_LOGIN_TIME, U_ACCOUNT_DISABLED, U_METHODS, U_DEF_PERMS, U_HOME)
  as select U_ID, U_NAME, U_FULL_NAME, U_E_MAIL, U_PASSWORD as U_PWD,
    U_GROUP, U_LOGIN_TIME, U_ACCOUNT_DISABLED, U_METHODS, U_DEF_PERMS, U_HOME
    from DB.DBA.SYS_USERS where U_IS_ROLE = 0 and U_DAV_ENABLE = 1;

-- WebDAV Groups
create view WS.WS.SYS_DAV_GROUP (G_ID, G_NAME)
    as select U_ID as G_ID, U_NAME as G_NAME
        from DB.DBA.SYS_USERS where U_IS_ROLE = 1 and U_DAV_ENABLE = 1;

-- The granted groups to the WebDAV user
create view WS.WS.SYS_DAV_USER_GROUP (UG_UID, UG_GID) as select GI_SUPER, GI_SUB from DB.DBA.SYS_ROLE_GRANTS
       where GI_DIRECT = 1;

create view SYS_USER_GROUP (UG_UID, UG_GID) as select GI_SUPER, GI_SUB
   from SYS_ROLE_GRANTS where GI_DIRECT = 1;
```

``` programlisting
    create table SYS_GRANTS  (
        G_USER      varchar,
        G_OP        integer,
        G_OBJECT    varchar,
        G_COL       varchar,
        primary key (G_USER, G_OP, G_OBJECT, G_COL));
```

These tables are visible only to dba members. The procedure list_grants
shows a summary of granted privileges:

``` screen
SQL> list_grants (0);
```

These tables should not be modified by applications. Only the SQL
statements GRANT, REVOKE, CREATE USER, DELETE USER, SET USER GROUP and
SET PASSWORD should be used to maintain user and security information.
Security information is cached in RAM during the execution of a Virtuoso
process and these statements ensure that the cache stays consistent with
the tables.

</div>
