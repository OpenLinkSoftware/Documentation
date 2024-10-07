<div id="oledbdatasource" class="section">

<div class="titlepage">

<div>

<div>

### 7.5.6. Data Source Objects

</div>

</div>

</div>

<div id="initprops" class="section">

<div class="titlepage">

<div>

<div>

#### Initialization and Authorization Properties

</div>

</div>

</div>

VIRTOLEDB supports the following properties in the initialization
property group.

<div id="id22277" class="table">

**Table 7.21. Supported Initialization and Authorization Properties**

<div class="table-contents">

| Property                               | R/W        |
|----------------------------------------|------------|
| DBPROP_AUTH_PASSWORD                   | Read/Write |
| DBPROP_AUTH_USERID                     | Read/Write |
| DBPROP_AUTH_PERSIST_SENSITIVE_AUTHINFO | Read/Write |
| DBPROP_INIT_DATASOURCE                 | Read/Write |
| DBPROP_INIT_CATALOG                    | Read/Write |
| DBPROP_INIT_PROVIDERSTRING             | Read/Write |
| DBPROP_INIT_HWND                       | Read/Write |
| DBPROP_INIT_PROMPT                     | Read/Write |
| DBPROP_INIT_TIMEOUT                    | Read/Write |

</div>

</div>

  

In addition, VIRTOLEDB implements a provider-specific property set
DBPROPSET_VIRTUOSODBINIT with the following properties

<div id="id22333" class="table">

**Table 7.22. Provider-Specific Initialization and Authorization
Properties**

<div class="table-contents">

| Property                 | R/W        |
|--------------------------|------------|
| VIRTPROP_INIT_ENCRYPT    | Read/Write |
| VIRTPROP_AUTH_PKCS12FILE | Read/Write |

</div>

</div>

  

</div>

<div id="oledbdatasourceprops" class="section">

<div class="titlepage">

<div>

<div>

#### Data Source Properties

</div>

</div>

</div>

VIRTOLEDB supports the following properties in the data source property
group.

<div id="id22362" class="table">

**Table 7.23. Supported Data Source Properties**

<div class="table-contents">

| Property                   | R/W        |
|----------------------------|------------|
| DBPROP_CURRENTCATALOG      | Read/Write |
| DBPROP_MULTIPLECONNECTIONS | Read/Write |

</div>

</div>

  

</div>

<div id="datasourceinfoprops" class="section">

<div class="titlepage">

<div>

<div>

#### Data Source Information Properties

</div>

</div>

</div>

VIRTOLEDB supports the following properties in the data source
information property group.

<div id="id22385" class="table">

**Table 7.24. Supported Data Source Information Properties**

<div class="table-contents">

| Property                           | R/W       |
|------------------------------------|-----------|
| DBPROP_ACTIVESESSIONS              | Read-Only |
| DBPROP_ASYNCTXNABORT               | Read-Only |
| DBPROP_ASYNCTXNCOMMIT              | Read-Only |
| DBPROP_BYREFACCESSORS              | Read-Only |
| DBPROP_CATALOGLOCATION             | Read-Only |
| DBPROP_CATALOGTERM                 | Read-Only |
| DBPROP_CATALOGUSAGE                | Read-Only |
| DBPROP_COLUMNDEFINITION            | Read-Only |
| DBPROP_COMSERVICES                 | Read-Only |
| DBPROP_CONCATNULLBEHAVIOR          | Read-Only |
| DBPROP_CONNECTIONSTATUS            | Read-Only |
| DBPROP_DATASOURCENAME              | Read-Only |
| DBPROP_DATASOURCEREADONLY          | Read-Only |
| DBPROP_DATASOURCE_TYPE             | Read-Only |
| DBPROP_DBMSNAME                    | Read-Only |
| DBPROP_DBMSVER                     | Read-Only |
| DBPROP_DSOTHREADMODEL              | Read-Only |
| DBPROP_GROUPBY                     | Read-Only |
| DBPROP_HETEROGENEOUSTABLES         | Read-Only |
| DBPROP_IDENTIFIERCASE              | Read-Only |
| DBPROP_MAXINDEXSIZE                | Read-Only |
| DBPROP_MAXOPENCHAPTERS             | Read-Only |
| DBPROP_MAXROWSIZE                  | Read-Only |
| DBPROP_MAXROWSIZEINCLUDESBLOB      | Read-Only |
| DBPROP_MAXTABLESINSELECT           | Read-Only |
| DBPROP_MULTIPLEPARAMSETS           | Read-Only |
| DBPROP_MULTIPLERESULTS             | Read-Only |
| DBPROP_MULTIPLESTORAGEOBJECTS      | Read-Only |
| DBPROP_MULTITABLEUPDATE            | Read-Only |
| DBPROP_NULLCOLLATION               | Read-Only |
| DBPROP_OLEOBJECTS                  | Read-Only |
| DBPROP_OPENROWSETSUPPORT           | Read-Only |
| DBPROP_ORDERBYCOLUMNSINSELECT      | Read-Only |
| DBPROP_OUTPUTPARAMETERAVAILABILITY | Read-Only |
| DBPROP_PERSISTENTIDTYPE            | Read-Only |
| DBPROP_PREPAREABORTBEHAVIOR        | Read-Only |
| DBPROP_PREPARECOMMITBEHAVIOR       | Read-Only |
| DBPROP_PROCEDURETERM               | Read-Only |
| DBPROP_PROVIDERFRIENDLYNAME        | Read-Only |
| DBPROP_PROVIDERMEMORY              | Read-Only |
| DBPROP_PROVIDERFILENAME            | Read-Only |
| DBPROP_PROVIDEROLEDBVER            | Read-Only |
| DBPROP_PROVIDERVER                 | Read-Only |
| DBPROP_QUOTEDIDENTIFIERCASE        | Read-Only |
| DBPROP_ROWSETCONVERSIONSONCOMMAND  | Read-Only |
| DBPROP_SCHEMATERM                  | Read-Only |
| DBPROP_SCHEMAUSAGE                 | Read-Only |
| DBPROP_SERVERNAME                  | Read-Only |
| DBPROP_SQLSUPPORT                  | Read-Only |
| DBPROP_STRUCTUREDSTORAGE           | Read-Only |
| DBPROP_SUBQUERIES                  | Read-Only |
| DBPROP_SUPPORTEDTXNDDL             | Read-Only |
| DBPROP_SUPPORTEDTXNISOLEVELS       | Read-Only |
| DBPROP_SUPPORTEDTXNISORETAIN       | Read-Only |
| DBPROP_TABLESTATISTICS             | Read-Only |
| DBPROP_TABLETERM                   | Read-Only |
| DBPROP_USERNAME                    | Read-Only |

</div>

</div>

  

</div>

</div>
