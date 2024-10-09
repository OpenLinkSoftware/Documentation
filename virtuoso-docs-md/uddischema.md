<div>

<div>

<div>

<div>

### 23.6.6. UDDI Schema

</div>

</div>

</div>

``` programlisting
---=====================
--- Business Entity Table
---=====================
create table UDDI..BUSINESS_ENTITY (
    BE_BUSINESS_KEY     varchar,
    BE_AUTHORIZED_NAME  varchar,
    BE_OPERATOR     varchar,
    BE_NAME         varchar not null,
    BE_CREATED      datetime,
    BE_CHANGED      timestamp,
    BE_OWNER        integer,
 PRIMARY KEY (BE_BUSINESS_KEY)
)
;
```

``` programlisting
---=======================
--- Business service Table
---=======================
create table UDDI..BUSINESS_SERVICE (
    BS_BUSINESS_KEY     varchar,        -- references business entity (optional)
    BS_SERVICE_KEY      varchar not null,       -- Unique Key
    BS_NAME         varchar not null,   -- Name
    BS_CREATED      datetime,
    BS_CHANGED      timestamp,
    BS_OWNER        integer,
PRIMARY KEY (BS_SERVICE_KEY)
)
;
```

``` programlisting
---========================
--- Binding Templates Table
---========================
create table UDDI..BINDING_TEMPLATE (
    BT_BINDING_KEY      varchar,
    BT_SERVICE_KEY      varchar,
    BT_ACCESS_POINT     varchar,
    BT_HOSTING_REDIRECTOR   varchar,
    BT_URL_TYPE     varchar,
    BT_CREATED      datetime,
    BT_CHANGED      timestamp,
    BT_OWNER        integer,
    PRIMARY KEY (BT_BINDING_KEY)
)
;
```

``` programlisting
---======================
--- tModel Table
---======================
create table UDDI..TMODEL (
    TM_TMODEL_KEY       varchar,
    TM_AUTHORIZED_NAME      varchar,
    TM_OPERATOR             varchar,
    TM_NAME                 varchar,
    TM_CREATED      datetime,
    TM_CHANGED      timestamp,
    TM_OWNER        integer,
    primary key (TM_TMODEL_KEY)
)
;
```

``` programlisting
---====================
--- Descriptions Table
---====================
create table UDDI..DESCRIPTION (
    UD_DESC         varchar,      -- Description Text
    UD_LANG         varchar,
    UD_PARENT_ID        varchar,      -- Parent ID (references tmodel,
                                    -- businessService etc.)
    UD_TYPE         varchar       -- ParentType (name of parent table)
)
create index DESC_PARENT on DESCRIPTION (UD_TYPE, UD_PARENT_ID)
;
```

``` programlisting
--=====================================================================================
-- Discovery URL table: contains structure - holds a URL addressable discovery documents
--=====================================================================================
create table UDDI..DISCOVERY_URL (
    DU_PARENT_ID        varchar not null,   -- parent ID
    DU_PARENT_TYPE      varchar not null,   -- name of parent element
    DU_URL          varchar,        -- URI
    DU_USE_TYPE     varchar         -- UseType element
)
create index DISCOVERY_URLS_PARENT on DISCOVERY_URL (DU_PARENT_TYPE, DU_PARENT_ID)
;
```

``` programlisting
--===================
-- Address line table
--===================
create table UDDI..ADDRESS_LINE (
    AL_PARENT_ID        varchar not null,       -- Parent key
    AL_PARENT_TYPE      varchar not null,   -- name of parent element
    AL_USE_TYPE     varchar,        -- UseType element
    AL_SORT_CODE        varchar,        -- SortCode element
    AL_LINE         varchar         -- The Line content
)
create index ADDR_LINE_PARENT on ADDRESS_LINE (AL_PARENT_TYPE, AL_PARENT_ID)
;
```

``` programlisting
---================
--- Contacts Table
---===============
create table UDDI..CONTACTS (
        CO_CONTACT_KEY      varchar,
    CO_BUSINESS_ID      varchar not null,   -- references business entity table by business key
    CO_USE_TYPE     varchar,        -- UseType element
    CO_PERSONAL_NAME    varchar not NULL,   -- name
    PRIMARY KEY (CO_CONTACT_KEY)
)
create index IN_BUSINESS on CONTACTS (CO_BUSINESS_ID)
;
```

``` programlisting
--============
-- email table
--============
create table UDDI..EMAIL (
    EM_CONTACT_KEY     varchar not null,
    EM_ADDR            varchar,
    EM_USE_TYPE        varchar
)
create index IN_EMPARENT on EMAIL (EM_CONTACT_KEY)
;
```

``` programlisting
--============
-- phone table
--============
create table UDDI..PHONE (
    PH_CONTACT_KEY     varchar not null,
    PH_PHONE           varchar,
    PH_USE_TYPE        varchar
)
create index IN_PHPARENT on PHONE (PH_CONTACT_KEY)
;
```

``` programlisting
---=====================
--- Identifier Bag Table
---=====================
create table UDDI..IDENTIFIER_BAG (
    IB_PARENT_ID        varchar not null,
    IB_PARENT_TYPE      varchar not null,
    IB_TMODEL_KEY_ID    varchar,
    IB_KEY_NAME     varchar,
    IB_KEY_VALUE        varchar
)
create index IB_PARENT on IDENTIFIER_BAG (IB_PARENT_ID,IB_PARENT_TYPE)
;
```

``` programlisting
---===================
--- Category Bag Table
---===================
create table UDDI..CATEGORY_BAG (
    CB_PARENT_ID        varchar not null,
    CB_PARENT_TYPE      varchar not null,
    CB_TMODEL_KEY_ID        varchar,
    CB_KEY_NAME         varchar,
    CB_KEY_VALUE        varchar
)
create index CB_PARENT on CATEGORY_BAG (CB_PARENT_ID, CB_PARENT_TYPE)
;
```

``` programlisting
---===================
--- Overview Doc Table
---===================
create table UDDI..OVERVIEW_DOC (
    OV_KEY              varchar,
    OV_PARENT_ID            varchar not null,
    OV_PARENT_TYPE          varchar not null,
    OV_URL              varchar,
    PRIMARY KEY (OV_KEY)
)
create unique index PARENT_OVERVIEW_DOC on OVERVIEW_DOC (OV_PARENT_ID, OV_PARENT_TYPE)
;
```

``` programlisting
---===============================
--- TModel Instance Details Table
---===============================
create table UDDI..INSTANCE_DETAIL  (
    ID_KEY          varchar not null,
    ID_BINDING_KEY      varchar,        -- references btemplate(bindingkey)
    ID_TMODEL_KEY       varchar,        -- references tmodel(tmodelkey)
    ID_PARMS        varchar,
    primary key (ID_KEY)
)
create index IN_IDPARENT on INSTANCE_DETAIL (ID_BINDING_KEY, ID_TMODEL_KEY)
;
```

</div>
