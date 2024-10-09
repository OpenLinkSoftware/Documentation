<div>

<div>

</div>

<div>

## Name

identity_value — returns the last assigned identity column value

</div>

<div>

## Synopsis

<div>

|                                    |      |
|------------------------------------|------|
| `integer `**`identity_value`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

This function returns the value assigned to an identity column by the
previous insert statement. Insert statements that do not assign identity
columns do not affect this. Note that tables that have no primary key
have n invisible identity column called \_IDN. The scope is the
connection. This function may be called from a client or from a stored
procedure and will return the last given identity column value wherever
it was given. The value stays set until overwritten by the next insert
operation. This value is not set by rexecute or inserts to remote tables
with autoincrement columns declared on the remote database since there
is no standard way of getting this information from remote data sources.

The same value can be more efficiently accessed from clients using the
SQLGetStmtOption ODBC call with the option SQL_GETLASTSERIAL. In this
case the value is of type SQLINTEGER.

</div>

<div>

## Return Types

The value assigned to an identity column by the previous insert or 0 if
no identity column was assigned.

</div>

</div>
