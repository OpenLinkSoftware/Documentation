<div>

<div>

</div>

<div>

## Name

txn_error — poison current transaction forcing rollback

</div>

<div>

## Synopsis

<div>

|                        |                         |
|------------------------|-------------------------|
| ` `**`txn_error`**` (` | in `code ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Calling this function will poison the current transaction. This means
that it is forced to roll back at when committed. The code can be in
integer that selects the error message generated when trying to commit.
This is useful before signalling application errors from SQL code that
runs in manual commit mode. This can ensure that even if the client
attempts a commit after getting the error signalled by the application
the transaction will not commit.

In most cases the code should be the constant 6, resulting the in the
'transaction rolled back due to previous SQL Error'.

<div>

**Table 24.84. Transaction error codes**

<div>

| code          | SQL state | Error ID | SQL message                                                                                                                                                                                     | Description                               |
|---------------|-----------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------|
| 1             | S1T00     | SR171    | Transaction timed out                                                                                                                                                                           |                                           |
| 2             | 40001     | SR172    | Transaction deadlocked                                                                                                                                                                          |                                           |
| 3             | 40003     | SR173    | Transaction out of disk                                                                                                                                                                         |                                           |
| 4             | 40004     | SR174    | Log out of disk                                                                                                                                                                                 |                                           |
| 5             | 23000     | SR175    | Uniqueness violation. Transaction killed                                                                                                                                                        |                                           |
| 6             | 4000X     | SR176    | Transaction rolled back due to previous SQL error                                                                                                                                               | The safest way of poisoning a transaction |
| 7             | 4000X     | SR177    |                                                                                                                                                                                                 | Reserved for system use                   |
| 8             | 08U01     | SR324    | Remote server has disconnected making the transaction uncommittable. Transaction has been rolled back                                                                                           |                                           |
| 9             | 40001     | SR325    | Transaction aborted due to a database checkpoint or database-wide atomic operation. Please retry transaction                                                                                    |                                           |
| 10            | 40005     | SR325    | Transaction aborted because its log after image size went above the limit                                                                                                                       |                                           |
| 11            | 40006     | SR337    | Transaction aborted because the server is out of memory                                                                                                                                         |                                           |
| 12            | 4000X     | SR177    |                                                                                                                                                                                                 | Reserved for system use                   |
| 13            | 08C02     | SR337    | Transaction aborted due to cluster connection failure                                                                                                                                           |                                           |
| 14            | 40001     | SR337    | Transaction aborted due to async rollback in cluster                                                                                                                                            |                                           |
| 15            | 40007     | CLTSY    | Transaction not committable because async update branch not synced before commit. Commit has overtaken the branch message or the branch message was lost by the network                         |                                           |
| 16            | 40007     | CLPNC    | Transaction prepared but not committed. Probably dropped commit message. The branch will automatically query coordinator for the final status. The situation will reset itself in a few seconds |                                           |
| 17            | 4000X     | SR177    |                                                                                                                                                                                                 | Reserved for system use                   |
| 18            | 42000     | RPERM    | No permission to delete from given graph                                                                                                                                                        |                                           |
| anything else | 4000X     | SR177    | Misc Transaction Error                                                                                                                                                                          |                                           |

</div>

</div>

  

</div>

</div>
