<div id="trxobj" class="section">

<div class="titlepage">

<div>

<div>

### 13.3.8. Objects created by transactional replication

</div>

</div>

</div>

Virtuoso creates triggers "\<name\>\_I", "\<name\>\_U" and "\<name\>\_D"
for every published table. On subscriber "DB"."DBA"."SYS_REPL_ACCOUNTS"
table and "DB"."DBA"."TP_ITEM" view are attached from publisher as
"DB"."\<dsn\>"."SYS_REPL_ACCCOUNTS" and "DB"."\<dsn\>"."TP_ITEM"
respectively.

If publication is updateable Virtuoso additionally creates the following
objects:

|                                                                                                                                                                                                                                      |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| "\<qual\>"."\<owner\>"."replcr\_\<name\>\_I", "\<qual\>"."\<owner\>"."replcr\_\<name\>\_U" and "\<qual\>"."\<owner\>"."replcr\_\<name\>\_D" procedures for every published table. These procedures are used for conflict resolution. |
| Triggers "\<name\>\_I", "\<name\>\_U" and "\<name\>\_D" for every subscribed table.                                                                                                                                                  |

</div>
