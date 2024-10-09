<div>

<div>

<div>

<div>

### 13.2.7. Data type mappings

</div>

</div>

</div>

Heterogeneous replication requires data type mapping to be performed
when Virtuoso table is created on replica.

<div>

**Table 13.1. Data type mappings**

<div>

|                                                     |                                            |                                        |                                     |                                          |
|-----------------------------------------------------|--------------------------------------------|----------------------------------------|-------------------------------------|------------------------------------------|
| <span class="emphasis">*Virtuoso*</span>            | <span class="emphasis">*SQL Server*</span> | <span class="emphasis">*Oracle*</span> | <span class="emphasis">*DB2*</span> | <span class="emphasis">*Informix*</span> |
| <span class="emphasis">*varchar*</span>             | varchar(8000)                              | VARCHAR2(4000)                         | VARCHAR(32000)                      | VARCHAR(254)                             |
| <span class="emphasis">*varchar(n)*</span>          | varchar(n)                                 | VARCHAR2(n)                            | VARCHAR(n)                          | VARCHAR(n)                               |
| <span class="emphasis">*integer*</span>             | int                                        | INTEGER                                | INTEGER                             | INTEGER                                  |
| <span class="emphasis">*smallint*</span>            | smallint                                   | SMALLINT                               | SMALLINT                            | SMALLINT                                 |
| <span class="emphasis">*real*</span>                | real                                       | FLOAT                                  | REAL                                | SMALLFLOAT                               |
| <span class="emphasis">*double precision*</span>    | float                                      | DOUBLE PRECISION                       | DOUBLE                              | FLOAT                                    |
| <span class="emphasis">*numeric*</span>             | numeric(38, 15)                            | NUMERIC(38, 15)                        | NUMERIC(32, 15)                     | DECIMAL(31, 15)                          |
| <span class="emphasis">*numeric(p, s)*</span>       | numeric(p, s)                              | NUMERIC(p, s)                          | NUMERIC(p, s)                       | DECIMAL(p, s)                            |
| <span class="emphasis">*date*</span>                | datetime                                   | DATE                                   | DATE                                | DATE                                     |
| <span class="emphasis">*time*</span>                | datetime                                   | DATE                                   | TIME                                | DATETIME HOUR TO SECOND                  |
| <span class="emphasis">*datetime, timestamp*</span> | datetime                                   | DATE                                   | TIMESTAMP                           | DATETIME YEAR TO FRACTION(5)             |
| <span class="emphasis">*varbinary*</span>           | varbinary(8000)                            | RAW(2000)                              | VARCHAR(32000) FOR BIT DATA         | BYTE                                     |
| <span class="emphasis">*varbinary(n)*</span>        | varbinary(n)                               | RAW(n)                                 | VARCHAR(n) FOR BIT DATA             | BYTE                                     |
| <span class="emphasis">*long varbinary*</span>      | image                                      | BLOB                                   | BLOB                                | BYTE                                     |
| <span class="emphasis">*long varchar*</span>        | text                                       | CLOB                                   | CLOB                                | TEXT                                     |
| <span class="emphasis">*nvarchar*</span>            | nvarchar(4000)                             | NVARCHAR2(4000)                        | VARCHAR(32000) FOR MIXED DATA       | NVARCHAR(254)                            |
| <span class="emphasis">*nvarchar(n)*</span>         | nvarchar(n)                                | NVARCHAR2(n)                           | VARCHAR(n) FOR MIXED DATA           | NVARCHAR(n)                              |
| <span class="emphasis">*long nvarchar*</span>       | ntext                                      | NCLOB                                  | DBCLOB                              | TEXT                                     |

</div>

</div>

  

</div>
