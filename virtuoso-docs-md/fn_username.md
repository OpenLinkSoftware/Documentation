<div>

<div>

</div>

<div>

## Name

username — returns the login name of the current user

</div>

<div>

## Synopsis

<div>

|                       |      |
|-----------------------|------|
| ` `**`username`**` (` | `)`; |

<div>

 

</div>

</div>

</div>

<div>

## Description

Returns the login name of the user of the connection. Selecting `user `
is equivalent.

</div>

<div>

## Parameters

None

</div>

<div>

## Return Values

A <span class="type">string </span> containing the login name of current
user

</div>

<div>

## Examples

<div>

**Example 24.432. Get current DB user**

<div>

``` screen
SQL> select username();
callret
VARCHAR
_______________________________________________________________________________

dba

1 Rows. -- 5 msec.
SQL> select user;
callret
VARCHAR
_______________________________________________________________________________

dba

1 Rows. -- 4 msec.
```

</div>

</div>

  

</div>

</div>
