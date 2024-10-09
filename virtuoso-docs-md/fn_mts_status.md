<div>

<div>

</div>

<div>

## Name

mts_status — checks status of current transaction or server.

</div>

<div>

## Synopsis

<div>

|                         |                            |
|-------------------------|----------------------------|
| ` `**`mts_status`**` (` | in `subject ` varchar `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Checks status of subject. Subject can be either 'MTS' or 'TRANSACTION'.
In the first case this checks if the server is connected to MTS. In the
second case, checks if 2pc control is enabled for the current
transaction. This function returns status string. For 'MTS' it could be
either 'connected' or 'disconnected'. For 'TRANSACTION' - either '2pc
enabled' or '2pc disabled'.

</div>

</div>
