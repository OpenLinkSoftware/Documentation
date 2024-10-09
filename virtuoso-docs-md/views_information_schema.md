<div>

<div>

<div>

<div>

### 23.6.14. INFORMATION_SCHEMA views

</div>

</div>

</div>

The INFORMATION_SCHEMA views are described in the SQL200n standard.
These views are defined in every qualifier and describe the objects in
that qualifier.

<div>

<div>

<div>

<div>

#### TABLES

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.TABLES
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        TABLE_TYPE                      VARCHAR(128),
        V_KEY_TABLE                     VARCHAR,
        V_KEY_NAME                      VARCHAR,
        V_KEY_ID                        INTEGER,
        V_KEY_N_SIGNIFICANT             SMALLINT,
        V_KEY_CLUSTER_ON_ID             SMALLINT,
        V_KEY_IS_MAIN                   SMALLINT,
        V_KEY_IS_OBJECT_ID              SMALLINT,
        V_KEY_IS_UNIQUE                 SMALLINT,
        V_KEY_MIGRATE_TO                INTEGER,
        V_KEY_SUPER_ID                  INTEGER,
        V_KEY_DECL_PARTS                SMALLINT,
        V_KEY_STORAGE                   VARCHAR,
        V_KEY_OPTIONS                   ANY
    
```

</div>

<div>

<div>

<div>

<div>

#### COLUMNS

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.COLUMNS
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        COLUMN_NAME                     VARCHAR(128),
        ORDINAL_POSITION                INTEGER,
        COLUMN_DEF                      VARCHAR,
        NULLABLE                        VARCHAR (3),
        DATA_TYPE                       VARCHAR(128),
        CHARACTER_MAXIMUM_LENGTH        INTEGER,
        CHARACTER_OCTET_LENGTH          INTEGER,
        NUMERIC_PRECISION               SMALLINT,
        NUMERIC_PRECISION_RADIX         SMALLINT,
        NUMERIC_SCALE                   SMALLINT,
        DOMAIN_CATALOG                  VARCHAR(128),
        DOMAIN_SCHEMA                   VARCHAR(128),
        DOMAIN_NAME                     VARCHAR(128),
        IS_IDENTITY                     VARCHAR(3),
        IDENTITY_GENERATION             VARCHAR(10),
        IDENTITY_START                  VARCHAR,
        IDENTITY_INCREMENT              VARCHAR,
        V_TABLE                         VARCHAR,
        V_COLUMN                        VARCHAR,
        V_COL_ID                        INTEGER,
        V_COL_DTP                       SMALLINT,
        V_COL_PREC                      INTEGER,
        V_COL_SCALE                     SMALLINT,
        V_COL_DEFAULT                   VARCHAR,
        V_COL_CHECK                     VARCHAR,
        V_COL_NULLABLE                  SMALLINT,
        V_COL_NTH                       SMALLINT,
        V_COL_OPTIONS                   ANY,
        V_KP_NTH                        SMALLINT
        
```

</div>

<div>

<div>

<div>

<div>

#### SCHEMATA

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.SCHEMATA
        CATALOG_NAME                    VARCHAR(128),
        SCHEMA_NAME                     VARCHAR(128),
        SCHEMA_OWNER                    VARCHAR(128)
        
```

</div>

<div>

<div>

<div>

<div>

#### CHECK_CONSTRAINTS

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.CHECK_CONSTRAINTS
        CONSTRAINT_CATALOG              VARCHAR(128),
        CONSTRAINT_SCHEMA               VARCHAR(128),
        CONSTRAINT_NAME                 VARCHAR(128),
        CHECK_CLAUSE                    VARCHAR,
        V_C_TABLE                       VARCHAR(128),
        V_C_ID                          INTEGER,
        V_C_TEXT                        VARCHAR(4000),
        V_C_MODE                        LONG VARCHAR
        
```

</div>

<div>

<div>

<div>

<div>

#### CHECK_CONSTRAINTS

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.CHECK_CONSTRAINTS
        CONSTRAINT_CATALOG              VARCHAR(128),
        CONSTRAINT_SCHEMA               VARCHAR(128),
        CONSTRAINT_NAME                 VARCHAR(128),
        CHECK_CLAUSE                    VARCHAR,
        V_C_TABLE                       VARCHAR(128),
        V_C_ID                          INTEGER,
        V_C_TEXT                        VARCHAR(4000),
        V_C_MODE                        LONG VARCHAR
        
```

</div>

<div>

<div>

<div>

<div>

#### COLUMN_DOMAIN_USAGE

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.COLUMN_DOMAIN_USAGE
        DOMAIN_CATALOG                  VARCHAR(128),
        DOMAIN_SCHEMA                   VARCHAR(128),
        DOMAIN_NAME                     VARCHAR(128),
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        COLUMN_NAME                     VARCHAR(128)
        
```

</div>

<div>

<div>

<div>

<div>

#### COLUMN_PRIVILEGES

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.COLUMN_PRIVILEGES
        GRANTOR                         VARCHAR(128),
        GRANTEE                         VARCHAR(128),
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        COLUMN_NAME                     VARCHAR(128),
        PRIVILEGE_TYPE                  VARCHAR(10),
        IS_GRANTABLE                    VARCHAR (3),
        V_G_USER                        INTEGER,
        V_G_OP                          INTEGER,
        V_G_OBJECT                      VARCHAR (386),
        V_G_COL                         VARCHAR (386),
        V_G_GRANTOR                     VARCHAR (128),
        V_G_ADMIN_OPT                   VARCHAR (128)
        
```

</div>

<div>

<div>

<div>

<div>

#### KEY_COLUMN_USAGE

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.KEY_COLUMN_USAGE
        CONSTRAINT_CATALOG              VARCHAR(128),
        CONSTRAINT_SCHEMA               VARCHAR(128),
        CONSTRAINT_NAME                 VARCHAR(128),
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        COLUMN_NAME                     VARCHAR(128),
        ORDINAL_POSITION                SMALLINT,
        V_KEY_IS_MAIN                   SMALLINT,
        V_KEY_IS_UNIQUE                 SMALLINT
        
```

</div>

<div>

<div>

<div>

<div>

#### ROUTINES

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.ROUTINES
        SPECIFIC_CATALOG                VARCHAR(128),
        SPECIFIC_SCHEMA                 VARCHAR(128),
        SPECIFIC_NAME                   VARCHAR(128),
        ROUTINE_CATALOG                 VARCHAR(128),
        ROUTINE_SCHEMA                  VARCHAR(128),
        ROUTINE_NAME                    VARCHAR(128),
        MODULE_CATALOG                  VARCHAR(128),
        MODULE_SCHEMA                   VARCHAR(128),
        MODULE_NAME                     VARCHAR(128),
        UDT_CATALOG                     VARCHAR(128),
        UDT_SCHEMA                      VARCHAR(128),
        UDT_NAME                        VARCHAR(128),
        DATA_TYPE                       VARCHAR(128),
        CHARACTER_MAXIMUM_LENGTH        INTEGER,
        CHARACTER_OCTET_LENGTH          INTEGER,
        COLLATION_CATALOG               VARCHAR(128),
        COLLATION_SCHEMA                VARCHAR(128),
        COLLATION_NAME                  VARCHAR(128),
        CHARACTER_SET_CATALOG           VARCHAR(128),
        CHARACTER_SET_SCHEMA            VARCHAR(128),
        CHARACTER_SET_NAME              VARCHAR(128),
        NUMERIC_PRECISION               SMALLINT,
        NUMERIC_PRECISION_RADIX         SMALLINT,
        NUMERIC_SCALE                   SMALLINT,
        DATETIME_PRECISION              SMALLINT,
        INTERVAL_TYPE                   VARCHAR(128),
        INTERVAL_PRECISION              SMALLINT,
        TYPE_UDT_CATALOG                VARCHAR(128),
        TYPE_UDT_SCHEMA                 VARCHAR(128),
        TYPE_UDT_NAME                   VARCHAR(128),
        SCOPE_CATALOG                   VARCHAR(128),
        SCOPE_SCHEMA                    VARCHAR(128),
        SCOPE_NAME                      VARCHAR(128),
        MAXIMUM_CARDINALITY             INTEGER,
        DTD_IDENTIFIER                  VARCHAR(128),
        ROUTINE_BODY                    VARCHAR(30),
        ROUTINE_DEFINTION               VARCHAR,
        EXTERNAL_NAME                   VARCHAR(128),
        EXTERNAL_LANGUAGE               VARCHAR(30),
        PARAMETER_STYLE                 VARCHAR(30),
        IS_DETERMINISTIC                VARCHAR(10),
        SQL_DATA_ACCESS                 VARCHAR(30),
        IS_NULL_CALL                    VARCHAR(10),
        SQL_PATH                        VARCHAR(128),
        SCHEMA_LEVEL_ROUTINE            VARCHAR(10),
        MAX_DYNAMIC_RESULT_SETS         SMALLINT,
        IS_USER_DEFINED_CAST            VARCHAR(10),
        IS_IMPLICITLY_INVOCABLE         VARCHAR(10),
        CREATED                         DATETIME,
        LAST_ALTERED                    DATETIME
        
```

</div>

<div>

<div>

<div>

<div>

#### PARAMETERS

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.PARAMETERS
        SPECIFIC_CATALOG                VARCHAR(128),
        SPECIFIC_SCHEMA                 VARCHAR(128),
        SPECIFIC_NAME                   VARCHAR(128),
        ORDINAL_POSITION                INTEGER,
        PARAMETER_MODE                  VARCHAR(10),
        IS_RESULT                       VARCHAR(10),
        AS_LOCATOR                      VARCHAR(10),
        PARAMETER_NAME                  VARCHAR(128),
        DATA_TYPE                       VARCHAR(128),
        CHARACTER_MAXIMUM_LENGTH        INTEGER,
        CHARACTER_OCTET_LENGTH          INTEGER,
        COLLATION_CATALOG               VARCHAR(128),
        COLLATION_SCHEMA                VARCHAR(128),
        COLLATION_NAME                  VARCHAR(128),
        CHARACTER_SET_CATALOG           VARCHAR(128),
        CHARACTER_SET_SCHEMA            VARCHAR(128),
        CHARACTER_SET_NAME              VARCHAR(128),
        NUMERIC_PRECISION               SMALLINT,
        NUMERIC_PRECISION_RADIX         SMALLINT,
        NUMERIC_SCALE                   SMALLINT,
        DATETIME_PRECISION              SMALLINT,
        INTERVAL_TYPE                   VARCHAR(128),
        INTERVAL_PRECISION              SMALLINT,
        USER_DEFINED_TYPE_CATALOG       VARCHAR(128),
        USER_DEFINED_TYPE_SCHEMA        VARCHAR(128),
        USER_DEFINED_TYPE_NAME          VARCHAR(128),
        SCOPE_CATALOG                   VARCHAR(128),
        SCOPE_SCHEMA                    VARCHAR(128),
        SCOPE_NAME                      VARCHAR(128)
        
```

</div>

<div id="views_information_schema_referential_constraints"
class="section">

<div>

<div>

<div>

#### REFERENTIAL_CONSTRAINTS

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.REFERENTIAL_CONSTRAINTS
        CONSTRAINT_CATALOG              VARCHAR(128),
        CONSTRAINT_SCHEMA               VARCHAR(128),
        CONSTRAINT_NAME                 VARCHAR(128),
        UNIQUE_CONSTRAINT_CATALOG       VARCHAR(128),
        UNIQUE_CONSTRAINT_SCHEMA        VARCHAR(128),
        UNIQUE_CONSTRAINT_NAME          VARCHAR(128),
        MATCH_OPTION                    VARCHAR(7),
        UPDATE_RULE                     VARCHAR(9),
        DELETE_RULE                     VARCHAR(9),
        V_FK_TABLE                      VARCHAR(128)
        
```

</div>

<div>

<div>

<div>

<div>

#### TABLE_CONSTRAINTS

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS
        CONSTRAINT_CATALOG              VARCHAR(128),
        CONSTRAINT_SCHEMA               VARCHAR(128),
        CONSTRAINT_NAME                 VARCHAR(128),
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        CONSTRAINT_TYPE                 VARCHAR(11),
        IS_DEFERRABLE                   VARCHAR(2),
        INITIALLY_DEFERRED              VARCHAR(2)
        
```

</div>

<div>

<div>

<div>

<div>

#### TABLE_PRIVILEGES

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.TABLE_PRIVILEGES
        GRANTOR                         VARCHAR(128),
        GRANTEE                         VARCHAR(128),
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        PRIVILEGE_TYPE                  VARCHAR(10),
        IS_GRANTABLE                    VARCHAR (3),
        V_G_USER                        INTEGER,
        V_G_OP                          INTEGER,
        V_G_OBJECT                      VARCHAR (386),
        V_G_GRANTOR                     VARCHAR (386)
        
```

</div>

<div>

<div>

<div>

<div>

#### VIEWS

</div>

</div>

</div>

``` programlisting
    INFORMATION_SCHEMA.VIEWS
        TABLE_CATALOG                   VARCHAR(128),
        TABLE_SCHEMA                    VARCHAR(128),
        TABLE_NAME                      VARCHAR(128),
        VIEW_DEFINITION                 VARCHAR,
        CHECK_OPTION                    VARCHAR(7),
        IS_UPDATABLE                    VARCHAR(3)
        
```

</div>

</div>
