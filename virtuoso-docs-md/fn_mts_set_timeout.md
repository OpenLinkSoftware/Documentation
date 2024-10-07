<div id="fn_mts_set_timeout" class="refentry">

<div class="titlepage">

</div>

<div class="refnamediv">

## Name

mts_set_timeout — sets timeout of distributed transaction.

</div>

<div class="refsynopsisdiv">

## Synopsis

<div id="fsyn_mts_set_timeout" class="funcsynopsis">

|                              |                            |
|------------------------------|----------------------------|
| ` `**`mts_set_timeout`**` (` | in `timeout ` integer `)`; |

<div class="funcprototype-spacer">

 

</div>

</div>

</div>

<div id="desc_mts_set_timeout" class="refsect1">

## Description

sets distributed transactions timeout. 'timeout' parameter indicates
amount of timeout in milliseconds. If it equals -1 then default timeout
of Virtuoso transaction is used (SQL_QUERY_TIMEOUT). This function must
be called directly after "SET MTS_2PC=1". The time countdown begins at
moment of changing first branch.

</div>

</div>
