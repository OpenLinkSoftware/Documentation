<div>

<div>

</div>

<div>

## Name

mts_set_timeout — sets timeout of distributed transaction.

</div>

<div>

## Synopsis

<div>

|                              |                            |
|------------------------------|----------------------------|
| ` `**`mts_set_timeout`**` (` | in `timeout ` integer `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

sets distributed transactions timeout. 'timeout' parameter indicates
amount of timeout in milliseconds. If it equals -1 then default timeout
of Virtuoso transaction is used (SQL_QUERY_TIMEOUT). This function must
be called directly after "SET MTS_2PC=1". The time countdown begins at
moment of changing first branch.

</div>

</div>
