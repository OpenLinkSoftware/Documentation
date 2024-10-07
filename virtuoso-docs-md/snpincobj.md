<div id="snpincobj" class="section">

<div class="titlepage">

<div>

<div>

### 13.2.8. Objects created by incremental snapshot replication

</div>

</div>

</div>

Table "DB.DBA.RPLOG\_\<name\>" (replay log) is created in Virtuoso
database for replayed snapshot log entries.

Table "RLOG\_\<name\>" (snapshot log) is created in the source DSN. This
table is attached as "\<qual\>"."\<dsn\>"."RLOG\_\<name\>" if source
table is an attached table. Other objects created by incremental
snapshot replication in the source DSN are:

|                                                                                                                                                                                                                          |
|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*Virtuoso*</span> Triggers "\<qual\>\_\<owner\>\_\<name\>\_I_log", "\<qual\>\_\<owner\>\_\<name\>\_U_log" and "\<qual\>\_\<owner\>\_\<name\>\_D_log" on replicated table.                         |
| <span class="emphasis">*SQL Server*</span> Triggers "\<name\>\_I_log", "\<name\>\_U_log" and "\<name\>\_D_log" on replicated table.                                                                                      |
| <span class="emphasis">*Oracle*</span> Triggers "\<name\>\_I_log", "\<name\>\_U_log" and "\<name\>\_D_log" on replicated table. Function OPL_GETUTCDATE().                                                               |
| <span class="emphasis">*DB2*</span> Triggers "\<name\>\_I", "\<name\>\_U" and "\<name\>\_D" on replicated table. Sequence opl_seq_rowguid.                                                                               |
| <span class="emphasis">*Informix*</span> Triggers "\<name\>\_I_log", "\<name\>\_U_log" and "\<name\>\_D_log" on replicated table. Sequence opl_seq_rowguid. Stored procedures "\<name\>\_R_proc" and "\<name\>\_U_proc". |

</div>
