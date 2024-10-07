<div id="metadata" class="section">

<div class="titlepage">

<div>

<div>

### 7.5.4. Metadata

</div>

</div>

</div>

<div id="schemas_01" class="section">

<div class="titlepage">

<div>

<div>

#### Schema Rowsets

</div>

</div>

</div>

VIRTOLEDB supports schema rowsets listed in the following table.

<div id="id22032" class="table">

**Table 7.19. Supported Schema Rowsets**

<div class="table-contents">

| Schema Rowset                 | Supported Restrictions                                                                                   |
|-------------------------------|----------------------------------------------------------------------------------------------------------|
| DBSCHEMA_CATALOGS             | All (CATALOG_NAME)                                                                                       |
| DBSCHEMA_COLUMN_PRIVILEGES    | All (TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME, GRANTOR, GRANTEE)                             |
| DBSCHEMA_COLUMNS              | All (TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, COLUMN_NAME)                                               |
| DBSCHEMA_FOREIGN_KEYS         | All (PK_TABLE_CATALOG, PK_TABLE_SCHEMA, PK_TABLE_NAME, FK_TABLE_CATALOG, FK_TABLE_SCHEMA, FK_TABLE_NAME) |
| DBSCHEMA_INDEXES              | 1, 2, 3, and 5 (TABLE_CATALOG, TABLE_SCHEMA, INDEX_NAME, TABLE_NAME)                                     |
| DBSCHEMA_PRIMARY_KEYS         | All (TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME)                                                            |
| DBSCHEMA_PROCEDURE_PARAMETERS | All (PROCEDURE_CATALOG, PROCEDURE_SCHEMA, PROCEDURE_NAME, PARAMETER_NAME)                                |
| DBSCHEMA_PROCEDURES           | All (PROCEDURE_CATALOG, PROCEDURE_SCHEMA, PROCEDURE_NAME, PROCEDURE_TYPE)                                |
| DBSCHEMA_PROVIDER_TYPES       | All (DATA_TYPE, BEST_MATCH)                                                                              |
| DBSCHEMA_SCHEMATA             | All (CATALOG_NAME, SCHEMA_NAME, SCHEMA_OWNER)                                                            |
| DBSCHEMA_TABLE_PRIVILEGES     | All (TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, GRANTOR, GRANTEE)                                          |
| DBSCHEMA_TABLES               | All (TABLE_CATALOG, TABLE_SCHEMA, TABLE_NAME, TABLE_TYPE)                                                |

</div>

</div>

  

</div>

<div id="columns" class="section">

<div class="titlepage">

<div>

<div>

#### Columns Rowset

</div>

</div>

</div>

VIRTOLEDB supports the following columns in the columns rowset.

<div class="itemizedlist">

- DBCOLUMN_IDNAME

- DBCOLUMN_GUID

- DBCOLUMN_PROPID

- DBCOLUMN_NAME

- DBCOLUMN_NUMBER

- DBCOLUMN_TYPE

- DBCOLUMN_TYPEINFO

- DBCOLUMN_COLUMNSIZE

- DBCOLUMN_PRECISION

- DBCOLUMN_SCALE

- DBCOLUMN_FLAGS

- DBCOLUMN_BASECATALOGNAME

- DBCOLUMN_BASECOLUMNNAME

- DBCOLUMN_BASESCHEMANAME

- DBCOLUMN_BASETABLENAME

- DBCOLUMN_COMPUTEMODE

- DBCOLUMN_DATETIMEPRECISION

- DBCOLUMN_ISCASESENSITIVE

- DBCOLUMN_ISSEARCHABLE

- DBCOLUMN_OCTETLENGTH

- DBCOLUMN_KEYCOLUMN

</div>

</div>

</div>
