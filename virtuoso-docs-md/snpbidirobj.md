<div id="snpbidirobj" class="section">

<div class="titlepage">

<div>

<div>

### 13.2.9. Objects created by bi-directional snapshot replication

</div>

</div>

</div>

Table "DB"."DBA"."RPLOG\_\<name\>" (replay log) is created in Virtuoso
database for replayed snapshot log entries.

Table "RLOG\_\<name\>" (snapshot log) is created on the publisher and on
subscribers. "RLOG\_\<name\>" table and replicated table itself are
attached from subscribers as "\<qual\>"."\<dsn\>"."RLOG\_\<name\>" and
"\<qual\>"."\<dsn\>"."\<name\>" respectively. Other objects created by
bi-directional snapshot replication on the publisher and on subscribers
are:

|                                                                                                                                                                                                                                                                                       |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| <span class="emphasis">*Virtuoso*</span> Triggers "\<qual\>\_\<owner\>\_\<name\>\_I_log", "\<qual\>\_\<owner\>\_\<name\>\_U_log" and "\<qual\>\_\<owner\>\_\<name\>\_D_log" on replicated table.                                                                                      |
| <span class="emphasis">*SQL Server*</span> Triggers "\<name\>\_I_log", "\<name\>\_U_log" and "\<name\>\_D_log" on replicated table.                                                                                                                                                   |
| <span class="emphasis">*Oracle*</span> Triggers "\<name\>\_I_log", "\<name\>\_IR_log", "\<name\>\_U_log", "\<name\>\_UR_log", "\<name\>\_UD_log", "\<name\>\_UDR_log", and "\<name\>\_D_log" on replicated table. Function OPL_GETUTCDATE(). Global temporary table "DLOG\_\<name\>". |
| <span class="emphasis">*DB2*</span> Triggers "\<name\>\_I", "\<name\>\_U", "\<name\>\_UD" and "\<name\>\_D" on replicated table. Sequence opl_seq_rowguid.                                                                                                                            |

</div>
